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

namespace Philip.Modules.SSM_ReportAndMetrics
{
    // The ViewSSM_ReportAndMetrics class displays the content
    partial class ViewSSM_ReportAndMetrics : PortalModuleBase, IActionable
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

               
        // Page_Load runs when the control is loaded
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
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }

        }

      
        
        #region Optional Interfaces

        
        // Registers the module actions required for interfacing with the portal framework
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
}
}

