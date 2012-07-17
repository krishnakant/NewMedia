<%@ Control Language="C#" Inherits="Philip.Modules.SSM_Gallary.ViewSSM_Gallary" CodeFile="ViewSSM_Gallary.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>

<script src="/media/DesktopModules/SSM_Gallary/js/silverlight.js" type="text/javascript"></script>

<script src="/media/DesktopModules/SSM_Gallary/js/wmvplayer.js" type="text/javascript"></script>

<script src="/media/DesktopModules/SSM_Gallary/js/jwplayer.js" type="text/javascript"></script>

<style type="text/css">
.itemStyle{ border-bottom: #e5e5e5 1px solid;width: 200px;padding: 3px 0 3px 8px;font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;font-size:14px; font-weight:bold; cursor: pointer;
    }
    .headerStyle
    {
        background-color: white;
        color: Maroon;
        height: 20px;
        padding-left: 3px;
        font-size: 16px;
    }
    .setCursorStyle
    {
        cursor: pointer;
    }
    .style1
    {
        height: 22px;
    }
    .outer
    {
        position: relative;
        height: 200px;
        width: 200px;
        border: solid blue 1px;
    }
    .top, .middle, .bottom
    {
        height: 200px;
        width: 200px;
        border: solid red 1px;
        top: 0;
        left: 0;
        position: absolute;
    }
    .bottom
    {
        border: solid orange 1px;
    }
    .middle
    {
        border: solid green 1px;
    }
    .inside-middle
    {
        text-align: right;
        display: block;
    }
    .setContaintBG
    {
        background-color:#c00000; 
        color:#FFFFFF; 
    }
    .setContaintBGC
    {
        background-color:#FFFFFF; 
        color:Black; 
    }
</style>
<div id="container">
    <!--subcontainer start here-->
    <div class="subcontainer">
        <!--ouraudience_content start here-->
        <div class="map_content1">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table cellpadding="0" cellspacing="1" bgcolor="#f4f4f4" style="border: #CFCFCF 1px solid;
                        width: 100%;">
                        <tr><td colspan="3"> <h3 style="padding-bottom: 15px;text-align:center;background-color:White;padding-top:25px;">Gallery</h3></td></tr>
                        <tr style="border-width: 5px; border-color: #333333; height: 10px">
                            <td class="gallerleft" rowspan="4" style="width: 22%; padding: 2px; padding-top: 1px;
                                padding-left: 1px;background-color:White;"  valign="top">
                                <asp:DataList ID="dlIndustary" runat="server" CellPadding="1" OnItemDataBound="lstContent_ItemDataBound"
                                    DataKeyField="IndustaryName" OnItemCommand="lstContent_ItemCommand" OnSelectedIndexChanged="lstContent_SelectedIndexChanged">
                                    <ItemStyle BackColor="#ffffff" CssClass="itemStyle" />
                                    <SelectedItemStyle BackColor="White" />
                                    <HeaderTemplate>
                                        <b>Industry</b></HeaderTemplate>
                                    <ItemTemplate>
                                        <table id="td_<%#Eval("IndustaryName")%>" onclick="javascript:showGallery(this.id);changeColor(this)" onmouseout="this.bgcolor='#FFFFF'" >
                                            <tr>
                                                <td>
                                                    <%-- <%#Eval("industry")%>--%>
                                                    <%# DataBinder.Eval(Container.DataItem, "IndustaryName")%>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                  <HeaderStyle CssClass="headerStyle" Height="40px" />
                                </asp:DataList>
                            </td>
                            <td bgcolor='#ffffff' align="right" style="width: 50%;height:50px; text-align: left;" valign="middle">
                                <p class="logoinfo">
                                    <asp:Label ID="lblClientName" runat="server"></asp:Label>
                                </p>
                            </td>
                            <td bgcolor='#ffffff' align="right" style="width: 20%;height:50px;">
                                <p class="logoinfo">
                                    <asp:Label ID="lblCaseStudy" runat="server"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr bgcolor='#ffffff' >
                            <td valign="middle" align="center" colspan="2" class="style1">
                                <div id="vidlayerBottom" style="display: block;">
                                    <img alt="" src="/media/DesktopModules/SSM_Gallary/Image/Web Gallery-V2.jpg" />
                                </div>
                                <div id="vid-stream-container" style="display: block; position:absolute; 
                                    width: 512px;z-index:20;height:50px; top: 322px; left: 308px;">
                                </div>
                                <div id="vidlayerTop" style="position: relative; top: -100px; left: -11px; z-index:10; width:516px;">
                                    <img src="/media/DesktopModules/SSM_Gallary/Image/grid-V2.png" alt="">
                                </div>
                            </td>
                        </tr>
                        <tr bgcolor='#ffffff' style="display:none;" >
                            <td valign="middle" align="left" colspan="2">
                                <p class="logoinfosdas">
                                    <asp:Label ID="lblIndustryName" runat="server"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff">
                            <td align="left" colspan="2" style="padding: 10px; border-top: 1px solid #ccc;" valign="top">
                                <div id="galleryImages" class="setCursorStyle">
                                    <asp:DataList ID="dlGalleryImages" runat="server" align="center" CellPadding="0"
                                        CellSpacing="0" ItemStyle-VerticalAlign="Top" RepeatColumns="5" RepeatDirection="Horizontal"
                                        RepeatLayout="Table">
                                        <ItemTemplate>
                                            <table align="left" class="thumbview" id='td_<%#Eval("ClientName")%>' bgcolor="#ffffff"
                                                border="0" cellpadding="0" cellspacing="3" onclick='GenerateVideoPalyer(&#039;<%#Eval("VideoUrl")%>&#039;,&#039;<%#Eval("ClientName")%>&#039;,&#039;<%#Eval("CaseStudy")%>&#039;)'
                                                onmouseout="ImageMouseOut(this.id)" onmouseover="ImageMouseOver(this.id)" width="100%">
                                                <tr>
                                                    <td valign="top">
                                                        <img align="left" alt="" height="100px" src='<%# Eval("PicUrl")%>' width="100px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </td>
                        </tr>
                        <tr style="display: none;" bgcolor='#ffffff'>
                            <td class="style2" colspan="3">
                                &nbsp; &nbsp;
                                <asp:Button ID="btnResult" runat="server" Style="display: none;" OnClick="btnResult_Click"
                                    Text="Show" />
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <br />
            <br />
        </div>
    </div>
