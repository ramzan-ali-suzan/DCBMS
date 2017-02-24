using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using DiagnosticC.B.M.SystemV2._29.DataAccessLayer.Gateway;
using DiagnosticC.B.M.SystemV2._29.DataAccessLayer.Model;

namespace DiagnosticC.B.M.SystemV2._29.BusinessLoginLayer
{
    public class TestManager
    {
        TestGateway aTestGateway = new TestGateway();

        public string SaveTestType(TestType aTestType)
        {
            if (aTestGateway.CheckTestType(aTestType))
                return "Type Name is already saved !";
            else
            {
                int rowAffected = aTestGateway.SaveTestType(aTestType);
                if (rowAffected > 0)
                    return "Type Saved :)";
                else
                    return "Type Name save failed !";
            }
        }

        public List<TestType> GetAllTestTypes()
        {
            return aTestGateway.GetAllTestTypes();
        }

        public string SaveTest(Test aTest)
        {
            if (aTestGateway.CheckTest(aTest))
                return "Test Name is already saved !";
            else
            {
                int rowAffected = aTestGateway.SaveTest(aTest);
                if (rowAffected > 0)
                    return "Test Saved :)";
                else
                    return "Test Name save failed !";
            }
        }

        public List<Test> GetAllTest()
        {
            return aTestGateway.GetAllTest();
        }
    }
}