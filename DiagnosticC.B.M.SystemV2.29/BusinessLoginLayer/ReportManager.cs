using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DiagnosticC.B.M.SystemV2._29.DataAccessLayer.Gateway;
using DiagnosticC.B.M.SystemV2._29.DataAccessLayer.Model;

namespace DiagnosticC.B.M.SystemV2._29.BusinessLoginLayer
{
    public class ReportManager
    {
        ReportGateway aReportGateway = new ReportGateway();

        public List<TestWiseReportView> GetTestWiseReportView(string fromDate, string toDate)
        {
            return aReportGateway.GetTestWiseReportView(fromDate, toDate);
        }

        public List<TypeWiseReportView> GetTypeWiseReportView(string fromDate, string toDate)
        {
            return aReportGateway.GetTypeWiseReportView(fromDate, toDate);
        }

        public List<UnpaidBillReportView> GetUnpaidBillReportView(string fromDate, string toDate)
        {
            return aReportGateway.GetUnpaidBillReportList(fromDate, toDate);
        }
    }
}