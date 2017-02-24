using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace DiagnosticC.B.M.SystemV2._29.DataAccessLayer.Gateway
{
    public class Gateway
    {
        protected string connectionSrting = WebConfigurationManager.ConnectionStrings["DiagnosticCenterBMSConnectionString"].ConnectionString;
        public string Query { get; set; }
        public SqlConnection Connection { get; set; }
        public SqlCommand Command { get; set; }
        public SqlDataReader Reader { get; set; }

        public Gateway()
        {
            Connection = new SqlConnection(connectionSrting);
        }
    }
}