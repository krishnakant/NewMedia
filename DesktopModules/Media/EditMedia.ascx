<%@ Control Language="vb" CodeBehind="EditMedia.ascx.vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.Modules.Media.EditMedia" %>
<%@ Register TagPrefix="dnn" TagName="Tracking" Src="~/controls/URLTrackingControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Url" Src="~/controls/URLControl.ascx" %>
<fieldset id="fsFileUpload" class="dnnmedia-fieldset">
    <legend class="dnnmedia-legend"><%= Me.GetLocalizedString("lblFileUpload.Text")%></legend>
    <ol id="olFileUpload" class="dnnmedia-list">
        <li class="dnnmedia-listitem dnnmedia-localfiles">
            <div class="dnnmedia-labelleft">
                <label id="lblMediaType" title="<%=Me.GetLocalizedString("plMediaType.Help")%>" class="SubHead dnnmedia-label"><%= Me.GetLocalizedString("plMediaType.Text")%></label>
            </div>
            <div class="dnnmedia-fieldwrapper dnnmedia-url-control">
                <asp:RadioButtonList ID="radMediaType" runat="server" CssClass="Normal" RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Flow" AutoPostBack="true" /> 
			    <asp:CustomValidator id="cvMediaType" resourcekey="valMediaType.ErrorMessage" runat="server" controltovalidate="radMediaType"
				    display="Dynamic" cssclass="NormalRed" errormessage="<br />Media Is Required" />
            </div>
        </li>
        <li id="liFileSystem" class="dnnmedia-listitem dnnmedia-localfiles" runat="server">
            <div class="dnnmedia-labeltop">
                <label id="plURL" title="<%=Me.GetLocalizedString("plURL.Help")%>" class="SubHead dnnmedia-label"><%=Me.GetLocalizedString("plURL.Text")%></label>
            </div>
            <div class="dnnmedia-fieldwrapper dnnmedia-url-control">
                <dnn:Url id="ctlURL" runat="server" width="300" showtabs="False" showfiles="True" 
                    showUrls="True" urltype="F" showlog="False" shownewwindow="False" showtrack="False" />
            </div>
            <div class="dnnmedia-fieldwrapper">
                <p class="Normal"><%=Me.GetLocalizedString("lblUploadWarning.Text")%></p>
            </div>
            <div class="dnnmedia-fieldwrapper">
                <p class="SubHead"><%= Me.GetLocalizedString("HostFileTypes.Text")%>:<br /> [<a id="lnkViewFileTypes" href="#"><%= Me.GetLocalizedString("lnkViewFileTypes.Text")%></a>]</p>
                <div id="divSupportedFileTypes" class="dnnmedia-hidden">
                    <p class="Normal"><%=Me.GetLocalizedString("lblSupportedFileTypes.Text") %></p>
                    <asp:Repeater ID="rptMediaFileTypes" runat="server">
                        <HeaderTemplate>
                            <table id="tblMediaFileTypes" cellpadding="0" cellspacing="0" summary="<%= Me.GetLocalizedString("lblSupportedFileTypes.Text")%>">
                                <tr class="dnnmedia-filetype-headrow">
                                    <td><%= Me.GetLocalizedString("tblMediaFileTypes.Header.FileType")%></td>
                                    <td><%= Me.GetLocalizedString("tblMediaFileTypes.Header.ModuleSupport")%></td>
                                    <td><%= Me.GetLocalizedString("tblMediaFileTypes.Header.HostSupport")%></td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr class="dnnmedia-filetype-row">
                                <td class="dnnmedia-filetype-filetype"><%# DataBinder.Eval(Container.DataItem, "FileType")%></td>
                                <td class="dnnmedia-filetype-modulesupport"><%# GetSupportedImage(DataBinder.Eval(Container.DataItem, "ModuleSupport"))%></td>
                                <td class="dnnmedia-filetype-hostsupport"><%# GetSupportedImage(DataBinder.Eval(Container.DataItem, "HostSupport"))%></td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr class="dnnmedia-filetype-altrow">
                                <td class="dnnmedia-filetype-filetype"><%# DataBinder.Eval(Container.DataItem, "FileType")%></td>
                                <td class="dnnmedia-filetype-modulesupport"><%# GetSupportedImage(DataBinder.Eval(Container.DataItem, "ModuleSupport"))%></td>
                                <td class="dnnmedia-filetype-hostsupport"><%# GetSupportedImage(DataBinder.Eval(Container.DataItem, "HostSupport"))%></td>
                            </tr>
                        </AlternatingItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <p id="pSupportedFileTypesLegend" class="Normal"><%= Me.SupportedImage%> = <%= Me.GetLocalizedString("SupportedImage.Text")%>&nbsp; <%= Me.UnsupportedImage%> = <%=Me.GetLocalizedString("UnsupportedImage.Text")%></p>
                </div>
            </div>
        </li>
        <li id="liEmbed" class="dnnmedia-listitem dnnmedia-embed" runat="server">
            <div class="dnnmedia-labelleft">
                <label id="lblEmbed" title="<%=Me.GetLocalizedString("plEmbed.Help")%>" class="SubHead dnnmedia-label"><%= Me.GetLocalizedString("plEmbed.Text")%></label>
            </div>
            <div class="dnnmedia-fieldwrapper dnnmedia-url-control">
                <asp:TextBox ID="txtEmbed" runat="server" CssClass="NormalTextBox dnnmedia_textbox" MaxLength="1000" Rows="5" TextMode="MultiLine" />
            </div>
            <div class="dnnmedia-fieldwrapper">
                <p class="Normal"><%=Me.GetLocalizedString("lblEmbedSupport.Text")%></p>
            </div>
        </li>
        <li id="liOEmbed" class="dnnmedia-listitem dnnmedia-oembed" runat="server">
            <div class="dnnmedia-fieldwrapper">
                <p class="Normal"><%=Me.GetLocalizedString("lblOEmbedDesc.Text")%></p>
            </div>
            <div class="dnnmedia-labelleft">
                <label id="lblOEmbed" title="<%=Me.GetLocalizedString("plOEmbed.Help")%>" class="SubHead dnnmedia-label"><%= Me.GetLocalizedString("plOEmbed.Text")%></label>
            </div>
            <div class="dnnmedia-fieldwrapper dnnmedia-url-control">
                <asp:TextBox ID="txtOEmbed" runat="server" CssClass="NormalTextBox dnnmedia_textbox" MaxLength="255" /> 
                <asp:LinkButton ID="lnkOEmbed" runat="server" CausesValidation="false" CssClass="CommandButton" />
            </div>
            <div class="dnnmedia-fieldwrapper dnnmedia-message">
                <asp:Label ID="lblOEmbedCheck" runat="server" CssClass="Normal" />
            </div>
            <div class="dnnmedia-fieldwrapper">
                <p class="Normal"><%=Me.GetLocalizedString("lblOEmbedSupport.Text")%></p>
            </div>
        </li>
    </ol>
