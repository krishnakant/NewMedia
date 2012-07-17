<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Settings.ascx.vb" Inherits="DotNetNuke.Modules.Events.Settings" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<asp:Label ID="lblSettingsMoved" resourcekey="lblSettingsMoved" runat="server">Settings can now be edited via the Edit Event option in the action menu</asp:Label>
<table id="tblMain" cellspacing="0" cellpadding="3" width="100%" border="0">
    <tr id="trUpgrade" visible="false" runat="server">
        <td>
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr>
                    <td class="SubHead" valign="top" style="width: 300px; background-color: Red; color: White; text-decoration: blink;">
                        <dnn:Label ID="plUpgrade" Text="Upgrade:" runat="server" ControlName="cmdUpgrade"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top" style="white-space:nowrap">
                        <asp:LinkButton ID="cmdUpgrade" CssClass="CommandButton" runat="server" EnableViewState="False" Text="Re-start Upgrade"></asp:LinkButton>
                    </td>
                    <td id="tdRetry" visible="false" class="SubHead" valign="top" style="background-color: Blue; color: White; text-decoration: blink;" runat="server">
                        <dnn:Label ID="plRetry" Text="Retry" runat="server" ControlName="cmdUpgrade"></dnn:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
