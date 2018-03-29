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
    private int volunteerID;

    protected void Page_Load(object sender, EventArgs e)
    {
        for (int i = 1; i <= 12; i++)
        {
            ListItem ltItem = new ListItem();
            ltItem.Text = i.ToString();
            ltItem.Text = i.ToString();

            ddlMonth.Items.Add(ltItem);
        }
        for (int  i = 1; i <= 31; i++)
        {
            ListItem ltItem = new ListItem();
            ltItem.Text = i.ToString();
            ltItem.Text = i.ToString();

            ddlDay.Items.Add(ltItem);
        }
        for (int i = 2004; i >= 1930; i--)
        {
            ListItem ltItem = new ListItem();
            ltItem.Text = i.ToString();
            ltItem.Value = i.ToString();

            ddlYear.Items.Add(ltItem);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {       

        int volunteerStatusID = 1; //Status Map ID variable hard coded

        String date = ddlYear.SelectedValue + "-" + ddlMonth.SelectedValue + "-" + ddlDay.SelectedValue;
        DateTime dt = DateTime.Parse(date);
        
        //Create new SqlConnection using the connection string from web.config
        SqlConnection mConn = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);

        //Create new Sql Statement to insert data into the Volunteer table
        SqlCommand cmd = new SqlCommand("Insert INTO Volunteer (Status_Map_ID,Last_Name, First_Name, Middle_Name, Gender, DOB, SSN, Address, Address2, City, State, Zip_Code, Phone, Email) VALUES (@Status_Map_ID, @Last_Name, @First_Name, @Middle_Name, @Gender, @DOB, @SSN, @Address, @Address2, @City, @State, @Zip_Code, @Phone, @Email)", mConn);

        //Define command type
        cmd.CommandType = CommandType.Text;

        //provide values from page
        cmd.Parameters.AddWithValue("@Status_Map_ID", volunteerStatusID);
        cmd.Parameters.AddWithValue("@Last_Name",tbLName.Text);
        cmd.Parameters.AddWithValue("@First_Name", tbFName.Text);
        cmd.Parameters.AddWithValue("@Middle_Name", tbMName.Text);
        cmd.Parameters.AddWithValue("@Gender", rBtnGender.SelectedValue);
        cmd.Parameters.AddWithValue("@DOB", dt);
        cmd.Parameters.AddWithValue("@SSN", tbSSN.Text);
        cmd.Parameters.AddWithValue("@Address", tbAddress.Text);
        cmd.Parameters.AddWithValue("@Address2", tbAddress2.Text);
        cmd.Parameters.AddWithValue("@City", tbCity.Text);
        cmd.Parameters.AddWithValue("@State", "NC");
        cmd.Parameters.AddWithValue("@Zip_Code", tbZip.Text);
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


    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}