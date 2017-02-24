using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DiagnosticC.B.M.SystemV2._29.DataAccessLayer.Gateway;
using DiagnosticC.B.M.SystemV2._29.DataAccessLayer.Model;

namespace DiagnosticC.B.M.SystemV2._29.BusinessLoginLayer
{
    public class PaymentManager
    {
        private PaymentGateway aPaymentGateway = new PaymentGateway();

        public DueView GetDue(string billNo, string mobileNo)
        {
            return aPaymentGateway.GetDue(billNo, mobileNo);
        }

        public string MakePayment(int patientId)
        {
            int rowAffacted = aPaymentGateway.MakePayment(patientId);
            if (rowAffacted > 0)
                return "Payment Successful";
            else
                return "Sorry, payment is not successful !";
        }
    }
}