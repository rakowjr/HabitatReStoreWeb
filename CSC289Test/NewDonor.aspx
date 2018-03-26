<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewDonor.aspx.cs" Inherits="Volunteers" %>

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
    <div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="ViewDonorInfo" runat="server">
                <div id="donorContent">
                    <h2 style="padding: 40px 0;">Donor Registration</h2>
                    <table class="donorTable">
                        <tr>
                            <td class="dnCol1"></td>
                            <td class="dnCol2">First Name: </td>
                            <td class="dnCol3">
                                <asp:textbox id="tbFName" runat="server" cssclass="dnTB"></asp:textbox>
                            </td>
                            <td class="dnCol4">
                                <asp:requiredfieldvalidator id="valFName" runat="server" errormessage="First Name missing" validationgroup="Donors" controltovalidate="tbFName" forecolor="Red" text="*" cssclass="dnValidate"></asp:requiredfieldvalidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="dnCol1"></td>
                            <td class="dnCol2">Middle Name: </td>
                            <td class="dnCol3">
                                <asp:textbox id="tbMName" runat="server" cssclass="dnTB"></asp:textbox>
                            </td>
                            <td class="dnCol4"></td>
                        </tr>
                        <tr>
                            <td class="dnCol1"></td>
                            <td class="dnCol2">Last Name: </td>
                            <td class="dnCol3">
                                <asp:textbox id="tbLName" runat="server" cssclass="dnTB"></asp:textbox>
                            </td>
                            <td class="dnCol4">
                                <asp:requiredfieldvalidator id="valLName" runat="server" errormessage="Last Name missing" controltovalidate="tbLName" validationgroup="Donors" text="*" forecolor="Red" cssclass="dnValidate"></asp:requiredfieldvalidator>

                            </td>
                        </tr>
                        <tr>
                            <td class="dnCol1"></td>
                            <td class="dnCol2">Gender (M/F): </td>
                            <td class="dnCol3">
                                <asp:radiobuttonlist id="rBtnGender" runat="server" autopostback="False" repeatdirection="Horizontal" validationgroup="Donors" height="24px" width="170px" cssclass="dnRadList">
                                    <asp:ListItem Value="M">Male</asp:ListItem>
                                    <asp:ListItem Value="F">Female</asp:ListItem>
                                </asp:radiobuttonlist>
                            </td>
                            <td class="dnCol4">
                                <asp:requiredfieldvalidator id="valGender" runat="server" errormessage="Gender missing" validationgroup="Donors" controltovalidate="rBtnGender" text="*" forecolor="Red" cssclass="dnValidate" height="12px"></asp:requiredfieldvalidator>

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
                            <td class="dnCol1"></td>
                            <td class="dnCol2">Date of Birth: </td>
                            <td class="dnCol3">
                                <span style="margin: 0 12px;">
                                    <asp:dropdownlist id="ddlMonth" runat="server" datasourceid="SqlDataSourceMonth" datatextfield="Month" datavaluefield="Month">
                                    </asp:dropdownlist>
                                </span>
                                <span style="margin: 0 12px;">
                                    <asp:dropdownlist id="ddlDay" runat="server" datasourceid="SqlDataSourceDay" datatextfield="Day" datavaluefield="Day"></asp:dropdownlist>
                                </span>
                                <span style="margin: 0 12px;">
                                    <asp:dropdownlist id="ddlYear" runat="server" datasourceid="SqlDataSourceYear" datatextfield="Year" datavaluefield="Year"></asp:dropdownlist>
                                </span>
                            </td>
                            <td class="dnCol4">
                                <asp:requiredfieldvalidator runat="server" errormessage="Birth month missing" id="valMonth" controltovalidate="ddlMonth" initialvalue=" " validationgroup="Donors" forecolor="Red" cssclass="dnValidate">*</asp:requiredfieldvalidator>
                                <asp:requiredfieldvalidator id="valDay" runat="server" controltovalidate="ddlDay" errormessage="Birth day missing" initialvalue=" " validationgroup="Donors" forecolor="Red" cssclass="dnValidate">*</asp:requiredfieldvalidator>
                                <asp:requiredfieldvalidator runat="server" errormessage="Birth year missing" id="valYear" controltovalidate="ddlYear" initialvalue=" " validationgroup="Donors" forecolor="Red" cssclass="dnValidate">*</asp:requiredfieldvalidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="dnCol1"></td>
                            <td class="dnCol2">Social Security Number (no dashes): </td>
                            <td class="dnCol3">
                                <asp:textbox id="tbSSN" runat="server" cssclass="dnTB"></asp:textbox>
                            </td>
                            <td class="dnCol4"></td>
                        </tr>
                        <tr>
                            <td class="dnCol1"></td>
                            <td class="dnCol2">Address: </td>
                            <td class="dnCol3">
                                <asp:textbox id="tbAddress" runat="server" cssclass="dnTB"></asp:textbox>
                            </td>
                            <td class="vtCol4">
                                <asp:requiredfieldvalidator id="valAddress" runat="server" errormessage="Address missing" validationgroup="Donors" controltovalidate="tbAddress" text="*" forecolor="Red" cssclass="dnValidate"></asp:requiredfieldvalidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="dnCol1"></td>
                            <td class="dnCol2">Address 2: </td>
                            <td class="dnCol3">
                                <asp:textbox id="tbAddress2" runat="server" cssclass="dnTB"></asp:textbox>
                            </td>
                            <td class="dnCol4"></td>
                        </tr>
                        <tr>
                            <td class="dnCol1"></td>
                            <td class="dnCol2">City: </td>
                            <td class="dnCol3">
                                <asp:textbox id="tbCity" runat="server" cssclass="dnTB"></asp:textbox>
                            </td>
                            <td class="dnCol4">
                                <asp:requiredfieldvalidator id="valCity" runat="server" errormessage="City missing" validationgroup="Donors" controltovalidate="tbCity" text="*" forecolor="Red" cssclass="dnValidate"></asp:requiredfieldvalidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="dnCol1"></td>
                            <td class="dnCol2">State: </td>
                            <td class="dnCol3">
                                <span style="margin: 0 12px;">
                                    <asp:dropdownlist runat="server" id="ddlState" datasourceid="SqlDataSourceState" datatextfield="State" datavaluefield="State"></asp:dropdownlist>
                                </span>
                            </td>
                            <td class="dnCol4">
                                <asp:requiredfieldvalidator runat="server" errormessage="State missing" id="valState" controltovalidate="ddlState" forecolor="Red" initialvalue=" " validationgroup="Donors" cssclass="dnValidate">*</asp:requiredfieldvalidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="dnCol1"></td>
                            <td class="dnCol2">Zipcode: </td>
                            <td class="dnCol3">
                                <asp:textbox id="tbZip" runat="server" cssclass="dnTB"></asp:textbox>
                            </td>
                            <td class="vtCol4">
                                <asp:requiredfieldvalidator id="valZip" runat="server" errormessage="Zip Code missing" validationgroup="Donors" controltovalidate="tbZip" text="*" forecolor="Red" cssclass="dnValidate"></asp:requiredfieldvalidator>
                                <asp:regularexpressionvalidator id="RegExZip" runat="server" controltovalidate="tbZip" cssclass="volExpr" errormessage="Incorrect Zipcode Format" forecolor="Red" validationexpression="\d{5}" validationgroup="Donors">*</asp:regularexpressionvalidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="dnCol1"></td>
                            <td class="dnCol2">Phone Number (no dashes): </td>
                            <td class="dnCol3">
                                <asp:textbox id="tbPhone" runat="server" cssclass="dnTB"></asp:textbox>
                            </td>
                            <td class="dnCol4">
                                <asp:requiredfieldvalidator id="valPhone" runat="server" errormessage="Phone Number missing" validationgroup="Donors" controltovalidate="tbPhone" text="*" forecolor="Red" cssclass="dnValidate"></asp:requiredfieldvalidator>
                                <asp:comparevalidator id="valPhoneData" runat="server" controltovalidate="tbPhone" cssclass="dnValidate" errormessage="Use only numbers for phone number" forecolor="Red" operator="DataTypeCheck" type="Integer" validationgroup="Donors">*</asp:comparevalidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="dnCol1"></td>
                            <td class="dnCol2">Email Address: </td>
                            <td class="dnCol3">
                                <asp:textbox id="tbEmail" runat="server" cssclass="dnTB"></asp:textbox>
                            </td>
                            <td class="vtCol4">
                                <asp:RequiredFieldValidator ID="valEmail" runat="server" ControlToValidate="tbEmail" CssClass="dnValidate" ErrorMessage="Email required" ForeColor="Red" ValidationGroup="Donors">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegExEmail" runat="server" ControlToValidate="tbEmail" CssClass="dnValidate" ErrorMessage="Email format invalid" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Donors">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <asp:validationsummary id="ValidationSummaryDonors" runat="server" validationgroup="Donors" forecolor="Red" />
                            </td>
                        </tr>
                    </table>
                    <div>
                        <asp:Button ID="btnToView2" runat="server" Text="Next" CssClass="auto-style1" OnClick="btnToView2_Click" ValidationGroup="Donors" />
                    </div>
                    <div style="height: 40px;"></div>
                </div>
            </asp:View>
            <asp:View ID="ViewDonationInfo" runat="server">
                <div id ="donationContent">
                    <h2 style="padding: 40px 0;">Donation Information</h2>
                    <table class="donorTable">
                        <tr>
                            <td class="dnCol1"></td>
                            <td class="dnCol2"></td>
                            <td class="dnCol3"></td>
                            <td class="dnCol4"></td>
                        </tr>
                    </table>
                    <div>
                        <asp:button id="btnSubmit" runat="server" text="Submit" validationgroup="Donations" onclick="btnSubmit_Click" cssclass="auto-style1" />
                        <asp:button id="Button1" runat="server" onclick="Button1_Click" text="Validation Check" validationgroup="Donors" />
                    </div>
                </div>
            </asp:View>
        </asp:MultiView>
        <div>
            <asp:label runat="server" id="lblDonorDbError"></asp:label><br />
            <asp:Label ID="lblDonationDbError" runat="server"></asp:Label>
        </div>
    </div>
    
    
    
    
</asp:Content>

