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
namespace Philip.Modules.SSM_Quote_Building
{
    
    partial class CampaignDetails : PortalModuleBase
    {
        string annual = string.Empty;
        string seasonal = string.Empty;
        string monthly = string.Empty;
        Boolean hasValue = false;
       
        protected void Page_Load(object sender, EventArgs e)
        {

            //Response.Write("<script>alert('" + Session["GmapContentForEmail"] + "')</script>");
            string finalSchoolList = string.Empty;
            if ((Request.QueryString["FinalSchoolList"] != null))
            {
                finalSchoolList = Request.QueryString["FinalSchoolList"];
                ViewState.Add("FinalSchool", finalSchoolList);
            }
        }
        protected void rdoAnnual_CheckedChanged(object sender, EventArgs e)
        {
            if (rdoAnnual.Checked == true)
            {
                
                annual = "Annual";
                TextBox1.Text = annual;
                seasonal = string.Empty;
                monthly = string.Empty;
                rdoMonthly.Checked = false;
                rdoSeasonal.Checked = false;
                chkListMonthly.Visible = false;
                chkListSeasonal.Visible = false;
                foreach (ListItem liSeasonal in chkListSeasonal.Items)
                {
                    liSeasonal.Selected = false;
                }
                foreach (ListItem liMonthly in chkListMonthly.Items)
                {
                    liMonthly.Selected = false;
                
                }

                TextBox1.Text = annual;
               
            }

        }
        protected void rdoSeasonal_CheckedChanged(object sender, EventArgs e)
        {
            if (rdoSeasonal.Checked == true)
            {
                annual = string.Empty;
                monthly = string.Empty;
                rdoAnnual.Checked = false;
                rdoMonthly.Checked = false;
                chkListMonthly.Visible = false;
                chkListSeasonal.Visible = true;
                foreach (ListItem liMonthly in chkListMonthly.Items)
                {
                    liMonthly.Selected = false;

                }
            }

        }
        protected void rdoMonthly_CheckedChanged(object sender, EventArgs e)
        {
            if (rdoMonthly.Checked == true)
            {
                annual = string.Empty;
                seasonal =string.Empty;
                rdoAnnual.Checked = false;
                rdoSeasonal.Checked = false;
                chkListMonthly.Visible = true;
                chkListSeasonal.Visible = false;
                foreach (ListItem liSeasonal in chkListSeasonal.Items)
                {
                    liSeasonal.Selected = false;
                }
            }

        }
        protected void btnNext_Click(object sender, EventArgs e)
        {
            string finalSchoolList = string.Empty;

            if (ViewState["FinalSchool"] != null)
            {
                finalSchoolList = ViewState["FinalSchool"].ToString();
            }
            else
            {
                finalSchoolList = "";
            }

            if (rdoAnnual.Checked == false && rdoSeasonal.Checked == false && rdoMonthly.Checked == false)
            {
                Response.Write("<script>alert('Please Fill Campaning Details.');</script>");
                return;
            }
            else
            {
                if (TextBox1.Text != "" && rdoAnnual.Checked == true)
                {
                    //Response.Write("<script>alert('Campaning Details Fill.');</script>");
                    TextBox1.Text = TextBox1.Text + "B_R_S" + finalSchoolList;
                    Response.Redirect(EditUrl("CampainDetails", TextBox1.Text,"QuoteDetails"), true);
                }
                if(rdoSeasonal.Checked == true)
                {
                    if (TextBox1.Text != "")
                    {
                        TextBox1.Text = TextBox1.Text + "B_R_S" + finalSchoolList;
                        Response.Redirect(EditUrl("CampainDetails", TextBox1.Text, "QuoteDetails"), true);
                    }
                    else
                    {
                        Response.Write("<script>alert('Please Choose Seasonal Type.');</script>");
                        return;
                    }
                
                }
                if (rdoMonthly.Checked == true)
                {
                    if (TextBox1.Text != "")
                    {
                        TextBox1.Text = TextBox1.Text + "B_R_S" + finalSchoolList;
                        Response.Redirect(EditUrl("CampainDetails", TextBox1.Text, "QuoteDetails"), true);
                    }
                    else
                    {
                        Response.Write("<script>alert('Please Choose Months.');</script>");
                        return;
                    }

                }

                
            }
               
        }
        protected void chkListSeasonal_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (ListItem liSeasonal in chkListSeasonal.Items)
            {
                if (liSeasonal.Selected == true)
                {
                    seasonal += liSeasonal.Text.ToString()+"-"; 
                }
            }
            TextBox1.Text = seasonal;
            
            
        }
        protected void chkListMonthly_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (ListItem liMonthly in chkListMonthly.Items)
            {
                if (liMonthly.Selected == true)
                {
                    Response.Write("monthly");
                    monthly += liMonthly.Text.ToString() + "-"; 
                }

            }
            TextBox1.Text = monthly;
            
        }
}
}
