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

public partial class Builds_AddExtra : System.Web.UI.Page
{
    Connection bank = new Connection();
    DataView dV = new DataView();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bank.drop(DropDownList1, "select * from TblBuild", "TblBuild", "NameBuild", "IdBuild");
            DropDownList1_SelectedIndexChanged(sender, e);
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        bank.insert("update TblBuild set YearBuild='" + TextBox1.Text + "',PeriodBuild='" + TextBox2.Text + "',TextBuild='" + TextBox3.Text + "' where IdBuild='" + DropDownList1.SelectedValue + "'");
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        dV = bank.select("select * from TblBuild where IdBuild='" + DropDownList1.SelectedValue + "'", "TblBuild");
        try
        {
            TextBox1.Text = dV[0]["YearBuild"].ToString();
            TextBox2.Text = dV[0]["PeriodBuild"].ToString();
            TextBox3.Text = dV[0]["TextBuild"].ToString();
        }
        catch { }
    }
}
