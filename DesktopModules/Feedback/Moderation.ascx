<%@ Import Namespace="DotNetNuke.Modules.Feedback" %>
<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Moderation.ascx.vb" Inherits="DotNetNuke.Modules.Feedback.Moderation" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>

<table cellspacing="0" cellpadding="4" class="Feedback_Moderation" summary="Moderation Table">
   <tr>
      <td valign="top">
         <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td class="Subhead">
                        <asp:CheckBox ID="cbShowOnlyModeratedCategories" TextAlign="Right" runat="server" Text="Show feedback only in unmoderated categories" ResourceKey="cbShowOnlyModeratedCategories" AutoPostBack="true" /><br /><br />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                       <dnn:SectionHead ID="scnPendingFeedback" CssClass="SubHead" runat="server" Text="Pending Feedback" resourcekey="scnPendingFeedback" Section="trPending" IncludeRule="True" />
                    </td>
                </tr>
                <tr id="trPending" runat="server">
                    <td class="Feedback_Moderation_Grid">
                        <asp:DataGrid ID="dgPendingFeedback" runat="server" AutoGenerateColumns="false" AllowSorting="True" 
                              CellPadding="6" GridLines="None" cssclass="DataGrid_Container" >
                         <headerstyle cssclass="NormalBold" verticalalign="Top" Horizontalalign="left"/>
                         <itemstyle cssclass="Normal" horizontalalign="left" />
                         <edititemstyle cssclass="NormalTextBox" />
                         <selecteditemstyle cssclass="NormalRed" />
                         <Columns>
                           <asp:BoundColumn DataField="FeedbackID" Visible = "false" ReadOnly="true"></asp:BoundColumn>
                           <asp:ButtonColumn ButtonType="LinkButton" Text="SetPublic" CommandName="StatusPublic"></asp:ButtonColumn>
                           <asp:ButtonColumn ButtonType="LinkButton" Text="SetPrivate" CommandName="StatusPrivate"></asp:ButtonColumn>
                           <asp:ButtonColumn ButtonType="LinkButton" Text="SetArchive" CommandName="StatusArchive"></asp:ButtonColumn>
                           <asp:TemplateColumn>
	                          <ItemTemplate>
	                             <asp:ImageButton ID="cmdPrint" runat="server" CommandName="Print" AlternateText="Print" ImageUrl="~/images/print.gif" />
	                          </ItemTemplate>
	                       </asp:TemplateColumn>
                           <asp:TemplateColumn>
	                          <ItemTemplate>
	                             <asp:ImageButton ID="cmdDelete" runat="server" CommandName="Delete" AlternateText="Delete" ImageUrl="~/images/delete.gif" />
	                          </ItemTemplate>
	                          <EditItemTemplate>
	                             <asp:ImageButton ID="cmdCancel" runat="server" CommandName="Cancel" AlternateText="Cancel" ImageUrl="~/images/cancel.gif" />
	                          </EditItemTemplate>
	                       </asp:TemplateColumn>
	                       <asp:TemplateColumn>
	                          <ItemTemplate>
	                             <asp:ImageButton ID="cmdEdit" runat="server" CommandName="Edit" AlternateText="Edit" ImageUrl="~/images/edit.gif" />
	                          </ItemTemplate>
	                          <EditItemTemplate>
	                             <asp:ImageButton ID="cmdUpdate" runat="server" CommandName="Update" AlternateText="Update" ImageUrl="~/images/save.gif" />
	                          </EditItemTemplate>
	                       </asp:TemplateColumn>
	                       <asp:BoundColumn DataField="CategoryName" HeaderText="Category" ReadOnly="true"></asp:BoundColumn>
		                   <asp:TemplateColumn HeaderText="Subject" ItemStyle-Width="200px">
		                      <ItemTemplate>
                                 <asp:label runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Subject") %>' CssClass="Normal" ID="lblSubject" Width="200px"/>
		                      </ItemTemplate>
		                      <EditItemTemplate>
                                 <asp:textbox runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Subject") %>' CssClass="NormalTextBox" ID="txtSubject" Width="200px"/>
		                      </EditItemTemplate>
		                   </asp:TemplateColumn>
		                   <asp:TemplateColumn HeaderText="Message" ItemStyle-Width="250px">
		                      <ItemTemplate>
                                 <asp:label runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Message") %>' CssClass="Normal" ID="lblMessage" Width="250px"/>
		                      </ItemTemplate>
		                      <EditItemTemplate>
                                 <asp:textbox runat="server" TextMode="MultiLine" Text='<%#DataBinder.Eval(Container.DataItem, "Message") %>' CssClass="NormalTextBox" ID="txtMessage" Rows="10" Width="250px"/>
		                      </EditItemTemplate>
		                   </asp:TemplateColumn>
		                   <asp:BoundColumn DataField="SenderName" HeaderText="Author" ReadOnly="true"></asp:BoundColumn>
		                   <asp:BoundColumn DataField="SenderEmail" HeaderText="From Email" ReadOnly="true"></asp:BoundColumn>
		                   <asp:BoundColumn DataField="CreatedOnDate" HeaderText="Created Date" ReadOnly="true" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" SortExpression="CreatedOnDate"></asp:BoundColumn>
		                 </Columns>
		                </asp:DataGrid>
		                <dnn:PagingControl id="pgPendingFeedback" runat="server" Mode="PostBack"></dnn:PagingControl>             
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <br /><br />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                       <dnn:SectionHead ID="scnPrivateFeedback" CssClass="SubHead" runat="server" Text="Private Feedback" resourcekey="scnPrivateFeedback" Section="trPrivate" IncludeRule="True" />
                    </td>
                </tr>
                <tr id="trPrivate" runat="server">
                    <td class="Feedback_Moderation_Grid">
                        <asp:DataGrid ID="dgPrivateFeedback" runat="server" AutoGenerateColumns="false" AllowSorting="True" 
                              CellPadding="6" GridLines="None" cssclass="DataGrid_Container" >
                         <headerstyle cssclass="NormalBold" verticalalign="Top" horizontalalign="left"/>
                         <itemstyle cssclass="Normal" horizontalalign="left" />
                         <alternatingitemstyle cssclass="Normal" />
                         <edititemstyle cssclass="NormalTextBox" />
                         <selecteditemstyle cssclass="NormalRed" />
                         <footerstyle cssclass="DataGrid_Footer" />
                         <pagerstyle cssclass="DataGrid_Pager" />
                         <Columns>
                           <asp:BoundColumn DataField="FeedbackID" Visible = "false" ReadOnly="true"></asp:BoundColumn>
                           <asp:ButtonColumn ButtonType="LinkButton" Text="SetPublic" CommandName="StatusPublic"></asp:ButtonColumn>
                           <asp:ButtonColumn ButtonType="LinkButton" Text="SetArchive" CommandName="StatusArchive"></asp:ButtonColumn>
                           <asp:TemplateColumn>
	                          <ItemTemplate>
	                             <asp:ImageButton ID="cmdPrint" runat="server" CommandName="Print" AlternateText="Print" ImageUrl="~/images/print.gif" />
	                          </ItemTemplate>
	                       </asp:TemplateColumn>
                           <asp:TemplateColumn>
	                          <ItemTemplate>
	                             <asp:ImageButton ID="cmdDelete" runat="server" CommandName="Delete" AlternateText="Delete" ImageUrl="~/images/delete.gif" />
	                          </ItemTemplate>
	                          <EditItemTemplate>
	                             <asp:ImageButton ID="cmdCancel" runat="server" CommandName="Cancel" AlternateText="Cancel" ImageUrl="~/images/cancel.gif" />
	                          </EditItemTemplate>
	                       </asp:TemplateColumn>
	                       <asp:TemplateColumn>
	                          <ItemTemplate>
	                             <asp:ImageButton ID="cmdEdit" runat="server" CommandName="Edit" AlternateText="Edit" ImageUrl="~/images/edit.gif" />
	                          </ItemTemplate>
	                          <EditItemTemplate>
	                             <asp:ImageButton ID="cmdUpdate" runat="server" CommandName="Update" AlternateText="Update" ImageUrl="~/images/save.gif" />
	                          </EditItemTemplate>
	                       </asp:TemplateColumn>
	                       <asp:BoundColumn DataField="CategoryName" HeaderText="Category" ReadOnly="true"></asp:BoundColumn>
		                   <asp:TemplateColumn HeaderText="Subject" ItemStyle-Width="200px">
		                      <ItemTemplate>
                                 <asp:label runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Subject") %>' CssClass="Normal" ID="lblSubject" Width="200px"/>
		                      </ItemTemplate>
		                      <EditItemTemplate>
                                 <asp:textbox runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Subject") %>' CssClass="NormalTextBox" ID="txtSubject" Width="200px"/>
		                      </EditItemTemplate>
		                   </asp:TemplateColumn>
		                   <asp:TemplateColumn HeaderText="Message" ItemStyle-Width="250px">
		                      <ItemTemplate>
                                 <asp:label runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Message") %>' CssClass="Normal" ID="lblMessage" Width="250px"/>
		                      </ItemTemplate>
		                      <EditItemTemplate>
                                 <asp:textbox runat="server" TextMode="MultiLine" Text='<%#DataBinder.Eval(Container.DataItem, "Message") %>' CssClass="NormalTextBox" ID="txtMessage" Rows="10" Width="250px"/>
		                      </EditItemTemplate>
		                   </asp:TemplateColumn>
		                   <asp:BoundColumn DataField="SenderName" HeaderText="Author" ReadOnly="true"></asp:BoundColumn>
		                   <asp:BoundColumn DataField="SenderEmail" HeaderText="From Email" ReadOnly="true"></asp:BoundColumn>
		                   <asp:BoundColumn DataField="CreatedOnDate" HeaderText="Created Date" ReadOnly="true" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" SortExpression="CreatedOnDate"></asp:BoundColumn>
		                 </Columns>
		              </asp:DataGrid>
		              <dnn:PagingControl id="pgPrivateFeedback" runat="server" Mode="PostBack"></dnn:PagingControl>
                    </td>
                 </tr>
                 <tr>
                    <td align="right">
                        <br /><br />
                    </td>
                 </tr>
                 <tr>
                    <td align="left">
                       <dnn:SectionHead ID="scnPublishedFeedback" CssClass="SubHead" runat="server" Text="Published Feedback" resourcekey="scnPublishedFeedback" Section="trPublished" IncludeRule="True" />
                    </td>
                </tr>
                <tr id="trPublished" runat="server">
                    <td class="Feedback_Moderation_Grid">
                        <asp:DataGrid ID="dgPublicFeedback" runat="server" AutoGenerateColumns="false" AllowSorting="True"   
                              CellPadding="6" GridLines="None" cssclass="DataGrid_Container" >
                         <headerstyle cssclass="NormalBold" verticalalign="Top" horizontalalign="left"/>
                         <itemstyle cssclass="Normal" horizontalalign="left" />
                         <alternatingitemstyle cssclass="Normal" />
                         <edititemstyle cssclass="NormalTextBox" />
                         <selecteditemstyle cssclass="NormalRed" />
                         <footerstyle cssclass="DataGrid_Footer" />
                         <pagerstyle cssclass="DataGrid_Pager" />
                         <Columns>
                           <asp:BoundColumn DataField="FeedbackID" Visible = "false" ReadOnly="true"></asp:BoundColumn>
                           <asp:ButtonColumn ButtonType="LinkButton" Text="SetPrivate" CommandName="StatusPrivate"></asp:ButtonColumn>
                           <asp:ButtonColumn ButtonType="LinkButton" Text="SetArchive" CommandName="StatusArchive"></asp:ButtonColumn>
                           <asp:TemplateColumn>
	                          <ItemTemplate>
	                             <asp:ImageButton ID="cmdPrint" runat="server" CommandName="Print" AlternateText="Print" ImageUrl="~/images/print.gif" />
	                          </ItemTemplate>
	                       </asp:TemplateColumn>
                           <asp:TemplateColumn>
	                          <ItemTemplate>
	                             <asp:ImageButton ID="cmdDelete" runat="server" CommandName="Delete" AlternateText="Delete" ImageUrl="~/images/delete.gif" />
	                          </ItemTemplate>
	                          <EditItemTemplate>
	                             <asp:ImageButton ID="cmdCancel" runat="server" CommandName="Cancel" AlternateText="Cancel" ImageUrl="~/images/cancel.gif" />
	                          </EditItemTemplate>
	                       </asp:TemplateColumn>
	                       <asp:TemplateColumn>
	                          <ItemTemplate>
	                             <asp:ImageButton ID="cmdEdit" runat="server" CommandName="Edit" AlternateText="Edit" ImageUrl="~/images/edit.gif" />
	                          </ItemTemplate>
	                          <EditItemTemplate>
	                             <asp:ImageButton ID="cmdUpdate" runat="server" CommandName="Update" AlternateText="Update" ImageUrl="~/images/save.gif" />
	                          </EditItemTemplate>
	                       </asp:TemplateColumn>
	                       <asp:BoundColumn DataField="CategoryName" HeaderText="Category" ReadOnly="true"></asp:BoundColumn>
		                   <asp:TemplateColumn HeaderText="Subject" ItemStyle-Width="200px">
		                      <ItemTemplate>
                                 <asp:label runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Subject") %>' CssClass="Normal" ID="lblSubject" Width="200px"/>
		                      </ItemTemplate>
		                      <EditItemTemplate>
                                 <asp:textbox runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Subject") %>' CssClass="NormalTextBox" ID="txtSubject" Width="200px"/>
		                      </EditItemTemplate>
		                   </asp:TemplateColumn>
		                   <asp:TemplateColumn HeaderText="Message" ItemStyle-Width="250px">
		                      <ItemTemplate>
                                 <asp:label runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Message") %>' CssClass="Normal" ID="lblMessage" Width="250px"/>
		                      </ItemTemplate>
		                      <EditItemTemplate>
                                 <asp:textbox runat="server" TextMode="MultiLine" Text='<%#DataBinder.Eval(Container.DataItem, "Message") %>' CssClass="NormalTextBox" ID="txtMessage" Rows="10" Width="250px"/>
		                      </EditItemTemplate>
		                   </asp:TemplateColumn>
		                   <asp:BoundColumn DataField="SenderName" HeaderText="Author" ReadOnly="true"></asp:BoundColumn>
		                   <asp:BoundColumn DataField="SenderEmail" HeaderText="From Email" ReadOnly="true"></asp:BoundColumn>
		                   <asp:BoundColumn DataField="CreatedOnDate" HeaderText="Created Date" ReadOnly="true" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" SortExpression="CreatedOnDate"></asp:BoundColumn>
		                 </Columns>
		              </asp:DataGrid>
		              <dnn:PagingControl id="pgPublicFeedback" runat="server" Mode="PostBack" />
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <br /><br />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                       <dnn:SectionHead ID="scnArchivedFeedback" CssClass="SubHead" runat="server" Text="Archived Feedback" resourcekey="scnArchivedFeedback" Section="trArchived" IncludeRule="True" />
                    </td>
                </tr>
                <tr id="trArchived" runat="server">
                    <td class="Feedback_Moderation_Grid">
                       <asp:DataGrid ID="dgArchiveFeedback" runat="server" AutoGenerateColumns="false" width="100%" 
                               CellPadding="6" GridLines="None" cssclass="DataGrid_Container" AllowSorting="true" >
                         <headerstyle cssclass="NormalBold" verticalalign="Top" horizontalalign="left"/>
                         <itemstyle cssclass="Normal" horizontalalign="left" />
                         <alternatingitemstyle cssclass="Normal" />
                         <edititemstyle cssclass="NormalTextBox" />
                         <selecteditemstyle cssclass="NormalRed" />
                         <footerstyle cssclass="DataGrid_Footer" />
                         <pagerstyle cssclass="DataGrid_Pager" />
                         <Columns>
                           <asp:BoundColumn DataField="FeedbackID" Visible = "false" ReadOnly="true"></asp:BoundColumn>
                           <asp:ButtonColumn ButtonType="LinkButton" Text="SetPublic" CommandName="StatusPublic"></asp:ButtonColumn>
                           <asp:ButtonColumn ButtonType="LinkButton" Text="SetPrivate" CommandName="StatusPrivate"></asp:ButtonColumn>
                           <asp:TemplateColumn>
	                          <ItemTemplate>
	                             <asp:ImageButton ID="cmdPrint" runat="server" CommandName="Print" AlternateText="Print" ImageUrl="~/images/print.gif" />
	                          </ItemTemplate>
	                       </asp:TemplateColumn>
                           <asp:TemplateColumn>
	                          <ItemTemplate>
	                             <asp:ImageButton ID="cmdDelete" runat="server" CommandName="Delete" AlternateText="Delete" ImageUrl="~/images/delete.gif" />
	                          </ItemTemplate>
	                          <EditItemTemplate>
	                             <asp:ImageButton ID="cmdCancel" runat="server" CommandName="Cancel" AlternateText="Cancel" ImageUrl="~/images/cancel.gif" />
	                          </EditItemTemplate>
	                       </asp:TemplateColumn>
	                       <asp:TemplateColumn>
	                          <ItemTemplate>
	                             <asp:ImageButton ID="cmdEdit" runat="server" CommandName="Edit" AlternateText="Edit" ImageUrl="~/images/edit.gif" />
	                          </ItemTemplate>
	                          <EditItemTemplate>
	                             <asp:ImageButton ID="cmdUpdate" runat="server" CommandName="Update" AlternateText="Update" ImageUrl="~/images/save.gif" />
	                          </EditItemTemplate>
	                       </asp:TemplateColumn>
	                       <asp:BoundColumn DataField="CategoryName" HeaderText="Category" ReadOnly="true"></asp:BoundColumn>
		                   <asp:TemplateColumn HeaderText="Subject" ItemStyle-Width="200px">
		                      <ItemTemplate>
                                 <asp:label runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Subject") %>' CssClass="Normal" ID="lblSubject" Width="200px"/>
		                      </ItemTemplate>
		                      <EditItemTemplate>
                                 <asp:textbox runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Subject") %>' CssClass="NormalTextBox" ID="txtSubject" Width="200px"/>
		                      </EditItemTemplate>
		                   </asp:TemplateColumn>
		                   <asp:TemplateColumn HeaderText="Message" ItemStyle-Width="250px">
		                      <ItemTemplate>
                                 <asp:label runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Message") %>' CssClass="Normal" ID="lblMessage" Width="250px"/>
		                      </ItemTemplate>
		                      <EditItemTemplate>
                                 <asp:textbox runat="server" TextMode="MultiLine" Text='<%#DataBinder.Eval(Container.DataItem, "Message") %>' CssClass="NormalTextBox" ID="txtMessage" Rows="10" Width="250px"/>
		                      </EditItemTemplate>
		                   </asp:TemplateColumn>
		                   <asp:BoundColumn DataField="SenderName" HeaderText="Author" ReadOnly="true"></asp:BoundColumn>
		                   <asp:BoundColumn DataField="SenderEmail" HeaderText="From Email" ReadOnly="true"></asp:BoundColumn>
		                   <asp:BoundColumn DataField="CreatedOnDate" HeaderText="Created Date" ReadOnly="true" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" SortExpression="CreatedOnDate"></asp:BoundColumn>
		                 </Columns>
		              </asp:DataGrid>
		              <dnn:PagingControl id="pgArchiveFeedback" runat="server" Mode="PostBack" />
                   </td>
                </tr>
                <tr>
                    <td align="right">
                        <br /><br />
                    </td>
                </tr>
            </table>
       </td>
   </tr>
   <tr>
      <td class="Feedback_Moderation_CommandButtons">
          <asp:linkbutton id="cmdReturn" resourcekey="cmdReturn" runat="server" cssclass="CommandButton" causesvalidation="False">Return</asp:linkbutton>
      </td>
   </tr>
</table>
