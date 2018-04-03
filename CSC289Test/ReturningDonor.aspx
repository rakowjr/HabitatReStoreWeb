<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReturningDonor.aspx.cs" Inherits="ReturningDonor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="ItemCategoryDs" runat="server" ConnectionString="<%$ ConnectionStrings:Habitat_RestoreCS %>" SelectCommand="SELECT [Item_Category_ID], [Description] FROM [Item_Category]"></asp:SqlDataSource>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="FindDonorView" runat="server">
            <h2>Welcome back</h2>
            <p>Please provide your email address so we can find your account</p>
            <table>
                <tr>
                    <td></td>
                    <td class="dnCol2">Email Address:</td>
                    <td>
                        <asp:TextBox ID="tbEmail" runat="server" CssClass="dnTB"></asp:TextBox></td>
                    <td></td>
                </tr>
            </table>
            <div>
                <asp:Button ID="Submit" runat="server" Text="Enter" OnClick="Submit_Click" />
                <br />
                <asp:Label ID="lblIdNotFound" runat="server" Visible="False"></asp:Label>
            </div>
            <div>
                <asp:Label ID="donorIdDbError" runat="server" Text=""></asp:Label>
            </div>
        </asp:View>
        <asp:View ID="ViewDonationInfo" runat="server">
                <div id ="donationContent">
                    <h2 style="padding: 40px 0;">Donation Information</h2>
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
            <asp:View ID="ViewDonationChoice" runat="server">
                <div style="text-align: center; padding-top: 40px;">
                    <h3>Thank you for your donation.</h3>
                    <p style="margin-top:25px;">A representative will contact you with the date scheduled for your pick-up</p>
                </div>
                <div style="height: 125px; width: 480px; padding-top: 40px;">
                    <span style="text-align: center; float: left;"><asp:Button ID="btnScheduleMore" runat="server" Text="I would like to donate another item" OnClick="btnScheduleMore_Click" Width="230px" /></span><span style="text-align: center; float: right;"><asp:Button ID="btnScheduleDone" runat="server" Text="I am finished with the donation" OnClick="btnScheduleDone_Click" Width="230px" /></span>
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
    </asp:MultiView>
</asp:Content>

