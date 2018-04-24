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
    private int donationStatusID = 3; //donation/submitted
    private int storeID;
    private bool bypassFlag = false;
    private string address;
    private string address2;
    private string city;
    private string zipcode;
    private string pickupDate;
    private string startTime;
    private string endTime;
    private int completed = 0;
        
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
        lblNoEmail.Visible = false;
        //Create new SqlConnection using the connection string from web.config
        SqlConnection mConn = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);

        //Create new Sql Statement to select donorID
        SqlCommand cmd = new SqlCommand("SELECT Donor_ID, Address, Address2, City, ZipCode FROM Donor WHERE Email = @email", mConn);        

        cmd.CommandType = CommandType.Text;

        cmd.Parameters.AddWithValue("@email", tbEmail.Text);

        try
        {
            using (mConn)
            {
                mConn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if(reader.HasRows)
                {
                    while(reader.Read())
                    {
                        donorID = reader.GetInt32(0);
                        lblDonorID.Text = Convert.ToString(donorID);
                        address = reader.GetString(1);
                        //lblDonAddr.Text = Convert.ToString(address);
                        address2 = reader.GetString(2);
                        //lblDonAddr2.Text = Convert.ToString(address2);
                        city = reader.GetString(3);
                        //lblDonCity.Text = Convert.ToString(city);
                        zipcode = reader.GetString(4);
                        //lblDonZip.Text = Convert.ToString(zipcode);
                    }
                    HttpContext.Current.Session["donorID"] = donorID;
                    HttpContext.Current.Session["address"] = address;
                    HttpContext.Current.Session["address2"] = address2;
                    HttpContext.Current.Session["city"] = city;
                    HttpContext.Current.Session["zipcode"] = zipcode;
                    MultiView1.ActiveViewIndex = 1;
                }
                else
                {
                    lblNoEmail.Text = "Sorry - We could not find the account with that email address<br /><br />Please try a different email or call the office.";
                    lblNoEmail.Visible = true;
                    tbEmail.Text = String.Empty;
                }
                reader.Close();
                mConn.Close();
                cmd.Dispose();
            }
            
            
            //lblDonorID.Text = donorID.ToString();
        }
        catch (Exception ex)
        {
            donorIdDbError.Text = "A getting donor info failed. A database error has occured.<br />" + "Message: " + ex.Message;
        }
        
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
                    cmdItem.Parameters.AddWithValue("@Item_Category_ID", ddlItemCategory.SelectedValue);
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
                cmdItem.Parameters.AddWithValue("@Item_Category_ID", ddlItemCategory.SelectedValue);
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
            switch (zipcode)
            {
                case "27012":
                case "27023":
                case "27040":
                case "27050":
                    storeID = 3;
                    break;
                case "27009":
                case "27051":
                case "27284":
                    storeID = 2;
                    break;
                case "27045":
                case "27101":
                case "27103":
                case "27104":
                case "27105":
                case "27106":
                case "27107":
                case "27109":
                case "27110":
                case "27127":
                    storeID = 1;
                    break;
                default:
                    storeID = 1;
                    break;
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
                    cmdItem.Parameters.AddWithValue("@Item_Category_ID", ddlItemCategory.SelectedValue);
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
                cmdItem.Parameters.AddWithValue("@Item_Category_ID", ddlItemCategory.SelectedValue);
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
        lblDonationRef.Text = Convert.ToString(donationID);
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

    protected void CalendarPickup_SelectionChanged(object sender, EventArgs e)
    {
        pickupDate = CalendarPickup.SelectedDate.ToString("yyyy-MM-dd");
    }

    protected void SubmitRequest_Click(object sender, EventArgs e)
    {
        String startPickup = pickupDate + " " + ddlStartWindow.SelectedValue.ToString();
        DateTime startTime = DateTime.Parse(startPickup);
        String endPickup = pickupDate + " " + ddlEndWindow.SelectedValue.ToString();
        DateTime endTime = DateTime.Parse(endPickup);

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);


        SqlCommand cmdItem = new SqlCommand("usp_AddDonation_PickUp_Schedule", con);
        cmdItem.CommandType = CommandType.StoredProcedure;

        cmdItem.Parameters.AddWithValue("@Donation_ID", donationID);
        cmdItem.Parameters.AddWithValue("@PickUp_Window_Start", startTime);
        cmdItem.Parameters.AddWithValue("@PickUp_Window_End", endTime);
        cmdItem.Parameters.AddWithValue("@Special_Instructions", tbSpecialInstr.Text);
        cmdItem.Parameters.AddWithValue("@Completed", completed);

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
            lblSchedDbError.Text = "A Schedule database error has occurred.< br /> " + "Message: " + ex.Message;
        }
        MultiView1.ActiveViewIndex = 4;
        lblDonationRef.Text = Convert.ToString(donationID);
        Session["donorID"] = null;
        Session["donationID"] = null;
    }
}