using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class ViewBuildExtras : System.Web.UI.Page
{
    Connection bank = new Connection();
    DataView dV = new DataView();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bank.grid(dlData, "select * from TblBuildPic where IdBuild='" + Request.QueryString["Id"].ToString() + "'", "TblBuildPic");
            dV = bank.select("select * from TblBuild where IdBuild='" + Request.QueryString["Id"].ToString() + "'", "TblBuild");
            TextBox1.Text = dV[0]["NameBuild"].ToString();
            TextBox2.Text = dV[0]["YearBuild"].ToString();
            TextBox3.Text = dV[0]["PeriodBuild"].ToString();
            TextBox4.Text = dV[0]["TextBuild"].ToString();
        }
    }
}