</fieldset>
<fieldset id="fsSettings" class="dnnmedia-fieldset">
    <legend class="dnnmedia-legend"><%= Me.GetLocalizedString("BasicSettings.Text")%></legend>
    <ol id="olSettings" class="dnnmedia-list">
        <li class="dnnmedia-listitem">
            <div class="dnnmedia-labelleft">
                <label id="plAlt" title="<%=Me.GetLocalizedString("plAlt.Help")%>" class="SubHead dnnmedia-label" for="<%=Me.txtAlt.ClientID%>"><%= Me.GetLocalizedString("plAlt.Text")%></label> <span class="NormalBold NormalRed">*</span>
            </div>
            <div class="dnnmedia-fieldwrapper">
                <asp:TextBox id="txtAlt" CssClass="NormalTextBox dnnmedia_textbox" runat="server" MaxLength="100" />
			    <asp:RequiredFieldValidator id="valAltText" resourcekey="valAltText.ErrorMessage" runat="server" controltovalidate="txtAlt"
				    display="Dynamic" cssclass="NormalRed" errormessage="<br />Alternate Text Is Required" />
            </div>
        </li>
        <li class="dnnmedia-listitem">
            <div class="dnnmedia-labelleft">
                <label id="plWidth" title="<%=Me.GetLocalizedString("plWidth.Help")%>" class="SubHead dnnmedia-label" for="<%=Me.txtWidth.ClientID%>"><%= Me.GetLocalizedString("plWidth.Text")%></label>
            </div>
            <div class="dnnmedia-fieldwrapper">
                <asp:TextBox id="txtWidth" CssClass="NormalTextBox dnnmedia_textbox" runat="server" MaxLength="10" /> <span class="Normal"><%=Me.GetLocalizedString("VideoDimsRequired.Text")%></span>
			    <asp:RegularExpressionValidator id="valWidth" resourcekey="valWidth.ErrorMessage" controltovalidate="txtWidth" validationexpression="^[1-9]+[0-9]*$"
				    display="Dynamic" cssclass="NormalRed" errormessage="<br />Width Must Be A Valid Integer" runat="server" />
            </div>
        </li>
        <li class="dnnmedia-listitem">
            <div class="dnnmedia-labelleft">
                <label id="plHeight" title="<%=Me.GetLocalizedString("plHeight.Help")%>" class="SubHead dnnmedia-label" for="<%=Me.txtHeight.ClientID%>"><%= Me.GetLocalizedString("plHeight.Text")%></label>
            </div>
            <div class="dnnmedia-fieldwrapper">
                <asp:TextBox id="txtHeight" CssClass="NormalTextBox dnnmedia_textbox" runat="server" MaxLength="10" /> <span class="Normal"><%=Me.GetLocalizedString("VideoDimsRequired.Text")%></span>
		        <asp:RegularExpressionValidator id="valHeight" resourcekey="valHeight.ErrorMessage" controltovalidate="txtHeight"
			        validationexpression="^[1-9]+[0-9]*$" display="Dynamic" cssclass="NormalRed" errormessage="<br />Height Must Be A Valid Integer"
			        runat="server" />
            </div>
        </li>
        <li class="dnnmedia-listitem">
            <div class="dnnmedia-labelleft">
                <label id="plAlignment" title="<%=Me.GetLocalizedString("plAlignment.Help")%>" class="SubHead dnnmedia-label" for="<%=Me.ddlImageAlignment.ClientID%>"><%= Me.GetLocalizedString("plAlignment.Text")%></label>
            </div>
            <div class="dnnmedia-fieldwrapper">
                <asp:DropDownList ID="ddlImageAlignment" Runat="server" Width="200" CssClass="dnnmedia_dropdownlist" />
            </div>
        </li>
    </ol>
