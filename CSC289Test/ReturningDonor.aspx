<%@ Page Title="" Language="C#" MasterPageFile="~/DonorMasterPage.master" AutoEventWireup="true" CodeFile="ReturningDonor.aspx.cs" Inherits="ReturningDonor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="ItemCategoryDs" runat="server" ConnectionString="<%$ ConnectionStrings:Habitat_RestoreCS %>" SelectCommand="SELECT [Item_Category_ID], [Description] FROM [Item_Category] ORDER BY [Description]"></asp:SqlDataSource>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="FindDonorView" runat="server">
            <div id="donorContent">            
                <h2 style="padding: 40px 0 20px 0;">Welcome back</h2>
                <div style="text-align: center;">                
                    <p>Please provide your email address so we can find your account</p>
                    <table style="margin: 25px 0;">
                        <tr>
                            <td></td>
                            <td class="dnCol2">Email Address:</td>
                            <td>
                                <asp:TextBox ID="tbEmail" runat="server" CssClass="dnTB"></asp:TextBox></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
                <div style="text-align: center;">
                    <asp:Button ID="Submit" runat="server" Text="Enter" OnClick="Submit_Click" Font-Size="Medium" />
                    <br />                    
                </div>
                <div>
                    <asp:Label ID="lblIdNotFound" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="donorIdDbError" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </asp:View>
        <asp:View ID="ViewDonationInfo" runat="server">
                <div id ="donationContent">
                    <h2 style="padding: 40px 0;">Donation Information</h2>
                    <div>
                        <asp:CheckBox ID="cbDiffAddr" runat="server" Text="Pick-up address is different from Donor's address" AutoPostBack="True" OnCheckedChanged="cbDiffAddr_CheckedChanged" />
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
                    <div style="margin-left: 15px; margin-top: 25px;">
                        <h3>Choose a donation category</h3>
                        <!--<asp:RadioButtonList ID="rbCategoryList" runat="server" DataSourceID="ItemCategoryDs" DataTextField="Description" DataValueField="Item_Category_ID" RepeatColumns="4" RepeatDirection="Horizontal" CellSpacing="1" CssClass="itemCategoryList"></asp:RadioButtonList>-->
                        <br />
                    </div>
                    <div style="text-align: center; margin-bottom: 25px;">
                        <asp:DropDownList ID="ddlItemCategory" runat="server" DataSourceID="ItemCategoryDs" DataTextField="Description" DataValueField="Item_Category_ID" Font-Size="Medium" Height="25px" Width="200px"></asp:DropDownList>
                    </div>
                    <table class="donorTable">                        
                        <tr>
                            <td class="dnCol1"></td>
                            <td class="dnCol2">
                                Type a description of the donation</td>
                            <td class="dnCol3">
                                <asp:TextBox ID="tbDnDesc" runat="server" Height="84px" TextMode="MultiLine" Width="230px"></asp:TextBox>
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
                        <asp:button id="btnSubmit" runat="server" text="Submit" validationgroup="Donations" onclick="btnSubmit_Click" cssclass="auto-style1" />
                    </div>
                </div>
            </asp:View>
            <asp:View ID="AnotherChoice" runat="server">
                <div style="text-align: center; padding-top: 40px;">
                    <h3>Would you like to add more items to your donation?</h3>
                </div>
                <div style="height: 125px; width: 480px; padding-top: 40px;">
                    <span style="text-align: center; float: left;"><asp:Button ID="btnScheduleMore" runat="server" Text="Yes, let me add more items" OnClick="btnScheduleMore_Click" Width="230px" /></span><span style="text-align: center; float: right;"><asp:Button ID="btnScheduleDone" runat="server" Text="No, I am finished" OnClick="btnScheduleDone_Click" Width="230px" /></span>
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
                            <asp:DropDownList ID="ddlStartWindow" runat="server" AutoPostBack="True" Width="100px">
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
                            <asp:DropDownList ID="ddlEndWindow" runat="server" AutoPostBack="True" Width="100px">
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
                <div style="text-align: center; padding-top: 125px;">
                    <h3>Thank you for your donation.</h3>
                    <p style="margin-top:25px;">Your donation reference number is: <asp:Label runat="server" ID="lblDonationRef"></asp:Label></p>
                    <p style="margin-top:25px;">If you have any questions, please refer to this number when calling.</p>
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
            <asp:Label ID="lblSchedDbError" runat="server"></asp:Label>
            <br />
            <asp:Label ID="imageTypeError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        </div>
    
</asp:Content>

