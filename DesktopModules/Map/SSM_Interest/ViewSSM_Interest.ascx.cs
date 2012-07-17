using System;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DotNetNuke;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Security;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using IntegrateWebService.SSM_WebService;

namespace Philip.Modules.SSM_Interest
{
   partial class ViewSSM_Interest : PortalModuleBase, IActionable
    {

        private string strTemplate;
        string sportsList = string.Empty;

        //get SMTP server setting from dnn.
        public string strSMTP = DotNetNuke.Entities.Host.HostSettings.GetHostSetting("SMTPServer");

        //defautl function add by dnn templet.
        public bool DisplayAudit()
        {
            bool retValue = false;

            if ((string)Settings["auditinfo"] == "Y")
            {
                retValue = true;
            }

            return retValue;
        }

        
        static string regularSeason = string.Empty;

        // Page_Load runs when the control is loaded
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            try
            {
                //call function to bind list of all state with drop down.
                CreateStateList();

                //set default state to MN
                ddlState0.SelectedItem.Text = "MN";

                if (!Page.IsPostBack)
                {
                    var dt = new DataTable();
                    var dtHosted = new DataTable();

                    // initialize regular season grid.
                    dgRegularSeason.DataSource = dt;
                    dgRegularSeason.DataBind();
                    RegularSeason();

                    // initialize hosted tournaments grid
                    dgHostedTournaments.DataSource = dtHosted;
                    dgHostedTournaments.DataBind();
                    HostedTournaments();

                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }

        }

        //to bind grid with all name of state form database.
        public void CreateStateList()
        {

            DataTable dt=new DataTable();
            
            //create webservice object
            IntegrateWebService.SSM_WebService.MTOMSoap obj=new MTOMSoapClient();

            //call method form webservice
            dt=obj.DNN_GetAllState();


            if (dt.Rows.Count > 0)
            {
                //bind state data to dropdownlist.
                ddlState0.DataSource = dt;
                ddlState0.DataTextField = "StateShortName";
                ddlState0.DataValueField = "StateID";
                ddlState0.DataBind();

            }
            
        }

        //--------Initialy set data to grid and strore in datatable--------------//
        public void RegularSeason()
        {
            //initialize datatable and its coloum
            var dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Sports");
            dt.Columns.Add("Of Events");
            dt.Columns.Add("Average Attendance");
            dt.Columns.Add("TotalAttendance");

            //store datatable to viewstate
            ViewState.Add("dtRegularSeason", dt);

            //bind grid
            dgRegularSeason.DataSource = dt;
            dgRegularSeason.DataBind();
        }

