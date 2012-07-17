using System;
using DotNetNuke;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Philip.Modules.SSM_Quote_Building;
namespace Philip.Modules.SSM_Quote_Building
{
        public partial class AjaxHandler : System.Web.UI.Page
        {
            protected void Page_Load(object sender, EventArgs e)
            {
                System.Diagnostics.Debugger.Break();
                #region Variables
                string status = "";
                #endregion
                if (Request.Params["status"] != null)
                {
                    status = Request.Params["status"];
                    /*Function for Get SI Configuration */
                    if (status == "GetSchoolList")
                    {
                        string str = string.Empty;
                        str += "<Detail>";
                        int id = 0;

                        //string ZipCode = string.Empty;
                        //if (Request.Params["ZipCode"] != null)
                        //{
                        //    ZipCode = Convert.ToString(Request.Params["ZipCode"]);
                        //}
                        //int Miles = 0;
                        //if (Request.Params["Miles"] != null)
                        //{
                        //    Miles = Convert.ToInt32(Request.Params["Miles"]);
                        //}
                        ////Create controlar class object.
                        //SSM_Quote_BuildingController objSSM_Quote_Buildings = new SSM_Quote_BuildingController();

                        ////Create SSM_Quote_BuildingInfo object for get and set property.
                        //SSM_Quote_BuildingInfo objSSM_Quote_Building = new SSM_Quote_BuildingInfo();

                        ////To store all resultant school list
                        //List<SSM_Quote_BuildingInfo> colSSM_Quote_Buildings;

                        //// get the content from the School table 
                        //objSSM_Quote_Building.ZipCode = "55123";  //"55123";
                        //objSSM_Quote_Building.Miles = Miles; //10;
                        //colSSM_Quote_Buildings = objSSM_Quote_Buildings.SSM_Quote_BuildingInfo(objSSM_Quote_Building.ZipCode, objSSM_Quote_Building.Miles);
                        //int record = 0;
                        string strContent = "";
                        //if (colSSM_Quote_Buildings.Count > 0)
                        //{
                        //    record = colSSM_Quote_Buildings.Count;
                        //    //read each data form list object
                        //    foreach (var list in colSSM_Quote_Buildings)
                        //    {
                        //        strContent += "<schoolId>" + CDATA(list.SchoolId.ToString()) + "</schoolId>";
                        //        strContent += "<schoolName>" + CDATA(list.Name.ToString()) + "</schoolName>";
                        //        strContent += "<Distance>" + CDATA(list.Distance.ToString()) + "</Distance>";
                        //        strContent += "<lat>" + CDATA(list.lat.ToString()) + "</lat>";
                        //        strContent += "<longitude>" + CDATA(list.longi.ToString()) + "</longitude>";
                        //    }

                        //}
                        strContent += "<schoolId>1</schoolId>";
                        strContent += "<schoolName>7547</schoolName>";
                        strContent += "<Distance>757</Distance>";
                        strContent += "<lat>754</lat>";
                        strContent += "<longitude>754</longitude>";
                        str += "<Records>1</Records>";
                        str += strContent;
                        str += "</Detail>";
                        Response.Write("<script>alert('sunil')</script>");
                        //SetData(str);
                    }

                }
                /* Write the content in the xml format */

            }
            public void SetData(string str)
            {
                //cnn.Close();
                Response.Clear();
                Response.ContentType = "text/xml";
                Response.Write("<data>" + str + "</data>");
                Response.End();
            }
            /*Function for handing the special character in XML */
            public string CDATA(string strContent)
            {
                strContent = "<![CDATA[" + strContent + "]]>";
                return strContent;
            }
        }

}
