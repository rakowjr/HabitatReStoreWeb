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
    int volunteerID;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.ActiveViewIndex = 0;
        }
        else
        {
            if (HttpContext.Current.Session["volunteerID"] != null)
                volunteerID = (int)HttpContext.Current.Session["volunteerID"];
        }

        for (int i = 1; i <= 12; i++)
        {
            ListItem ltItem = new ListItem();
            ltItem.Text = i.ToString();
            ltItem.Value = i.ToString();

            ddlMonth.Items.Add(ltItem);
        }
        for (int  i = 1; i <= 31; i++)
        {
            ListItem ltItem = new ListItem();
            ltItem.Text = i.ToString();
            ltItem.Value = i.ToString();

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
        //SqlCommand cmd = new SqlCommand("Insert INTO Volunteer (Status_Map_ID,Last_Name, First_Name, Middle_Name, Gender, DOB, SSN, Address, Address2, City, State, Zip_Code, Phone, Email) OUTPUT INSERTED.Volunteer_ID VALUES (@Status_Map_ID, @Last_Name, @First_Name, @Middle_Name, @Gender, @DOB, @SSN, @Address, @Address2, @City, @State, @Zip_Code, @Phone, @Email)", mConn);
        SqlCommand cmd = new SqlCommand("usp_AddVolunteer", mConn);
        //Define command type
        cmd.CommandType = CommandType.StoredProcedure;

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
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    volunteerID = Convert.ToInt32(reader[0]);
                }
                //volunteerID = (int)cmd.ExecuteScalar();
                mConn.Close();
                cmd.Dispose();
            }

        }
        catch (Exception ex)
        {
            lblDbError.Text = "A database error has occured.<br />" + "Message: " + ex.Message;
        }

        HttpContext.Current.Session["volunteerID"] = volunteerID; //set session variable
        MultiView1.ActiveViewIndex = 1;
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //does nothing but check validation
    }

    protected void volCatSubmit_Click(object sender, EventArgs e)
    {        
        
        //provide values from page
        foreach (ListItem item in cblVolCategory.Items)
        {
            if (item.Selected)
            {
                if (Convert.ToInt32(item.Value) == 1)
                {
                    //Create new SqlConnection using the connection string from web.config
                    SqlConnection mConn1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);

                    //Create new Sql Statement to insert data into the Volunteer table
                    SqlCommand cmd1 = new SqlCommand("Insert INTO Volunteer_Category (Volunteer_ID, Category_Type_ID) VALUES (@Volunteer_ID, @Category_Type_ID)", mConn1);

                    //Define command type
                    cmd1.CommandType = CommandType.Text;

                    cmd1.Parameters.AddWithValue("@Volunteer_ID", volunteerID);
                    cmd1.Parameters.AddWithValue("@Category_Type_ID", 1);
                    try
                    {
                        using (mConn1)
                        {
                            mConn1.Open();
                            cmd1.ExecuteNonQuery();
                            mConn1.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        lblDbError.Text = "A database error has occurred.<br />" + "Message: " + ex.Message;
                    }                    
                }
                if (Convert.ToInt32(item.Value) == 2)
                {
                    //Create new SqlConnection using the connection string from web.config
                    SqlConnection mConn2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);

                    //Create new Sql Statement to insert data into the Volunteer table
                    SqlCommand cmd2 = new SqlCommand("Insert INTO Volunteer_Category (Volunteer_ID, Category_Type_ID) VALUES (@Volunteer_ID, @Category_Type_ID)", mConn2);

                    //Define command type
                    cmd2.CommandType = CommandType.Text;

                    cmd2.Parameters.AddWithValue("@Volunteer_ID", volunteerID);
                    cmd2.Parameters.AddWithValue("@Category_Type_ID", 2);
                    try
                    {
                        using (mConn2)
                        {
                            mConn2.Open();
                            cmd2.ExecuteNonQuery();
                            mConn2.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        lblDbError.Text = "A database error has occurred.<br />" + "Message: " + ex.Message;
                    }
                }
                if (Convert.ToInt32(item.Value) == 3)
                {
                    //Create new SqlConnection using the connection string from web.config
                    SqlConnection mConn3 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);

                    //Create new Sql Statement to insert data into the Volunteer table
                    SqlCommand cmd3 = new SqlCommand("Insert INTO Volunteer_Category (Volunteer_ID, Category_Type_ID) VALUES (@Volunteer_ID, @Category_Type_ID)", mConn3);

                    //Define command type
                    cmd3.CommandType = CommandType.Text;

                    cmd3.Parameters.AddWithValue("@Volunteer_ID", volunteerID);
                    cmd3.Parameters.AddWithValue("@Category_Type_ID", 3);
                    try
                    {
                        using (mConn3)
                        {
                            mConn3.Open();
                            cmd3.ExecuteNonQuery();
                            mConn3.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        lblDbError.Text = "A database error has occurred.<br />" + "Message: " + ex.Message;
                    }
                }
                if (Convert.ToInt32(item.Value) == 4)
                {
                    //Create new SqlConnection using the connection string from web.config
                    SqlConnection mConn4 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);

                    //Create new Sql Statement to insert data into the Volunteer table
                    SqlCommand cmd4 = new SqlCommand("Insert INTO Volunteer_Category (Volunteer_ID, Category_Type_ID) VALUES (@Volunteer_ID, @Category_Type_ID)", mConn4);

                    //Define command type
                    cmd4.CommandType = CommandType.Text;

                    cmd4.Parameters.AddWithValue("@Volunteer_ID", volunteerID);
                    cmd4.Parameters.AddWithValue("@Category_Type_ID", 4);
                    try
                    {
                        using (mConn4)
                        {
                            mConn4.Open();
                            cmd4.ExecuteNonQuery();
                            mConn4.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        lblDbError.Text = "A database error has occurred.<br />" + "Message: " + ex.Message;
                    }
                }
                if (Convert.ToInt32(item.Value) == 5)
                {
                    //Create new SqlConnection using the connection string from web.config
                    SqlConnection mConn5 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);

                    //Create new Sql Statement to insert data into the Volunteer table
                    SqlCommand cmd5 = new SqlCommand("Insert INTO Volunteer_Category (Volunteer_ID, Category_Type_ID) VALUES (@Volunteer_ID, @Category_Type_ID)", mConn5);

                    //Define command type
                    cmd5.CommandType = CommandType.Text;

                    cmd5.Parameters.AddWithValue("@Volunteer_ID", volunteerID);
                    cmd5.Parameters.AddWithValue("@Category_Type_ID", 5);
                    try
                    {
                        using (mConn5)
                        {
                            mConn5.Open();
                            cmd5.ExecuteNonQuery();
                            mConn5.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        lblDbError.Text = "A database error has occurred.<br />" + "Message: " + ex.Message;
                    }
                }
                if (Convert.ToInt32(item.Value) == 6)
                {
                    //Create new SqlConnection using the connection string from web.config
                    SqlConnection mConn6 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);

                    //Create new Sql Statement to insert data into the Volunteer table
                    SqlCommand cmd6 = new SqlCommand("Insert INTO Volunteer_Category (Volunteer_ID, Category_Type_ID) VALUES (@Volunteer_ID, @Category_Type_ID)", mConn6);

                    //Define command type
                    cmd6.CommandType = CommandType.Text;

                    cmd6.Parameters.AddWithValue("@Volunteer_ID", volunteerID);
                    cmd6.Parameters.AddWithValue("@Category_Type_ID", 6);
                    try
                    {
                        using (mConn6)
                        {
                            mConn6.Open();
                            cmd6.ExecuteNonQuery();
                            mConn6.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        lblDbError.Text = "A database error has occurred.<br />" + "Message: " + ex.Message;
                    }
                }
                if (Convert.ToInt32(item.Value) == 7)
                {
                    //Create new SqlConnection using the connection string from web.config
                    SqlConnection mConn7 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);

                    //Create new Sql Statement to insert data into the Volunteer table
                    SqlCommand cmd7 = new SqlCommand("Insert INTO Volunteer_Category (Volunteer_ID, Category_Type_ID) VALUES (@Volunteer_ID, @Category_Type_ID)", mConn7);

                    //Define command type
                    cmd7.CommandType = CommandType.Text;

                    cmd7.Parameters.AddWithValue("@Volunteer_ID", volunteerID);
                    cmd7.Parameters.AddWithValue("@Category_Type_ID", 7);
                    try
                    {
                        using (mConn7)
                        {
                            mConn7.Open();
                            cmd7.ExecuteNonQuery();
                            mConn7.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        lblDbError.Text = "A database error has occurred.<br />" + "Message: " + ex.Message;
                    }
                }

            }
        }
       
        MultiView1.ActiveViewIndex = 2;
    }
}