        //--------Initialy set data to grid and strore in datatable--------------//
        public void HostedTournaments()
        {
            //initialize datatable and its coloum
            var dtHosted = new DataTable();
            dtHosted.Columns.Add("ID");
            dtHosted.Columns.Add("HostedEventsName");
            dtHosted.Columns.Add("HostedSports");
            dtHosted.Columns.Add("No_Of_Days");
            dtHosted.Columns.Add("Hosted_Average_Attendance");
            dtHosted.Columns.Add("Hosted_Total_Attendance");

            //store datatable to viewstate
            ViewState.Add("dtHostedTournaments", dtHosted);

            //bind grid
            dgRegularSeason.DataSource = dtHosted;
            dgRegularSeason.DataBind();
            //CreateHostedTournamentData();

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

        protected void chkListBoysSports_SelectedIndexChanged(object sender, EventArgs e)
        {
            //------------to set visibility of  hosted tournament grid only when any item in boy check box group is selected--------------//
            foreach (ListItem liSeasonal in chkListBoysSports.Items)
            {
                if (liSeasonal.Selected == true)
                {
                    dgHostedTournaments.Visible = true;
                    break;
                }

            }
            try
            {

                var dt = ViewState["dtRegularSeason"] as DataTable;
                //reset datatable
                if (dt.Rows.Count > 0)
                {
                    dt.Clear();
                }

                //----functionto create regular season table---------//
                CreateRegularSeasonData();
                AddItemToDropDownList();


            }
            catch
            {

            }
        }

        protected void chkListGirlsSports_SelectedIndexChanged(object sender, EventArgs e)
        {
            //------------to set visibility of  hosted tournament grid  only when any item in boy check box group is selected--------------//
            foreach (ListItem liSeasonal in chkListGirlsSports.Items)
            {
                if (liSeasonal.Selected == true)
                {
                    dgHostedTournaments.Visible = true;
                    break;
                }

            }
            try
            {

                var dt = ViewState["dtRegularSeason"] as DataTable;
                //reset datatable
                if (dt.Rows.Count > 0)
                {
                    dt.Clear();
                }

                //----functionto create regular season table---------//
                CreateRegularSeasonData();
                AddItemToDropDownList();

            }
            catch
            {

            }

        }

        //----To create view state for regular season grid and bind it-------//
        public void CreateRegularSeasonData()
        {
            try
            {
                int i = 0;

                //--------set view  state data to variable ----------//
                var dt = ViewState["dtRegularSeason"] as DataTable;

                //--------process each element of boys check box group to create regular  season table------------//
                foreach (ListItem liSeasonal in chkListBoysSports.Items)
                {
                    if (liSeasonal.Selected == true)
                    {

                        if (dt != null)
                        {
                            i = i + 1;
                            //------Prepare new row to add data to it---------//
                            var dr = dt.NewRow();

                            //--------set data for each new row cell------------//
                            dr["ID"] = "";
                            dr["Sports"] = "Boys" + " " + liSeasonal.Value.ToString();
                            dr["Of Events"] = "<input id='EventInputBoy_" + i + "' type='text'  maxLength=8 style='width:80px; margin: 4px;' onkeyup='javascript:validateInput(this.id);javascript:RowCalculation(this.id);javascript:ColoumCalculation();'/>";
                            dr["Average Attendance"] = "<input id='AvgAttendanceBoy_" + i + "' type='text' maxLength=8  style='width:80px;  margin: 4px;' onkeyup='javascript:validateInput(this.id);javascript:RowCalculation(this.id);javascript:ColoumCalculation();'/>";
                            dr["TotalAttendance"] = "<input id='TotalBoy_" + i + "' type='text'  readonly='readonly' disabled='disabled'  style='width:80px; margin: 4px; border-style: none;' onkeyup='javascript:ColoumCalculation();'/>";

                            //----------Add new row to datatable.------------//
                            dt.Rows.Add(dr);

                            //---------Add all details of datatable to viewstate-----------//
                            ViewState.Add("dtRegularSeason", dt);
                            dgRegularSeason.DataSource = dt;
                            dgRegularSeason.DataBind();
                        }


                    }


                }

                //--------process each element of girls check box group to create regular  season table------------//
                foreach (ListItem liSeasonal in chkListGirlsSports.Items)
                {

                    if (liSeasonal.Selected == true)
                    {
                        if (dt != null)
                        {
                            i = i + 1;
                            //---------Prepare new row add data to it-----------//
                            var dr = dt.NewRow();

                            //--------set data for each new row cell------------//
                            dr["ID"] = "";
                            dr["Sports"] = "Girls" + " " + liSeasonal.Value.ToString();
                            dr["Of Events"] = "<input id='EventInputGirl_" + i + "' type='text'  maxLength=8 style='width:80px; margin: 4px;'  onkeyup='javascript:validateInput(this.id);javascript:RowCalculation(this.id);javascript:ColoumCalculation();'/>";
                            dr["Average Attendance"] = "<input id='AvgAttendanceGirl_" + i + "'  maxLength=8 type='text' style='width:80px;  margin: 4px;'  onkeyup='javascript:validateInput(this.id);javascript:RowCalculation(this.id);javascript:ColoumCalculation();'/>";
                            dr["TotalAttendance"] = "<input id='TotalGirl_" + i + "' type='text' readonly='readonly' disabled='disabled'  style='width:80px; margin: 4px;border-style: none;' onkeyup='javascript:ColoumCalculation();'/>";

                            //------Add new row to datatable---------//.
                            dt.Rows.Add(dr);

                            //--------Add all details of datatable to viewstate-----------//
                            ViewState.Add("dtRegularSeason", dt);
                            dgRegularSeason.DataSource = dt;
                            dgRegularSeason.DataBind();
                        }
                    }
                }

            }
            catch
            {

            }
        }


        //-----To create dropdownlist by useing checked value of checkbox for add into hosted torunament grid-----//
        public void AddItemToDropDownList()
        {
            try
            {
                //System.Diagnostics.Debugger.Break();
                //--------To find drop down list in footer of hosted tournament grid----//
                Table tbl = (Table)dgHostedTournaments.Controls[0];
                DataGridItem footer = (DataGridItem)tbl.Controls[tbl.Controls.Count - 1]; 
                var sports = (DropDownList)footer.FindControl("ddlSportsList");

                //clear all item before add to dropdown list.
                sports.Items.Clear();

                if (sports != null)
                {
                    //check each check box of boy group and add it sport name to dropdownlist.
                    foreach (ListItem liSeasonal in chkListBoysSports.Items)
                    {
                        if (liSeasonal.Selected == true)
                        {
                            ListItem li = new ListItem();
                            li.Text = "Boys" + " " + liSeasonal.Value.ToString();
                            li.Value = "Boys" + " " + liSeasonal.Value.ToString();
                            sports.Items.Add(li);
                            
                        }
                    }
                    //check each check box of girl group and add it sport name to dropdownlist.
                    foreach (ListItem liSeasonal in chkListGirlsSports.Items)
                    {
                        if (liSeasonal.Selected == true)
                        {
                            ListItem li = new ListItem();
                            li.Text = "Girls" + " " + liSeasonal.Value.ToString();
                            li.Value = "Girls" + " " + liSeasonal.Value.ToString();
                            sports.Items.Add(li);
                        }
                    }
                }
            }
            catch
            {
            }
        }

       //----To add row with data on hoursted tournament grid--------//
        public void AddSportsEvents(object s, DataGridCommandEventArgs e)
        {
            try
            {
                // System.Diagnostics.Debugger.Break();
                int j = 0;
                var dtHosted = ViewState["dtHostedTournaments"] as DataTable;

                //---------Execute when add button click on hosted tournament grid------------//
                if (e.CommandName == "AddSchoolEvents")
                {
                    //-------Read viewstate data-------//
                    var dt = ViewState["dtHostedTournaments"] as DataTable;

                    //---------create datagrid contorl  object --------//
                    var txtEventName = (TextBox)e.Item.FindControl("txtEventName");
                    var ddlSports = (DropDownList)e.Item.FindControl("ddlSportsList");
                    var txtNoOfDays = (TextBox)e.Item.FindControl("txtNoOfDays");
                    var txtAvtAttendance = (TextBox)e.Item.FindControl("txtAvgAttendence");

                    if (dt != null && txtEventName.Text.Trim() != "")
                    {
                        //------Prepare new row to add data to it---------//
                        var dr = dt.NewRow();

                        //--------this part is used to prepare unique id when new row add to grid-------//
                        int new_UniqueNo;
                        if (dt.Rows.Count >= 1)
                        {
                            new_UniqueNo = IncrementID(dt);
                        }
                        else
                        {
                            new_UniqueNo = 1;
                        }

                        //----------add data to each  cell of new row----------//
                        dr["ID"] = new_UniqueNo;
                        dr["HostedEventsName"] = txtEventName.Text.Trim();
                        dr["HostedSports"] = ddlSports.SelectedValue.ToString();
                        dr["No_Of_Days"] = txtNoOfDays.Text.ToString();
                        dr["Hosted_Average_Attendance"] = txtAvtAttendance.Text.Trim();
                        dr["Hosted_Total_Attendance"] = Convert.ToDouble(txtNoOfDays.Text.Trim().ToString()) * Convert.ToDouble(txtAvtAttendance.Text.Trim().ToString());

                        //-------Add new row to datatable.------//
                        dt.Rows.Add(dr);

                        //----Add all details of datatable to viewstate----//
                        ViewState.Add("dtHostedTournaments", dt);
                        dgHostedTournaments.DataSource = dt;
                        dgHostedTournaments.DataBind();

                    }

                }
                AddItemToDropDownList();

            }
            catch
            {



            }



        }

       //------To remove row from data grid on 
        public void DelCustomEvents(object S, DataGridCommandEventArgs e)
        {
          try
            {
              //----Execute when delete button click on grid ----//
                if (e.CommandName == "Delete")
                {
                    //----read viewstate data.----//
                    var dt = ViewState["dtHostedTournaments"] as DataTable;

                    if (dt != null)
                    {
                        if (dt.Rows.Count > 0)
                        {
                            //----get selected index of row from grid----//
                            dt.Rows.RemoveAt(e.Item.ItemIndex);
                            dt.AcceptChanges();

                            //----add updated datatable to viewstate----//
                            ViewState.Add("dtHostedTournaments", dt);

                            //-----bing grid----//
                            dgHostedTournaments.DataSource = dt;
                            dgHostedTournaments.DataBind();
                        }
                    }
                }

                AddItemToDropDownList();

            }
            catch
            {


            }
        }

        //-------To generate unique no for hosted tournament grid------------//
        public int IncrementID(DataTable dt)
        {
            int maxValue = 0;

            //--------process each row of hosted tournament grid--------//
            foreach (DataRow r in dt.Rows)
            {
                //--------compare id coloum each cell value and if it is greater then assing it to variable---------//
                if (Convert.ToInt32(r[0].ToString()) >= maxValue)
                {
                    maxValue = Convert.ToInt32(r[0].ToString());
                }

            }
            //-------increment higheest value by 1-------//
            if (maxValue >= 0)
            {
                maxValue = maxValue + 1;
            }
            return maxValue;

        }

        protected void lbtnAdd_Click(object sender, EventArgs e)
        {

        }

      

        //----To send email-------//
        protected void btnSend_Click(object sender, EventArgs e)
        {

            try
            {
                //System.Diagnostics.Debugger.Break();
                Boolean flag = false;
                Boolean desingFlage = true;
                //-------Create email part for hosted torunament table---------//
                string hostedTournament = string.Empty;
                var dtHosted = ViewState["dtHostedTournaments"] as DataTable;
                hostedTournament = "<table  cellpadding='0'; cellspacing='0';><tr><th style='border-style:solid none solid none; border-top-width: 1px; border-color: #000000; border-bottom-width: 1px;width:150px;font-size:10.0pt;' >Event Name</th><th style='border-style:solid none solid none; border-top-width: 1px; border-color: #000000; border-bottom-width: 1px;width:150px;font-size:10.0pt;'>Sports</th><th style='border-style:solid none solid none; border-top-width: 1px; border-color: #000000; border-bottom-width: 1px;width:150px;font-size:10.0pt;'># of days</th><th style='border-style:solid none solid none; border-top-width: 1px; border-color: #000000; border-bottom-width: 1px;width:150px;font-size:10.0pt;'>Average atteandence</th><th style='border-style:solid none solid none; border-top-width: 1px; border-color: #000000; border-bottom-width: 1px;width:150px;font-size:10.0pt;'>Total attendence</th></tr>";
                foreach (DataRow r in dtHosted.Rows)
                {
                    if (desingFlage == true)
                    {
                        hostedTournament += "<tr style='height:25px;' bgcolor='#D1D1D1'><td>" + r[1].ToString() + "</td><td>" + r[2].ToString() + "</td><td>" + r[3].ToString() + "</td><td>" + r[4].ToString() + "</td><td>" + r[5].ToString() + "</td></tr>";
                        desingFlage = false;
                    }
                    else{
                        hostedTournament += "<tr style='height:25px;' bgcolor='#F8F8F8'><td>" + r[1].ToString() + "</td><td>" + r[2].ToString() + "</td><td>" + r[3].ToString() + "</td><td>" + r[4].ToString() + "</td><td>" + r[5].ToString() + "</td></tr>";
                        desingFlage = true;
                    }

                    
                }
                hostedTournament += "</table>";

                //prepare sports list

                foreach (ListItem liSeasonal in chkListBoysSports.Items)
                {
                    if (liSeasonal.Selected == true)
                    {
                        ListItem li = new ListItem();
                        li.Text = "Boys" + " " + liSeasonal.Value.ToString();
                        //------email string data-------//
                        sportsList += "<tr><td>-" + " " + li.Text + "</td></tr>";
                        flag = true;

                    }
                }
               
                foreach (ListItem liSeasonal in chkListGirlsSports.Items)
                {
                    if (liSeasonal.Selected == true)
                    {
                        ListItem li = new ListItem();
                        li.Text = "Girls" + " " + liSeasonal.Value.ToString();
                       
                        //------email string data-------//
                        sportsList += "<tr><td>-" + " " + li.Text + "</td></tr>";
                        flag = true;

                    }
                }

                //-----Send main when any sports is selected---------//
                if (flag == true)
                {
                    string emailTemplet = string.Empty;
                    emailTemplet += "<table>";
                    emailTemplet += "<tr><td><span style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>About me:<u></u><u></u></span></td></tr>";
                    emailTemplet += "<tr><td><p></p></td></tr>";
                    emailTemplet += "<tr><td style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>Name          : <b>" + txtFirstName.Text + " " + txtLastName.Text + "</b></br></br></td></tr>";
                    emailTemplet += "<tr><td style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>Title          : <b>" + txtYourTitle.Text + "</b></br></br></td></tr>";
                    emailTemplet += "<tr><td style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>Email Address : <span style='color: #0066FF;'><b>" + txtEmailAddress.Text + "</b></span></br></br></td></tr>";
                    emailTemplet += "<tr><td style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>Phone No      : <span style='color: #0066FF;'><b>" + txtPhoneNo.Text + "</b></span></br></br></td></tr>";
                    emailTemplet += "<tr><td><hr></hr></td></tr>";
                    emailTemplet += "<tr><td><p></p></td></tr>";
                    emailTemplet += "<tr><td><span style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>About my school:<u></u><u></u></span></td></tr>";
                    emailTemplet += "<tr><td><p></p></td></tr>";
                    emailTemplet += "<tr><td style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>School name          : <b>" + txtSchoolName.Text + "</b></br></br></td></tr>";
                    emailTemplet += "<tr><td style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>School district          : <b>" + txtSchoolDistrict.Text + "</b></br></br></td></tr>";
                    emailTemplet += "<tr><td style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>School address          : <b>" + txtSchoolAddress.Text + "</b></br></br></td></tr>";
                    emailTemplet += "<tr><td style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>City          : <b>" + txtCity.Text + "</b></br></br></td></tr>";
                    emailTemplet += "<tr><td style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>State         : <b>" + ddlState0.SelectedValue + "</b></br></br></td></tr>";
                    emailTemplet += "<tr><td style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>Zip         : <b>" + txtZip.Text + "</b></br></br></td></tr>";
                    emailTemplet += "<tr><td><p></p></td></tr>";
                    emailTemplet += "<tr><td><hr></hr></td></tr>";
                    emailTemplet += "<tr><td><span style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>Conference name: <b>" + txtConferenceName.Text + "</b><u></u><u></u></span></td></tr>";
                    emailTemplet += "<tr><td><p></p></td></tr>";
                    emailTemplet += "<tr><td><span style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>Sports we play:<u></u><u></u></span></td></tr>";
                    emailTemplet += "<tr><td><p></p></td></tr>";
                    emailTemplet += sportsList;
                    emailTemplet += "<tr><td><p></p></td></tr>";
                    emailTemplet += "<tr><td><hr></hr></td></tr>";
                    emailTemplet += "<tr><td><br/></td></tr>";
                    emailTemplet += "<tr><td><span style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>Regular Season:<u></u><u></u></span></td></tr>";
                    emailTemplet += "<tr><td>" + hdnRegularSeasonEmailStr.Value.ToString() + "</td></tr>";
                    emailTemplet += "<tr><td><hr></hr></td></tr>";
                    emailTemplet += "<tr><td><p></p></td></tr>";
                    emailTemplet += "<tr><td><span style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>Hosted tournaments and speacial events:<u></u><u></u></span></td></tr>";
                    emailTemplet += "<tr><td>" + hostedTournament + "</td></tr>";
                    emailTemplet += "<tr><td></br></td></tr>";
                    emailTemplet += "<tr><td><hr></hr></td></tr>";
                    emailTemplet += "<tr><td><p></p></td></tr>";
                    emailTemplet += "<tr><td><span style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>Comment and other information:<u></u><u></u></span></td></tr>";
                    emailTemplet += "<tr><td></br></td></tr>";
                    emailTemplet += "<tr><td>" + txtComment.Text + "</td></tr>";
                    emailTemplet += "<tr><td><hr></hr></td></tr>";
                    emailTemplet += "</table>";
                    SendEmail("krishnabatham@gmail.com", "bjnicholson@schoolspacemedia.com", "", "", "Enrolling Details", emailTemplet);
                    Response.Redirect(EditUrl("ThankYou"));
                }
                else
                {
                    Response.Write("<script>alert('Please select any sport and fill it details.')</script>");
                    return;

                }


            }
            catch
            {

            }
        }

        //Method to send email
        public void SendEmail(string strFrom, string strTo, string strCC, string strBCC, string strSubject, string strBody)
        {
            //Sending email
            DotNetNuke.Services.Mail.Mail.SendMail(strFrom, strTo, strCC, strBCC, DotNetNuke.Services.Mail.MailPriority.Normal, strSubject, DotNetNuke.Services.Mail.MailFormat.Html, System.Text.Encoding.UTF8, strBody, "", strSMTP, "", "krishna.batham@systematixindia.com", "4844@sipl");
        }
    }


}

