using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;
using System.IO;


public partial class Volunteers : System.Web.UI.Page
{
    private int donorID; //variable to store Donor_ID output
    private int donorStatusID = 4; //Status Map ID active hard coded 
    private int donationID; //variable to store Donation_ID output
    private int storeID = 1;
    private bool bypassFlag = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.ActiveViewIndex = 0;
        }
    }

    protected void btnToView2_Click(object sender, EventArgs e)
    {
        //Insert information into Donor table and output Donor_ID       

        //Create new SqlConnection using the connection string from web.config
        SqlConnection mConn = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);

        //Create new Sql Statement to insert data into the Volunteer table
        SqlCommand cmd = new SqlCommand("Insert INTO Donor (Status_Map_ID, Last_Name, First_Name, Middle_Name, Gender, Address, Address2, City, State, ZipCode, Phone, Email) OUTPUT INSERTED.Donor_ID VALUES (@Status_Map_ID, @Last_Name, @First_Name, @Middle_Name, @Gender,  @Address, @Address2, @City, @State, @ZipCode, @Phone, @Email)", mConn);

        //Define command type
        cmd.CommandType = CommandType.Text;

        //provide values from page
        cmd.Parameters.AddWithValue("@Status_Map_ID", donorStatusID);
        cmd.Parameters.AddWithValue("@Last_Name", tbLName.Text);
        cmd.Parameters.AddWithValue("@First_Name", tbFName.Text);
        cmd.Parameters.AddWithValue("@Middle_Name", tbMName.Text);
        cmd.Parameters.AddWithValue("@Gender", rBtnGender.SelectedValue);
        cmd.Parameters.AddWithValue("@Address", tbAddress.Text);
        cmd.Parameters.AddWithValue("@Address2", tbAddress2.Text);
        cmd.Parameters.AddWithValue("@City", tbCity.Text);
        cmd.Parameters.AddWithValue("@State", "NC");
        cmd.Parameters.AddWithValue("@ZipCode", tbZip.Text);
        cmd.Parameters.AddWithValue("@Phone", tbPhone.Text);
        cmd.Parameters.AddWithValue("@Email", tbEmail.Text);

        try
        {
            using (mConn)
            {
                mConn.Open();
                donorID = (int)cmd.ExecuteScalar(); //return Donor_ID data
            }

        }
        catch (Exception ex)
        {
            lblDonorDbError.Text = "A database error has occured.<br />" + "Message: " + ex.Message;
        }

        //Switch to Donation Information view
        MultiView1.ActiveViewIndex = 1;

        lblDonorID.Text = donorID.ToString();

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {   

        //insert information into Donation table and output Donation_ID
        //Create new SqlConnection using the connection string from web.config
        SqlConnection mConn = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);

        //Create new Sql Statement to insert data into the Volunteer table
        SqlCommand cmd = new SqlCommand("Insert INTO Donation (Store_ID, Donor_ID, Status_Map_ID, Address, Address2, City, State, ZipCode, Bypass_Flag) OUTPUT INSERTED.Donation_ID VALUES (@Store_ID, @Donor_ID, @Status_Map_ID, @Address, @Address2, @City, @State, @ZipCode, @Bypass_Flag)", mConn);

        //Define command type
        cmd.CommandType = CommandType.Text;

        cmd.Parameters.AddWithValue("@Store_ID", storeID);
        cmd.Parameters.AddWithValue("@Donor_ID", donorID);
        cmd.Parameters.AddWithValue("@Status_Map_ID", donorStatusID);
        cmd.Parameters.AddWithValue("@Address", tbAddress.Text);
        cmd.Parameters.AddWithValue("@Address2", tbAddress2.Text);
        cmd.Parameters.AddWithValue("@City", tbCity.Text);
        cmd.Parameters.AddWithValue("@State", "NC");
        cmd.Parameters.AddWithValue("@ZipCode", tbZip.Text);
        cmd.Parameters.AddWithValue("@Bypass_Flag", bypassFlag);

        try
        {
            using (mConn)
            {
                mConn.Open();
                donationID = (int)cmd.ExecuteScalar(); //return Donation_ID data
            }

        }
        catch (Exception ex)
        {
            lblDonorDbError.Text = "A database error has occured.<br />" + "Message: " + ex.Message;
        }



        //Insert information into Item table and upload image data
        HttpPostedFile postedFile = FileUpload1.PostedFile;
        string filename = Path.GetFileName(postedFile.FileName);
        string fileExtension = Path.GetExtension(filename);
        int fileSize = postedFile.ContentLength;

        if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
        {
            Stream stream = postedFile.InputStream;
            BinaryReader binaryReader = new BinaryReader(stream);
            Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
            

        }


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //does nothing but check validation and reg expressions for errors in validation group Donors
    }



    
}