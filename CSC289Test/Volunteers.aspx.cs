using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;


public partial class Volunteers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Label1.Text = tbLName.Text;
        Label2.Text = tbFName.Text;
        Label3.Text = tbMName.Text;
        Label4.Text = rBtnGender.SelectedValue;
        Label5.Text = tbDOB.Text;
        Label6.Text = tbSSN.Text;
        Label7.Text = tbAddress.Text;
        Label8.Text = tbAddress2.Text;
        Label9.Text = tbCity.Text;
        Label10.Text = tbState.Text;
        Label11.Text = tbZip.Text;
        Label12.Text = tbPhone.Text;
        Label13.Text = tbEmail.Text;

        //Create new SqlConnection using the connection string from web.config
        SqlConnection mConn = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);

        //Create new Sql Statement to insert data into the Volunteer table
        SqlCommand cmd = new SqlCommand("Insert INTO Volunteer (Last_Name, First_Name, Middle_Name, Gender, DOB, SSN, Address, Address2, City, State, ZipCode, Phone, Email) VALUES (@First_Name, @Last_Name, @Middle_Name, @Gender, @DOB, @SSN, @Address, @Address2, @City, @State, @ZipCode, @Phone, @Email)", mConn);

        //Define command type
        cmd.CommandType = CommandType.Text;

        //provide values from page
        cmd.Parameters.AddWithValue("@Last_Name",tbLName.Text);
        cmd.Parameters.AddWithValue("@First_Name", tbFName.Text);
        cmd.Parameters.AddWithValue("@Middle_Name", tbMName.Text);
        cmd.Parameters.AddWithValue("@Gender", rBtnGender.SelectedValue);
        cmd.Parameters.AddWithValue("@DOB", Convert.ToDateTime(tbDOB.Text));
        cmd.Parameters.AddWithValue("@SSN", tbSSN.Text);
        cmd.Parameters.AddWithValue("@Address", tbAddress.Text);
        cmd.Parameters.AddWithValue("@Address2", tbAddress2.Text);
        cmd.Parameters.AddWithValue("@City", tbCity.Text);
        cmd.Parameters.AddWithValue("@State", tbState.Text);
        cmd.Parameters.AddWithValue("@ZipCode", tbZip.Text);
        cmd.Parameters.AddWithValue("@Phone", tbPhone.Text);
        cmd.Parameters.AddWithValue("@Email", tbEmail.Text);

        try
        {
            using (mConn)
            {
                mConn.Open();
                cmd.ExecuteNonQuery();
            }

        }
        catch (Exception ex)
        {
            lblDbError.Text = "A database error has occured.<br />" + "Message: " + ex.Message;
        }

    }
}