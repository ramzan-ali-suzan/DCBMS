using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DiagnosticC.B.M.SystemV2._29.DataAccessLayer.Model
{
    public class TestRequest
    {
        public int PatientId { get; set; }
        public int TestId { get; set; }
        public string EntryDate { get; set; }
    }
}