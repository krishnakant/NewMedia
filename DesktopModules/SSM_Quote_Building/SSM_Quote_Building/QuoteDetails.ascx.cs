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
using System.Web.UI;using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Entities.Tabs;
using DotNetNuke.Security;
using System.Web.Security;

namespace Philip.Modules.SSM_Quote_Building
{
    public partial class QuoteDetails : PortalModuleBase
    {
      // Determine ItemId of ModuleName1 to Update 
      public string strSMTP = DotNetNuke.Entities.Host.HostSettings.GetHostSetting("SMTPServer");
        protected void Page_Load(object sender, EventArgs e)
        {
            string campainDetails = string.Empty;
            if ((Request.QueryString["CampainDetails"] != null))
            {
                campainDetails = Request.QueryString["CampainDetails"];
                ViewState.Add("AllDetails",campainDetails);
            }
        }

        //Method to send email
        public void SendEmail(string strFrom, string strTo, string strCC, string strBCC, string strSubject, string strBody)
        {
            //Sending email
            DotNetNuke.Services.Mail.Mail.SendMail(strFrom, strTo, strCC, strBCC, DotNetNuke.Services.Mail.MailPriority.Normal, strSubject, DotNetNuke.Services.Mail.MailFormat.Html, System.Text.Encoding.UTF8, strBody, "", strSMTP, "", "krishna.batham@systematixindia.com", "4844@sipl");
        }

        protected void txtFinish_Click(object sender, EventArgs e)
        {
           
            int flag = 0;
            string combineData =Convert.ToString(ViewState["AllDetails"]);
            string[] dataPart=null;
            string schoolName = string.Empty;
            string campaingTime = string.Empty;
            string emailTemplet = string.Empty;
            string gmapStr=string.Empty;
            String gmapUrl=string.Empty;

            gmapUrl="src=http://maps.googleapis.com/maps/api/staticmap?center=Brooklyn+Bridge,New+York,NY&zoom=14&size=512x512&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318&markers=color:red%7Ccolor:red%7Clabel:C%7C40.718217,-73.998284&sensor=false";
            gmapStr = "<img " + gmapUrl + "></img>";

            if (combineData != "")
            {
                dataPart = combineData.Split(new string[] { "B_R_S" }, StringSplitOptions.None);
                //dataPart = combineData.Split('B_R_S');
                 string [] strarrayemail = dataPart[1].Split('*');
                 Array.Sort(strarrayemail);
                 schoolName = "<ul style='list-style-type: none;padding-left: 10px;'>";
                 foreach (string str in strarrayemail)
                 {
                     if (flag != 0)
                     {
                         schoolName += "<li style='font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>" + " " + "  " + str + "</li>";
                     }
                     
                     flag = 1;
                 }
                 schoolName += "</ul>";
                 flag = 0;
                 campaingTime = dataPart[0].Replace('-',',');
                 emailTemplet += "<table>";
                 emailTemplet += "<tr><td><span style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>Please provide a quote to:</span></br></br></td></tr>";
                 emailTemplet += "<tr><td><p></p></td></tr>";
                 emailTemplet += "<tr><td style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>Name          : <b>" + txtName.Text + "</b></br></br></td></tr>";
                 emailTemplet += "<tr><td style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>Title         : <b>" + txtTitle.Text + "</b></br></br></td></tr>";
                 emailTemplet += "<tr><td style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>Company Name  : <b>" + txtCompanyName.Text + "</b></br></br></td></tr>";
                 emailTemplet += "<tr><td style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>Email Address : <span style='color: #0066FF;'><b>" + txtEmailAddress.Text + "</b></span></br></br></td></tr>";
                 emailTemplet += "<tr><td style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>Phone No      : <span style='color: #0066FF;'><b>" + txtPhoneNo.Text + "</b></span></br></br></td></tr>";
                 emailTemplet += "<tr><td><hr></hr></td></tr>";
                 emailTemplet += "<tr><td><p></p></td></tr>";

                 if (Session["investorLocation"] != "" && Session["investorLocation"] != null)
                 {
                     emailTemplet += "<tr><td><span style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>Their locations are:</span></td></tr>";
                     emailTemplet += "<tr><td>" + Session["investorLocation"] + "</td></tr>";
                     emailTemplet += "<tr><td><hr></hr></td></tr>";
                     emailTemplet += "<tr><td><p></p></td></tr>";
                 }
                 
                 if (schoolName != "" && schoolName!=null)
                 {
                     emailTemplet += "<tr><td><span style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>They would like a quote on the following schools:</span></td></tr>";
                     emailTemplet += "<tr><td>" + schoolName + "</br></br></td></tr>";
                     emailTemplet += "<tr><td><hr></hr></td></tr>";
                     emailTemplet += "<tr><td><p></p></td></tr>";
                 }
                 emailTemplet += "<tr><td><span style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>Campaing Details  :</span></br></br></td></tr>";
                 emailTemplet += "<tr><td> <p style='font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>" + campaingTime + "</p></tr></td>";
                 emailTemplet += "<tr><td><hr></hr></td></tr>";
                 emailTemplet += "<tr><td></br></td></tr>";
                 if (Session["GmapContentForEmail"] != "" && Session["GmapContentForEmail"]!=null)
                 {
                     emailTemplet += "<tr><td><span style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'><b>Map of their coverage:</b></span></td></tr>";
                     emailTemplet += "<tr><td></br></td></tr>";
                     emailTemplet += "<tr><td style='padding-top:10px;font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'><img style='width: 20px; height: 20px;' src='http://maps.google.com/mapfiles/ms/micons/red-dot.png'></img>school include in quote";
                     emailTemplet += "<img style='width: 20px; height: 20px;padding-left:20px;' src='http://maps.google.com/mapfiles/ms/micons/blue-dot.png'/>your location</td></tr>";
                     //emailTemplet += "<tr><td><span style='font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'>Your locations are shown in blue pushpins.  Schools you’ve been quoted are shown with red ‘S’ pushpins.</span></td></tr>";
                     emailTemplet += "<tr><td>" + Session["GmapContentForEmail"] + "</td></tr>";
                     emailTemplet += "<tr><td><hr></hr></td></tr>";
                     emailTemplet += "<tr><td></br></td></tr>";
                 }
                
                 emailTemplet += "</table>";
                 SendEmail("krishnabatham@gmail.com", "krishna.batham@systematixindia.com", "", "", "SSM Quotation Details", emailTemplet);
                 Response.Write("<script>alert('EMail Send Successfully.');</script>");
            }
           
             ////Get the selected TabId
            //int iProfileTabId = 81;

            ////Redirect to selected Page
            //this.Response.Redirect(Globals.NavigateURL(iProfileTabId), true);

            Response.Redirect(EditUrl("ThankYou"));
         
        }
}
}
