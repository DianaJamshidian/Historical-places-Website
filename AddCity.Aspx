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

public partial class Admin_AddCity : System.Web.UI.Page
{
    Connection bank = new Connection();
    DataView dV = new DataView();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bank.grid(GridView1, "select * from TblCity", "TblCity");
        }
    }
    private void empty()
    {
        lblMsg.Text = "عملیات انجام گردید";
        TextBox1.Text = TextBox2.Text = "";
        bank.grid(GridView1, "select * from TblCity", "TblCity");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            bank.insert("insert into TblCity(IdCity,NameCity)values('" + TextBox1.Text + "','" + TextBox2.Text + "')");
            empty();
        }
        catch { lblMsg.Text = "در ورود اطلاعات دقت نمایید"; }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            bank.insert("update TblCity set NameCity='" + TextBox2.Text + "' where IdCity='" + TextBox1.Text + "'");
            empty();
        }
        catch { lblMsg.Text = "در ورود اطلاعات دقت نمایید"; }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            bank.insert("delete from TblCity where IdCity='" + TextBox1.Text + "'");
            empty();
        }
        catch { lblMsg.Text = "در ورود اطلاعات دقت نمایید"; }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox1.Text = GridView1.SelectedRow.Cells[0].Text;
        TextBox2.Text = GridView1.SelectedRow.Cells[1].Text;
    }
}
