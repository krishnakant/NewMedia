// 
// DotNetNuke® - http://www.dotnetnuke.com
// Copyright (c) 2002-2011
// by DotNetNuke Corporation
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
// documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
// the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
// to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all copies or substantial portions 
// of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
// TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
// CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
// DEALINGS IN THE SOFTWARE.


using System;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Security;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using IntegrateWebService.SSM_WebService;
using System.Data;

namespace Philip.Modules.SSMTestUserControl
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewSSMTestUserControl class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class ViewSSMTestUserControl : PortalModuleBase, IActionable
    {

        #region Private Members

        private string strTemplate;

        #endregion

        #region Public Methods

        public bool DisplayAudit()
        {
            bool retValue = false;

            if ((string)Settings["auditinfo"] == "Y")
            {
                retValue = true;
            }

            return retValue;
        }

        #endregion

        #region Event Handlers

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Page_Load runs when the control is loaded
        /// </summary>
        /// <remarks>
        /// </remarks>
        /// <history>
        /// </history>
        /// -----------------------------------------------------------------------------
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    if (((string)Settings["template"] != null) && ((string)Settings["template"] != ""))
                        strTemplate = (string)Settings["template"];
                    else
                        strTemplate = Localization.GetString("Template.Text", LocalResourceFile);

                    SSMTestUserControlController objSSMTestUserControls = new SSMTestUserControlController();
                    List<SSMTestUserControlInfo> colSSMTestUserControls;






                    bindGrid();
                    //grdSchool.DataSource = dt; 
                    //grdSchool.DataBind(); 
                   // Response.Redirect(dt.Rows.Count.ToString());
                    

                    ////get the content from the SSMTestUserControl table
                    //colSSMTestUserControls = objSSMTestUserControls.GetSSMTestUserControls(ModuleId);

                    //if (colSSMTestUserControls.Count == 0)
                    //{
                    //    //add the content to the SSMTestUserControl table
                    //    SSMTestUserControlInfo objSSMTestUserControl = new SSMTestUserControlInfo();
                    //    objSSMTestUserControl.ModuleId = ModuleId;
                    //    objSSMTestUserControl.Content = Localization.GetString("DefaultContent", LocalResourceFile);
                    //    objSSMTestUserControl.CreatedByUser = this.UserId;
                    //    objSSMTestUserControls.AddSSMTestUserControl(objSSMTestUserControl);

                    //    //get the content from the SSMTestUserControl table
                    //    colSSMTestUserControls = objSSMTestUserControls.GetSSMTestUserControls(ModuleId);
                    //}

                 
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }

        }

        public void bindGrid()
        {
           
            MTOMSoapClient obj = new MTOMSoapClient();
            DataTable dt = new DataTable();
            DataTable dt_1 = new DataTable();

            dt_1 = obj.getSchool();
            
            dt.Columns.Add("SchoolId");
            dt.Columns.Add("Name");
            dt.Columns.Add("Mascot");
            dt.Columns.Add("State");
            dt.Columns.Add("ZIP");
            dt.Columns.Add("StudentAttendance");
            int i = 0;
            DataRow row = null;
            foreach (DataRow r in dt_1.Rows)
            {
                row = dt.NewRow();
                row["SchoolId"] = dt_1.Rows[i][0];
                row["Name"] = dt_1.Rows[i][1];
                row["Mascot"] = dt_1.Rows[i][2];
                row["State"] = dt_1.Rows[i][6];
                row["ZIP"] = dt_1.Rows[i][7];
                row["StudentAttendance"] = dt_1.Rows[i][8];
                //row["Field2"] = ds.Tables[0].Rows[i][2];
                dt.Rows.Add(row);
                i = i + 1;
            }

            grdSchool.DataSource = dt;
            grdSchool.DataBind(); 
       
        
        
        
        }

        //protected void lstContent_ItemDataBound(System.Object sender, System.Web.UI.WebControls.DataListItemEventArgs e)
        //{
        //    string strContent = strTemplate;
        //    string strValue = Null.NullString;

        //    //add content to template
        //    ArrayList objProperties = CBO.GetPropertyInfo(typeof(SSMTestUserControlInfo));
        //    int intProperty;
        //    foreach (PropertyInfo objPropertyInfo in objProperties)
        //    {
        //        if (strContent.IndexOf("[" + objPropertyInfo.Name.ToUpper() + "]") != -1)
        //        {
        //            strValue = Server.HtmlDecode(DataBinder.Eval(e.Item.DataItem, objPropertyInfo.Name).ToString());
        //            strContent = strContent.Replace("[" + objPropertyInfo.Name.ToUpper() + "]", strValue);
        //        }
        //    }

        //    //assign the content
        //    Label lblContent = (Label)e.Item.FindControl("lblContent");
        //    lblContent.Text = strContent;
        //}

        #endregion

        #region Optional Interfaces

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Registers the module actions required for interfacing with the portal framework
        /// </summary>
        /// <value></value>
        /// <returns></returns>
        /// <remarks></remarks>
        /// <history>
        /// </history>
        /// -----------------------------------------------------------------------------
        public ModuleActionCollection ModuleActions
        {
            get
            {
                ModuleActionCollection Actions = new ModuleActionCollection();
                Actions.Add(this.GetNextActionID(), Localization.GetString(ModuleActionType.AddContent, this.LocalResourceFile), ModuleActionType.AddContent, "", "", this.EditUrl(), false, SecurityAccessLevel.Edit, true, false);
                return Actions;
            }
        }

        #endregion

        protected void grdSchool_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
        }
}
}

