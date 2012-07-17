<%@ Control Language="vb" AutoEventWireup="false" Codebehind="EventMyEnrollments.ascx.vb" Inherits="DotNetNuke.Modules.Events.EventMyEnrollments" %>
<%@ Register TagPrefix="evt" TagName="Icons" Src="~/DesktopModules/Events/EventIcons.ascx" %>
<%@ Register Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" TagPrefix="dnn" %>
<table id="Table1" cellspacing="1" cellpadding="1" border="0" width="100%">
    <tr>
        <td style="white-space:nowrap;width:33%" align="center">
        </td>
        <td style="white-space:nowrap;width:33%">
            <asp:Label ID="lblMessage" CssClass="SubHead" runat="server" Visible="False">No Events/Enrollments Found...</asp:Label>
        </td>
        <td style="white-space:nowrap;width:33%" align="right">
            <evt:Icons ID="EventIcons" runat="server"></evt:Icons>
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <table width="100%">
                <tr>
                    <td style="width:5%"></td>
                    <td style="white-space:nowrap;width:90%">
                        <asp:DataGrid ID="grdEnrollment" runat="server" AutoGenerateColumns="False" BorderStyle="Outset" BorderWidth="2px" CssClass="Normal"
                            DataKeyField="SignupID" GridLines="Horizontal" OnItemCommand="grdEnrollment_ItemCommand" Width="100%">
                            <EditItemStyle VerticalAlign="Bottom"></EditItemStyle>
                            <AlternatingItemStyle BackColor="WhiteSmoke"></AlternatingItemStyle>
                            <ItemStyle VerticalAlign="Top"></ItemStyle>
                            <HeaderStyle Font-Bold="True" BackColor="Silver"></HeaderStyle>
                            <Columns>
                                <asp:TemplateColumn HeaderText="Select">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelect" runat="server"></asp:CheckBox>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="EventTimeBegin" HeaderText="Start" DataFormatString="{0:g}"></asp:BoundColumn>
                                <asp:BoundColumn DataField="EventTimeEnd" HeaderText="End" DataFormatString="{0:g}"></asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="Event">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEnrollEventName" CssClass="CommandButton" runat="server" CommandName="Select" CommandArgument="Select">
										            <%# DataBinder.Eval(Container.DataItem,"EventName") %>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn headerText="Approved">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkApproved" runat="server" Enabled="false" Checked='<%# DataBinder.Eval(Container.DataItem,"Approved") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="Approved" Visible="false"></asp:BoundColumn>
                                <asp:TemplateColumn headerText="Fee">
                                    <ItemTemplate>
                                        <asp:Label id="lblAmount" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="PayPalAmount" Visible="false"></asp:BoundColumn>
                                <asp:BoundColumn DataField="NoEnrolees" HeaderText="Qty"></asp:BoundColumn>
                                <asp:TemplateColumn headerText="Total">
                                    <ItemTemplate>
                                        <asp:Label id="lblTotal" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                        </asp:DataGrid>
                    </td>
                    <td style="width:5%"></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="white-space:nowrap;">
            <dnn:CommandButton ID="returnButton" runat="server" ImageUrl="~/images/lt.gif" CssClass="CommandButton" CausesValidation="False" resourcekey="returnButton" />&nbsp;&nbsp;&nbsp;
            <dnn:CommandButton ID="lnkSelectedDelete" resourcekey="lnkSelectedDelete" ImageUrl="~/images/delete.gif" runat="server" CssClass="CommandButton" />
        </td>
    </tr>
    <tr>
        <td style="white-space:nowrap;width:0px" align="center" colspan="3">
            <evt:Icons ID="EventIcons2" runat="server"></evt:Icons>
        </td>
    </tr>
</table>
