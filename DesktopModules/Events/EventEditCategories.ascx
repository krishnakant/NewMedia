<%@ Control Language="vb" AutoEventWireup="false" Codebehind="EventEditCategories.ascx.vb" Inherits="DotNetNuke.Modules.Events.EventEditCategories" %>
<%@ Register Src="~/controls/LabelControl.ascx" TagName="Label" TagPrefix="dnn" %>
<%@ Register Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" TagPrefix="dnn" %>
<asp:Panel ID="pnlEventsModuleCategories" runat="server">
<table id="Table1" cellspacing="0" cellpadding="0" width="100%" border="0">
    <tr valign="top">
        <td style="white-space:nowrap;width:50%;">
            <table id="Table2" cellspacing="0" cellpadding="2" border="0" width="100%">
                <tr>
                    <td class="SubHead" valign="top" style="width:125px">
                        <dnn:Label ID="lblCategoryCap" runat="server" CssClass="SubHead" ResourceKey="plCategory" Text="Category:" />
                    </td>
                    <td class="SubHead" valign="top" colspan="2">
                        <asp:TextBox ID="txtCategoryName" runat="server" CssClass="NormalTextBox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="lblColorCap" runat="server" CssClass="SubHead" ResourceKey="plColor" Text="Color:" />
                    </td>
                    <td class="SubHead" valign="top" style="width:150px;">
                        <asp:TextBox ID="txtCategoryColor" runat="server" CssClass="NormalTextBox" style=""></asp:TextBox>
                    </td>
                    <td>
                        <span id="colorPicker1"><asp:Literal ID="cpBackColor" runat="server"></asp:Literal></span>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="lblFontColorCap" runat="server" CssClass="SubHead" ResourceKey="plFontColor" Text="Font Color:" />
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:TextBox ID="txtCategoryFontColor" runat="server" CssClass="NormalTextBox"></asp:TextBox>
                    </td>
                    <td><span id="colorPicker2" ><asp:Literal ID="cpForeColor" runat="server" ></asp:Literal></span></td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="lblPreview" runat="server" CssClass="SubHead" ResourceKey="plPreview" Text="Preview:" />
                    </td>
                    <td id="previewpane" class="SubHead" valign="top" style="text-align:center;" >
                        <span id="lblPreviewCat" style="" ></span>
                    </td>
                    <td>&nbsp;</td>
                </tr>

            </table>
            <dnn:CommandButton ID="cmdAdd" runat="server" ImageUrl="~/images/add.gif" CssClass="CommandButton" resourcekey="cmdAdd" />&nbsp;
            <dnn:CommandButton ID="cmdUpdate" runat="server" ImageUrl="~/images/save.gif" CssClass="CommandButton" resourcekey="cmdUpdate" Visible="false" />&nbsp;
            <dnn:CommandButton ID="returnButton" resourcekey="returnButton" ImageUrl="~/images/lt.gif" CssClass="CommandButton" runat="server" CausesValidation="False" />
        </td>
        <td style="width:50%">
            <asp:DataGrid ID="GrdCategories" runat="server" AutoGenerateColumns="False" BorderStyle="Outset" BorderWidth="1px" CssClass="Normal"
                DataKeyField="Category" GridLines="Horizontal" OnDeleteCommand="GrdCategories_DeleteCommand" OnItemCommand="GrdCategories_ItemCommand"
                Width="250px">
                <EditItemStyle VerticalAlign="Bottom" />
                <AlternatingItemStyle BackColor="WhiteSmoke" />
                <ItemStyle VerticalAlign="Top" />
                <HeaderStyle BackColor="Silver" Font-Bold="True" />
                <Columns>
                    <asp:TemplateColumn>
                        <ItemStyle HorizontalAlign="Left" />
                        <ItemTemplate>
                            <asp:ImageButton ID="DeleteButton" runat="server" AlternateText="Delete" CausesValidation="false" CommandArgument="Delete"
                                CommandName="Delete" ImageUrl="~/images/delete.gif" resourcekey="DeleteButton" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="PortalID" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text="<%# Container.DataItem.PortalID.ToString %>">
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Category" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text="<%# Container.DataItem.Category.ToString %>">
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Category Name">
                        <ItemTemplate>
                            <asp:Panel runat="server" BackColor="<%# GetColor(Container.DataItem.Color) %>">
                                <asp:LinkButton ID="lnkCategoryName" runat="server" forecolor="<%# GetColor(Container.DataItem.FontColor) %>" CommandArgument="Select"
                                    CommandName="Select" Text="<%# Container.DataItem.CategoryName %>">
                                </asp:LinkButton>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
            </asp:DataGrid>
            <asp:Label ID="lblEditMessage" runat="server" CssClass="SubHead" resourcekey="lblEditMessage">(Select Item Link to Edit)</asp:Label>
        </td>
    </tr>
</table>
</asp:Panel>
<script type="text/javascript">
    //Get the variables
    var ctrlCategoryName = $("input[ID$='txtCategoryName']");
    var ctrlCategoryColor = $("input[ID$='txtCategoryColor']");
    var ctrlCategoryFontColor = $("input[ID$='txtCategoryFontColor']");

    $(function() {
        $("#colorPicker1").EventsCp(
            { 'onChange': function(val) {
                $("#lblPreviewCat").text(ctrlCategoryName);
                $("#previewpane").css("background-color", "#" + val);
                ctrlCategoryColor.val("#" + val);
            }
            });
        $("#colorPicker2").EventsCp(
            { 'onChange': function(val) {
                $("#lblPreviewCat").text(ctrlCategoryName);
                $("#lblPreviewCat").css("color", "#" + val);
                ctrlCategoryFontColor.val("#" + val);
            }
            });
        });
</script>