<%@ Control language="C#" Inherits="Philip.Modules.SSM_Quote_Building.ViewSSM_Quote_Building" CodeFile="ViewSSM_Quote_Building.ascx.cs" AutoEventWireup="true"%>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
</style>
<div id="container">
<!--subcontainer start here-->
<div class="subcontainer">
<!--ouraudience_content start here-->
<div class="ouraudience_content">
<div id="ContentFirstPage">
  <table border="0" cellspacing="0" cellpadding="0">
    <tbody>
        <tr>
            <td>
            <h3> Build A Quotation</h3>
            </td>
        </tr>
        <tr>
            <td><img alt="" style="width: 20px; height: 30px;" src="/ssm_dnn/portals/1/space.gif" /></td>
        </tr>
        <tr>
            <td>
            <table border="0" cellspacing="2" cellpadding="0">
                <tbody>
                    <tr>
                        <td style="" valign="top">
                            <br />
                            <table  style="height: 179px;" cellspacing="0" 
                                class="style1">
                                <tr>
                                    <td valign="top">
                            <asp:RadioButton ID="rdohelp" runat="server" Checked="True" 
                                GroupName="choice" />
                                    </td>
                                    <td valign="top" align="left" valign="top" style="width: 800px;">
                                    <span class="redfont" style="color: #be1b2b;"><strong>Help me choose schools</strong></span><br />
                        <span class="discrip_text">you tell us where your business is located and we&#39;ll help you pick schools based on the distances to our schools.</span><br/><br/>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td valign="top" >
                                    
                            <asp:RadioButton ID="rdopick" runat="server" GroupName="choice" />
                                    </td>
                                    <td valign="top" align="left" valign="top" style="width: 800px;">
                                        <span class="redfont" style="color: #be1b2b;"><strong>I&#39;ll pick the schools</strong></span><br />
                        <span class="discrip_text">you just tell us the school&#39;s you&#39;d like to include in your quote.</span><br/><br/>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td valign="top">
                            <asp:RadioButton ID="rdoComplete" runat="server" GroupName="choice" />
                                    </td>
                                    <td valign="top" align="left" valign="top" style="width: 800px;">
                                      <span class="redfont" style="color: #be1b2b;"><strong>Complete Network</strong></span><br />
                        <span class="discrip_text">you&#39;d like to get a quote on all of our locations.</span>
                        </td>
                                </tr>
                            </table>
                        </td>
                        <td >
                        <br/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" valign="top"><img alt="" style="width: 20px; height:15px;" src="/ssm_dnn/portals/1/space.gif" /></td>
                    </tr>
                    <tr>
                      <td colspan="2" align="right" valign="top"><asp:Button ID="btnBegin" runat="server" Font-Bold="True" Font-Size="Medium" 
                onclick="btnBegin_Click" Text="Begin&gt;" /></td>
                    </tr>
                </tbody>
            </table>
            </td>
        </tr>
    </tbody>
</table>
</div>
<div class="clr">&nbsp;</div>
</div>
<!--ouraudience_content start here-->
</div>
<!--subcontainer start here-->
</div>