</div>
<input id="hdnIndustaryName" type="hidden" value="" runat="server" />
<input id="hdnPlayOnLoad" type="hidden" value="" runat="server" />
<script type="text/javascript">

    function load() {
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(CallFunctionBegin);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(CallFunctionEnd);
    }

    function CallFunctionEnd() {
        var ctrlID;
        var rowID;
        ctrlID = document.getElementById("<%=hdnIndustaryName.ClientID%>").value;
        changeColor($("[id='td_" + ctrlID + "']"));
    }

    function CallFunctionBegin() {
        var ctrlID;
        var rowID;
        ctrlID = document.getElementById("<%=hdnIndustaryName.ClientID%>").value;
        $($("[id='td_" + ctrlID + "']")).addClass("setContaintBGC"); 
    }
    
    //to change backgroun on mouse over
    function ImageMouseOver(id) {

        var tblID = document.getElementById(id);
        if (tblID != null) {
            tblID.setAttribute("bgcolor", "#333333");
        }
    }

    //to change background on mouser out.
    function ImageMouseOut(id) {
        var tblID = document.getElementById(id);
        if (tblID != null) {
            tblID.setAttribute("bgcolor", "#ffffff");
        }
    }

    /*Build the video player content*/
    function GenerateVideoPalyer(videoUrl, clientName, casestudy) {
        try
         {
            var VideoContent = '';
            VideoContent = "";
            document.getElementById('vid-stream-container').innerHTML = VideoContent;
            if (document.getElementById("<%=lblClientName.ClientID%>") != null) {
                //to add ('s)   on client name for peritcular client
                if (clientName == "Canes Chicken Fingers") {
                    clientName = "Cane&#039;s Chicken Fingers";
                    document.getElementById("<%=lblClientName.ClientID%>").innerHTML = clientName;
                }
        
                //to add ('s)   on client name for peritcular client
                else if (clientName == "Jerrys Foods") {
                    clientName = "Jerry&#039;s Foods";
                    document.getElementById("<%=lblClientName.ClientID%>").innerHTML = clientName;
                }
        
                //to add ('s)   on client name for peritcular client
                else if (clientName == "Flahertys Arden Bowl") {
                    clientName = "Flaherty&#039;s Arden Bowl";
                    document.getElementById("<%=lblClientName.ClientID%>").innerHTML = clientName;
                }
        
                //to add ('s)   on client name for peritcular client
                else {
                    document.getElementById("<%=lblClientName.ClientID%>").innerHTML = clientName;
                }
            }

            //code to set casestudy link
            if (casestudy != "none") {
                document.getElementById("<%=lblCaseStudy.ClientID%>").innerHTML = "<h6><a href=http://" + casestudy + " target='new'>See a case study</a></h6>";
            }
            else {
                document.getElementById("<%=lblCaseStudy.ClientID%>").innerHTML = "";
            }

            //code for play video  
            if (videoUrl.indexOf("wmv") != -1 || videoUrl.indexOf("mp4") != -1) {
                document.getElementById('vid-stream-container').innerHTML = "";
                var cnt = document.getElementById('vid-stream-container');
                var src = '/media/DesktopModules/SSM_Gallary/Player/wmvplayer.xaml';
                var cfg = { height: '50', width: '512', backgroundcolor: '#333333', image: '/media/DesktopModules/SSM_Gallary/Image/Process.png', file: videoUrl, link: '', screencolor: 'fbfbfb', windowless: 'true', overstretch: 'none', shownavigation: 'false', showdigits: 'false', autostart: 'true', linkfromdisplay: 'true', repeat: 'true' };
                var ply = new jeroenwijering.Player(cnt, src, cfg);
            }
        }
        catch (err) {
        }
    }

    //shot test on amination part when user not click on it.    
    function showGallery(rowID) {
        if (document.getElementById("<%=btnResult.ClientID%>") != null) {
            document.getElementById("<%=hdnIndustaryName.ClientID%>").value = rowID.replace("td_", "");
            document.getElementById("<%=btnResult.ClientID%>").click();
            //put maker on all location of recommended school colom
            window.setTimeout('setText()', 1000);
        }
    }

    function setText() {
        //put maker on all location of recommended school colom
        document.getElementById("vid-stream-container").innerHTML = "<center><h1 style='margin-top: 10px;'>Choose a sponsor below.</h1></center>";
    }
    window.onload = window.setTimeout("PlayAnimationOnLoad()", 5000);

    function PlayAnimationOnLoad() {
        var argList = document.getElementById("<%=hdnPlayOnLoad.ClientID%>").value;
        var animationDetails = argList.split('*');
        //alert(animationDetails[1] + animationDetails[0] + animationDetails[2]);
        GenerateVideoPalyer(animationDetails[1], animationDetails[0], animationDetails[2]);
    }

    //for change color of industary row on click  
    function changeColor(ctrlID) {
        $(ctrlID).addClass("setContaintBG");
    }
   load();

</script>

