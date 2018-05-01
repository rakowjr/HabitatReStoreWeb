<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="banner">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/ReStore675x275.png" />
    </div>
    <div class="padding">
        <h1>ReStores</h1>
        <p>
            <strong>Visit our Habitat for Humanity ReStores Serving Forsyth County and Stokes County!</strong>
            <br/>                                                                    
            <br />
            Habitat ReStores are home improvement stores that accept small and large donations of new or 
            gently used furniture, appliances, housewares, building materials and more. Proceeds from the 
            sales of these items help Habitat’s work in our community.
            
            <br />
        </p>
        <h6 id="dlink">Donate</h6>
        <img alt="" src="images/employee-unloading-wicker-chair_Stock-300x199.jpg" class="donateImg" />
        <p>            
            The ReStores accept donations of new and 
            gently used furniture, appliances, and 
            building materials, which we then sell at discounted prices. Proceeds help fund our 
            mission to build safe, affordable homes in Forsyth County. The ReStores also seek to 
            be good stewards of our environment by diverting usable items from landfills.            
        </p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p style="text-align: center;">
            <span style="margin-right: 30px;">
                <asp:Button ID="btnNewDonor" runat="server" OnClick="btnDonate_Click" Text="I Am A New Donor" />
            </span>
            <span style="margin-left: 30px;">
                <asp:Button ID="btnReturnDonor" runat="server" Text="I Am A Returning Donor" OnClick="btnReturnDonor_Click" Height="26px" Width="207px" />
            </span>            
            <br />
            <br />
            <span>
                &nbsp;Click the appropriate button to make an online request for a donation pickup. 
            </span>           
        </p>
        <h6>Volunteer</h6>
        <img alt="" src="images/volunteers-300x228.jpg" class="volunteerImg"/>
        <p>
            Volunteers are the lifeblood of Habitat Forsyth. We could never function without the 1,000+ 
            volunteers who bless us each year. Thank you for supporting Habitat through your time and energy!
        </p>
        <p>
            When volunteering at the ReStore, you will help with accepting, moving and preparing donations for 
            the sales floor while also assisting customers and the ReStore staff. If you sign up for an all-day 
            position, be aware that you may leave the store and help with donation pick-ups and that you 
            MUST be physically fit and able to lift at least 30 lbs.  Minimum age is 14. Those 14-15 need a 
            parent guardian while they volunteer. Both individuals and groups are welcome.
        </p>
        <p>
            <asp:Button ID="btnVolunteer" runat="server" OnClick="btnVolunteer_Click" Text="I Want To Volunteer" />&nbsp;Click here to begin volunteer registration
        </p>
    </div>
</asp:Content>

