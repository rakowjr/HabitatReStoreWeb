<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewDonor2.aspx.cs" Inherits="NewDonor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">       
        .auto-style1 {
            margin-left: 325px;
        }       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">  
    <div>
        <asp:sqldatasource runat="server" ID="ItemCategoryDs" ConnectionString="<%$ ConnectionStrings:Habitat_RestoreCS %>" SelectCommand="SELECT [Item_Category_ID], [Description] FROM [Item_Category]"></asp:sqldatasource>
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
                                <asp:RegularExpressionValidator ID="valPhoneLength" runat="server" ErrorMessage=" Incorrect phone number format" Text="*" ValidationGroup="Donors" ValidationExpression="\d{10}" ControlToValidate="tbPhone" CssClass="dnValidate"></asp:RegularExpressionValidator>
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
                        <asp:Button ID="btnToView2" runat="server" Text="Next" CssClass="auto-style1" OnClick="btnToView2_Click" ValidationGroup="Donors" IsPostBack="false"/>
                    </div>
                    <div style="height: 40px;"></div>
                </div>
            </asp:View>
            <asp:View ID="ViewDonationInfo" runat="server">
                <div id ="donationContent">
                    <h2 style="padding: 40px 0;">Donation Information</h2>
                    <div>
                        <asp:CheckBox ID="cbDifAddr" runat="server" Text="Pick-up address is different from Donor's address" AutoPostBack="True" OnCheckedChanged="cbDifAddr_CheckedChanged" />
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
                        <asp:RadioButtonList ID="rbCategoryList" runat="server" DataSourceID="ItemCategoryDs" DataTextField="Description" DataValueField="Item_Category_ID" RepeatColumns="4" RepeatDirection="Horizontal" CellSpacing="1" CssClass="itemCategoryList">
                        </asp:RadioButtonList>
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
                        <asp:button id="btnSubmit" runat="server" text="Submit" validationgroup="Donations" onclick="btnSubmit_Click" cssclass="auto-style1" />
                    </div>
                </div>
            </asp:View>
            <asp:View ID="AnotherItemOrDone" runat="server">
                <div style="text-align: center; padding-top: 40px;">
                    <h3>Would you like to add more items to your donation?</h3>
                </div>
                <div style="height: 125px; width: 480px; padding-top: 40px;">
                    <span style="text-align: center; float: left;"><asp:Button ID="btnScheduleMore" runat="server" Text="Yes, let me add more items" OnClick="btnScheduleMore_Click" Width="200px" /></span><span style="text-align: center; float: right;"><asp:Button ID="btnScheduleDone" runat="server" Text="No, I am finished" OnClick="btnScheduleDone_Click" Width="200px" /></span>
                </div>
            </asp:View>
            <asp:View ID="ViewDonationChoice" runat="server">
                <div style="text-align: center; padding-top: 40px;">
                    <h3>Thank you for your donation.</h3>
                    <p style="margin-top:25px;">Your donation reference number is: <asp:Label runat="server" ID="lblDonationRef"></asp:Label></p>
                    <p style="margin-top:25px;">
                        Please select a day you would like have us pick up your donation. (We do not pick up on Sundays)</p>
                    <p style="margin-top:25px;">
                        <asp:TextBox ID="TextBox1" runat="server" Width="112px"></asp:TextBox>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </p>
                    <p style="margin-top:25px;">
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" OnSelectionChanged="Calendar1_SelectionChanged" Width="200px">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                            <NextPrevStyle VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#808080" />
                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" />
                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                        </asp:Calendar>
                    </p>
                    <p style="margin-top:25px;">
                        <asp:Label ID="Label1" runat="server" Text="The Best Time For Pickup Would Be Between "></asp:Label>
                        <asp:DropDownList ID="ddlStartWindow" runat="server" AutoPostBack="True" Width="100px" OnSelectedIndexChanged="ddlStartWindow_SelectedIndexChanged" Height="21px">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem Value="9:00">9:00 AM</asp:ListItem>
                            <asp:ListItem Value="9:30">9:30 AM</asp:ListItem>
                            <asp:ListItem Value="10:00">10:00 AM</asp:ListItem>
                            <asp:ListItem Value="10:30">10:30 AM</asp:ListItem>
                            <asp:ListItem Value="11:00">11:00 AM</asp:ListItem>
                            <asp:ListItem Value="11:30">11:30 AM</asp:ListItem>
                            <asp:ListItem Value="12:00">12:00 PM</asp:ListItem>
                            <asp:ListItem Value="12:30">12:30 PM</asp:ListItem>
                            <asp:ListItem Value="13:00">1:00 PM</asp:ListItem>
                            <asp:ListItem Value="13:30">1:30 PM</asp:ListItem>
                            <asp:ListItem Value="14:00">2:00 PM</asp:ListItem>
                            <asp:ListItem Value="14:30">2:30 PM</asp:ListItem>
                            <asp:ListItem Value="15:00">3:00 PM</asp:ListItem>
                            <asp:ListItem Value="15:30">3:30 PM</asp:ListItem>
                            <asp:ListItem Value="16:00">4:00 PM</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label2" runat="server" Text=" And "></asp:Label>
                        <asp:DropDownList ID="ddlEndWindow" runat="server" AutoPostBack="True" Width="100px" OnSelectedIndexChanged="ddlEndWindow_SelectedIndexChanged">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem Value="10:00">10:00 AM</asp:ListItem>
                            <asp:ListItem Value="10:30">10:30 AM</asp:ListItem>
                            <asp:ListItem Value="11:00">11:00 AM</asp:ListItem>
                            <asp:ListItem Value="11:30">11:30 AM</asp:ListItem>
                            <asp:ListItem Value="12:00">12:00 PM</asp:ListItem>
                            <asp:ListItem Value="12:30">12:30 PM</asp:ListItem>
                            <asp:ListItem Value="13:00">1:00 PM</asp:ListItem>
                            <asp:ListItem Value="13:30">1:30 PM</asp:ListItem>
                            <asp:ListItem Value="14:00">2:00 PM</asp:ListItem>
                            <asp:ListItem Value="14:30">2:30 PM</asp:ListItem>
                            <asp:ListItem Value="15:00">3:00 PM</asp:ListItem>
                            <asp:ListItem Value="15:30">3:30 PM</asp:ListItem>
                            <asp:ListItem Value="16:00">4:00 PM</asp:ListItem>
                            <asp:ListItem Value="16:30">4:30 PM</asp:ListItem>
                            <asp:ListItem Value="17:00">5:00 PM</asp:ListItem>
                        </asp:DropDownList>
                    </p>
                    <p style="margin-top:25px;">
                        If you have any special instructions for our drivers, please put them here:
                        <asp:TextBox ID="tbSpecialInstr" runat="server" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                    </p>
                    <p style="margin-top:25px;">
                        <asp:Button ID="btnPickupSchedule" runat="server" Text="Submit Your Choice" />
                    </p>
                    <p style="margin-top:25px;">A representative will contact you to confirm the date scheduled for your pick-up</p>
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
    </div>
    
    
    
    
</asp:Content>

