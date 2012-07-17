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

    // The EditSSM_Quote_Building class is used to manage content
    partial class EditSSM_Quote_Building : PortalModuleBase
    {

        private int ItemId = Null.NullInteger;

        #region Event Handlers

        // Page_Load runs when the control is loaded
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            try
            {
                if (Page.IsPostBack == false)
                {
                    var dt = new DataTable();
                    var dtNearestSchool = new DataTable();
                    var dtSchInMyQuote = new DataTable();
                   
                    // initialize investror location grid.
                    dgMyLocation.DataSource = dt;
                    dgMyLocation.DataBind();
                    MyLocation();
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        #endregion

        //--------Initialy set data to grid and strore in datatable--------------//
        public void MyLocation()
        {
            //initialize datatable and its coloum
            var dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Name");
            dt.Columns.Add("Address");
            dt.Columns.Add("City");
            dt.Columns.Add("State");
            dt.Columns.Add("Zip");
            dt.Columns.Add("NearestSchoolList");
            dt.Columns.Add("RecommendedSchoolList");

            //store datatable to viewstate
            ViewState.Add("dtInvestorLoc", dt);

            //bind grid
            dgMyLocation.DataSource = dt;
            dgMyLocation.DataBind();
        }

        //--------Autoincement Datatable ID for Create DataKey----------//
        public int IncrementID(DataTable dt)
        {
            int maxValue = 0;
            foreach (DataRow r in dt.Rows)
            {
                if (Convert.ToInt32(r[0].ToString()) >= maxValue)
                {
                    maxValue = Convert.ToInt32(r[0].ToString());
                }
            }
            if (maxValue >= 0)
            {
                maxValue = maxValue + 1;
            }
            return maxValue;
        }

        //----------Add Location form visitor And Select Location----------------//
        public void AddInvestorLoc(object s, DataGridCommandEventArgs e)
        {
            try
            {
                //System.Diagnostics.Debugger.Break();
                lblmessage.Text += "itemcommnadn";
                int i = 0;
                string nearestSchoolHTML = string.Empty;
                string recommndedSchoolHTML = string.Empty;


                //----Execute when add investor location button click on grid "dgMyLocation"----//
                if (e.CommandName == "addLocation")
                {
                    //Find contorl in grid and create that object.
                    var txtName = (TextBox)e.Item.FindControl("txtName");
                    var txtAddress = (TextBox)e.Item.FindControl("txtAddress");
                    var txtCity = (TextBox)e.Item.FindControl("txtCity");
                    var txtState = (TextBox)e.Item.FindControl("txtState");
                    var txtZip = (TextBox)e.Item.FindControl("txtZip");
                    IntegrateWebService.SSM_WebService.MTOMSoapClient obj = new MTOMSoapClient();
                    DataTable dtSchool = new DataTable();
                    DataRow row = null;
                    dtSchool=obj.DNN_GetNearestSchool(txtZip.Text.ToString(),10);
                    int record = 0;
                    string strContent = "";
                    
                    //----Read viewstate data----//
                    var dt = ViewState["dtInvestorLoc"] as DataTable;
                    if (dt != null)
                    {
                        //----Prepare new row add data to it----//
                        var dr = dt.NewRow();
                        int new_UniqueNo;
                        if (dt.Rows.Count >= 1)
                        {
                            new_UniqueNo = IncrementID(dt);
                        }
                        else
                        {
                            new_UniqueNo = 1;
                        }
                      
                        //----prepare recommneded school and nearest school table to show in grid----//
                        if (dtSchool.Rows.Count > 0)
                        {

                            record = dtSchool.Rows.Count;
                            recommndedSchoolHTML = "<table id='id_tabel_" + new_UniqueNo + "' class='abcdefg' align='center' width='99%'><tr Style='display: none'><th></th><th>schoolId</th><th>school name</th><th>distance</th><th>lat</th><th>longitude</th></tr>";

                            //-----read each data form list object----//
                            foreach (DataRow r in dtSchool.Rows)
                            {
                                if (Convert.ToInt32(r["Distance"].ToString()) <= 5)
                                {
                                    recommndedSchoolHTML += "<tr><td><input id='chkChoice_" + new_UniqueNo + i + "' onclick='javascript:SchholInMyQuote(this);javascript:MarkAllSameSchool(this.id);' type='checkbox'  checked='checked'/></td><td Style='display: none' id='schoolId_" + new_UniqueNo + i + "'>" + r["SchoolId"].ToString() + "</td><td  id='schoolName_" + new_UniqueNo + i + "'>" + r["Name"].ToString() + "</td><td>(" + r["Distance"].ToString() + " Mi)</td><td  id='lat_" + new_UniqueNo + i + "'  Style='display: none'>" + r["lat"].ToString() + "</td><td id='long_" + new_UniqueNo + i + "' Style='display: none'>" + r["longi"].ToString() + "</td></tr>";
                                }
                                else
                                {
                                    recommndedSchoolHTML += "<tr><td><input id='chkChoice_" + new_UniqueNo + i + "' onclick='javascript:SchholInMyQuote(this);javascript:MarkAllSameSchool(this.id);' type='checkbox'/></td><td Style='display: none' id='schoolId_" + new_UniqueNo + i + "'>" + r["SchoolId"].ToString() + "</td><td  id='schoolName_" + new_UniqueNo + i + "'>" + r["Name"].ToString() + "</td><td>(" + r["Distance"].ToString() + " Mi)</td><td  id='lat_" + new_UniqueNo + i + "'  Style='display: none'>" + r["lat"].ToString() + "</td><td id='long_" + new_UniqueNo + i + "' Style='display: none'>" + r["longi"].ToString() + "</td></tr>";
                                }

                                //----do only for first record of list this has closes school----///
                                if (i == 0)
                                {
                                    nearestSchoolHTML = r["Name"].ToString() + "<br/>" + "(" + r["Distance"].ToString() + " " + "Miles)";
                                }
                                i = i + 1;
                            }
                            recommndedSchoolHTML += "</table>";
                            //-----set each cell value of datarow object-----//
                            dr["id"] = new_UniqueNo;
                            dr["Name"] = txtName.Text.Trim();
                            dr["Address"] = txtAddress.Text.ToString();
                            dr["City"] = txtCity.Text.ToString();
                            dr["State"] = txtState.Text.Trim();
                            dr["Zip"] = txtZip.Text.Trim();
                            dr["NearestSchoolList"] = "<div id='NearestSchoolResult_" + new_UniqueNo + "'>" + nearestSchoolHTML + "</div>";
                            dr["RecommendedSchoolList"] = "<div id='RecommendedSchoolList_" + new_UniqueNo + "'>" + recommndedSchoolHTML + "</div>";

                            //----Add new row to datatable.----//
                            dt.Rows.Add(dr);

                            //----Add all details of datatable to viewstate----//
                            ViewState.Add("dtInvestorLoc", dt);
                            dgMyLocation.DataSource = dt;
                            dgMyLocation.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        //---------------Delete Location------------//

        public void DelInvestorLoc(object S, DataGridCommandEventArgs e)
        {
            //----xecute when delete button click on grid "dgMyLocation"----//
            if (e.CommandName == "Delete")
            {
                //----read viewstate data.----//
                var dt = ViewState["dtInvestorLoc"] as DataTable;
                if (dt != null)
                {
                    if (dt.Rows.Count > 0)
                    {
                        //----get selected index of row from grid----//
                        dt.Rows.RemoveAt(e.Item.ItemIndex);
                        dt.AcceptChanges();

                        //----add updated datatable to viewstate----//
                        ViewState.Add("dtInvestorLoc", dt);

                        //----bing grid----//
                        dgMyLocation.DataSource = dt;
                        dgMyLocation.DataBind();
                    }
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {


        }
        protected void dgMyLocation_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            string completeAddress = "";
            string[] address_Part;
            string selRow = "";

            //-----to show school name in grid tool tip------//
            if (e.Item.ItemIndex != -1)
            {
                var dtNearestSchool = ViewState["dtInvestorLoc"] as DataTable;
                foreach (DataRow r in dtNearestSchool.Rows)
                {
                    if (r[0].ToString() == dgMyLocation.DataKeys[e.Item.ItemIndex].ToString())
                    {
                        e.Item.ToolTip = r[2].ToString();
                    }
                }
                
                //------to add javascript function ot grid row and also set its values----//
                selRow = dgMyLocation.DataKeys[e.Item.ItemIndex].ToString();
                completeAddress = getMyLocSelectedRow(selRow);
                address_Part = completeAddress.Split(',');
                if (completeAddress != "")
                {
                    e.Item.Attributes.Add("onclick", "javascript:codeAddress('" + completeAddress + "');");
                }
            }
            //e.Item.ToString();
        }

        public string getMyLocSelectedRow(string rowID)
        {
            //--------Reset SchInMyQuote Grid----------//
            string name = "";
            string state = "";
            string city = "";
            string address = "";
            string zip = "";



            //Identify selected row
            int key = Convert.ToInt32(rowID);

            //stroe viewstate data to variable for process
            var dt = ViewState["dtInvestorLoc"] as DataTable;

            //Match selected row in dt and call getschool function.
            foreach (DataRow r in dt.Rows)
            {

                if (key == Convert.ToInt32(r[0].ToString()))
                {
                    //assing selected school name and distance to lable.
                    name = r[1].ToString();
                    address = r[2].ToString();
                    city = r[3].ToString();
                    state = r[4].ToString();
                    zip = r[5].ToString();
                }
            }
            return address + "," + city + "," + state + "," + zip;
        }

        protected void dgMyLocation_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {


        }
        protected void dgMyLocation_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblmessage.Text += "grid selected index change";
        }

       
        protected void dgMyLocation_ItemCreated(object sender, DataGridItemEventArgs e)
        {
            string zip = "";
            lblmessage.Text = "Itencreaeted";
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                e.Item.Attributes.Add("onmouseover", "this.style.backgroundColor='#355597';this.style.cursor='pointer'");
                e.Item.Attributes.Add("onmouseout", "this.style.backgroundColor='#869BC3';");
            }
            if (e.Item.ItemIndex != -1)
            {


            }

        }
        protected void BtnNext_Click(object sender, EventArgs e)
        {

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {

            string gmapUrl = string.Empty;
            string gmapStr = string.Empty;
            Boolean designFlag = true;
            if (FinalChoice.Value == "")
            {
                Response.Write("<script>alert('Please Choose School For Quotation.');</script>");
                return;
            }
            else
           {
                string investorLocHTML = "";
                //-----------email content start-------------//
                var dt = ViewState["dtInvestorLoc"] as DataTable;
                investorLocHTML = "<table  cellpadding='0'; cellspacing='0';><tr><th style='border-style:solid none solid none; border-top-width: 1px; border-color: #000000; border-bottom-width: 1px;width:150px;font-size:10.0pt;'>Address</th><th style='border-style:solid none solid none; border-top-width: 1px; border-color: #000000; border-bottom-width: 1px;width:100px;font-size:10.0pt;'>City</th><th style='border-style:solid none solid none; border-top-width: 1px; border-color: #000000; border-bottom-width: 1px;width:50px;font-size:10.0pt;'>State</th><th  style='border-style: solid none solid none; border-top-width: 1px; border-color: #000000; border-bottom-width: 1px;width:50px;'>Zip</th></tr>";
                foreach (DataRow r in dt.Rows)
                {
                    if (designFlag == true)
                    {
                        investorLocHTML += "<tr style='height:25px;' bgcolor='#D1D1D1'><td >" + r[2].ToString() + "</td><td>" + r[3].ToString() + "</td><td>" + r[4].ToString() + "</td><td>" + r[5].ToString() + "</td></tr>";
                        designFlag = false;
                    }
                    else 
                    {
                        investorLocHTML += "<tr style='height:25px;' bgcolor='#F8F8F8'><td >" + r[2].ToString() + "</td><td>" + r[3].ToString() + "</td><td>" + r[4].ToString() + "</td><td>" + r[5].ToString() + "</td></tr>";
                        designFlag = true;
                    }

                    
                }
                investorLocHTML += "</table>";
                Session["investorLocation"] = investorLocHTML;
                //---------end-----------//

                //----------email Content start--------------//

                //-------Put marker on gmail for all selected school------------//
                hdnEmailStringGMap.Value = hdnEmailStringGMap.Value.Replace("undefined", "");
                hdnAllGmapMark.Value = hdnAllGmapMark.Value.Replace("undefined", "");
                //replace is used to reduce legnth of uri genreate for static gmap for email (max legnth:2048 for gmap server)
                hdnEmailStringGMap.Value = hdnEmailStringGMap.Value.ToString().Replace("&amp;", "&");
                hdnEmailStringGMap.Value = hdnEmailStringGMap.Value.ToString().Replace("0000", "");
                hdnAllGmapMark.Value = hdnAllGmapMark.Value.ToString().Replace("&amp;", "&");
                hdnAllGmapMark.Value = hdnAllGmapMark.Value.ToString().Replace("0000", "");
                gmapUrl = "src=http://maps.googleapis.com/maps/api/staticmap?size=512x512&maptype=roadmap&markers=color:red|label:S|" + hdnEmailStringGMap.Value + "&markers=color:blue|" + hdnAllGmapMark.Value + "&sensor=false";
                gmapStr = "<img " + gmapUrl + "></img>";
                Response.Write("<script>alert(" + gmapStr + ")</script>");
                Session["GmapContentForEmail"] = gmapStr;
                //-------------end---------------------//
                Response.Redirect(EditUrl("FinalSchoolList", FinalChoice.Value, "Companing"), true);
            }
        }
    }
}

