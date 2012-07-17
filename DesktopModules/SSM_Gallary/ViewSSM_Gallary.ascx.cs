using System;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using System.Xml;
using DotNetNuke;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Security;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;

namespace Philip.Modules.SSM_Gallary
{
    // The ViewSSM_Gallary class displays the content
    partial class ViewSSM_Gallary : PortalModuleBase, IActionable
    {

    #region Private Members

        private string strTemplate;

    #endregion

    #region Public Methods

        //This is created by defaut by dnn module createion templet.
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

                    //Create datatable object to initialize industry datalist
                    var dtIndustary = new DataTable();

                    //bind
                    dlIndustary.DataSource = dtIndustary;
                    dlIndustary.DataBind();
                    initilizeIndustary();

                    //Create datatable object to initialize image datalist
                    var dtGalleryImg = new DataTable();
                    dlGalleryImages.DataSource = dtGalleryImg;
                    //bind
                    dlGalleryImages.DataBind();
                    initlizeGallery();

                    //Generate randome no.
                    //System.Diagnostics.Debugger.Break();
                    Random r = new Random();
                    int k = r.Next(1,62);
                    //Response.Write("<script>alert('value'+" + k + ")</script>");
                    PlayRamdomAnimation(k);
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }

        }
        #endregion

        public void PlayRamdomAnimation(int randomNumber)
        {
            string playAnimationArg = string.Empty;

            //------create xml document object--------//
            XmlDocument _doc = new XmlDocument();

            //---------Load xml file----------//
            _doc.Load(Server.MapPath(ModulePath + "gallery.xml"));

            //-------Create object for each node of xml file----------//
            XmlNodeList elemList = _doc.GetElementsByTagName("gallery_item");

            //-----Read viewstate data-----//
            var dt = ViewState["dtGallery"] as DataTable;

            //----check data table for result-----//
            if (dt.Rows.Count > 0)
            {
                dt.Clear();
            }

            if (dt != null)
            {
                //--------Process each node of xml for its attribute-------------//
                for (int i = 0; i < elemList.Count; i++)
                {
                    if (i == randomNumber)
                    {
                        playAnimationArg = elemList[i].Attributes["name"].Value + "*" + elemList[i].Attributes["vid"].Value + "*" + elemList[i].Attributes["casestudy"].Value;
                        hdnPlayOnLoad.Value = playAnimationArg;
                    }
                }
            }
        }

        #region Optional Interfaces

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

        protected void lstContent_ItemCreated(object sender, DataListItemEventArgs e)
        {

            Response.Write("<script>alert(" + dlIndustary.DataKeys[e.Item.ItemIndex].ToString() + ")</script>");

        }
        protected void lstContent_ItemDataBound(object sender, DataListItemEventArgs e)
        {

            if (e.Item.ItemIndex != -1)
            {
                e.Item.ToolTip = dlIndustary.DataKeys[e.Item.ItemIndex].ToString();
            }

            //Response.Write("<script>alert('item databound command')</script>");
        }

        protected void lstContent_ItemCommand(object source, DataListCommandEventArgs e)
        {

            Response.Write("<script>alert(" + dlIndustary.DataKeys[e.Item.ItemIndex].ToString() + ")</script>");
        }

        protected void lstContent_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Write("ssl");
        }

        //-------Important----------//
        //------this is execute when any row is cliek of dtindustry datalist--------//
        //------because when this row click the javascript code fire click event of button and this code execute.......//
        protected void btnResult_Click(object sender, EventArgs e)
        {
            try
            {
                string industraty = string.Empty;

                //------check hidden field to get industry name-------//
                if (hdnIndustaryName.Value != "")
                {
                    industraty = hdnIndustaryName.Value;
                }
                else
                {
                    Response.Write("<script>alert('industary name not black')</script>");
                }

                //------create xml document object--------//
                XmlDocument _doc = new XmlDocument();

                //---------Load xml file----------//
                _doc.Load(Server.MapPath(ModulePath + "gallery.xml"));

                //-------Create object for each node of xml file----------//
                XmlNodeList elemList = _doc.GetElementsByTagName("gallery_item");

                //-----Read viewstate data-----//
                var dt = ViewState["dtGallery"] as DataTable;

                //----check data table for result-----//
                if (dt.Rows.Count > 0)
                {
                    dt.Clear();
                }

                if (dt != null)
                {

                    //--------Process each node of xml for its attribute-------------//
                    for (int i = 0; i < elemList.Count; i++)
                    {
                        //Prepare new row add data to it
                        var dr = dt.NewRow();

                        string attrVal = elemList[i].Attributes["industry"].Value;

                        //varigy industry name in xml file
                        if (industraty == attrVal)
                        {

                            dr["ClientName"] = elemList[i].Attributes["name"].Value;
                            dr["IndustraryName"] = elemList[i].Attributes["industry"].Value;
                            dr["PicUrl"] = elemList[i].Attributes["pic"].Value;
                            dr["VideoUrl"] = elemList[i].Attributes["vid"].Value;
                            dr["CaseStudy"] = elemList[i].Attributes["casestudy"].Value;
                            //Add new row to datatable.
                            dt.Rows.Add(dr);

                        }

                    }

                    //Add all details of datatable to viewstate
                    ViewState.Add("dtGallery", dt);
                    dlGalleryImages.DataSource = dt;
                    dlGalleryImages.DataBind();
                }
            }
            catch
            {
            }
        }


        //------To create view state for gallery datalist------//
        public void initlizeGallery()
        {
            //initialize datatable and its coloum
            var dt = new DataTable();

            dt.Columns.Add("ClientName");
            dt.Columns.Add("IndustraryName");
            dt.Columns.Add("PicUrl");
            dt.Columns.Add("VideoUrl");
            dt.Columns.Add("CaseStudy");

            //store datatable to viewstate
            ViewState.Add("dtGallery", dt);

        }


        //------To read XML and create view state that is bind to industry datlist------//
        public void initilizeIndustary()
        {
            try
            {
                DataTable DistinctValuesDataTable = new DataTable();
                //initialize datatable and its coloum
                var dt = new DataTable();
                dt.Columns.Add("IndustaryName");

                //store datatable to viewstate
                ViewState.Add("dtIndustary", dt);

                //------create xml document object--------//
                XmlDocument _doc = new XmlDocument();

                //---------Load xml file----------//
                _doc.Load(Server.MapPath(ModulePath + "gallery.xml"));

                //-------Create object for each node of xml file----------//
                XmlNodeList elemList = _doc.GetElementsByTagName("gallery_item");

                //-----Read viewstate data-----//
                var dtTemp = ViewState["dtIndustary"] as DataTable;
                if (dtTemp != null)
                {
                    //--------Process each node of xml for its attribute-------------//
                    for (int i = 0; i < elemList.Count; i++)
                    {
                        //Prepare new row add data to it
                        var dr = dtTemp.NewRow();
                        dr["IndustaryName"] = elemList[i].Attributes["industry"].Value;
                        dtTemp.Rows.Add(dr);
                    }
                    //---------Read only unique value form industary coloum---------//
                    DistinctValuesDataTable = dt.DefaultView.ToTable(true, "IndustaryName");

                }
                //-----Add all details of datatable to viewstate-------//
                ViewState.Add("dtIndustary", DistinctValuesDataTable);
                dlIndustary.DataSource = DistinctValuesDataTable;
                dlIndustary.DataBind();
            }
            catch
            {
            }
            
        }

    }
}


