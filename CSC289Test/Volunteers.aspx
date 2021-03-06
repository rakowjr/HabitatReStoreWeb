﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Volunteers.aspx.cs" Inherits="Volunteers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #bodyContainer{
            height: 1050px !important;
        }
        .buttonPosition {
            margin-left: 325px;
        } 
        .volPhoto{
            border: 1px solid #ddd;
            padding: 6px;
            box-shadow: 0 2px 6px rgba(0,0,0,33);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">  

    <div id="volunteerContent">
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <h2 style="padding: 40px 0;">Volunteer Registration</h2>
                <table class="volunteerTable">
                    <tr style="height: 20px;">
                        <td></td>
                        <td style="font-size: small;"><span style="font-size: large; color: red; vertical-align: sub;">*</span> required fields</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="vtCol1"></td>
                        <td class="vtCol2"><span style="font-size: large; color: red; vertical-align: sub;">*</span> First Name: </td>
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
                        <td class="vtCol2"><span style="font-size: large; color: red; vertical-align: sub;">*</span> Last Name: </td>
                        <td class="vtCol3">
                            <asp:TextBox ID="tbLName" runat="server" CssClass="volTB"></asp:TextBox>
                        </td>
                        <td class="vtCol4">
                            <asp:RequiredFieldValidator ID="valLName" runat="server" ErrorMessage="Last Name missing" ControlToValidate="tbLName" ValidationGroup="Volunteers" Text="*" ForeColor="Red" CssClass="volValidate"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td class="vtCol1"></td>
                        <td class="vtCol2"><span style="font-size: large; color: red; vertical-align: sub;">*</span> Gender (M/F): </td>
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
                        <td class="vtCol2"><span style="font-size: large; color: red; vertical-align: sub;">*</span> Date of Birth: </td>
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
                        <td class="vtCol2"><span style="font-size: large; color: red; vertical-align: sub;">*</span> Address: </td>
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
                        <td class="vtCol2"><span style="font-size: large; color: red; vertical-align: sub;">*</span> City: </td>
                        <td class="vtCol3">
                            <asp:TextBox ID="tbCity" runat="server" CssClass="volTB"></asp:TextBox>
                        </td>
                        <td class="vtCol4">
                            <asp:RequiredFieldValidator ID="valCity" runat="server" ErrorMessage="City missing" ValidationGroup="Volunteers" ControlToValidate="tbCity" Text="*" ForeColor="Red" CssClass="volValidate"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="vtCol1"></td>
                        <td class="vtCol2"><span style="font-size: large; color: red; vertical-align: sub;">*</span> Zipcode: </td>
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
                        <td class="vtCol2"><span style="font-size: large; color: red; vertical-align: sub;">*</span> Phone Number (no dashes): </td>
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
                    <asp:Button ID="btnSubmit" runat="server" Text="Next" ValidationGroup="Volunteers" OnClick="btnSubmit_Click" CssClass="buttonPosition" />                    
                </div>
                
                <div style="height: 40px;"></div>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <div style="margin-top: 80px;">
                    <asp:SqlDataSource ID="VolCategoryDS" runat="server" ConnectionString="<%$ ConnectionStrings:Habitat_RestoreCS %>" SelectCommand="SELECT [Category_Type_ID], [Description] FROM [Volunteer_Category_Type]"></asp:SqlDataSource>
                    <h3 style="padding-top: 30px;">Please select your volunteering preferences</h3>
                    <div style="margin-left: 70px;">
                        <asp:CheckBoxList ID="cblVolCategory" runat="server" RepeatDirection="Horizontal" CellPadding="5" CellSpacing="30" CssClass="volunteerCategoryCB" DataSourceID="VolCategoryDS" DataTextField="Description" DataValueField="Category_Type_ID" RepeatColumns="2"></asp:CheckBoxList>
                    </div>
                    <div>
                        <asp:Button ID="volCatSubmit" runat="server" Text="Submit" OnClick="volCatSubmit_Click" CssClass="buttonPosition" />
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <div style="margin-top: 80px;">
                    <h2>Thank You!</h2>
                    <h4 style="text-align:center; margin-top: 35px; margin-bottom: 55px;">Welcome to our group!<br /><br />A Habitat representative will contact you to schedule your volunteering activity</h4>                    
                </div>
                <div style="margin-left: 200px;">
                    <img alt="" src="images/volunteers-300x228.jpg" class="volPhoto;"/>
                </div>
            </asp:View>
        </asp:MultiView>
        <div>
            <asp:label runat="server" ID="lblDbError"></asp:label>
        </div>
    </div>

</asp:Content>

