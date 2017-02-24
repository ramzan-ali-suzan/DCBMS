using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DiagnosticC.B.M.SystemV2._29.BusinessLoginLayer;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace DiagnosticC.B.M.SystemV2._29.UI
{
    public partial class UnpaidBillReport : System.Web.UI.Page
    {
        ReportManager aReportManager = new ReportManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void showButton_Click(object sender, EventArgs e)
        {
            unpaidBillReportGridView.DataSource = aReportManager.GetUnpaidBillReportView(fromDateTextBox.Text,toDateTextBox.Text);
            unpaidBillReportGridView.DataBind();

            double sum = 0;
            for (int i = 0; i < unpaidBillReportGridView.Rows.Count; i++)
            {
                sum += Double.Parse(unpaidBillReportGridView.Rows[i].Cells[4].Text);
            }
            totalTextBox.Text = sum.ToString();
            totalTextBox.ForeColor = Color.Red;
        }

        protected void pdfButton_Click(object sender, EventArgs e)
        {
            PDFManager aPdfManager = new PDFManager();
            Document pdfDocument = new Document(PageSize.A4, 50f, 50f, 50f, 50f);
            PdfWriter.GetInstance(pdfDocument, Response.OutputStream);

            pdfDocument.Open();
            pdfDocument.Add(aPdfManager.GetUnpaidBillReportPdfParagraph(fromDateTextBox.Text,toDateTextBox.Text,unpaidBillReportGridView,totalTextBox.Text));
            pdfDocument.Close();

            fromDateTextBox.Text = string.Empty;
            toDateTextBox.Text = string.Empty;
            unpaidBillReportGridView.DataSource = null;
            unpaidBillReportGridView.DataBind();
            totalTextBox.Text = String.Empty;

            Response.ContentType = "application/pdf";
            Response.AppendHeader("content-disposition", "attachment;filename=UnpaidBillReport.pdf");
            Response.Write(pdfDocument);
            Response.Flush();
            Response.End();
        }
    }
}