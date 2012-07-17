<%@ Control Language="C#" Inherits="Philip.Modules.SSM_ReportAndMetrics.ViewSSM_ReportAndMetrics"
    CodeFile="ViewSSM_ReportAndMetrics.ascx.cs" AutoEventWireup="true" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        width: 45%;
        height: 541px;
    }
    .style3
    {
        width: 5%;
        height: 541px;
    }
    .style4
    {
        color: #800000;
    }
    .viewerstyle
    {
        margin-left:30px;
        margin-top:50px;
        vertical-align:top;
        padding-right:20px;
        padding-bottom:20px;
       
    }
    .viwerheadeing
    {
        font-size:10pt;
        font-weight:bold;
        padding-bottom:15px;
        color: #800000;
    }
    .viewp
    {
        line-height:15px;
        vertical-align:top;
       
    }
</style>
<div id="container">
    <!--subcontainer start here-->
    <div class="subcontainer">
        <!--ouraudience_content start here-->
        <div class="map_content">
            <table class="style1">
                <tr>
                    <td colspan="4" align="left">
                        <hr style="border-width: 1px; border-color: #333333; background-color: #333333;"
                            size="1" />
                        <h5 style="color: #800000;">
                            Reports</h5>
                        <hr style="border-width: 1px; border-color: #333333; background-color: #333333;"
                            size="1" />
                    </td>
                </tr>
                <tr>
                    <td class="style2" rowspan="2">
                        <div>
                            <div>
                                <img id="imgPerformance" src="/ssm_dnn/DesktopModules/SSM_ReportAndMetrics/Images/NetworkMap.jpg"
                                    usemap="#PerformanceMap" alt="" />
                                <map id="PerformanceMapImg" name="PerformanceMap">
                                    <area id="Area1" shape="rect" coords="50, 166, 147, 180" alt="" 
                                        
                                        onmouseover="this.style.cursor='pointer';PerformanceHotSpotReport(this.id);" />
                                    <area id="Area2" shape="rect" coords="56, 182, 142, 194" alt="" 
                                        
                                        onmouseover="this.style.cursor='pointer';PerformanceHotSpotReport(this.id);" />
                                    <area id="Area3" shape="rect" coords="66, 296, 144, 308" alt="" 
                                        
                                        onmouseover="this.style.cursor='pointer';PerformanceHotSpotReport(this.id);" />
                                    <area id="Area4" shape="rect" coords="46, 313, 145, 324" alt="" 
                                        
                                        onmouseover="this.style.cursor='pointer';PerformanceHotSpotReport(this.id);" />
                                    <area id="Area5" shape="rect" coords="42, 381, 145, 419" alt="" 
                                        
                                        onmouseover="this.style.cursor='pointer';PerformanceHotSpotReport(this.id);" />
                                    <area id="Area6" shape="rect" coords="37, 424, 145, 463" alt="" 
                                        
                                        onmouseover="this.style.cursor='pointer';PerformanceHotSpotReport(this.id);" />
                                    <area id="Area7" shape="rect" coords="39, 465, 147, 505" alt="" 
                                        
                                        onmouseover="this.style.cursor='pointer';PerformanceHotSpotReport(this.id);" />
                                </map>
                            </div>
                        </div>
                    </td>
                    <td class="style3" style="border-right: 1px solid #333333;" rowspan="2">
                    </td>
                    <td valign="top" style="height: 10%" class="style4">
                        
                    </td>
                    <td rowspan="2">
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="style2">
                    <br/>
                        <br/>
                        <br/>
                    
                    <br/>
                    <br/>
                        <div id="performanceImgContaiont" style="height: auto; width: 95%; padding-left: 15px;padding-top: 50px;">
                          <p  class="viwerheadeing">Place your cursor over the hot-spots on the report to learn more.</p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                   
                        <div id="FanAppDiv" style="height: auto; width: 95%; padding-left: 15px; padding-top: 15px;">
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
    function PerformanceHotSpotReport(id) {
        if (document.getElementById("performanceImgContaiont") != null) {

            var divObj = (document.getElementById("performanceImgContaiont"));
            divObj.innerHTML = ""; 
            if (id == "Area1") {
                divObj.innerHTML = "";
                divObj.innerHTML = "<span class='viewerstyle'><p class='viwerheadeing'>This is the date that the report was created</p><br/><p class='viwerheadeing' style='color:black;'>Why We Include It</p><p class='viewp'>We don't always get event attendance information right away.  Typically it takes no longer than two weeks to get attendance figures.  We update your exposure information as soon as we receive the attendance data, so if we ran your report today and received a new report tomorrow the contents of this report may change.</p></span>";
            }
            else if (id == "Area2") {
                divObj.innerHTML = "";
                divObj.innerHTML = "<span class='viewerstyle'><p class='viwerheadeing'>The info in the 'Your Exposure' section comes from this date range</p><br/><p class='viwerheadeing' style='color:black;'>Why We Include It</p><p class='viewp'>If you're viewing this report for a subset of your contracted dates you may see a bigger or smaller number of impressions provided than you expected.  The quantities of impressions we provide aren't always spread evenly throughout the campaign.  The number of events and their attendance vary from school to school and month to month, so too does your exposure.</p></span>";
            }
            else if (id == "Area3") {
                divObj.innerHTML = "";
                divObj.innerHTML = "<span class='viewerstyle'><p class='viwerheadeing'>This is the number of impressions you purchased</p><br/><p class='viwerheadeing' style='color:black;'>Why We Include It</p><p class='viewp'>To save you time - you don't need to dig out your quote to compare what you've received to what you ordered.</p></span>";
            }
            else if (id == "Area4") {
                divObj.innerHTML = "";
                divObj.innerHTML = "<span class='viewerstyle'><p class='viwerheadeing' >This is an estimated number of events where we expected to run your messages when we quoted you</p><br/><p class='viwerheadeing' style='color:black;'>Why We Include It</p><p class='viewp'>To save you time - you don't need to dig out your quote to compare what you've received to what you ordered.</p></span>";
            }
            else if (id == "Area5") {
                divObj.innerHTML = "";
                divObj.innerHTML = "<span class='viewerstyle'><p class='viwerheadeing'>This is the number of impressions we provided during the dates in the reporting period</p><br/><p class='viwerheadeing' style='color:black;'>Why We Include It</p><p class='viewp'>This is what you bought!  If the concept of an impression is a little awkward for you,think of it this way: this is the number of times we've told your story to an audience of one person.</p></span>";
            }
            else if (id == "Area6") {
                divObj.innerHTML = "";
                divObj.innerHTML = "<span class='viewerstyle'><p class='viwerheadeing'>This is the amount of time your messages were on the sign during the reporting period</p><br/><p class='viwerheadeing' style='color:black;'>Why We Include It</p><p class='viewp'>It's interesting to know!  This number is often bigger than our clients expect.  We're providing some great exposure to a hard-to-reach audience.</p></span>";
            }
            else{
                divObj.innerHTML = "";
                divObj.innerHTML = "<span class='viewerstyle'><p class='viwerheadeing'>This is the actual number of events where your messages were shown</p><br/><p class='viwerheadeing' style='color:black;'>Why We Include It</p><p class='viewp'>This can vary from the estimated number of events for two reasons: First, the number of events at a school can change (games get cancelled; teams make it to playoffs or progress further in tournament brackets).  Second, the attendance at each event may vary from our forecast.  When it does, we may cover more or fewer events to provide the impressions we guaranteed to you.</p></span>";
            }
        }
    }

    
 
</script>

