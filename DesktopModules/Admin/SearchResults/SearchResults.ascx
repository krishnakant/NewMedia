<%@ Control Language="C#" AutoEventWireup="false" Inherits="DotNetNuke.Modules.SearchResults.SearchResults"
    CodeFile="SearchResults.ascx.cs" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<div id="container">
    <!--subcontainer start here-->
    <div class="subcontainer">
        <!--ouraudience_content start here-->
        <div class="map_content">
            <div class="dnnForm dnnSearchResults dnnClear" style="height:auto;">
                <asp:Label ID="lblMessage" runat="server" Font-Size="Medium"/>
                <hr style="border-width: 1px; border-color: #333333; background-color: #333333; width:98%" size="1" />
                <br/>
                <asp:DataGrid ID="dgResults" runat="server" AutoGenerateColumns="False" AllowPaging="true"
                    BorderStyle="None" ShowHeader="False" GridLines="None" 
                    PagerStyle-Visible="false" Width="99%">
                    <ItemStyle CssClass="dnnGridItem" HorizontalAlign="Left" />

<PagerStyle Visible="False"></PagerStyle>

                    <AlternatingItemStyle CssClass="dnnGridAltItem" />
                    <FooterStyle CssClass="dnnGridFooter" />
                    <Columns>
                        <asp:TemplateColumn>
                            <ItemTemplate>
                                <asp:Label ID="lblNo" style="padding-left:10px" runat="server" Text='<%# (int)DataBinder.Eval(Container, "ItemIndex") + 1 %>'
                                    CssClass="SubHead" />
                                    <br/>
                                    <br/>
                                    
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn>
                            <ItemTemplate>
                                <asp:HyperLink ID="lnkTitle" runat="server" CssClass="SubHead" style="display:none;" NavigateUrl='<%# FormatURL((int)DataBinder.Eval(Container.DataItem,"TabId"),(string)DataBinder.Eval(Container.DataItem,"Guid")) %>'
                                    Text='<%# DataBinder.Eval(Container.DataItem, "Title") %>' />
                                <asp:Label ID="lblRelevance" runat="server" CssClass="Normal"  style="display:none;" Text='<%# FormatRelevance((int)DataBinder.Eval(Container.DataItem, "Relevance")) %>' />
                                <br />
                                <asp:Label ID="lblSummary" runat="server" CssClass="Normal" Text='<%# DataBinder.Eval(Container.DataItem, "Description") + "<br>" %>'
                                    Visible="<%# !String.IsNullOrEmpty(ShowDescription()) %>" />
                                <br/>    
                                <asp:HyperLink ID="lnkLink" runat="server" CssClass="CommandButton" NavigateUrl='<%# FormatURL((int)DataBinder.Eval(Container.DataItem,"TabId"),(string)DataBinder.Eval(Container.DataItem,"Guid")) %>'
                                    Text='<%# FormatURL((int)DataBinder.Eval(Container.DataItem,"TabId"),(string)DataBinder.Eval(Container.DataItem,"Guid")) %>' />
                                <asp:Label ID="lblPubDate" runat="server" CssClass="Normal" style="display:none;" Text='<%# FormatDate((DateTime)DataBinder.Eval(Container.DataItem, "PubDate")) %>' />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid>
                <dnn:PagingControl ID="ctlPagingControl" runat="server" Mode="PostBack" />
                <br/>
                <br/>
                <br/>
            </div>
        </div>
    </div>
</div>
