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

public partial class Admin_AddFaq : System.Web.UI.Page
{
    Connection bank = new Connection();
    DataView dV = new DataView();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bank.grid(GridView1, "select * from TblFaq", "TblFaq");
        }
    }
    private void empty()
    {
        lblMsg.Text = "عملیات انجام گردید";
        TextBox1.Text = TextBox2.Text = "";
        TextBox3.Text = TextBox4.Text = "";
        bank.grid(GridView1, "select * from TblFaq", "TblFaq");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            bank.insert("insert into TblFaq(IdFaq,NameFaq,QFaq,AnswerFaq)values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "')");
            empty();
        }
        catch { lblMsg.Text = "در ورود اطلاعات دقت نمایید"; }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            bank.insert("update TblFaq set NameFaq='" + TextBox2.Text + "',QFaq='" + TextBox3.Text + "',AnswerFaq='" + TextBox4.Text + "' where IdFaq='" + TextBox1.Text + "'");
            empty();
        }
        catch { lblMsg.Text = "در ورود اطلاعات دقت نمایید"; }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            bank.insert("delete from TblFaq where IdFaq='" + TextBox1.Text + "'");
            empty();
        }
        catch { lblMsg.Text = "در ورود اطلاعات دقت نمایید"; }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox1.Text = GridView1.SelectedRow.Cells[0].Text;
        TextBox2.Text = GridView1.SelectedRow.Cells[1].Text;
        TextBox3.Text = GridView1.SelectedRow.Cells[2].Text;
        TextBox4.Text = GridView1.SelectedRow.Cells[3].Text;
    }
}
