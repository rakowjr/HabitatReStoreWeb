using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;

public partial class ReturnDonor : System.Web.UI.Page
{
    private int donorID;
    private int donationID;
    private int donationStatusID = 3; //donation/submitted
    private int storeID = 1;
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

    protected void btnSubmitEmail_Click(object sender, EventArgs e)
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

                if (reader.HasRows)
                {
                    while (reader.Read())
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