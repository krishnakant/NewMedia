<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Control Language="vb" AutoEventWireup="false" Codebehind="ViewComments.ascx.vb" Inherits="DotNetNuke.Modules.Feedback.ViewComments" TargetSchema="http://schemas.microsoft.com/intellisense/ie3-2nav3-0" %>
<div id="FeedbackContainer">
<asp:Panel ID="pnlModuleContent" Runat="server">
	<table class="Feedback_Comments">
	    <tr>
	        <td colspan="2" class="Normal">
	            <asp:Literal id="litMessage" runat="server" Visible="false"></asp:Literal>
	        </td> 
	    </tr>
	    <tr>
			<td colspan="2" style="padding-bottom: 6px">
				<asp:repeater id="rptComments" runat="server" EnableViewState = "False"></asp:repeater>
			</td>
		</tr>
		<tr id="trPager" runat="server">
			<td style="white-space:nowrap;" >
				<asp:Label id="lblPageSize" Runat="server" resourcekey="lblPageSize" CssClass="SubHead">Comments Per Page:</asp:Label>
				<asp:DropDownList id="ddlPageSize" Runat="server" AutoPostBack="True"></asp:DropDownList></td>
			<td style="white-space:nowrap;" >
				<dnn:PagingControl id="ctlPagingControl" runat="server" Mode="PostBack"></dnn:PagingControl></td>
		</tr>
	</table>
</asp:Panel>
</div>
