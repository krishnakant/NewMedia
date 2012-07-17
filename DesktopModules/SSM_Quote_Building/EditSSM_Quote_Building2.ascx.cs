using System;
using DotNetNuke;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using System.Data;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.UI;
using IntegrateWebService.SSM_WebService;

namespace Philip.Modules.SSM_Quote_Building
{
    public partial class EditSSM_Quote_Building2 : PortalModuleBase
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            var dt = new DataTable();

            // initialize school list grid.
            dlSchools.DataSource = dt;
            dlSchools.DataBind();
            SchoolList();
            btnNext.Focus();
        }

        //--------Initialy set data to grid and strore in datatable--------------//
        public void SchoolList()
        {
            //initialize datatable and its coloum
            var dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Name");

            //store datatable to viewstate
            ViewState.Add("schoolList", dt);

            //bind grid
            dlSchools.DataSource = dt;
            dlSchools.DataBind();

            GetSchoolList();
        }

        public void GetSchoolList()
        {
            int i = 0;
            int record = 0;
            string pageHtml = string.Empty;

            IntegrateWebService.SSM_WebService.MTOMSoapClient obj = new MTOMSoapClient();
            DataTable dtSchool = new DataTable();
            DataRow row = null;
            dtSchool = obj.DNN_GetAllSchools();

            var dt = ViewState["schoolList"] as DataTable;

            if (dt.Rows.Count > 0)
            {
                dt.Clear();
            }

            if (dt != null)
            {
                //----prepare recommneded school and nearest school table to show in grid----//
                if (dtSchool.Rows.Count > 0)
                {
                    record = dt.Rows.Count;

                    //-----read each data form list object----//
                    foreach (DataRow r in dtSchool.Rows)
                    {
                        i = i + 1;
                        //Prepare new row add data to it
                        var dr = dt.NewRow();
                        dr["ID"] = r["SchoolId"];
                        dr["Name"] = "<td><input id='chkSchool_" + i + "' type='checkbox' value='" + r["Name"].ToString() + "'/></td><td  id='schoolName_" + i + "'>" + r["Name"].ToString() + "</td>";
                        dt.Rows.Add(dr);
                    }

                    //---store the check box count to hidden field----//
                    hdnChkCount.Value = Convert.ToString(i);
                }

                //Add all details of datatable to viewstate
                ViewState.Add("schoolList", dt);
                dlSchools.DataSource = dt;
                dlSchools.DataBind();
            }

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            Response.Redirect(EditUrl("FinalSchoolList", hdnDivContent.Value, "Companing"), true);
        }
}
}
