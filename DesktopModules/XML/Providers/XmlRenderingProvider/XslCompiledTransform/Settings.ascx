<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Settings.ascx.cs" Inherits="DotNetNuke.Modules.Xml.Providers.XmlRenderingProvider.XslCompiledTransform.Settings" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="ParameterEditor" Src="~/DesktopModules/xml/Parameters/ParameterEditor.ascx" %>
<asp:Label ID="lblXslDefinition" resourcekey="lblXslDefinition" runat="server" CssClass="normal">In this section, you can define the source of your XSl Stylesheet. You can define additional arguments to provide your script with context information.</asp:Label>
<dnn:url id="ctlURLxsl" runat="server" required="True" showtrack="False" shownewwindow="False"
    showlog="False" urltype="F" showfiles="True" showurls="True" showtabs="False"
    width="300"></dnn:url>
<div id="divXslSettings" runat="server" style="margin-top: -20px; margin-bottom: 10px">
    <dnn:sectionhead id="dshXslParams" runat="server" isexpanded="true" resourcekey="dshXslParams"
        section="sectXslParams" cssclass="SubHead"></dnn:sectionhead>
    <div id="sectXslParams" runat="server">
        <dnn:parametereditor id="pedXsl" runat="server" purpose="XSL"></dnn:parametereditor>
    </div>
</div>
