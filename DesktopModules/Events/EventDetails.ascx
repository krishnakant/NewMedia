<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="EventDetails.ascx.vb" Inherits="DotNetNuke.Modules.Events.EventDetails" %>
<%@ Register Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" TagPrefix="dnn" %>

<asp:Panel ID="pnlEventsModuleDetails" runat="server">
    <div id="divEventDetails1" runat="server" style="width:90%;text-align:left;" />
    <div id="tabReminder" Runat="server" style="width:90%;">
    <table cellspacing="2" cellpadding="3" border="0" width="90%" style="text-align:left;">
        <tbody>
           <!-- Begin controls -->
            <tr valign="top">
                <td class="SubHead" style="width:35%"><div id="rem1" runat="server" visible="false">
                <asp:Image ID="imgNotify" runat="server" ImageUrl="Images/bell.gif" />&nbsp;
                    <asp:LinkButton ID="cmdNotify" CssClass="CommandButton" runat="server" BorderStyle="none" 
                        resourcekey="cmdNotify">Notify Me for this Event @</asp:LinkButton><br />
		<asp:CheckBox ID="chkReminderRec" resourcekey="chkReminderRec" Visible="false" runat="server" CssClass="SubHead" Text=""></asp:CheckBox></div> 
                </td>
                <td class="SubHead"><div id="rem2" runat="server" visible="false">
                    <asp:TextBox ID="txtUserEmail" CssClass="NormalTextBox" runat="server" Width="199px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="valEmail" ValidationGroup="EventEmail" runat="server" resourcekey="valEmail" 
                          ControlToValidate="txtUserEmail" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator  ID="valEmail2" ValidationGroup="EventEmail" runat="server" resourcekey="valEmail" 
                          ControlToValidate="txtUserEmail" Display="Dynamic"></asp:RequiredFieldValidator><br />
	            <asp:TextBox ID="txtReminderTime" CssClass="NormalTextBox" runat="server" MaxLength="3" Width="30" Font-Size="8pt">8</asp:TextBox>
                    <asp:DropDownList
                        ID="ddlReminderTimeMeasurement" runat="server" Width="90" Font-Size="8pt" CssClass="NormalTextBox">
                    </asp:DropDownList> <asp:Label ID="lblTimeBefore" resourcekey="lblTimeBefore" runat="server"></asp:Label></div>
		    <div id="rem3" runat="server" visible="false"> <asp:Image ID="imgConfirmation" runat="server" ImageUrl="Images/bell.gif" />
                    <asp:Label ID="lblConfirmation" runat="server"></asp:Label></div>
                </td>
            </tr> 
        </tbody>
    </table>
    </div>
    <div id="divEventDetails2" runat="server" style="width:100%;text-align:left;" />
    <div id="tabEnrollment" Runat="server" style="width:90%;">
    <table cellspacing="2" cellpadding="3" border="0" width="90%" style="text-align:left;">
        <tbody>
            <tr>
                <td class="SubHead" style="width:35%"><div id="enroll1" runat="server" visible="false">
                <asp:Image ID="imgEnroll" runat="server" ImageUrl="Images/enroll.gif" />&nbsp;
                <asp:LinkButton ID="cmdSignup" CssClass="CommandButton" runat="server" BorderStyle="none" 
                        causesvalidation="False">Enroll for this Event?</asp:LinkButton></div>
                </td>
                <td class="SubHead">
                    <div id="enroll3" runat="server" visible="false">
                        <asp:Label ID="lblNoEnrolee" runat="server" resourcekey="lblNoEnrolee">No. of Enrolees</asp:Label>&nbsp;
                        <asp:TextBox ID="txtNoEnrolees" runat="server" CssClass="NormalTextBox" 
                            Font-Size="8pt" MaxLength="3" Width="30">1</asp:TextBox>&nbsp;
                        <asp:Label ID="lblMaxNoEnrolees" runat="server">(Max 1)</asp:Label>&nbsp;
                        <asp:RangeValidator ID="valNoEnrolees" runat="server" 
                            ControlToValidate="txtNoEnrolees" MinimumValue="1" MaximumValue="1" Display="Dynamic" Type="Integer" CssClass="Normal" 
                            EnableClientScript="False" ></asp:RangeValidator>
                    </div>
                    <div id="enroll2" runat="server" visible="false">
                        <asp:Image ID="imgSignup" runat="server" ImageUrl="Images/enroll.gif" />&nbsp;
                        <asp:Label ID="lblSignup" runat="server">You are not enrolled for this event!</asp:Label>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
    </div>
    <div id="divEventDetails3" runat="server" style="width:100%;text-align:left;" />
    <div id="tabEnrollList" Runat="server" style="width:90%;">
    <table cellspacing="2" cellpadding="3" border="0" width="90%" style="text-align:left;">
        <tbody>
            <tr>
                <td class="SubHead" valign="top" >
                    <asp:Label ID="lblEnrolledUsers" resourcekey="lblEnrolledUsers" runat="server">Enrolled Users</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="SubHead" valign="top" align="center">
                    <div>
                        <asp:DataGrid ID="grdEnrollment" runat="server" AutoGenerateColumns="False" BorderStyle="Outset" BorderWidth="2px" CssClass="Normal"
                            DataKeyField="SignupID" GridLines="Horizontal" Visible="True" Width="100%">
                            <EditItemStyle VerticalAlign="Bottom"></EditItemStyle>
                            <AlternatingItemStyle BackColor="WhiteSmoke"></AlternatingItemStyle>
                            <ItemStyle VerticalAlign="Top"></ItemStyle>
                            <HeaderStyle Font-Bold="True" BackColor="Silver"></HeaderStyle>
                            <Columns>
                                <asp:BoundColumn DataField="EnrollUserName" HeaderText="EnrollUserName"></asp:BoundColumn>
                                <asp:BoundColumn DataField="EnrollDisplayName" HeaderText="EnrollDisplayName"></asp:BoundColumn>
                                <asp:BoundColumn DataField="EnrollEmail" HeaderText="EnrollEmail"></asp:BoundColumn>
                                <asp:BoundColumn DataField="EnrollPhone" HeaderText="EnrollPhone"></asp:BoundColumn>
                                <asp:TemplateColumn headerText="EnrollApproved">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkEnrollApproved" runat="server" Enabled="false" Checked='<%# DataBinder.Eval(Container.DataItem,"EnrollApproved") %>'/>
                                </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="EnrollNo" HeaderText="EnrollNo"></asp:BoundColumn>
                            </Columns>
                        </asp:DataGrid>
                    </div>
                </td>
                        </tr>
        </tbody>
    </table>
    </div>
    <div id="divEventDetails4" runat="server" style="width:100%;text-align:left;" />
    <table cellspacing="2" cellpadding="3" border="0" width="100%" style="text-align:left">
        <tbody>
            <tr valign="top">
                <td align="right" class="Normal">
                    <br />
                    <asp:Label ID="lblvEventExport" runat="server" resourcekey="plvEventExport">Export to Desktop Event:</asp:Label>&nbsp;
                    <asp:LinkButton ID="cmdvEvent" CssClass="CommandButton" runat="server" BorderStyle="none" Text="Event" resourcekey="cmdvEvent" causesvalidation="False">Single</asp:LinkButton>&nbsp;&nbsp;
                    <asp:LinkButton ID="cmdvEventSeries" CssClass="CommandButton" runat="server" BorderStyle="none" Text="Event series" resourcekey="cmdvEventSeries" causesvalidation="False">Series</asp:LinkButton>
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <br />
                    <dnn:CommandButton ID="returnButton" CssClass="CommandButton" ImageUrl="~/images/lt.gif" runat="server" resourcekey="returnButton" causesvalidation="False" />&nbsp;
                    <dnn:CommandButton ID="editButton" CssClass="CommandButton" ImageUrl="~/images/edit.gif" runat="server" resourcekey="editButton" causesvalidation="False" />&nbsp;
                    <dnn:CommandButton ID="editSeriesButton" CssClass="CommandButton" ImageUrl="~/images/edit.gif" runat="server" resourcekey="editSeriesButton" causesvalidation="False" Visible="False" />&nbsp;
                    <dnn:CommandButton ID="deleteButton" CssClass="CommandButton" ImageUrl="~/images/delete.gif" runat="server" resourcekey="deleteButton" causesvalidation="False" />&nbsp;
                    <dnn:CommandButton ID="deleteSeriesButton" CssClass="CommandButton" ImageUrl="~/images/delete.gif" runat="server" resourcekey="deleteSeriesButton" causesvalidation="False" Visible="False" />&nbsp;
                    <asp:DropDownList ID="cboTimeZone" runat="server" Visible="False" CssClass="NormalTextBox" Font-Size="8pt"/>
                </td>
            </tr>
        </tbody>
    </table>
</asp:Panel>
