<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnpaidBillReport.aspx.cs" Inherits="DiagnosticC.B.M.SystemV2._29.UI.UnpaidBillReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Unpaid Bill Report</title>
    <link href="../Styles/StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <h1>Unpaid Bill Report</h1>
        <hr/>
        <br/>
        <asp:Label ID="fromDateLabel" Text="From Date" CssClass="lable" runat="server"></asp:Label>
        <asp:TextBox ID="fromDateTextBox" CssClass="textBox" placeholder="yyyy-mm-dd" runat="server"></asp:TextBox>
        <br/>
        <asp:RequiredFieldValidator ID="fromDateValidator" ControlToValidate="fromDateTextBox" 
            CssClass="validatorText" ErrorMessage="Required" runat="server"></asp:RequiredFieldValidator>
        <br/>
        <asp:RegularExpressionValidator ID="regularExpressionValidator1" CssClass="validatorText" ErrorMessage="Not a valid date!" 
            ControlToValidate="fromDateTextBox" ValidationExpression="^(19|20)\d\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])$" runat="server"></asp:RegularExpressionValidator>
        <br/>
        <br/>
        <asp:Label ID="toDateLabel" CssClass="lable" Text="To Date" runat="server" ></asp:Label>
        <asp:TextBox ID="toDateTextBox" CssClass="textBox" placeholder="yyyy-mm-dd" runat="server"></asp:TextBox>
        <br/>
        <asp:RequiredFieldValidator ID="toDateValidator" ControlToValidate="toDateTextBox" 
            CssClass="validatorText" ErrorMessage="Required" runat="server"></asp:RequiredFieldValidator>
        <br/>
        <asp:RegularExpressionValidator ID="regularExpressionValidator2" ControlToValidate="toDateTextBox" ErrorMessage="Not a valid date!"
            CssClass="validatorText" ValidationExpression="^(19|20)\d\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])$" runat="server"></asp:RegularExpressionValidator>
        <br/>
        <br/>
        <asp:Button ID="showButton" CssClass="button" Text="Show" runat="server" OnClick="showButton_Click"/>
        <br/>
        <br/>
        <asp:GridView ID="unpaidBillReportGridView" AutoGenerateColumns="False" CssClass="gridView" runat="server">
            <Columns>
                <asp:TemplateField HeaderText="SN" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%#Container.DataItemIndex+1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center" DataField="BillNo" HeaderText="Bill No"/>
                <asp:BoundField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" DataField="Name" HeaderText="Patient Name"/>
                <asp:BoundField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" DataField="MobileNo" HeaderText="Mobile No"/>
                <asp:BoundField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" DataField="BillAmount" HeaderText="Bill Amount"/>
            </Columns>
        </asp:GridView>
        <br/>
        <br/>
        <asp:Label ID="totalLabel" Text="Total" CssClass="lable" runat="server"></asp:Label>
        <asp:TextBox ID="totalTextBox" CssClass="textBox"  ReadOnly="True" runat="server"></asp:TextBox>
        <br/>
        <br/>
        <asp:Button ID="pdfButton" Text="PDF" CssClass="button" runat="server" OnClick="pdfButton_Click"/>
    </form>
    <div align="center">
        <br/>
        <br/>
        <br/>
        <a href="IndexUI.aspx" style="font-size:20px;">Go To Index Page</a>
    </div>
</body>
</html>
