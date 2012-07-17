<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CampaignDetails.ascx.cs"
    Inherits="Philip.Modules.SSM_Quote_Building.CampaignDetails" %>
<style type="text/css">
    .stepheading
    {
        font-size: 12pt;
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
                    <td class="stepheading">
                        Step 1:Pick Schools &gt; <b>Step 2: Campaign Details </b>&gt; Step 3: Quote Details
                    </td>
                </tr>
                <tr>
                    <td>
                        <img alt="" style="width: 20px; height: 30px;" src="/ssm_dnn/portals/3/space.gif" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Tell us about the timing of the advertising you're considering. Our pricing is based
                        on the number of fans you reach, so depending on the schools you've picked, pricing
                        can vary quite a bit over the course of the year (based on the number of games and
                        anticipated fans)
                    </td>
                </tr>
                <tr>
                    <td>
                        <img alt="" style="width: 20px; height: 10px;" src="/ssm_dnn/portals/3/space.gif" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="rdoAnnual" />
                                <asp:AsyncPostBackTrigger ControlID="rdoSeasonal" />
                                <asp:AsyncPostBackTrigger ControlID="rdoMonthly" />
                                <asp:AsyncPostBackTrigger ControlID="chkListMonthly" />
                                <asp:AsyncPostBackTrigger ControlID="chkListSeasonal" />
                                <asp:AsyncPostBackTrigger ControlID="TextBox1" />
                            </Triggers>
                            <ContentTemplate>
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td colspan="2">
                                            <asp:RadioButton ID="rdoAnnual" runat="server" Text="Annual Contract" Font-Size="Medium"
                                                OnCheckedChanged="rdoAnnual_CheckedChanged" AutoPostBack="True" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="height: 25px;">
                                            <img alt="" style="width: 20px; height: 15px;" src="/ssm_dnn/portals/3/space.gif" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="height: 25px;">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:RadioButton ID="rdoSeasonal" runat="server" Text="Seasonal Contract" Font-Size="Medium"
                                                OnCheckedChanged="rdoSeasonal_CheckedChanged" AutoPostBack="True" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td style="padding-left: 15px; height: 25px;">
                                            <div>
                                                <asp:CheckBoxList ID="chkListSeasonal" runat="server" Height="22px" RepeatDirection="Horizontal"
                                                    Font-Size="Small" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="chkListSeasonal_SelectedIndexChanged">
                                                    <asp:ListItem>Fall</asp:ListItem>
                                                    <asp:ListItem>Winter</asp:ListItem>
                                                    <asp:ListItem>Spring</asp:ListItem>
                                                </asp:CheckBoxList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="height: 25px;">
                                            <img alt="" style="width: 20px; height: 15px;" src="/ssm_dnn/portals/3/space.gif" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:RadioButton ID="rdoMonthly" runat="server" Text="Monthly Contract" Font-Size="Medium"
                                                OnCheckedChanged="rdoMonthly_CheckedChanged" AutoPostBack="True" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td style="padding-left: 15px; height: 25px;">
                                            <div>
                                                <asp:CheckBoxList ID="chkListMonthly" runat="server" Height="22px" RepeatDirection="Horizontal"
                                                    Font-Size="Small" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="chkListMonthly_SelectedIndexChanged">
                                                    <asp:ListItem>Jan</asp:ListItem>
                                                    <asp:ListItem>Feb</asp:ListItem>
                                                    <asp:ListItem>Mar</asp:ListItem>
                                                    <asp:ListItem>Apr</asp:ListItem>
                                                    <asp:ListItem>May</asp:ListItem>
                                                    <asp:ListItem>Jun</asp:ListItem>
                                                    <asp:ListItem>Jul</asp:ListItem>
                                                    <asp:ListItem>Aug</asp:ListItem>
                                                    <asp:ListItem>Sep</asp:ListItem>
                                                    <asp:ListItem>Oct</asp:ListItem>
                                                    <asp:ListItem>Nov</asp:ListItem>
                                                    <asp:ListItem>Dec</asp:ListItem>
                                                </asp:CheckBoxList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="height: 25px;">
                                            <img alt="" style="width: 20px; height: 3px;" src="/ssm_dnn/portals/3/space.gif" />
                                        </td>
                                    </tr>
                                </table>
                                <asp:TextBox ID="TextBox1" Style="display: none" runat="server"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td style="height: 25px;">
                        &nbsp;
                        <asp:Button ID="btnNext" runat="server" OnClick="btnNext_Click" Text="Next" UseSubmitBehavior="True" />
                    </td>
                    <td style="height: 25px;">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
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
