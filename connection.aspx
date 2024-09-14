using System;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

public class Connection : System.Web.UI.Page
{
    private int recordCount;
    private SqlConnection con;
    private SqlCommand cm;
    private SqlDataAdapter da;
    DataView dw= new DataView();

    public Connection()
    {
        con = new SqlConnection(@"Data Source=.;Initial Catalog=Tarikhi;Integrated Security=True");
    }

    public Boolean insert(String sqlStr)
    {
        con.Open();
        cm = new SqlCommand(sqlStr, con);
        int a = cm.ExecuteNonQuery();
        con.Close();
        return true;
    }
    
    public DataView select(String sqlStr,String sqlTable)
    {
        con.Open();
        da = new SqlDataAdapter(sqlStr, con);
        DataSet ds=new DataSet();
        DataView dv= new DataView();
        da.Fill(ds,sqlTable);
        dv=ds.Tables[sqlTable].DefaultView;
        con.Close();
        recordCount = dv.Count;
        return dv;
   }

    public Boolean drop(DropDownList dp,string strsql,string tblname,string view,string value)
    {
        dw = select(strsql, tblname);
        dp.DataSource = dw;
        dp.DataTextField = view;
        dp.DataValueField = value;
        dp.DataBind();
        return true;
    }
    public Boolean grid(GridView dg, string strsql, string tblname)
    {
        dw = select(strsql, tblname);
        dg.DataSource = dw;
        dg.DataBind();
        return true;
    }
    public Boolean grid(DataList dg, string strsql, string tblname)
    {
        dw = select(strsql, tblname);
        dg.DataSource = dw;
        dg.DataBind();
        return true;
    }
}
