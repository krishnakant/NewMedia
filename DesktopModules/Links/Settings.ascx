<%@ Control Language="vb" AutoEventWireup="false" CodeFile="Settings.ascx.vb" Inherits="DotNetNuke.Modules.Links.Settings" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="Portal" TagName="URL" Src="~/controls/URLControl.ascx" %>
<table cellspacing="0" cellpadding="2" border="0" summary="Edit Links Design Table" >
    <tr>
        <td class="SubHead" width="150">
            <dnn:Label ID="plLinkModuleType" runat="server" ControlName="optModuleType" Suffix=":">
            </dnn:Label>
        </td>
        <td valign="bottom">
            <asp:DropDownList ID="optLinkModuleType" runat="server" CssClass="Normal" Width="100"
                AutoPostBack="true">
                <asp:ListItem resourcekey="Link" Value="1">Link</asp:ListItem>
                <asp:ListItem resourcekey="Menu" Value="2">Menu</asp:ListItem>
                <asp:ListItem resourcekey="Folder" Value="3">Folder</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="optTypeContentSelection" runat="server" CssClass="Normal" Width="200"
                Visible="false" AutoPostBack="true">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="SubHead" width="150">
            <dnn:Label ID="plControl" runat="server" ControlName="optControl" Suffix=":"></dnn:Label>
        </td>
        <td valign="bottom">
            <asp:RadioButtonList ID="optControl" runat="server" CssClass="NormalTextBox" AutoPostBack="true" RepeatDirection="Horizontal">
                <asp:ListItem resourcekey="List" Value="L">List</asp:ListItem>
                <asp:ListItem resourcekey="Dropdown" Value="D">Dropdown</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr runat="server" id="trOptView" >
        <td class="SubHead" width="150">
            <dnn:Label ID="ploptView" runat="server" ControlName="optView" Suffix=":"></dnn:Label>
        </td>
        <td valign="bottom">
            <asp:RadioButtonList ID="optView" runat="server" CssClass="NormalTextBox" RepeatDirection="Horizontal">
                <asp:ListItem resourcekey="Vertical" Value="V">Vertical</asp:ListItem>
                <asp:ListItem resourcekey="Horizontal" Value="H">Horizontal</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="SubHead" width="150">
            <dnn:Label ID="plInfo" runat="server" ControlName="optInfo" Suffix=":"></dnn:Label>
        </td>
        <td valign="bottom">
            <asp:RadioButtonList ID="optInfo" runat="server" CssClass="NormalTextBox" RepeatDirection="Horizontal">
                <asp:ListItem resourcekey="No" Value="N">No</asp:ListItem>
                <asp:ListItem resourcekey="Yes" Value="Y">Yes</asp:ListItem>
                <asp:ListItem resourcekey="plUsePopup" Value="JQ">Telerik Popup</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr  runat="server" id="pnlWrap">
        <td class="SubHead" width="150">
            <dnn:Label ID="plNoWrap" runat="server" ControlName="optNoWrap" Suffix=":"></dnn:Label>
        </td>
        <td valign="bottom">
            <asp:RadioButtonList ID="optNoWrap" runat="server" CssClass="NormalTextBox" RepeatDirection="Horizontal">
                <asp:ListItem resourcekey="NoWrap" Value="NW">No Wrap</asp:ListItem>
                <asp:ListItem resourcekey="Wrap" Value="W">Wrap</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="SubHead" width="150">
            <dnn:Label ID="plUsePermissions" runat="server" ControlName="optUsePermissions" Suffix=":">
            </dnn:Label>
        </td>
        <td valign="bottom">
            <asp:RadioButtonList ID="optUsePermissions" runat="server" CssClass="NormalTextBox"
                RepeatDirection="Horizontal">
                <asp:ListItem resourcekey="notUsePermissions" Value="False">No</asp:ListItem>
                <asp:ListItem resourcekey="usePermissions" Value="True">Yes</asp:ListItem>                
            </asp:RadioButtonList>
        </td>
    </tr>

    <tr id="pnlIcon" runat="server">
        <td class="SubHead" width="150">
            <dnn:Label ID="plIcon" runat="server" ControlName="ctlIcon" Suffix=":"></dnn:Label>
        </td>
        <td width="365">
            <Portal:URL ID="ctlIcon" runat="server" Width="250" ShowUrls="False" ShowTabs="False"
                ShowLog="False" ShowTrack="False" Required="False" />
        </td>
    </tr>
</table>
