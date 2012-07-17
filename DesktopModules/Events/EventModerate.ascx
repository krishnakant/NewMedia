<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="EventModerate.ascx.vb" Inherits="DotNetNuke.Modules.Events.EventModerate" Explicit="True" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" TagPrefix="dnn" %>
<asp:Panel ID="pnlEventsModuleModerate" runat="server">
    <div>
        <table id="Table1" cellspacing="0" cellpadding="2" width="100%">
            <tr>
                <td class="SubHead" valign="top">
                    <table cellspacing="0" cellpadding="2" width="100%" border="0">
                        <tr>
                            <td style="width:200px; white-space: nowrap;" class="SubHead" valign="top" >
                                <dnn:Label ID="lblModerateView" runat="server"></dnn:Label>
                            </td>
                            <td class="SubHead" valign="top" style="white-space: nowrap;">
                                <asp:RadioButtonList ID="rbModerate" runat="server" CssClass="SubHead" ToolTip="Select Events to Moderate Events or Enrollment to Moderate Event Enrollment" AutoPostBack="True" RepeatDirection="Vertical">
                                    <asp:ListItem resourcekey="EventsListItem" Value="Events" Selected="True">Events</asp:ListItem>
                                    <asp:ListItem resourcekey="EnrollmentListItem" Value="Enrollment">Enrollment</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="SubHead" valign="top" style="white-space: nowrap;">
                    <asp:Panel ID="pnlEmail" runat="server" Width="100%" BorderWidth="2px" BorderStyle="Outset" CssClass="SubHead">
                        <table class="SubHead" id="Table2" cellspacing="0" cellpadding="2" width="100%" border="0">
                            <tr>
                                <td class="SubHead" colspan="2">
                                    <asp:CheckBox ID="chkEmail" runat="server" CssClass="SubHead" resourcekey="chkEmail"></asp:CheckBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="SubHead" valign="top" style="width:225px">
                                    <dnn:Label ID="lblEmailFrom" runat="server"></dnn:Label>
                                </td>
                                <td valign="top">
                                    <asp:TextBox ID="txtEmailFrom" runat="server" Width="250px" CssClass="NormalTextBox" MaxLength="100" Wrap="False"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="SubHead" valign="top">
                                    <dnn:Label ID="lblNotifyEmailSubject" runat="server"></dnn:Label>
                                </td>
                                <td valign="top">
                                    <asp:TextBox ID="txtEmailSubject" runat="server" Width="500px" CssClass="NormalTextBox"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="SubHead" valign="top">
                                    <dnn:Label ID="lblNotifyEmailMessage" runat="server"></dnn:Label>
                                </td>
                                <td class="SubHead" valign="top">
                                    <asp:TextBox ID="txtEmailMessage" runat="server" Width="500px" ToolTip="Message to be emailed to the Requesting User." CssClass="NormalTextBox" TextMode="MultiLine" Height="100px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="SubHead" valign="top" style="white-space: nowrap;">
                    <asp:Panel ID="pnlGrid" runat="server">
                        <asp:DataGrid ID="grdRecurEvents" runat="server" Width="100%" BorderStyle="Outset" BorderWidth="2px" CssClass="Normal" GridLines="Horizontal" AutoGenerateColumns="False" OnItemCommand="grdRecurEvents_ItemCommand" DataKeyField="RecurMasterID">
                            <EditItemStyle VerticalAlign="Bottom"></EditItemStyle>
                            <AlternatingItemStyle BackColor="WhiteSmoke"></AlternatingItemStyle>
                            <ItemStyle VerticalAlign="Top"></ItemStyle>
                            <HeaderStyle Font-Bold="True" BackColor="Silver"></HeaderStyle>
                            <Columns>
                                <asp:TemplateColumn HeaderText="RecurAction">
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="rbEventRecurAction" runat="server" RepeatDirection="Horizontal" Font-Names="Verdana" Font-Size="7pt">
                                            <asp:ListItem resourcekey="Approve" Value="Approve">Approve</asp:ListItem>
                                            <asp:ListItem resourcekey="Deny" Value="Deny">Deny</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="DTStart" HeaderText="Date" DataFormatString="{0:d}"></asp:BoundColumn>
                                <asp:BoundColumn DataField="DTStart" HeaderText="Time" DataFormatString="{0:t}"></asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="Event">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkRecurDownload" CssClass="CommandButton" runat="server" CommandName="Select" CommandArgument="Select">
										<%# DataBinder.Eval(Container.DataItem,"EventName") %>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="FirstEventID" Visible="false"></asp:BoundColumn>
                            </Columns>
                        </asp:DataGrid>
                        <asp:DataGrid ID="grdEvents" runat="server" Width="100%" BorderStyle="Outset" BorderWidth="2px" CssClass="Normal" GridLines="Horizontal" AutoGenerateColumns="False" OnItemCommand="grdEvents_ItemCommand" DataKeyField="EventID">
                            <EditItemStyle VerticalAlign="Bottom"></EditItemStyle>
                            <AlternatingItemStyle BackColor="WhiteSmoke"></AlternatingItemStyle>
                            <ItemStyle VerticalAlign="Top"></ItemStyle>
                            <HeaderStyle Font-Bold="True" BackColor="Silver"></HeaderStyle>
                            <Columns>
                                <asp:TemplateColumn HeaderText="SingleAction">
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="rbEventAction" runat="server" RepeatDirection="Horizontal" Font-Names="Verdana" Font-Size="7pt">
                                            <asp:ListItem resourcekey="Approve" Value="Approve">Approve</asp:ListItem>
                                            <asp:ListItem resourcekey="Deny" Value="Deny">Deny</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="EventDateBegin" HeaderText="Date" DataFormatString="{0:d}"></asp:BoundColumn>
                                <asp:BoundColumn DataField="EventTimeBegin" HeaderText="Time" DataFormatString="{0:g}"></asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="Event">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkDownload" CssClass="CommandButton" runat="server" CommandName="Select" CommandArgument="Select">
										<%# DataBinder.Eval(Container.DataItem,"EventName") %>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                        </asp:DataGrid>
                        <asp:DataGrid ID="grdEnrollment" runat="server" Width="100%" BorderStyle="Outset" BorderWidth="2px" CssClass="Normal" GridLines="Horizontal" AutoGenerateColumns="False" OnItemCommand="grdEnrollment_ItemCommand" DataKeyField="SignupID" Visible="False">
                            <EditItemStyle VerticalAlign="Bottom"></EditItemStyle>
                            <AlternatingItemStyle BackColor="WhiteSmoke"></AlternatingItemStyle>
                            <ItemStyle VerticalAlign="Top"></ItemStyle>
                            <HeaderStyle Font-Bold="True" BackColor="Silver"></HeaderStyle>
                            <Columns>
                                <asp:TemplateColumn HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="rbEnrollAction" runat="server" RepeatDirection="Horizontal" Font-Names="Verdana" Font-Size="7pt">
                                            <asp:ListItem resourcekey="Approve" Value="Approve">Approve</asp:ListItem>
                                            <asp:ListItem resourcekey="Deny" Value="Deny">Deny</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="EventDateBegin" HeaderText="Date" DataFormatString="{0:d}"></asp:BoundColumn>
                                <asp:BoundColumn DataField="EventTimeBegin" HeaderText="Time" DataFormatString="{0:g}"></asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="Event">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEnrollEventName" CssClass="CommandButton" CommandArgument="Select" CommandName="Select" runat="server">
										<%# DataBinder.Eval(Container.DataItem,"EventName") %>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnUserEmail" runat="server" CausesValidation="false" CommandName="User" CommandArgument="Select" ImageUrl="~/DesktopModules/Events/Images/email.gif" Visible='<%# DataBinder.Eval(Container.DataItem,"EmailVisible") %>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="UserName" HeaderText="User"></asp:BoundColumn>
                                <asp:BoundColumn DataField="NoEnrolees" HeaderText="Qty"></asp:BoundColumn>
                            </Columns>
                        </asp:DataGrid>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="SubHead" valign="top">
                    <dnn:CommandButton ID="returnButton" runat="server" ImageUrl="~/images/lt.gif" CssClass="CommandButton" resourcekey="returnButton" CausesValidation="False" />&nbsp;&nbsp;
                    <dnn:CommandButton ID="cmdUpdateSelected" CssClass="CommandButton" ImageUrl="~/images/save.gif" runat="server" resourcekey="cmdUpdateSelected" CausesValidation="False" />&nbsp;&nbsp;
                    <dnn:CommandButton ID="cmdSelectApproveAll" CssClass="CommandButton" ImageUrl="~/images/grant.gif" runat="server" resourcekey="cmdSelectApproveAll" CausesValidation="False" />&nbsp;&nbsp;
                    <dnn:CommandButton ID="cmdSelectDenyAll" CssClass="CommandButton" ImageUrl="~/images/deny.gif" runat="server" resourcekey="cmdSelectDenyAll" CausesValidation="False" />&nbsp;&nbsp;
                    <dnn:CommandButton ID="cmdUnmarkAll" CssClass="CommandButton" ImageUrl="~/images/unchecked.gif" runat="server" resourcekey="cmdUnmarkAll" CausesValidation="False" />
                </td>
            </tr>
            <tr>
                <td class="SubHead" valign="top">
                    <asp:Label ID="lblMessage" runat="server" CssClass="SubHead">Note: Deny will delete Event/Signup Entries from the Database!</asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Panel>
