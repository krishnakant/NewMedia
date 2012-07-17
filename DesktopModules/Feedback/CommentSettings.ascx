<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Control language="vb" CodeBehind="CommentSettings.ascx.vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.Modules.Feedback.CommentSettings" %>
<table cellspacing="0" cellpadding="2" summary="Feedback Settings Design Table" border="0">
     <tr>
		<td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plScope" runat="server" controlname="rblScope" suffix=":"></dnn:label></td>
		<td class="Feedback_Settings_Field">
			<asp:RadioButtonList ID="rblScope" runat="server" CssClass="Normal" RepeatLayout="Flow" RepeatDirection="Horizontal" AutoPostBack = "true">
			   <asp:ListItem Text="Selected Modules Only" resourcekey="SelectedModules" Value="1"></asp:ListItem>
			   <asp:ListItem Text="Portal (all Feedback modules of portal)" resourcekey="Portal" Value="2"></asp:ListItem>
			</asp:RadioButtonList>
		</td>
	</tr>
    <tr id="trFeedbackModules" runat="server">
        <td class="SubHead Feedback_Settings_FieldLabel" style="vertical-align: top; padding-top: 5px; padding-bottom: 5px"><dnn:label id="plFeedbackModules" runat="server" controlname="gvFeedbackModules" suffix=":" /></td>
        <td colspan="2" class="Feedback_Settings_Field" style="vertical-align: top; padding-top: 5px; padding-bottom: 5px">
            <asp:GridView ID="gvFeedbackModules" runat="server" DataKeyNames="ModuleId"  CellPadding="2" AutoGenerateColumns="false" ShowHeader="True">
                <RowStyle Font-Names="Arial" Font-Size="10px" />
                <HeaderStyle Font-Names="Arial" Font-Size="8px" Font-Bold="True" />
                <Columns>
                    <asp:BoundField HeaderText="TabName" DataField="TabName" ReadOnly="True" />
                    <asp:BoundField HeaderText="ModuleTitle" DataField="ModuleTitle" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Selected" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:CheckBox ID="cbSelected" runat="server" Checked='<%# DataBinder.Eval(Container.DataItem, "Selected") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>             
                </Columns>            
            </asp:GridView>
        </td>
    </tr>
	<tr valign="top">
		<td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plCategories" runat="server" controlname="cblCategories" suffix=":" /></td>
		<td class="Feedback_Settings_Field" colspan="2">
			<asp:CheckBoxList id="cblCategories" runat="server" cssclass="normal" RepeatColumns="2" RepeatDirection="Horizontal" />
		</td>
	</tr>
	<tr valign="top">
        <td class="SubHead Feedback_Settings_FieldLabel">
            <dnn:Label ID="plHeaderTemplate" runat="server" ControlName="txtHeaderTemplate" Suffix=":"></dnn:Label>
        </td>
        <td class="Feedback_Settings_Field">
            <asp:TextBox ID="txtHeaderTemplate" CssClass="NormalTextBox" Width="350" Columns="30" TextMode="MultiLine"
                Rows="10" MaxLength="2000" runat="server" />
        </td>
        <td style="white-space: nowrap; vertical-align: bottom; width: 84px;">
            <asp:LinkButton ID="cmdLoadDefaultHeaderTemplate" runat="server" CausesValidation="False" CssClass="commandButton" resourcekey="LoadDefault" >Load Default</asp:LinkButton></td>
    </tr>
    <tr valign="top">
        <td class="SubHead Feedback_Settings_FieldLabel">
            <dnn:Label ID="plItemTemplate" runat="server" ControlName="txtItemTemplate" Suffix=":"></dnn:Label>
        </td>
        <td class="Feedback_Settings_Field">
            <asp:TextBox ID="txtItemTemplate" CssClass="NormalTextBox" Width="350" Columns="30" TextMode="MultiLine"
                Rows="10" MaxLength="2000" runat="server" />
        </td>
        <td style="white-space: nowrap; vertical-align: bottom; width: 84px;">
            <asp:LinkButton ID="cmdLoadDefaultItemTemplate" runat="server" CausesValidation="False" CssClass="commandButton" resourcekey="LoadDefault">Load Default</asp:LinkButton></td>
    </tr>
    <tr valign="top">
        <td class="SubHead Feedback_Settings_FieldLabel">
            <dnn:Label ID="plAltItemTemplate" runat="server" ControlName="txtAltItemTemplate" Suffix=":"></dnn:Label>
        </td>
        <td class="Feedback_Settings_Field">
            <asp:TextBox ID="txtAltItemTemplate" CssClass="NormalTextBox" Width="350" Columns="30" TextMode="MultiLine"
                Rows="10" MaxLength="2000" runat="server" />
        </td>
        <td style="white-space: nowrap; vertical-align: bottom; width: 84px;">
            <asp:LinkButton ID="cmdLoadDefAltItemTemplate" runat="server" CausesValidation="False" CssClass="commandButton" resourcekey="LoadDefault">Load Default</asp:LinkButton></td>
    </tr>
    <tr valign="top">
        <td class="SubHead Feedback_Settings_FieldLabel">
            <dnn:Label ID="plSeparatorTemplate" runat="server" ControlName="txtSeparatorTemplate" Suffix=":"></dnn:Label>
        </td>
        <td class="Feedback_Settings_Field">
            <asp:TextBox ID="txtSeparatorTemplate" CssClass="NormalTextBox" Width="350" Columns="30" TextMode="MultiLine"
                Rows="10" MaxLength="2000" runat="server" />
        </td>
        <td style="white-space: nowrap; vertical-align: bottom; width: 84px;">
            <asp:LinkButton ID="cmdLoadDefaultSeparatorTemplate" runat="server" CausesValidation="False" CssClass="commandButton" resourcekey="LoadDefault">Load Default</asp:LinkButton></td>
    </tr>
    <tr valign="top">
        <td class="SubHead Feedback_Settings_FieldLabel">
            <dnn:Label ID="plFooterTemplate" runat="server" ControlName="txtFooterTemplate" Suffix=":"></dnn:Label>
        </td>
        <td class="Feedback_Settings_Field">
            <asp:TextBox ID="txtFooterTemplate" CssClass="NormalTextBox" Width="350" Columns="30" TextMode="MultiLine"
                Rows="10" MaxLength="2000" runat="server" />
        </td>
        <td style="white-space: nowrap; vertical-align: bottom; width: 84px;">
            <asp:LinkButton ID="cmdLoadDefaultFooterTemplate" runat="server" CausesValidation="False" CssClass="commandButton" resourcekey="LoadDefault">Load Default</asp:LinkButton></td>
    </tr>
    <tr valign="top">
        <td class="SubHead Feedback_Settings_FieldLabel">
           <dnn:Label ID="plAvailableTokens" runat="server" ControlName="lblAvailableTokens" Suffix=":" />
        </td>
        <td class="Feedback_Settings_Field" colspan="2" style="white-space: normal"><asp:Label id="lblAvailableTokens" runat="server" ResourceKey="lblAvailableTokens"></asp:Label></td>
    </tr>
	<tr>
		<td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plEnablePager" runat="server" controlname="chkEnablePager" suffix=":" /></td>
		<td class="Feedback_Settings_Field" colspan="2">
			<asp:CheckBox id="chkEnablePager" runat="server" AutoPostBack="True" />
		</td>
	</tr>
	<tr valign="top">
	    <td class="SubHead Feedback_Settings_FieldLabel">
	        <dnn:Label ID="plDefaultPageSize" runat="server" ControlName="txtDefaultPageSize" Suffix=":" />
	    </td>
	    <td class="Feedback_Settings_Field" colspan="2">
	        <asp:TextBox ID="txtDefaultPageSize" runat="server" Width="50px" CssClass="NormalTextBox"></asp:TextBox>
	        <asp:RangeValidator ID="valDefaultPageSize" runat="server" ControlToValidate="txtDefaultPageSize" Display="Dynamic" CssClass="ErrorRed"
	              ErrorMessage="Must be number 5 to 25" MinimumValue="5" MaximumValue="25" Type="Integer" ValidationGroup="CommentSettings"></asp:RangeValidator>
	    </td>
	</tr>
</table>
