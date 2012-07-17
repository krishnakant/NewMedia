<%@ Control Language="C#" Inherits="Philip.Modules.SuperFishMenu.ViewSuperFishMenu"
    CodeFile="ViewSuperFishMenu.ascx.cs" AutoEventWireup="true" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<%--link to the CSS files for this menu type --%>
<link rel="stylesheet" media="screen" href="/ssm_dnn/DesktopModules/SuperFishMenu/stylesheet/superfish.css" />
<%--// link to the JavaScript files (hoverIntent is optional) --%>

<script src="/ssm_dnn/DesktopModules/SuperFishMenu/js/hoverIntent.js"></script>

<script src="/ssm_dnn/DesktopModules/SuperFishMenu/js/superfish.js"></script>

<%--// initialise Superfish --%>

<script type="text/javascript">
    $(document).ready(function() {
        $("ul.sf-menu").superfish();
    });

    $(document).ready(function() {
       addMenu();
    });

    //to add menu to div
        function addMenu() {
            if (document.getElementById("<%=hdnMenuHtml.ClientID%>") != null)
               // alert("in1");
            if (document.getElementById("menuContainer") != null) {
                //alert(document.getElementById("<%=hdnMenuHtml.ClientID%>").value);
                    document.getElementById("menuContainer").innerHTML = document.getElementById("<%=hdnMenuHtml.ClientID%>").value;
            }
        }

</script>
  <input id="Button1" type="button" value="ShowMenu"  onclick="javascript:addMenu();" />
        
<div id="menuContainer" style="width:1000px;padding:0px;">
   
</div>
<input id="hdnMenuHtml" type="hidden" runat="server" />
