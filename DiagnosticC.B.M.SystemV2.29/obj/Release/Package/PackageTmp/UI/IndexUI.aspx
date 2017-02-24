<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IndexUI.aspx.cs" Inherits="DiagnosticC.B.M.SystemV2._29.UI.IndexUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Index</title>
    <link href="../Styles/StyleSheet.css" rel="stylesheet" />
    <style>
        ul {
            margin-left: 500px;
            font-size: 24px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <div>
            <h1>Diagnostic Center Bill Management System</h1>
            <hr />
            <br />
           <ul>
               <li><a href="TestTypeSetupUI.aspx" target="_blank">Test Type Setup</a></li>
               <li><a href="TestSetupUI.aspx" target="_blank">Test Setup</a></li>
               <li><a href="TestRequestEntryUI.aspx" target="_blank">Test Request Entry</a></li>
               <li><a href="PaymentUI.aspx" target="_blank">Payment</a></li>
               <li><a href="TestWiseReportUI.aspx" target="_blank">Test Wise Report</a></li>
               <li><a href="TypeWiseReportUI.aspx" target="_blank">Type Wise Report</a></li>
               <li><a href="UnpaidBillReport.aspx" target="_blank">Unpaid Bill Report</a></li>
           </ul>
        </div>
    </form>
</body>
</html>
