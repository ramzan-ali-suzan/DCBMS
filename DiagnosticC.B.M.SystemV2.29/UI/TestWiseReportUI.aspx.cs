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
    public partial class TestWiseReportUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void showButton_Click(object sender, EventArgs e)
        {
            ReportManager aReportManager = new ReportManager();
            testWiseReportGridView.DataSource = aReportManager.GetTestWiseReportView(fromDateTextBox.Text,toDateTextBox.Text);
            testWiseReportGridView.DataBind();

            double total = 0;
            for (int i = 0; i < testWiseReportGridView.Rows.Count; i++)
            {
                total += Double.Parse(testWiseReportGridView.Rows[i].Cells[3].Text);
            }
            totalTextBox.Text = (total).ToString();
            totalTextBox.ForeColor = Color.Red;
        }

        protected void pdfButton_Click(object sender, EventArgs e)
        {
            PDFManager aPdfManager = new PDFManager();
            Document pdfDocument = new Document(PageSize.A4, 50f, 50f, 50f, 50f);
            PdfWriter.GetInstance(pdfDocument, Response.OutputStream);

            pdfDocument.Open();
            pdfDocument.Add(aPdfManager.GetTestWiseReportPdfParagraph(fromDateTextBox.Text, toDateTextBox.Text, testWiseReportGridView, totalTextBox.Text));
            pdfDocument.Close();

            fromDateTextBox.Text = string.Empty;
            toDateTextBox.Text = string.Empty;
            testWiseReportGridView.DataSource = null;
            testWiseReportGridView.DataBind();
            totalTextBox.Text = String.Empty;

            Response.ContentType = "application/pdf";
            Response.AppendHeader("content-disposition", "attachment;filename=TestWiseReport.pdf");
            Response.Write(pdfDocument);
            Response.Flush();
            Response.End();
        }
    }
}