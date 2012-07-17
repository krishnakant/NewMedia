<%@ Control language="C#" Inherits="Philip.Modules.SSMTestUserControl.ViewSSMTestUserControl" CodeFile="ViewSSMTestUserControl.ascx.cs" AutoEventWireup="true"%>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        font-size: x-large;
    }
</style>
<p>
    &nbsp;</p>
<table class="style1">
    <tr>
        <td style="text-align: center" class="style2">
            All School List</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
        <div id="grd_school"  style="width: 724px; float: right; margin-left: 219px;">
            <asp:GridView ID="grdSchool" runat="server" 
                onrowdatabound="grdSchool_RowDataBound" style="text-align: center">
            </asp:GridView>
            </div> 
        </td>
    </tr>
</table>

