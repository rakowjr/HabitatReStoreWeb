<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Volunteers.aspx.cs" Inherits="Volunteers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">       
        .auto-style1 {
            margin-left: 325px;
        }       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">  
    <asp:SqlDataSource ID="SqlDataSourceMonth" runat="server" ConnectionString="<%$ ConnectionStrings:rakowj2891ConnectionString %>" SelectCommand="SELECT * FROM [Month]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceDay" runat="server" ConnectionString="<%$ ConnectionStrings:rakowj2891ConnectionString %>" SelectCommand="SELECT * FROM [Day]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceYear" runat="server" ConnectionString="<%$ ConnectionStrings:rakowj2891ConnectionString %>" SelectCommand="SELECT * FROM [Year]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceState" runat="server" ConnectionString="<%$ ConnectionStrings:rakowj2891ConnectionString %>" SelectCommand="SELECT * FROM [State]"></asp:SqlDataSource>

    <div id="volunteerContent">
        <h2 style="padding: 40px 0;">Volunteer Registration</h2>
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
            <tr>
                <td class="vtCol1"></td>
                <td class="vtCol2">Gender (M/F): </td>
                <td class="vtCol3">
                    <asp:RadioButtonList ID="rBtnGender" runat="server" AutoPostBack="False" RepeatDirection="Horizontal" ValidationGroup="Volunteers" Height="24px" Width="170px" CssClass="volRadList">
                        <asp:ListItem Value="M">Male</asp:ListItem>
                        <asp:ListItem Value="F">Female</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="vtCol4">
                    <asp:RequiredFieldValidator ID="valGender" runat="server" ErrorMessage="Gender missing" ValidationGroup="Volunteers" ControlToValidate="rBtnGender" Text="*" ForeColor="Red" CssClass="volValidate" Height="12px"></asp:RequiredFieldValidator>                

                </td>                
            </tr>
            <tr style="height: 12px">
                <td></td>
                <td></td>
                <td>
                    <span style="padding: 0 12px;">Month</span><span style="padding: 0 20px;">Day</span><span style="padding: 0 25px;">Year</span>
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="vtCol1"></td>
                <td class="vtCol2">Date of Birth: </td>
                <td class="vtCol3">
                    <span style="margin: 0 12px;">
                        <asp:DropDownList ID="ddlMonth" runat="server">
                            <asp:ListItem> </asp:ListItem>
                        </asp:DropDownList>
                    </span>
                    <span style="margin: 0 12px;">
                        <asp:DropDownList ID="ddlDay" runat="server">
                            <asp:ListItem> </asp:ListItem>
                        </asp:DropDownList>
                    </span>
                    <span style="margin: 0 12px;">
                        <asp:DropDownList ID="ddlYear" runat="server">
                            <asp:ListItem> </asp:ListItem>
                        </asp:DropDownList>
                    </span>
                </td>
                <td class="vtCol4">
                    <asp:requiredfieldvalidator runat="server" errormessage="Birth month missing" ID="valMonth" ControlToValidate="ddlMonth" InitialValue=" " ValidationGroup="Volunteers" ForeColor="Red" CssClass="volValidate">*</asp:requiredfieldvalidator>
                    <asp:RequiredFieldValidator ID="valDay" runat="server" ControlToValidate="ddlDay" ErrorMessage="Birth day missing" InitialValue=" " ValidationGroup="Volunteers" ForeColor="Red" CssClass="volValidate">*</asp:RequiredFieldValidator>
                    <asp:requiredfieldvalidator runat="server" errormessage="Birth year missing" ID="valYear" ControlToValidate="ddlYear" InitialValue=" " ValidationGroup="Volunteers" ForeColor="Red" CssClass="volValidate">*</asp:requiredfieldvalidator>
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
            <!--<tr>
                <td class="vtCol1"></td>
                <td class="vtCol2">State: </td>
                <td class="vtCol3">
                    <span style="margin: 0 12px;">
                       <asp:dropdownlist runat="server" ID="ddlState" DataSourceID="SqlDataSourceState" DataTextField="State" DataValueField="State"></asp:dropdownlist>
                    </span>
                </td>
                <td class="vtCol4">
                    <asp:requiredfieldvalidator runat="server" errormessage="State missing" ID="valState" ControlToValidate="ddlState" ForeColor="Red" InitialValue=" " ValidationGroup="Volunteers" CssClass="volValidate">*</asp:requiredfieldvalidator>
                </td>
            </tr>-->
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
                    

                    <asp:CompareValidator ID="valPhoneData" runat="server" ControlToValidate="tbPhone" CssClass="volValidate" ErrorMessage="Use only numbers for phone number" ForeColor="Red" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Volunteers">*</asp:CompareValidator>
                    

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
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" ValidationGroup="Volunteers" OnClick="btnSubmit_Click" CssClass="auto-style1" />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Validation Check" ValidationGroup="Volunteers" Visible="False" />
        </div>
        <div>
            <asp:label runat="server" ID="lblDbError"></asp:label>
        </div>
        <div style="height: 40px;"></div>
    </div>

</asp:Content>

