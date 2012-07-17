﻿<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ImportCSV.ascx.vb" Inherits="DotNetNuke.Modules.UserDefinedTable.ImportCSV" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<br/>
<table width="560" cellspacing="0" cellpadding="0" border="0" summary="Edit Links Design Table">
    <tr>
        <td class="SubHead" valign="top" width="150"><dnn:label id="plFolder" runat="server" controlname="cboFolders" suffix=":"></dnn:label></td>
        <td><asp:DropDownList ID="cboFolders" Runat="server" CssClass="NormalTextBox" Width="300" AutoPostBack="true" /></td>
    </tr>
    <tr>
        <td class="SubHead" valign="top" width="150"><dnn:label id="plFile" runat="server" controlname="cboFiles" suffix=":"></dnn:label></td>
        <td><asp:DropDownList ID="cboFiles" Runat="server" CssClass="NormalTextBox" Width="300"></asp:DropDownList></td>
    </tr>
     <tr>
        <td class="SubHead" valign="top" width="150"><dnn:label id="plDelimiter" runat="server" controlname="cboFiles" suffix=":"></dnn:label></td>
        <td>
            <asp:RadioButtonList ID="rblDelimiter" runat="server"  RepeatDirection="Horizontal" RepeatLayout="Flow">
                <asp:ListItem Selected="True" Value="," resourcekey="comma"></asp:ListItem>
                <asp:ListItem Value=";" resourcekey="semicolon"></asp:ListItem>
            </asp:RadioButtonList>
         </td>
    </tr>
</table>
<p>
    <asp:linkbutton id="cmdImport" resourcekey="cmdImport" runat="server" cssclass="CommandButton" text="Import" borderstyle="none"></asp:linkbutton>&nbsp;
    <asp:linkbutton id="cmdCancel" resourcekey="cmdCancel" runat="server" cssclass="CommandButton" text="Cancel" borderstyle="none" causesvalidation="False"></asp:linkbutton>
</p>