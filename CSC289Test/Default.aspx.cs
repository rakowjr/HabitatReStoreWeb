using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnVolunteer_Click(object sender, EventArgs e)
    {
        Response.Redirect("Volunteers.aspx");
    }



    protected void btnDonate_Click(object sender, EventArgs e)
    {
        Response.Redirect("NewDonor.aspx");
    }

    protected void btnReturnDonor_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReturningDonor.aspx");
    }
}