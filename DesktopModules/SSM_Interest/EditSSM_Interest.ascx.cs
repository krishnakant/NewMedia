using System;
using DotNetNuke;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;

namespace Philip.Modules.SSM_Interest
{
    partial class EditSSM_Interest : PortalModuleBase
    {

        #region Private Members

        private int ItemId = Null.NullInteger;

        #endregion

        #region Event Handlers

        // Page_Load runs when the control is loaded
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            try
            {
                //http://183.182.84.29/ssm_dnn/ssm/Interest.aspx
                //Determine ItemId of SSM_Interest to Update
                if (this.Request.QueryString["ItemId"] != null)
                {
                    ItemId = Int32.Parse(this.Request.QueryString["ItemId"]);
                }

                //If this is the first visit to the page, bind the role data to the datalist
                if (Page.IsPostBack == false)
                {
                    //cmdDelete.Attributes.Add("onClick", "javascript:return confirm('" + Localization.GetString("DeleteItem") + "');");
                    
                   
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        //// cmdCancel_Click runs when the cancel button is clicked
        //protected void cmdCancel_Click(System.Object sender, System.EventArgs e)
        //{
        //    try
        //    {
        //        this.Response.Redirect(Globals.NavigateURL(this.TabId), true);
        //    }
        //    catch (Exception exc) //Module failed to load
        //    {
        //        Exceptions.ProcessModuleLoadException(this, exc);
        //    }
        //}

        //// cmdDelete_Click runs when the delete button is clicked
        //protected void cmdDelete_Click(System.Object sender, System.EventArgs e)
        //{
        //    try
        //    {
        //        //Only attempt to delete the item if it exists already
        //        if (!Null.IsNull(ItemId))
        //        {
        //            SSM_InterestController objSSM_Interests = new SSM_InterestController();
        //            objSSM_Interests.DeleteSSM_Interest(ModuleId, ItemId);
        //            //refresh cache
        //            SynchronizeModule();
        //        }

        //        this.Response.Redirect(Globals.NavigateURL(this.TabId), true);
        //    }
        //    catch (Exception exc) //Module failed to load
        //    {
        //        Exceptions.ProcessModuleLoadException(this, exc);
        //    }
        //}

        //// cmdUpdate_Click runs when the update button is clicked
        //protected void cmdUpdate_Click(System.Object sender, System.EventArgs e)
        //{
        //    try
        //    {
        //        SSM_InterestController objSSM_Interests = new SSM_InterestController();
        //        SSM_InterestInfo objSSM_Interest = new SSM_InterestInfo();

        //        objSSM_Interest.ModuleId = ModuleId;
        //        objSSM_Interest.ItemId = ItemId;
        //        objSSM_Interest.CreatedByUser = this.UserId;

        //        //Update the content within the SSM_Interest table
        //        if (Null.IsNull(ItemId))
        //        {
        //            objSSM_Interests.AddSSM_Interest(objSSM_Interest);
        //        }
        //        else
        //        {
        //            objSSM_Interests.UpdateSSM_Interest(objSSM_Interest);
        //        }

        //        //refresh cache
        //        SynchronizeModule();

        //        //Redirect back to the portal home page
        //        this.Response.Redirect(Globals.NavigateURL(this.TabId), true);
        //    }
        //    catch (Exception exc) //Module failed to load
        //    {
        //        Exceptions.ProcessModuleLoadException(this, exc);
        //    }
        //}

        #endregion

    }
}

