<%@ Page Title="" Language="C#" MasterPageFile="~/DonorMasterPage.master" AutoEventWireup="true" CodeFile="ReturnDonor.aspx.cs" Inherits="ReturnDonor" %>

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
                                <asp:TextBox ID="tbEmail" runat="server" CssClass="dnTB"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="text-align: center;">
                    <asp:Button ID="btnSubmitEmail" runat="server" Text="Enter" Font-Size="Medium" OnClick="btnSubmitEmail_Click" />
                </div>
                <div style="text-align: center; margin-top: 30px;">
                    <asp:Label ID="lblNoEmail" runat="server" Visible="False" ForeColor="Red" Font-Size="Medium"></asp:Label>
                    <asp:Label ID="donorIdDbError" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
        </asp:View>
        <asp:View ID="DonationInfoView" runat="server">
            <div id="donationContent">
                <h2 style="padding: 40px 0;">Donation Information</h2>
                <div>
                    <asp:CheckBox ID="cbDiffAddr" runat="server" Text="Pick-up address is different from Donor's address" AutoPostBack="True" OnCheckedChanged="cbDiffAddr_CheckedChanged" />
                    <asp:Panel ID="PanelAltAddr" runat="server" Visible="False">
                        <table class="donorTable">
                            <tr>
                                <td class="dnCol1"></td>
                                <td class="dnCol2"></td>
                                <td class="dnCol3"></td>
                                <td class="dnCol4"></td>
                            </tr>
                            <tr>
                                <td class="dnCol1"></td>
                                <td class="dnCol2"></td>
                                <td class="dnCol3"></td>
                                <td class="dnCol4"></td>
                            </tr>
                            <tr>
                                <td class="dnCol1"></td>
                                <td class="dnCol2"></td>
                                <td class="dnCol3"></td>
                                <td class="dnCol4"></td>
                            </tr>
                            <tr>
                                <td class="dnCol1"></td>
                                <td class="dnCol2"></td>
                                <td class="dnCol3"></td>
                                <td class="dnCol4"></td>
                            </tr>
                        </table>
                    </asp:Panel>
                </div>
            </div>
        </asp:View>
        <asp:View ID="MoreOrDoneView" runat="server">

        </asp:View>
        <asp:View ID="SchedulePickupView" runat="server">

        </asp:View>
        <asp:View ID="DonationCompleteView" runat="server">

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
        <br />
        <asp:Label ID="lblDonorID" runat="server" Text="donorID empty"></asp:Label>
    </div>
</asp:Content>

