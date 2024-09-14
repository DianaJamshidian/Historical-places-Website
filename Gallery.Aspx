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

public partial class Gallery : System.Web.UI.Page
{
    Connection bank = new Connection();
    DataView dV = new DataView();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bank.grid(dlData, "select * from TblBuildPic", "TblBuildPic");
        }
    }
}
