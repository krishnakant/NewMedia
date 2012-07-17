<%@ Control language="vb" Inherits="DotNetNuke.Authentication.ActiveDirectory.Login, DotNetNuke.Authentication.ActiveDirectory" AutoEventWireup="false" Explicit="True" Codebehind="Login.ascx.vb" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls"%>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<table cellspacing="0" cellpadding="3" border="0" summary="SignIn Design Table" width="160">
	<tr>
		<td colspan="2" class="SubHead" align="center"><dnn:label id="plUsername" controlname="txtUsername" runat="server" text="UserName:"></dnn:label></td>
	</tr>
	<tr>
		<td colspan="2"  align="center"><asp:textbox id="txtUsername" columns="9" width="130" cssclass="NormalTextBox" runat="server" /></td>
	</tr>
	<tr>
		<td colspan="2" class="SubHead" align="center"><dnn:label id="plPassword" controlname="txtPassword" runat="server" text="Password:"></dnn:label></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><asp:textbox id="txtPassword" columns="9" width="130" textmode="password" cssclass="NormalTextBox" runat="server" /></td>
	</tr>
    <tr id="trCaptcha1" runat="server">
	    <td colspan="2" class="SubHead" align="center"><dnn:label id="plCaptcha" controlname="ctlCaptcha" runat="server" text="Password:"></dnn:label></td>
    </tr>
    <tr id="trCaptcha2" runat="server">
	    <td colspan="2" align="center"><dnn:captchacontrol id="ctlCaptcha" captchawidth="130" captchaheight="40" cssclass="Normal" runat="server" errorstyle-cssclass="NormalRed" /></td>
    </tr>
    <tr>
	    <td id="tdLogin" runat="server" colspan="2" align="center"><asp:button id="cmdLogin" resourcekey="cmdLogin" cssclass="StandardButton" text="Login" runat="server" /></td>
    </tr>
</table>
