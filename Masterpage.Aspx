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

public partial class MasterPage : System.Web.UI.MasterPage
{
    Connection bank = new Connection();
    DataView dV = new DataView();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            lblUserName.Text = Request.Cookies["Users"].Value.ToString();
        }
        catch { }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        dV = bank.select("select * from TblAdmin where Uid='" + TextBox1.Text + "' and Pass='" + TextBox2.Text + "'", "TblStd");
        if (dV.Count > 0)
        {
            HttpCookie cook = new HttpCookie("Admin", "Admin");
            Response.Cookies.Add(cook);
            Response.Redirect("Admin/");
        }
        else lblUserName.Text = "ورود اشتباه";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        bank.insert("insert into TblOp(TextOp)values('"+TextBox3.Text+"')");
        TextBox3.Text = "";
        lblUserName.Text = "نظر ارسال گردید";
    }
}
