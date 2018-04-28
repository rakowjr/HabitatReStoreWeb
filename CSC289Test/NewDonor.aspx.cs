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


public partial class Donations : System.Web.UI.Page
{
    private int donorID; //variable to store Donor_ID output
    private int donorStatusID = 2; //Status Map ID = donor/submitted
    private int donationStatusID = 3; //Status Map ID = donation/submitted
    private int donationID; //variable to store Donation_ID output
    private int storeID;
    private bool bypassFlag = false;
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
            if (HttpContext.Current.Session["donationID"] != null)
                donationID = (int)HttpContext.Current.Session["donationID"];
        }
    }

    //Insert information into Donor table and output Donor_ID
    protected void btnSubmitDonor_Click(object sender, EventArgs e)
    {               

        //Create new SqlConnection using the connection string from web.config
        SqlConnection mConn = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);        

        //Create Sql Command to use Stored Procedure usp_AddDonor
        SqlCommand cmd = new SqlCommand("usp_AddDonor", mConn);

        //Define command type
        cmd.CommandType = CommandType.StoredProcedure;

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
                SqlDataReader reader = cmd.ExecuteReader(); //return Donor_ID data
                while (reader.Read())
                {
                    donorID = Convert.ToInt32(reader[0]);
                }
                lblDonorID.Text = Convert.ToString(donorID); //verify donorID retreival
                mConn.Close();
                cmd.Dispose();
            }

        }
        catch (Exception ex)
        {
            lblDonorDbError.Text = "A Donor database error has occured.<br />" + "Message: " + ex.Message;
        }

        //Switch to Donation Information view
        HttpContext.Current.Session["donorID"] = donorID;
        MultiView1.ActiveViewIndex = 1;
    }

    protected void btnSubmitDonation_Click(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["donationID"] != null) //A donation is already started
        {
            //Insert information into Item table and upload image data
            HttpPostedFile newPostedFile = FileUpload1.PostedFile;
            string newFilename = Path.GetFileName(newPostedFile.FileName);
            string fileExtension = Path.GetExtension(newFilename);
            int newFileSize = newPostedFile.ContentLength;

            if (FileUpload1.HasFile == true) //Donor is uploading image
            {
                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
                {
                    Stream stream = newPostedFile.InputStream;
                    BinaryReader binaryReader = new BinaryReader(stream);
                    Byte[] bytes = binaryReader.ReadBytes((int)stream.Length); //Byte array holds image data

                    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);
                    
                    SqlCommand cmdItem = new SqlCommand("usp_AddItem", con);
                    
                    cmdItem.CommandType = CommandType.StoredProcedure;

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
            else //Donor is not uploading image
            {
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);
                
                SqlCommand cmdItem = new SqlCommand("usp_AddItem", con);

                cmdItem.CommandType = CommandType.StoredProcedure;

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
        }//A donation is already started
        else //no donation made yet
        {
            //Create new SqlConnection using the connection string from web.config
            SqlConnection mConn = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);

            //Create new Sql Statement to insert data into the Volunteer table            
            SqlCommand cmd = new SqlCommand("usp_AddDonation", mConn);

            //Define command type
            cmd.CommandType = CommandType.StoredProcedure;

            string address;
            string address2;
            string city;
            string zip;

            if (PanelAltAddr.Visible == true)
            {
                address = tbAltAddress.Text;
                address2 = tbAltAddress2.Text;
                city = tbAltCity.Text;
                zip = tbAltZip.Text;
            }
            else
            {
                address = tbAddress.Text;
                address2 = tbAddress2.Text;
                city = tbCity.Text;
                zip = tbZip.Text;
            }
            
            cmd.Parameters.AddWithValue("@Donor_ID", donorID);
            cmd.Parameters.AddWithValue("@Address", address);
            cmd.Parameters.AddWithValue("@Address2", address2);
            cmd.Parameters.AddWithValue("@City", city);
            cmd.Parameters.AddWithValue("@ZipCode", zip);

            try
            {
                using (mConn)
                {
                    mConn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        donationID = Convert.ToInt32(reader[0]);
                    }
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
                    
                    SqlCommand cmdItem = new SqlCommand("usp_AddItem", con);
                    
                    cmdItem.CommandType = CommandType.StoredProcedure;

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
            }//User has chosen an image
            else //user has not chosen an image
            {
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);
                
                SqlCommand cmdItem = new SqlCommand("usp_AddItem", con);

                cmdItem.CommandType = CommandType.StoredProcedure;

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
        } //no donation made yet  

        
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
    }

    protected void dbDiffAddr_CheckedChanged(object sender, EventArgs e)
    {
        if (cbDiffAddr.Checked == true)
        {
            PanelAltAddr.Visible = true;
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

    protected void ddlStartWindow_SelectedIndexChanged(object sender, EventArgs e)
    {
        //startTime = ddlStartWindow.SelectedValue.ToString();
    }

    protected void ddlEndWindow_SelectedIndexChanged(object sender, EventArgs e)
    {
        //endPickup = endPickup += " " + ddlEndWindow.SelectedValue.ToString();
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
        cmdItem.Parameters.AddWithValue("@PickUp_Window_Start",startTime);
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
            }
        }
        catch (Exception ex)
        {
            lblSchedDbError.Text = "A Schedule database error has occurred.< br /> " + "Message: " + ex.Message;
        }
        MultiView1.ActiveViewIndex = 4;
        //lblDonationRef.Text = Convert.ToString(donationID);
        Session["donorID"] = null;
        Session["donationID"] = null;
    }
}