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

public partial class ViewBuilding : System.Web.UI.Page
{
    Connection bank = new Connection();
    DataView dV = new DataView();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bank.grid(GridView1, "select * from TblBuild", "TblBuild");
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        bank.insert("insert into TblVisit(IdBuild)values('" + GridView1.Rows[int.Parse(e.CommandArgument.ToString())].Cells[1].Text + "')");
        Response.Redirect("ViewBuildExtras.aspx?Id=" + GridView1.Rows[int.Parse(e.CommandArgument.ToString())].Cells[1].Text);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        bank.grid(GridView1, "select * from TblBuild where CityBuild like ('%" + TextBox1.Text + "%')", "TblBuild");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        bank.grid(GridView1, "select * from TblBuild", "TblBuild");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
