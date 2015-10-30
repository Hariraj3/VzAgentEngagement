using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Vz.AgentEngagement
{
    public class FruitEnity
    {
        public string Name { get; set; }
        public int Value { get; set; }
    }


    public class FruitEnity2
    {
        public string[] UserName { get; set; }
        public string[] UserValue { get; set; }
    }


    /// <summary>
    /// Summary description for Service
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class Service : System.Web.Services.WebService
    {

        [WebMethod]
        public FruitEnity2 FruitAnalysis2()
        {
            DataSet ds = new DataSet();

            DataTable dt = new DataTable("FruitAnalysis");
            DataColumn dtColName = dt.Columns.Add("name");
            DataColumn dtColValue = dt.Columns.Add("value");

            DataRow dr4 = dt.NewRow();
            dr4["name"] = "A1";
            dr4["value"] = "40";
            //dr4[dtColName] = "A1";
            //dr4[dtColValue] = "10";
            dt.Rows.Add(dr4);

            DataRow dr1 = dt.NewRow();
            dr1["name"] = "A2";
            dr1["value"] = "33";
            dt.Rows.Add(dr1);

            DataRow dr2 = dt.NewRow();
            dr2["name"] = "A3";
            dr2["value"] = "34";
            dt.Rows.Add(dr2);

            DataRow dr3 = dt.NewRow();
            dr3["name"] = "A4";
            dr3["value"] = "45";
            dt.Rows.Add(dr3);
            ds.Tables.Add(dt);
            FruitEnity2 objFruitEnity2 = new FruitEnity2();
            string[] strSplitArr = new string[] { };
            string[] strSplitArr2 = new string[] { };

            string str1 = string.Empty;
            string str2 = string.Empty;

            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables["FruitAnalysis"].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables["FruitAnalysis"].Rows)
                        {
                            str1 += dr["name"].ToString() + ",";
                            str2 += dr["value"].ToString() + ",";
                            //fruitinfo.Add(new FruitEnity
                            //{
                            //    Name = dr["name"].ToString(),
                            //    Value = Convert.ToInt32(dr["value"])
                            //});
                        }

                        str1 = str1.Remove(str1.Length - 1);
                        str2 = str2.Remove(str2.Length - 1);
                        strSplitArr = str1.Split(',');
                        strSplitArr2 = str2.Split(',');
                    }
                }

                objFruitEnity2.UserName = strSplitArr;
                objFruitEnity2.UserValue = strSplitArr2;
            }

            return objFruitEnity2;
        }


        [WebMethod]
        public List<FruitEnity> FruitAnalysis()
        {
            //url: '/ControllerName/GetData?id=@(Model.Id)',
            List<FruitEnity> fruitinfo = new List<FruitEnity>();
            DataSet ds = new DataSet();

            DataTable dt = new DataTable("FruitAnalysis");
            DataColumn dtColName = dt.Columns.Add("name");
            DataColumn dtColValue = dt.Columns.Add("value");

            DataRow dr4 = dt.NewRow();
            dr4["name"] = "A1";
            dr4["value"] = "40";
            //dr4[dtColName] = "A1";
            //dr4[dtColValue] = "10";
            dt.Rows.Add(dr4);

            DataRow dr1 = dt.NewRow();
            dr1["name"] = "A2";
            dr1["value"] = "33";
            dt.Rows.Add(dr1);

            DataRow dr2 = dt.NewRow();
            dr2["name"] = "A3";
            dr2["value"] = "34";
            dt.Rows.Add(dr2);

            DataRow dr3 = dt.NewRow();
            dr3["name"] = "A4";
            dr3["value"] = "45";
            dt.Rows.Add(dr3);
            ds.Tables.Add(dt);

            /*
            using (SqlConnection con = new SqlConnection("Data Source=XXXX;User Id=XXXX;
            Password=XXXX;DataBase=XXXX"))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select name,value from tbl_fruitanalysis";
                    cmd.Connection = con;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds, "FruitAnalysis");
                    }
                }
            }
             */

            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables["FruitAnalysis"].Rows.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables["FruitAnalysis"].Rows)
                        {
                            fruitinfo.Add(new FruitEnity
                            {
                                Name = dr["name"].ToString(),
                                Value = Convert.ToInt32(dr["value"])
                            });
                        }
                    }
                }
            }
            return fruitinfo;
        }
    }
}