</fieldset>
<fieldset id="fsVideoSettings" class="dnnmedia-fieldset">
    <legend class="dnnmedia-legend"><%= Me.GetLocalizedString("lblVideosOnly.Text")%></legend>
    <ol id="olVideoSettings" class="dnnmedia-list">
        <li class="dnnmedia-listitem">
            <p class="Normal"><%=Me.GetLocalizedString("lblVideoMessage.Text")%></p>
        </li>
        <li class="dnnmedia-listitem">
            <div class="dnnmedia-labelleft">
                <label id="lblAutoStart" title="<%=Me.GetLocalizedString("lblAutoStart.Help")%>" class="SubHead dnnmedia-label" for="<%=Me.chkAutoStart.ClientID%>"><%= Me.GetLocalizedString("lblAutoStart.Text")%></label>
            </div>
            <div class="dnnmedia-fieldwrapper">
                <asp:CheckBox ID="chkAutoStart" runat="server" CssClass="dnnmedia_checkbox" />
            </div>
        </li>
        <li class="dnnmedia-listitem">
            <div class="dnnmedia-labelleft">
                <label id="lblLoop" title="<%=Me.GetLocalizedString("lblLoop.Help")%>" class="SubHead dnnmedia-label" for="<%=Me.chkLoop.ClientID%>"><%= Me.GetLocalizedString("lblLoop.Text")%></label>
            </div>
            <div class="dnnmedia-fieldwrapper">
                <asp:CheckBox ID="chkLoop" runat="server" CssClass="dnnmedia_checkbox" />
            </div>
        </li>
    </ol>
</fieldset>
<fieldset id="fsImageSettings" class="dnnmedia-fieldset">
    <legend class="dnnmedia-legend"><%= Me.GetLocalizedString("lblImagesOnly.Text")%></legend>
    <ol id="olImageSettings" class="dnnmedia-list">
        <li class="dnnmedia-listitem">
            <div class="dnnmedia-labeltop">
                <label id="plNavigateUrl" title="<%=Me.GetLocalizedString("plNavigateUrl.Help")%>" class="SubHead dnnmedia-label"><%= Me.GetLocalizedString("plNavigateUrl.Text")%></label>
            </div>
            <div class="dnnmedia-fieldwrapper dnnmedia-url-control">
                <dnn:Url id="ctlNavigateUrl" runat="server" width="300" required="False" showtabs="False"
				    showfiles="True" showUrls="True" showlog="False" shownewwindow="False" showtrack="False" />
            </div>
        </li>
    </ol>
</fieldset>
<div id="divMediaCommands">
    <ul id="ulMediaCommands">
        <li class="dnnmedia-cmd-listitem">
            <asp:LinkButton class="CommandButton" id="cmdUpdate" resourcekey="cmdUpdate" runat="server" borderstyle="none" text="Update" />
        </li>
        <li class="dnnmedia-cmd-listitem">
            <asp:LinkButton class="CommandButton" id="cmdCancel" resourcekey="cmdCancel" runat="server" borderstyle="none" text="Cancel" causesvalidation="False" />
        </li>
    </ul>
</div>
<div id="divDnnAudit">
    <dnn:Tracking id="ctlTracking" runat="server" />
</div>
<script type="text/javascript" language="javascript">
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
    function EndRequestHandler(sender, args) {
        if (args.get_error() == undefined) {
            try { executejQuery(); } catch (e) { }
        }
    }

    function pageLoad(sender, args) {
        if (args.get_isPartialLoad()) {
            try { executejQuery(); } catch (e) { }
        }
    }

    jQuery(document).ready(function () {
        try { executejQuery(); } catch (e) { }
    });

    function executejQuery() {
        try {
            jQuery('#divSupportedFileTypes').hide();
            jQuery('#lnkViewFileTypes').live('click', function () { jQuery('#divSupportedFileTypes').toggle(); return false; });

            initiateTooltip();
        } catch (e) { }
    }

    function initiateTooltip() {
        try {
            jQuery('.dnnmedia-label').qtip({ style: 'cream', position: { corner: { target: 'topleft', tooltip: 'bottomright' }, adjust: { x: -4, y: -4}} });
            jQuery('.dnnmedia_textbox, .dnnmedia_dropdownlist, .dnnmedia_checkbox').qtip({ style: 'cream', position: { corner: { target: 'topright', tooltip: 'bottomleft' }, adjust: { x: 4, y: -4}} });
        } catch (e) { }
    }
</script>