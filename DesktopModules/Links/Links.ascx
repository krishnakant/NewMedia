<%@ Control Language="vb" Inherits="DotNetNuke.Modules.Links.Links" CodeFile="Links.ascx.vb"
    AutoEventWireup="false" Explicit="True" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Panel ID="pnlList" runat="server" CssClass="link_module">
    <asp:Repeater ID="lstLinks" runat="server">
        <HeaderTemplate>
            <ul class="linklist <%# Horizontal %>">
        </HeaderTemplate>
        <ItemTemplate>
            <li class="linkitem <%# Horizontal %>" <%# NoWrap %>>
                <asp:HyperLink ID="editLink" NavigateUrl='<%# EditURL("ItemID",Eval("ItemID")) %>'
                    Visible="<%# IsEditable %>" runat="server">
                    <asp:Image ID="editLinkImage" ImageUrl="~/images/edit.gif" AlternateText="Edit" Visible="<%# IsEditable %>"
                        runat="server" />
                </asp:HyperLink>
                <asp:Image ID="Image1" ImageUrl='<%# Eval("ImageURL") %>' Visible="<%# DisplayIcon() %>"
                    runat="server" resourcekey="imgLinkIcon.Text" />
                <a runat="server" id="linkHyp" href='<%# FormatURL(Eval("Url"),Eval("TrackClicks")) %>' class="Normal<%#PopupTrigger%>"
                    alt='<%# DisplayToolTip(Eval("Description")) %>' target='<%# IIF(Eval("NewWindow"),"_blank","_self") %>'>
                    <%#Eval("Title")%>
                </a><span id="spnSelect" runat="server" visible='<%# DisplayInfo(Eval("Description")) %>'>
                    &nbsp;
                    <asp:Label ID="lblMoreInfo" resourcekey="MoreInfo.Text" runat="server" Text="Label"
                        Visible="<%#Not CBool(ShowPopup) %>">...</asp:Label>
                </span>
                <asp:Panel ID="pnlDescription" class="item_desc" Style="display: none" runat="server">
                    <asp:Label runat="server" CssClass="Normal" Text='<%# HtmlDecode(Eval("Description")) %>'
                        ID="lbldescrdiv" />
                </asp:Panel>
                <telerik:RadToolTip ID="RadToolTip1" runat="server" TargetControlID="linkHyp" RelativeTo="Element"
                            Position="BottomCenter" RenderInPageRoot="true" EnableShadow="true" Animation="Slide"
                            AnimationDuration="150" ShowDelay="200" AutoCloseDelay="0" Skin="Telerik" Width="300"
                            Visible='<%#CBool(ShowPopup) AndAlso (Cstr(Eval("Description")) <> "") %>'>
                            <%# HtmlDecode(Eval("Description")) %>
                </telerik:RadToolTip>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            <div style="clear: both;" />
            </ul>
        </FooterTemplate>
    </asp:Repeater>
</asp:Panel>
<asp:Panel ID="pnlDropdown" runat="server">
    <asp:ImageButton ID="cmdEdit" runat="server" ImageUrl="~/images/edit.gif" AlternateText="Edit"
        resourcekey="Edit"></asp:ImageButton>
    <label style="display: none" for="<%=cboLinks.ClientID%>">
        Link</label>
    <asp:DropDownList ID="cboLinks" runat="server" DataTextField="Title" DataValueField="ItemID"
        CssClass="NormalTextBox">
    </asp:DropDownList>
    &nbsp;
    <asp:LinkButton ID="cmdGo" runat="server" CssClass="CommandButton" resourcekey="cmdGo"></asp:LinkButton>&nbsp;
    <asp:LinkButton ID="cmdInfo" runat="server" CssClass="CommandButton" Text="..."></asp:LinkButton>
    <asp:Label ID="lblDescription" runat="server" CssClass="Normal"></asp:Label>
</asp:Panel>
