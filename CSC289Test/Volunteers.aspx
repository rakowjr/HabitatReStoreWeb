<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Volunteers.aspx.cs" Inherits="Volunteers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">  
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <div id="volunteerContent">
        <h2>Volunteer Registration</h2>
        <table class="volunteerTable">
            <tr>
                <td class="vtCol1"></td>
                <td class="vtCol2">First Name: </td>
                <td class="vtCol3">
                    <asp:TextBox ID="tbFName" runat="server" CssClass="volTB"></asp:TextBox>
                </td>
                <td class="vtCol4">
                    <asp:RequiredFieldValidator ID="volFName" runat="server" ErrorMessage="First Name missing" ValidationGroup="Volunteers" ControlToValidate="tbFName" ForeColor="Red" Text="*" CssClass="volValidate"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="vtCol1"></td>
                <td class="vtCol2">Middle Name: </td>
                <td class="vtCol3"><asp:TextBox ID="tbMName" runat="server" CssClass="volTB"></asp:TextBox></td>
                <td class="vtCol4"></td>
            </tr>
            <tr>
                <td class="vtCol1"></td>
                <td class="vtCol2">Last Name: </td>
                <td class="vtCol3">
                    <asp:TextBox ID="tbLName" runat="server" CssClass="volTB"></asp:TextBox>
                </td>
                <td class="vtCol4">
                    <asp:RequiredFieldValidator ID="valLName" runat="server" ErrorMessage="Last Name missing" ControlToValidate="tbLName" ValidationGroup="Volunteers" Text="*" ForeColor="Red" CssClass="volValidate"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr errormessage="Incorrect Date Format">
                <td class="vtCol1"></td>
                <td class="vtCol2">Gender (M/F): </td>
                <td class="vtCol3">
                    <asp:RadioButtonList ID="rBtnGender" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" ValidationGroup="Volunteers" Height="24px" Width="170px" CssClass="volRadList">
                        <asp:ListItem Value="M">Male</asp:ListItem>
                        <asp:ListItem Value="F">Female</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="vtCol4">
                    <asp:RequiredFieldValidator ID="valGender" runat="server" ErrorMessage="Gender missing" ValidationGroup="Volunteers" ControlToValidate="rBtnGender" Text="*" ForeColor="Red" CssClass="volValidate" Height="12px"></asp:RequiredFieldValidator>                

                </td>                
            </tr>
            <tr>
                <td class="vtCol1"></td>
                <td class="vtCol2">Date of Birth (MM/DD/YYYY): </td>
                <td class="vtCol3">
                    <asp:TextBox ID="tbDOB" runat="server" CssClass="volTB"></asp:TextBox>
                </td>
                <td class="vtCol4">
                    <asp:RequiredFieldValidator ID="valDOB" runat="server" ErrorMessage="Date of Birth missing" ControlToValidate="tbDOB" ValidationGroup="Volunteers" Text="*" ForeColor="Red" CssClass="volValidate"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbDOB" CssClass="volExpr" ErrorMessage="Incorrect Date Format" ForeColor="Red" ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$" ValidationGroup="Volunteers">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="vtCol1"></td>
                <td class="vtCol2">Social Security Number (no dashes): </td>
                <td class="vtCol3">
                    <asp:TextBox ID="tbSSN" runat="server" CssClass="volTB"></asp:TextBox>
                </td>
                <td class="vtCol4"></td>
            </tr>
            <tr>
                <td class="vtCol1"></td>
                <td class="vtCol2">Address: </td>
                <td class="vtCol3">
                    <asp:TextBox ID="tbAddress" runat="server" CssClass="volTB"></asp:TextBox>
                </td>
                <td class="vtCol4">
                   <asp:RequiredFieldValidator ID="valAddress" runat="server" ErrorMessage="Address missing" ValidationGroup="Volunteers" ControlToValidate="tbAddress" Text="*" ForeColor="Red" CssClass="volValidate"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="vtCol1"></td>
                <td class="vtCol2">Address 2: </td>
                <td class="vtCol3"><asp:TextBox ID="tbAddress2" runat="server" CssClass="volTB"></asp:TextBox></td>
                <td class="vtCol4"></td>
            </tr>
            <tr>
                <td class="vtCol1"></td>
                <td class="vtCol2">City: </td>
                <td class="vtCol3">
                    <asp:TextBox ID="tbCity" runat="server" CssClass="volTB"></asp:TextBox>
                </td>
                <td class="vtCol4">
                    <asp:RequiredFieldValidator ID="valCity" runat="server" ErrorMessage="City missing" ValidationGroup="Volunteers" ControlToValidate="tbCity" Text="*" ForeColor="Red" CssClass="volValidate"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="vtCol1"></td>
                <td class="vtCol2">State: </td>
                <td class="vtCol3">
                    <asp:TextBox ID="tbState" runat="server" CssClass="volTB"></asp:TextBox>
                </td>
                <td class="vtCol4">
                    <asp:RequiredFieldValidator ID="valState" runat="server" ErrorMessage="State missing" ValidationGroup="Volunteers" ControlToValidate="tbState" Text="*" ForeColor="Red" CssClass="volValidate"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="vtCol1"></td>
                <td class="vtCol2">Zipcode: </td>
                <td class="vtCol3">
                    <asp:TextBox ID="tbZip" runat="server" CssClass="volTB"></asp:TextBox>
                </td>
                <td class="vtCol4">
                    <asp:RequiredFieldValidator ID="valZip" runat="server" ErrorMessage="Zip Code missing" ValidationGroup="Volunteers" ControlToValidate="tbZip" Text="*" ForeColor="Red" CssClass="volValidate"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegExZip" runat="server" ControlToValidate="tbZip" CssClass="volExpr" ErrorMessage="Incorrect Zipcode Format" ForeColor="Red" ValidationExpression="\d{5}" ValidationGroup="Volunteers">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="vtCol1"></td>
                <td class="vtCol2">Phone Number (no dashes): </td>
                <td class="vtCol3">
                    <asp:TextBox ID="tbPhone" runat="server" CssClass="volTB"></asp:TextBox>
                </td>
                <td class="vtCol4">
                    <asp:RequiredFieldValidator ID="valPhone" runat="server" ErrorMessage="Phone Number missing" ValidationGroup="Volunteers" ControlToValidate="tbPhone" Text="*" ForeColor="Red" CssClass="volValidate"></asp:RequiredFieldValidator>
                    

                </td>
            </tr>
            <tr>
                <td class="vtCol1"></td>
                <td class="vtCol2">Email Address: </td>
                <td class="vtCol3"><asp:TextBox ID="tbEmail" runat="server" CssClass="volTB"></asp:TextBox></td>
                <td class="vtCol4"></td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Volunteers" ForeColor="Red" />
                </td>
            </tr>            
        </table>
        <div>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" ValidationGroup="Volunteers" OnClick="btnSubmit_Click" />
        </div>
        <div>
            <asp:label runat="server" ID="lblDbError"></asp:label>
            <asp:sqldatasource runat="server" ID="VolunteerDS" ConnectionString="<%$ ConnectionStrings:Habitat_RestoreCS %>" SelectCommand="SELECT [Last_Name], [First_Name], [Address], [City], [State], [ZipCode], [Middle_Name], [Gender], [DOB], [SSN], [Address2], [Phone], [Email] FROM [Volunteer]"></asp:sqldatasource>
        </div>
        <div>
            
            <asp:label runat="server" text="" ID="Label1"></asp:label><br />
            <asp:label runat="server" text="" ID="Label2"></asp:label><br />
            <asp:label runat="server" text="" ID="Label3"></asp:label><br />
            <asp:label runat="server" text="" ID="Label4"></asp:label><br />
            <asp:label runat="server" text="" ID="Label5"></asp:label><br />
            <asp:label runat="server" text="" ID="Label6"></asp:label><br />
            <asp:label runat="server" text="" ID="Label7"></asp:label><br />
            <asp:label runat="server" text="" ID="Label8"></asp:label><br />
            <asp:label runat="server" text="" ID="Label9"></asp:label><br />
            <asp:label runat="server" text="" ID="Label10"></asp:label><br />
            <asp:label runat="server" text="" ID="Label11"></asp:label><br />
            <asp:label runat="server" text="" ID="Label12"></asp:label><br />
            <asp:label runat="server" text="" ID="Label13"></asp:label><br />
            <br />
            <br />
            <br />
            <br />
        </div>

    </div>

</asp:Content>

