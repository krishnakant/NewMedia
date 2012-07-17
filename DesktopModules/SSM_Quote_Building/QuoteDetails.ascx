<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QuoteDetails.ascx.cs"
    Inherits="Philip.Modules.SSM_Quote_Building.QuoteDetails" %>
<style type="text/css">
    .stepheading
    {
        font-size: 12pt;
        text-align: left;
    }
    .location
    {
        font-size: 11pt;
        color: #A91D24;
    }
</style>
<div id="container">
    <!--subcontainer start here-->
    <div class="subcontainer">
        <!--ouraudience_content start here-->
        <div class="ouraudience_content">
            <table class="googlemap" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="stepheading" colspan="2">
                        Step 1:Pick Schools > Step 2: Campaign Details ><b> Step 3: Quote Details</b>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <img alt="" style="width: 20px; height: 30px;" src="/ssm_dnn/portals/3/space.gif" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table border="0" cellspacing="7" cellpadding="0">
                            <tr>
                                <td class="stepheading" valign="top">
                                    Enter Your Name:
                                </td>
                                <td class="stepheading" valign="top">
                                    <asp:TextBox ID="txtName" runat="server" />
                                </td>
                                <td class="stepheading" valign="top">
                                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="stepheading" valign="top">
                                    Title:
                                </td>
                                <td class="stepheading" valign="top">
                                    <asp:TextBox ID="txtTitle" runat="server" />
                                </td>
                                <td class="stepheading" valign="top">
                                    <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="stepheading" valign="top">
                                    Company:
                                </td>
                                <td class="stepheading" valign="top">
                                    <asp:TextBox ID="txtCompanyName" runat="server" />
                                </td>
                                <td class="stepheading" valign="top">
                                    <asp:RequiredFieldValidator ID="rfvCompany" runat="server" ControlToValidate="txtCompanyName"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="stepheading" valign="top">
                                    Email Address:<br />
                                    <span style="font-size: 7pt; color: #F69;">(This is where we'll send the quote.)</span>
                                </td>
                                <td class="stepheading" valign="top">
                                    <asp:TextBox ID="txtEmailAddress" runat="server" />
                                </td>
                                <td class="stepheading" valign="top">
                                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmailAddress"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="rfvEmailExpression" runat="server" ControlToValidate="txtEmailAddress"
                                        ErrorMessage="Enter Valid Email Address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="stepheading" valign="top">
                                    Phone No:
                                </td>
                                <td class="stepheading" valign="top">
                                    <asp:TextBox ID="txtPhoneNo" runat="server" />
                                </td>
                                <td class="stepheading" valign="top">
                                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhoneNo"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="stepheading" valign="top">
                                    &nbsp;
                                </td>
                                <td class="stepheading" valign="top">
                                    <asp:Button ID="btnFinish" runat="server" Text="Finish" Width="78px" OnClick="btnFinish_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <img alt="" style="width: 20px; height: 15px;" src="/ssm_dnn/portals/3/space.gif" />
                    </td>
                </tr>
            </table>
            <div class="clr">
                &nbsp;</div>
        </div>
        <!--ouraudience_content start here-->
    </div>
    <!--subcontainer start here-->
</div>
