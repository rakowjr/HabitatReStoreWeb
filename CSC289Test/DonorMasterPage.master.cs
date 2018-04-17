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

public partial class DonorMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*SqlConnection con1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);
        SqlCommand cmd1 = new SqlCommand("Select TOP 4 Donation_Image FROM Item", con1);
        using (con1)
        {
            con1.Open();
            SqlDataReader reader = cmd1.ExecuteReader();
            reader.Read();

            while (reader.HasRows)
            {
                byte[] imagem0 = (byte[])(reader[0]);
                string base64String = Convert.ToBase64String(imagem0);
                Item1.ImageUrl = String.Format("data:image/jpg;base64,{0}", base64String);

                byte[] imagem1 = (byte[])(reader[1]);
                base64String = Convert.ToBase64String(imagem1);
                Item2.ImageUrl = String.Format("data:image/jpg;base64,{0}", base64String);

                byte[] imagem2 = (byte[])(reader[2]);
                base64String = Convert.ToBase64String(imagem2);
                Item3.ImageUrl = String.Format("data:image/jpg;base64,{0}", base64String);

                byte[] imagem3 = (byte[])(reader[3]);
                base64String = Convert.ToBase64String(imagem3);
                Item4.ImageUrl = String.Format("data:image/jpg;base64,{0}", base64String);
            }

            for (int i = 0; i < 4; i++)
            {
                byte[] imagem = (byte[])(reader[0]);
                string base64String = Convert.ToBase64String(imagem);
                Item1.ImageUrl = String.Format("data:image/jpg;base64,{0}", base64String);
            }
            con1.Close();    
        }*/

        SqlConnection con1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);
        SqlCommand cmd1 = new SqlCommand("Select  Donation_Image FROM Item WHERE Item_ID = 41", con1);
        using (con1)
        {
            con1.Open();
            SqlDataReader reader = cmd1.ExecuteReader();
            reader.Read();            
            byte[] imagem = (byte[])(reader[0]);
            string base64String = Convert.ToBase64String(imagem);
            Item1.ImageUrl = String.Format("data:image/jpg;base64,{0}", base64String);            
            con1.Close();
        }
        SqlConnection con2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);
        SqlCommand cmd2 = new SqlCommand("Select  Donation_Image FROM Item WHERE Item_ID = 17", con2);
        using (con2)
        {
            con2.Open();
            SqlDataReader reader = cmd2.ExecuteReader();
            reader.Read();
            byte[] imagem = (byte[])(reader[0]);
            string base64String = Convert.ToBase64String(imagem);
            Item2.ImageUrl = String.Format("data:image/jpg;base64,{0}", base64String);
            con2.Close();
        }
        SqlConnection con3 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);
        SqlCommand cmd3 = new SqlCommand("Select  Donation_Image FROM Item WHERE Item_ID = 26", con3);
        using (con3)
        {
            con3.Open();
            SqlDataReader reader = cmd3.ExecuteReader();
            reader.Read();
            byte[] imagem = (byte[])(reader[0]);
            string base64String = Convert.ToBase64String(imagem);
            Item3.ImageUrl = String.Format("data:image/jpg;base64,{0}", base64String);
            con3.Close();
        }
        SqlConnection con4 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Habitat_RestoreCS"].ConnectionString);
        SqlCommand cmd4 = new SqlCommand("Select  Donation_Image FROM Item WHERE Item_ID = 21", con4);
        using (con4)
        {
            con4.Open();
            SqlDataReader reader = cmd4.ExecuteReader();
            reader.Read();
            byte[] imagem = (byte[])(reader[0]);
            string base64String = Convert.ToBase64String(imagem);
            Item4.ImageUrl = String.Format("data:image/jpg;base64,{0}", base64String);
            con4.Close();
        }
    }
}
