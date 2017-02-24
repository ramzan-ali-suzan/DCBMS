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
    public partial class TypeWiseReportUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void showButton_Click(object sender, EventArgs e)
        {
            ReportManager aReportManager = new ReportManager();
            typeWiseReportGridView.DataSource = aReportManager.GetTypeWiseReportView(fromDateTextBox.Text, toDateTextBox.Text);
            typeWiseReportGridView.DataBind();

            double total = 0;
            for (int i = 0; i < typeWiseReportGridView.Rows.Count; i++)
            {
                total += double.Parse(typeWiseReportGridView.Rows[i].Cells[3].Text);
            }
            totalTextBox.Text = (total).ToString();
            totalTextBox.ForeColor = Color.Red;
        }

        protected void pdgButton_Click(object sender, EventArgs e)
        {
            PDFManager aPdfManager = new PDFManager();
            Document pdfDocument = new Document(PageSize.A4, 50f, 50f, 50f, 50f);
            PdfWriter.GetInstance(pdfDocument, Response.OutputStream);

            pdfDocument.Open();
            pdfDocument.Add(aPdfManager.GetTypeWiseReportPdfParagraph(fromDateTextBox.Text,toDateTextBox.Text,typeWiseReportGridView,totalTextBox.Text));
            pdfDocument.Close();

            fromDateTextBox.Text = string.Empty;
            toDateTextBox.Text = string.Empty;
            typeWiseReportGridView.DataSource = null;
            typeWiseReportGridView.DataBind();
            totalTextBox.Text = String.Empty;

            Response.ContentType = "application/pdf";
            Response.AppendHeader("content-disposition", "attachment;filename=TypeWiseReport.pdf");
            Response.Write(pdfDocument);
            Response.Flush();
            Response.End();
        }
    }
}