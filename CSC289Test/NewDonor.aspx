<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewDonor.aspx.cs" Inherits="Donations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">       
        .btnMargin {
            margin-left: 325px;
        }       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="ItemCategoryDs" runat="server" ConnectionString="<%$ ConnectionStrings:Habitat_RestoreCS %>" SelectCommand="SELECT [Item_Category_ID], [Description] FROM [Item_Category] ORDER BY [Description]"></asp:SqlDataSource>
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
                            <asp:RegularExpressionValidator ID="valPhoneLength" runat="server" ErrorMessage=" Incorrect phone number format" Text="*" ValidationGroup="Donors" ValidationExpression="\d{10}" ControlToValidate="tbPhone" CssClass="dnValidate" ForeColor="Red"></asp:RegularExpressionValidator>
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
                    <asp:Button ID="btnSubmitDonor" runat="server" Text="Next" CssClass="btnMargin" ValidationGroup="Donors" OnClick="btnSubmitDonor_Click" />
                </div>
                <div style="height: 50px;"></div>
            </div>
        </asp:View>
        <asp:View ID="ViewDonationInfo" runat="server">
            <div id="donationContent">
                <h2 style="padding: 40px 0;">Donation Information</h2>
                <div>
                    <asp:CheckBox ID="cbDiffAddr" runat="server" Text="Pick-up address is different from Donor's address" AutoPostBack="True" CssClass="volunteerCategoryCB" OnCheckedChanged="dbDiffAddr_CheckedChanged" />
                    <asp:Panel ID="PanelAltAddr" runat="server" Visible="False">
                        <table class="donorTable">
                                <tr>
                                    <td class="dnCol1"></td>
                                    <td class="dnCol2">Address: </td>
                                    <td class="dnCol3">
                                        <asp:textbox id="tbAltAddress" runat="server" cssclass="dnTB"></asp:textbox>
                                    </td>
                                    <td class="vtCol4">
                                        <asp:requiredfieldvalidator id="Requiredfieldvalidator1" runat="server" errormessage="Address missing" validationgroup="AltAddress" controltovalidate="tbAltAddress" text="*" forecolor="Red" cssclass="dnValidate"></asp:requiredfieldvalidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dnCol1"></td>
                                    <td class="dnCol2">Address 2: </td>
                                    <td class="dnCol3">
                                        <asp:textbox id="tbAltAddress2" runat="server" cssclass="dnTB"></asp:textbox>
                                    </td>
                                    <td class="dnCol4"></td>
                                </tr>
                                <tr>
                                    <td class="dnCol1"></td>
                                    <td class="dnCol2">City: </td>
                                    <td class="dnCol3">
                                        <asp:textbox id="tbAltCity" runat="server" cssclass="dnTB"></asp:textbox>
                                    </td>
                                    <td class="dnCol4">
                                        <asp:requiredfieldvalidator id="Requiredfieldvalidator2" runat="server" errormessage="City missing" validationgroup="AltAddress" controltovalidate="tbAltCity" text="*" forecolor="Red" cssclass="dnValidate"></asp:requiredfieldvalidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dnCol1"></td>
                                    <td class="dnCol2">Zipcode: </td>
                                    <td class="dnCol3">
                                        <asp:textbox id="tbAltZip" runat="server" cssclass="dnTB"></asp:textbox>
                                    </td>
                                    <td class="vtCol4">
                                        <asp:requiredfieldvalidator id="Requiredfieldvalidator3" runat="server" errormessage="Zip Code missing" validationgroup="AltAddress" controltovalidate="tbAltZip" text="*" forecolor="Red" cssclass="dnValidate"></asp:requiredfieldvalidator>
                                        <asp:regularexpressionvalidator id="Regularexpressionvalidator1" runat="server" controltovalidate="tbAltZip" cssclass="volExpr" errormessage="Incorrect Zipcode Format" forecolor="Red" validationexpression="\d{5}" validationgroup="AltAddress">*</asp:regularexpressionvalidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan ="4">
                                        <asp:ValidationSummary ID="ValAltAddress" runat="server" ValidationGroup="AltAddress" ForeColor="Red" />
                                    </td>
                                </tr>
                            </table>
                    </asp:Panel>
                </div>
                <div style="margin-left: 15px;">
                    <h3>Choose a donation category</h3>
                    <asp:RadioButtonList ID="rbCategoryList" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" CellPadding="1" CssClass="itemCategoryList" DataSourceID="ItemCategoryDs" DataTextField="Description" DataValueField="Item_Category_ID"></asp:RadioButtonList>
                </div>
                <table class="donorTable">                        
                    <tr>
                        <td class="dnCol1"></td>
                        <td class="dnCol2">
                            Type a description of the donation</td>
                        <td class="dnCol3">
                            <asp:TextBox ID="tbDnDesc" runat="server" Height="49px" TextMode="MultiLine" Width="230px"></asp:TextBox>
                        </td>
                        <td class="dnCol4"></td>
                    </tr>
                    <tr>
                        <td class="dnCol1"></td>
                        <td class="dnCol2" style="height: 80px">
                            (optional) Upload a photo of the donation
                        </td>
                        <td class="dnCol3">
                            <asp:FileUpload ID="FileUpload1" runat="server" Width="256px" />
                        </td>
                        <td class="dnCol4"></td>
                    </tr>                        
                </table>
                <div>
                    <asp:Label ID="lblCategoryVal" runat="server" Text=""></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="rbCategoryList" ErrorMessage="You Must Choose a Donation Category" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:Button ID="btnSubmitDonation" runat="server" Text="Submit" ValidationGroup="Donations" CssClass="btnMargin" OnClick="btnSubmitDonation_Click" />
                </div>
                <div style="height: 50px;"></div>
            </div>
        </asp:View>
        <asp:View ID="AnotherItemOrDone" runat="server">
            <div style="text-align: center; padding-top: 40px;">
                <h3>Would you like to add more items to your donation?</h3>
            </div>
            <div style="height: 125px; width: 480px; padding-top: 40px;">
                <span style="text-align: center; float: left;">
                    <asp:Button ID="btnScheduleMore" runat="server" Text="Yes, let me add more items" Width="200 px" OnClick="btnScheduleMore_Click" />
                </span>
                <span style="text-align: center; float: right;">
                    <asp:Button ID="btnScheduleDone" runat="server" Text="No, I am finished" Width="200px" OnClick="btnScheduleDone_Click" />
                </span>
            </div>
        </asp:View>
        <asp:View ID="ViewDonationComplete" runat="server">
            <div style="text-align: center; padding-top: 40px;">
                <h3>Thank you for your donation.</h3>
                <p style="margin-top:25px;">Your donation reference number is: <asp:Label runat="server" ID="lblDonationRef"></asp:Label></p>
                <p style="margin-top:25px;">A representative will contact you with the date scheduled for your pick-up</p>
            </div>
        </asp:View>
    </asp:MultiView>
    <div>
        <asp:label runat="server" id="lblDonorDbError"></asp:label>
        <br />
        <asp:Label ID="lblDonorIDerror" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblDonationDbError" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblItemDbError" runat="server"></asp:Label>
        <br />
        <asp:Label ID="imageTypeError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    </div>
</asp:Content>

