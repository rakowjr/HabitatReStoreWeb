<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewDonor.aspx.cs" Inherits="Donations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #bodyContainer{
            height: 1050px !important;
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
                    <tr style="height: 20px;">
                        <td></td>
                        <td style="font-size: small;"><span style="font-size: large; color: red; vertical-align: sub;">*</span> required fields</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="dnCol1"></td>
                        <td class="dnCol2"><span style="font-size: large; color: red; vertical-align: sub;">*</span> First Name: </td>
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
                        <td class="dnCol2"><span style="font-size: large; color: red; vertical-align: sub;">*</span> Last Name: </td>
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

                        </td>
                    </tr>
                        
                    <tr>
                        <td class="dnCol1"></td>
                        <td class="dnCol2"><span style="font-size: large; color: red; vertical-align: sub;">*</span> Address: </td>
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
                        <td class="dnCol2"><span style="font-size: large; color: red; vertical-align: sub;">*</span> City: </td>
                        <td class="dnCol3">
                            <asp:textbox id="tbCity" runat="server" cssclass="dnTB"></asp:textbox>
                        </td>
                        <td class="dnCol4">
                            <asp:requiredfieldvalidator id="valCity" runat="server" errormessage="City missing" validationgroup="Donors" controltovalidate="tbCity" text="*" forecolor="Red" cssclass="dnValidate"></asp:requiredfieldvalidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="dnCol1"></td>
                        <td class="dnCol2"><span style="font-size: large; color: red; vertical-align: sub;">*</span> Zipcode: </td>
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
                            <asp:RegularExpressionValidator ID="valPhoneLength" runat="server" ErrorMessage=" Incorrect phone number format" Text="*" ValidationGroup="Donors" ValidationExpression="\d{10}" ControlToValidate="tbPhone" CssClass="dnValidate" ForeColor="Red"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="dnCol1"></td>
                        <td class="dnCol2"><span style="font-size: large; color: red; vertical-align: sub;">*</span> Email Address: </td>
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
                <div style="text-align: center;">
                    <asp:Button ID="btnSubmitDonor" runat="server" Text="Next" ValidationGroup="Donors" OnClick="btnSubmitDonor_Click" Font-Size="Medium" />
                </div>
                <div style="height: 50px;"></div>
            </div>
        </asp:View>
        <asp:View ID="ViewDonationInfo" runat="server">
            <div id="donationContent">
                <h2 style="padding: 35px 0;">Donation Information</h2>
                <div>
                    <asp:CheckBox ID="cbDiffAddr" runat="server" Text="Pick-up address is different from Donor's address" AutoPostBack="True" CssClass="altAddressCheckbox" OnCheckedChanged="dbDiffAddr_CheckedChanged" Height="30px" />
                    <asp:Panel ID="PanelAltAddr" runat="server" Visible="False">
                        <table class="altAddressTable">
                                <tr>
                                    <td></td>
                                    <td class="dnCol2">Address: </td>
                                    <td class="dnCol3">
                                        <asp:textbox id="tbAltAddress" runat="server" cssclass="dnTB"></asp:textbox>
                                    </td>
                                    <td class="vtCol4">
                                        <asp:requiredfieldvalidator id="Requiredfieldvalidator1" runat="server" errormessage="Address missing" validationgroup="AltAddress" controltovalidate="tbAltAddress" text="*" forecolor="Red" cssclass="dnValidate"></asp:requiredfieldvalidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="dnCol2">Address 2: </td>
                                    <td class="dnCol3">
                                        <asp:textbox id="tbAltAddress2" runat="server" cssclass="dnTB"></asp:textbox>
                                    </td>
                                    <td class="dnCol4"></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="dnCol2">City: </td>
                                    <td class="dnCol3">
                                        <asp:textbox id="tbAltCity" runat="server" cssclass="dnTB"></asp:textbox>
                                    </td>
                                    <td class="dnCol4">
                                        <asp:requiredfieldvalidator id="Requiredfieldvalidator2" runat="server" errormessage="City missing" validationgroup="AltAddress" controltovalidate="tbAltCity" text="*" forecolor="Red" cssclass="dnValidate"></asp:requiredfieldvalidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
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
                <div class="categoryDIV">
                    <h3>Choose a donation category</h3>                    
                </div>
                <div class="categoryDIV">
                    <asp:DropDownList ID="ddlItemCategory" runat="server" DataSourceID="ItemCategoryDs" DataTextField="Description" DataValueField="Item_Category_ID" Font-Size="Medium" Height="25px" Width="200px">
                    </asp:DropDownList>
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
                
                <div style="text-align: center; padding-top: 20px;">
                    <asp:Button ID="btnSubmitDonation" runat="server" Text="Submit" ValidationGroup="Donations" OnClick="btnSubmitDonation_Click" />
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
        <asp:View ID="ViewSchedulePickup" runat="server">
            <div style="text-align: center; padding-top: 40px;">
                <h3>To better server you, let know when it would be best to pickup your donation</h3>
            </div>
            <div style="text-align: center; margin-bottom:20px;">
                <p style="margin-top:25px;">
                    <span style="font-weight: bold">pickups are Monday through Saturday between 9 AM and 5 PM (we do not pick up on Sundays)</span><br /><br />Select a day you would like have us pick up your donation.
                </p>
            </div>
            <div style="text-align: center; margin-bottom:20px;">
                <asp:Calendar ID="CalendarPickup" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" OnSelectionChanged="CalendarPickup_SelectionChanged">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
            </div>
            <div style="text-align: center; margin-bottom:20px;">
                <p>The best time for pickup would be between 
                    <span style="padding:0 5px;">
                        <asp:DropDownList ID="ddlStartWindow" runat="server" Width="100px" AutoPostBack="True">
                            
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
                    </span>
                    and
                    <span style="padding: 0 5px;">
                        <asp:DropDownList ID="ddlEndWindow" runat="server" Width="100px" AutoPostBack="True">
                            
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
                    </span>
                </p>
            </div>
            <div style="text-align: center; margin-bottom:20px;">
                <p>Any special instructions for drivers: 
                    <span style="padding: 0 5px;">
                        <asp:TextBox ID="tbSpecialInstr" runat="server" Height="30px" TextMode="MultiLine" Width="274px"></asp:TextBox>
                    </span>
                </p>
            </div>
            <div style="text-align: center; margin-bottom:20px;">
                <asp:Button ID="SubmitRequest" runat="server" Text="Submit Schedule Request" OnClick="SubmitRequest_Click" />
            </div>
        </asp:View>
        <asp:View ID="ViewDonationComplete" runat="server">
            <div class="summaryContainer">
                <div class="printDIV">                    
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/print.png" OnClientClick="javascript:window.print();" CssClass="printImage" /><span class="printText">print</span>
                </div>
                <h2>Thank you for your donation.</h2>
                <p style="margin-top:25px;">Your donation reference number is: <asp:Label runat="server" ID="lblDonationRef"></asp:Label></p>
                <asp:SqlDataSource ID="dsSummarySp" runat="server" ConnectionString="<%$ ConnectionStrings:Habitat_RestoreCS %>" SelectCommand="usp_ReportDonorDonationSummary" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblDonationRef" Name="donationID" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <p style="margin-top:25px;">
                    <asp:DetailsView ID="dvDonorInfo" runat="server" AutoGenerateRows="False" DataKeyNames="Donation_ID" DataSourceID="dsSummarySp" Width="450px" Gridlines="None">
                        <FieldHeaderStyle CssClass="alignRight" Font-Bold="True" />
                        <Fields>
                            <asp:BoundField DataField="Donation_ID" HeaderText="Donation_ID" InsertVisible="False" ReadOnly="True" SortExpression="Donation_ID" Visible="False" />
                            <asp:BoundField DataField="Donor_ID" HeaderText="Donor_ID" SortExpression="Donor_ID" Visible="False" />
                            <asp:BoundField DataField="First_Name" HeaderText="First Name : " SortExpression="First_Name" />
                            <asp:BoundField DataField="Last_Name" HeaderText="Last Name : " SortExpression="Last_Name" />
                            <asp:BoundField DataField="Address" HeaderText="Address : " SortExpression="Address" />
                            <asp:BoundField DataField="Address2" HeaderText="Address2 : " SortExpression="Address2" />
                            <asp:BoundField DataField="City" HeaderText="City : " SortExpression="City" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" Visible="False" />
                            <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" Visible="False" />
                            <asp:BoundField DataField="PickUp_Window_Start" HeaderText="Pickup Start Time : " SortExpression="PickUp_Window_Start" />
                            <asp:BoundField DataField="PickUp_Window_End" HeaderText="Pickup End Time : " SortExpression="PickUp_Window_End" />
                            <asp:BoundField DataField="Special_Instructions" HeaderText="Special Instructions :" SortExpression="Special_Instructions" />
                            <asp:BoundField DataField="Store_ID" HeaderText="Store_ID" SortExpression="Store_ID" Visible="False" />
                            <asp:BoundField DataField="Name" HeaderText="Store Name : " SortExpression="Name" />
                            <asp:TemplateField HeaderText="Store Phone Number : " SortExpression="Phone">                                
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# string.Format("{0: (###) ###-####}", Int64.Parse(Eval("Phone").ToString())) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Fields>
                        <HeaderStyle Font-Bold="False" />
                        <RowStyle CssClass="alignLeft" />
                    </asp:DetailsView>
                </p>
                <p style="margin-top:25px;">
                    <asp:GridView ID="gvDonationSummary" runat="server" AutoGenerateColumns="False" DataKeyNames="Donation_ID" DataSourceID="dsSummarySp" Width="386px" Gridlines="None">
                        <Columns>
                            <asp:BoundField DataField="Donation_ID" HeaderText="Donation_ID" InsertVisible="False" ReadOnly="True" SortExpression="Donation_ID" Visible="False" />
                            <asp:BoundField DataField="Donor_ID" HeaderText="Donor_ID" SortExpression="Donor_ID" Visible="False" />
                            <asp:BoundField DataField="First_Name" HeaderText="First_Name" SortExpression="First_Name" Visible="False" />
                            <asp:BoundField DataField="Last_Name" HeaderText="Last_Name" SortExpression="Last_Name" Visible="False" />
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" Visible="False" />
                            <asp:BoundField DataField="Address2" HeaderText="Address2" SortExpression="Address2" Visible="False" />
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="Description" Visible="False" />
                            <asp:BoundField DataField="Description" HeaderText="Donation Category" SortExpression="Description" >
                            <HeaderStyle Font-Underline="True" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Expr1" HeaderText="Item Description" SortExpression="Expr1" >
                            <HeaderStyle Font-Underline="True" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PickUp_Window_Start" HeaderText="PickUp_Window_Start" SortExpression="PickUp_Window_Start" Visible="False" />
                            <asp:BoundField DataField="PickUp_Window_End" HeaderText="PickUp_Window_End" SortExpression="PickUp_Window_End" Visible="False" />
                            <asp:BoundField DataField="Special_Instructions" HeaderText="Special_Instructions" SortExpression="Special_Instructions" Visible="False" />
                            <asp:BoundField DataField="Store_ID" HeaderText="Store_ID" SortExpression="Store_ID" Visible="False" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" Visible="False" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" Visible="False" />
                        </Columns>
                    </asp:GridView>
                </p>
                <p style="margin-top:25px;">If you have any questions, please refer to the reference number when calling.</p>
                <p style="margin-top:25px;">A representative will contact you prior to the date of your pick-up</p>
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
        <asp:Label ID="lblSchedDbError" runat="server"></asp:Label>
        <br />
        <asp:Label ID="imageTypeError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
    </div>
</asp:Content>

