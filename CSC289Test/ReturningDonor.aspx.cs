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

public partial class ReturningDonor : System.Web.UI.Page
{
    private int donorID;
    private int donationID;
    private int donationStatusID = 3; //Status_Map_ID 3 = donation/submitted
    private int storeID = 1;
    private bool bypassFlag = false;
    private string address;
    private string address2;
    private string city;
    private string zipcode;


    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            MultiView1.ActiveViewIndex = 0;
        }
        else
        {
            if (HttpContext.Current.Session["donorID"] != null)
                donorID = (int)HttpContext.Current.Session["donorID"];
            if (HttpContext.Current.Session["address"] != null)
                address = (string)HttpContext.Current.Session["address"];
            if (HttpContext.Current.Session["address2"] != null)
                address2 = (string)HttpContext.Current.Session["address2"];
            if (HttpContext.Current.Session["city"] != null)
                city = (string)HttpContext.Current.Session["city"];
            if (HttpContext.Current.Session["zipcode"] != null)
                zipcode = (string)HttpContext.Current.Session["zipcode"];
            if (HttpContext.Current.Session["donationID"] != null)
                donationID = (int)HttpContext.Current.Session["donationID"];
        }

    }

    //Get DonorID
    protected void Submit_Click(object sender, EventArgs e)
    {
        //Create new SqlConnection using the connection string from web.config
        SqlConnection mConn = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);

        //Create new Sql Statement to insert data into the Volunteer table
        SqlCommand cmd = new SqlCommand("SELECT Donor_ID FROM Donor WHERE Email = @email", mConn);

        cmd.CommandType = CommandType.Text;

        cmd.Parameters.AddWithValue("@email", tbEmail.Text);
        try
        {
            using (mConn)
            {
                mConn.Open();
                donorID = (int)cmd.ExecuteScalar(); //return Donor_ID data
                mConn.Close();
                cmd.Dispose();
            }

        }
        catch (Exception ex)
        {
            donorIdDbError.Text = "A Donor database error has occured.<br />" + "Message: " + ex.Message;
        }

        if(donorID != 0)
        {
            //Create new SqlConnection using the connection string from web.config
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);

            //Create new Sql Statement to insert data into the Volunteer table
            SqlCommand command = new SqlCommand("SELECT Address, Address2, City, ZipCode FROM Donor WHERE Donor_ID = @donorID", conn);

            command.CommandType = CommandType.Text;

            command.Parameters.AddWithValue("@donorID", donorID);

            try
            {
                using (conn)
                {
                    conn.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        address = (string)reader[0];
                        address2 = (string)reader[1];
                        city = (string)reader[2];
                        zipcode = (string)reader[3];
                    }
                    reader.Close();
                    conn.Close();
                    command.Dispose();
                }
            }
            catch (Exception ex)
            {
                lblDonorIDerror.Text = "retrieving data from Donor table failed.<br />" + "Message: " + ex.Message;
            }
        }
        else
        {
            lblIdNotFound.Text = "Sorry - We could not find the account with that email address<br />Please try again or call the office.";
        }
        //set session variables
        HttpContext.Current.Session["donorID"] = donorID;
        HttpContext.Current.Session["address"] = address;
        HttpContext.Current.Session["address2"] = address2;
        HttpContext.Current.Session["city"] = city;
        HttpContext.Current.Session["zipcode"] = zipcode;
        MultiView1.ActiveViewIndex = 1;

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if(HttpContext.Current.Session["donationID"] != null) //A donation is already started
        {
            //Insert information into Item table and upload image data
            HttpPostedFile newPostedFile = FileUpload1.PostedFile;
            string newFilename = Path.GetFileName(newPostedFile.FileName);
            string fileExtension = Path.GetExtension(newFilename);
            int newFileSize = newPostedFile.ContentLength;

            if (FileUpload1.HasFile == true)
            {
                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
                {
                    Stream stream = newPostedFile.InputStream;
                    BinaryReader binaryReader = new BinaryReader(stream);
                    Byte[] bytes = binaryReader.ReadBytes((int)stream.Length); //Byte array holds image data

                    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);


                    SqlCommand cmdItem = new SqlCommand("Insert INTO Item (Donation_ID, Item_Category_ID, Donation_Image, Description) VALUES (@Donation_ID, @Item_Category_ID, @Donation_Image, @Description)", con);
                    cmdItem.CommandType = CommandType.Text;

                    cmdItem.Parameters.AddWithValue("@Donation_ID", donationID);
                    cmdItem.Parameters.AddWithValue("@Item_Category_ID", rbCategoryList.SelectedValue);
                    cmdItem.Parameters.AddWithValue("@Donation_Image", bytes);
                    cmdItem.Parameters.AddWithValue("@Description", tbDnDesc.Text);

                    try
                    {
                        using (con)
                        {
                            con.Open();
                            cmdItem.ExecuteNonQuery();
                            con.Close();
                            cmdItem.Dispose();
                        }

                    }
                    catch (Exception ex)
                    {
                        lblItemDbError.Text = "An Item database error has occured.<br />" + "Message: " + ex.Message;
                    }
                }
                else
                {
                    imageTypeError.Visible = true;
                    imageTypeError.Text = "Only images (.jpg, .png, .gif and .bmp) can be uploaded";
                }
            }
            else
            {
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);


                SqlCommand cmdItem = new SqlCommand("Insert INTO Item (Donation_ID, Item_Category_ID, Description) VALUES (@Donation_ID, @Item_Category_ID, @Description)", con);
                cmdItem.CommandType = CommandType.Text;

                cmdItem.Parameters.AddWithValue("@Donation_ID", donationID);
                cmdItem.Parameters.AddWithValue("@Item_Category_ID", rbCategoryList.SelectedValue);
                cmdItem.Parameters.AddWithValue("@Description", tbDnDesc.Text);

                try
                {
                    using (con)
                    {
                        con.Open();
                        cmdItem.ExecuteNonQuery();
                        con.Close();
                        cmdItem.Dispose();
                    }

                }
                catch (Exception ex)
                {
                    lblItemDbError.Text = "An Item database error has occured.<br />" + "Message: " + ex.Message;
                }
            }
        } //A donation is already started
        else //No donation has yet been made
        {
            //insert information into Donation table and output Donation_ID
            //Create new SqlConnection using the connection string from web.config
            SqlConnection mConn = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);

            //Create new Sql Statement to insert data into the Volunteer table
            SqlCommand cmd = new SqlCommand("Insert INTO Donation (Store_ID, Donor_ID, Status_Map_ID, Address, Address2, City, State, ZipCode, Bypass_Flag) OUTPUT INSERTED.Donation_ID VALUES (@Store_ID, @Donor_ID, @Status_Map_ID, @Address, @Address2, @City, @State, @ZipCode, @Bypass_Flag)", mConn);

            //Define command type
            cmd.CommandType = CommandType.Text;

            if (PanelAltAddr.Visible == true)
            {
                address = tbAltAddress.Text;
                address2 = tbAltAddress2.Text;
                city = tbAltCity.Text;
                zipcode = tbAltZip.Text;
            }

            cmd.Parameters.AddWithValue("@Store_ID", storeID);
            cmd.Parameters.AddWithValue("@Donor_ID", donorID);
            cmd.Parameters.AddWithValue("@Status_Map_ID", donationStatusID); // 3 = donation/submitted
            cmd.Parameters.AddWithValue("@Address", address);
            cmd.Parameters.AddWithValue("@Address2", address2);
            cmd.Parameters.AddWithValue("@City", city);
            cmd.Parameters.AddWithValue("@State", "NC");
            cmd.Parameters.AddWithValue("@ZipCode", zipcode);
            cmd.Parameters.AddWithValue("@Bypass_Flag", bypassFlag);

            try
            {
                using (mConn)
                {
                    mConn.Open();
                    donationID = (int)cmd.ExecuteScalar(); //return Donation_ID data
                    mConn.Close();
                    cmd.Dispose();
                }

            }
            catch (Exception ex)
            {
                lblDonorDbError.Text = "A Donation database error has occured.<br />" + "Message: " + ex.Message;
            }
            HttpContext.Current.Session["donationID"] = donationID;

            //Insert information into Item table and upload image data
            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string filename = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(filename);
            int fileSize = postedFile.ContentLength;

            if (FileUpload1.HasFile == true) //User has chosen an image
            {
                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
                {
                    Stream stream = postedFile.InputStream;
                    BinaryReader binaryReader = new BinaryReader(stream);
                    Byte[] bytes = binaryReader.ReadBytes((int)stream.Length); //Byte array holds image data

                    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);


                    SqlCommand cmdItem = new SqlCommand("Insert INTO Item (Donation_ID, Item_Category_ID, Donation_Image, Description) VALUES (@Donation_ID, @Item_Category_ID, @Donation_Image, @Description)", con);
                    cmdItem.CommandType = CommandType.Text;

                    cmdItem.Parameters.AddWithValue("@Donation_ID", donationID);
                    cmdItem.Parameters.AddWithValue("@Item_Category_ID", rbCategoryList.SelectedValue);
                    cmdItem.Parameters.AddWithValue("@Donation_Image", bytes);
                    cmdItem.Parameters.AddWithValue("@Description", tbDnDesc.Text);

                    try
                    {
                        using (con)
                        {
                            con.Open();
                            cmdItem.ExecuteNonQuery();
                            con.Close();
                            cmdItem.Dispose();
                        }

                    }
                    catch (Exception ex)
                    {
                        lblItemDbError.Text = "An Item database error has occured.<br />" + "Message: " + ex.Message;
                    }
                }
                else
                {
                    imageTypeError.Visible = true;
                    imageTypeError.Text = "Only images (.jpg, .png, .gif and .bmp) can be uploaded";
                }
            } //User has chosen an image
            else //user has not chosen an image
            {
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);

                SqlCommand cmdItem = new SqlCommand("Insert INTO Item (Donation_ID, Item_Category_ID, Description) VALUES (@Donation_ID, @Item_Category_ID, @Description)", con);
                cmdItem.CommandType = CommandType.Text;

                cmdItem.Parameters.AddWithValue("@Donation_ID", donationID);
                cmdItem.Parameters.AddWithValue("@Item_Category_ID", rbCategoryList.SelectedValue);
                cmdItem.Parameters.AddWithValue("@Description", tbDnDesc.Text);

                try
                {
                    using (con)
                    {
                        con.Open();
                        cmdItem.ExecuteNonQuery();
                        con.Close();
                        cmdItem.Dispose();
                    }

                }
                catch (Exception ex)
                {
                    lblItemDbError.Text = "An Item database error has occured.<br />" + "Message: " + ex.Message;
                }
            } //user has not chosen an image            
        } //No donation has yet been made

        rbCategoryList.ClearSelection();
        tbDnDesc.Text = "";
        MultiView1.ActiveViewIndex = 2;
    }

    protected void btnScheduleMore_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }

    protected void btnScheduleDone_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 3;
        //Response.Redirect("Default.aspx");
    }

    protected void cbDiffAddr_CheckedChanged(object sender, EventArgs e)
    {
        if (cbDiffAddr.Checked == true)
        {
            PanelAltAddr.Visible = true;
            cbDiffAddr.Enabled = false;
        }
        else
        {
            PanelAltAddr.Visible = false;
        }
    }
}