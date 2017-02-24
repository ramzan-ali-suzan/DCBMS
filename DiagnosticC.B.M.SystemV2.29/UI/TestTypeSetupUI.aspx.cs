using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DiagnosticC.B.M.SystemV2._29.BusinessLoginLayer;
using DiagnosticC.B.M.SystemV2._29.DataAccessLayer.Model;

namespace DiagnosticC.B.M.SystemV2._29.UI
{
    public partial class TestTypeSetupUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            TestType aTestType = new TestType();
            aTestType.TestTypeName = typeNameTextBox.Text;

            TestManager aTestManager = new TestManager();
            outputLabel.Text = aTestManager.SaveTestType(aTestType);
            typeNameTextBox.Text = string.Empty;

            TestTypeGridView.DataSource = aTestManager.GetAllTestTypes();
            TestTypeGridView.DataBind();
        }
    }
}