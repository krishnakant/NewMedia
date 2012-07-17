<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditSSM_Quote_Building2.ascx.cs"
    Inherits="Philip.Modules.SSM_Quote_Building.EditSSM_Quote_Building2" %>
<style type="text/css">
    .tblStyle
    {
        width: 100%;
    }
    
    .stepheading
    {
        font-size: 12pt;
        text-align: Center;
    }
    
    .heading2
    {
        font-size: 9pt;
        text-align: left;
        padding-left:60px;
    
    }
   
    
   
    .style3
    {
        height: 22px;
    }
   
    
   
</style>
<div id="container">
    <!--subcontainer start here-->
    <div class="subcontainer">
        <!--ouraudience_content start here-->
        <div class="map_content">
            <table class="tblStyle">
                <tr>
                    <td colspan="2"  class="stepheading">
                         <b>Step 1:Pick Schools &gt;</b> Step 2: Campaign Details &gt; Step 3: Quote Details</td>
                </tr>
                <tr>
                    <td  class="heading2" >
                        <br/>
                          <br/>
                          
                        <b>Select the schools you&#39;d like to include into your quote </b><br/>
                        <br/>
                          
                    </td>
                    <td >
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="style3" >
                         <div id="SchoolList"  style="padding:30px; padding-top:10px;">
                            <asp:DataList ID="dlSchools" runat="server" RepeatLayout="Table" RepeatColumns="4"
                                RepeatDirection="Vertical" CellPadding="0" CellSpacing="0" align="left" 
                                 ItemStyle-VerticalAlign="Top" Height="300px">
<ItemStyle VerticalAlign="Top" Width="600px"></ItemStyle>
                                <ItemTemplate>
                                   <table  border='0' cellpadding='2' cellspacing='2'  width="auto" id="td_<%#Eval("ID")%>" >
                                        <tr>
                                             <%# Eval("Name")%>
                                            
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                         </div></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: right" >
                         <asp:Button ID="btnNext" runat="server" 
                             OnClientClick="javascript:return getSelectedSchool();" Text="Next" onclick="btnNext_Click" 
                             />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

<input id="hdnDivContent" type="hidden" runat="server" />
<input id="hdnChkCount" type="hidden" runat="server" />
<script type ="text/javascript">
   function getSelectedSchool() {
       var max;
       var schools="";
       if (document.getElementById("<%=hdnChkCount.ClientID%>") != null) {
           if (document.getElementById("<%=hdnChkCount.ClientID%>").value != "") {
               max = document.getElementById("<%=hdnChkCount.ClientID%>").value;
               for (i = 1; i <= max; i++) {
                   if (document.getElementById("chkSchool_" + i) != null) {
                       if (document.getElementById("chkSchool_" + i).checked) {
                           schools = schools + document.getElementById("chkSchool_" + i).value + "*";
                       }
                                     
                   }

               }
               document.getElementById("<%=hdnDivContent.ClientID%>").value = schools;
           }
       }
       if (document.getElementById("<%=hdnDivContent.ClientID%>").value == "") {
           alert("Please select school for quote.")
           return false;
       }
       else {
           return true;
       }
    }
</script>
