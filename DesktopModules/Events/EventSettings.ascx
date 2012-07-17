<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="EventSettings.ascx.vb" Inherits="DotNetNuke.Modules.Events.EventSettings" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" TagPrefix="dnn" %>
<table id="tblMain" cellspacing="0" cellpadding="3" width="100%" border="0">
    <tr>
        <td class="SubHead" valign="top">
            <dnn:SectionHead ID="dshAdminSettings" Text="Admin Settings" CssClass="Head" Section="tblAdminSettings" IncludeRule="True" ResourceKey="AdminSettings" runat="server"></dnn:SectionHead>
            <table id="tblAdminSettings" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td class="SubHead" valign="top" style="width: 300px">
                        <dnn:Label ID="plTimeInterval" Text="Edit Time Interval:" runat="server" ControlName="txtTimeInterval"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:DropDownList ID="ddlTimeInterval" runat="server" CssClass="NormalTextBox" Width="60px">
                            <asp:ListItem Value="30">30</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="lblTimeZone" runat="server"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:DropDownList ID="cboTimeZone" runat="server" CssClass="NormalTextBox">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plAllowRecurring" Text="Event Height/Width:" runat="server" ControlName="txtEventWidth"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkAllowRecurring" runat="server" Checked="True"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plMaxRecurrences" runat="server" Text="Max Generated Occurences:" ControlName="txtMaxRecurrences"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:TextBox ID="txtMaxRecurrences" runat="server" CssClass="NormalTextBox" Width="48px">1000</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plPreventConflicts" Text="Event Height/Width:" runat="server" ControlName="txtEventWidth"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkPreventConflicts" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plLocationConflict" Text="Location Conflict:" runat="server" ControlName="chkLocationConflict"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkLocationConflict" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plEnableSearch" Text="Event Height/Width:" runat="server" ControlName="txtEventWidth"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkEnableSearch" runat="server" Checked="True"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="lblOwnerChangeAllowed" runat="server" Text="Owner Change Allowed" ControlName="lblOwnerChangeAllowed"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkOwnerChangeAllowed" runat="server" Checked="False"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plExpireEvents" runat="server" Text="Expire Events Older Than:" ControlName="txtExpireEvents"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:TextBox ID="txtExpireEvents" runat="server" CssClass="NormalTextBox" Width="32px"></asp:TextBox>&nbsp;
                        <asp:Label ID="plDays" resourcekey="plDays" runat="server">days</asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plPrivateMessage" runat="server" recourcekey="PrivateMessage" Text="Private Calendar Message:" ControlName="txtPrivateMessage"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:TextBox ID="txtPrivateMessage" runat="server" CssClass="NormalTextBox" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plModuleCategory" runat="server" recourcekey="ModuleCategory" Text="Filter Events by Category:" ControlName="ddlModuleCategory"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:DropDownList ID="ddlModuleCategory" runat="server" DataValueField="CategoryName" DataTextField="CategoryName" />
                        <br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <dnn:SectionHead ID="dskLookFeelSettings" Text="Look & Feel Settings" CssClass="Head" Section="tblLookFeelSettings" IncludeRule="True" ResourceKey="LookFeelSettings" runat="server" IsExpanded="False"></dnn:SectionHead>
            <table id="tblLookFeelSettings" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td class="SubHead" valign="top" style="width: 300px">
                        <dnn:Label ID="lblTheme" runat="server" Text="Event Height/Width:" ControlName="txtEventWidth"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <p>
                            <asp:RadioButton GroupName="Theme" ID="rbThemeStandard" runat="server" Text="Standard" Width="150px" />
                            <asp:DropDownList ID="ddlThemeStandard" runat="server" CssClass="NormalTextBox" />
                            <br />
                            <asp:RadioButton GroupName="Theme" ID="rbThemeCustom" runat="server" Text="Custom" Width="150px" />
                            <asp:DropDownList ID="ddlThemeCustom" runat="server" CssClass="NormalTextBox" />
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="lblDefaultView" runat="server" Text="Event Height/Width:" ControlName="txtEventWidth"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:DropDownList ID="ddlDefaultView" runat="server" CssClass="NormalTextBox" Width="178px">
                            <asp:ListItem Value="EventMonth.ascx">Month</asp:ListItem>
                            <asp:ListItem Value="EventWeek.ascx">Week</asp:ListItem>
                            <asp:ListItem Value="EventList.ascx">List</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="lblAllowedViews" recourcekey="lblAllowedViews" runat="server" Text=""></dnn:Label>
                    </td>
                    <td class="SubHead">
                        <asp:CheckBox ID="chkMonthAllowed" runat="server"></asp:CheckBox>
                        |
                        <asp:CheckBox ID="chkWeekAllowed" runat="server"></asp:CheckBox>
                        |
                        <asp:CheckBox ID="chkListAllowed" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="lblEnableContainerSkin" runat="server"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkEnableContainerSkin" runat="server" Checked="true"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="lblCategoriesEnable" runat="server"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkEnableCategories" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plEnableEventNav" Text="Enable Date Navigation Controls" runat="server" ControlName="txtEnableEventNav"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkEnableEventNav" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plImageEnabled" runat="server" Text="Event Height/Width:" ControlName="txtEventWidth"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkImageEnabled" runat="server" Checked="True"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plTZDisplay" runat="server" Text="Event Height/Width:" ControlName="txtEventWidth"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkTZDisplay" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plIconBar" runat="server" Text="Icon Bar:" ControlName="txtIconBar"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:RadioButtonList ID="rblIconBar" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow">
                            <asp:ListItem Value="Top" Selected="True" resourcekey="plIconBarTop"></asp:ListItem>
                            <asp:ListItem Value="Bottom" resourcekey="plIconBarBottom"></asp:ListItem>
                            <asp:ListItem Value="None" resourcekey="plIconBarNone"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plHTMLEmail" runat="server" Text="HTML Email:" ControlName="rblHTMLEmail"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:RadioButtonList ID="rblHTMLEmail" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow">
                            <asp:ListItem Value="Html" Selected="True" resourcekey="plHTMLEmailHtml"></asp:ListItem>
                            <asp:ListItem Value="Auto" resourcekey="plHTMLEmailAuto"></asp:ListItem>
                            <asp:ListItem Value="Text" resourcekey="plHTMLEmailText"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <dnn:SectionHead ID="dskDetailSettings" Text="Detail View Settings" CssClass="Head" Section="tblDetailSettings" IncludeRule="True" ResourceKey="DetailSettings" runat="server" IsExpanded="False"></dnn:SectionHead>
            <table id="tblDetailSettings" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td class="SubHead" valign="top" style="width: 300px">
                        <dnn:Label ID="lblEventDetailNewPage" runat="server"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkEventDetailNewPage" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="lblDetailPageAllowed" runat="server" Text="Set Event Detail Page Allowed" ControlName="lblDetailPageAllowed"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkDetailPageAllowed" runat="server" Checked="False"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="lblEnableEnrollPopup" runat="server" Text="Enable Enroll Popup Validation:" ControlName="lblEnableEnrollPopup"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkEnableEnrollPopup" runat="server" Checked="True"></asp:CheckBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <dnn:SectionHead ID="dskMonthSettings" Text="Month View Settings" CssClass="Head" Section="tblMonthSettings" IncludeRule="True" ResourceKey="MonthSettings" runat="server" IsExpanded="False"></dnn:SectionHead>
            <table id="tblMonthSettings" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td class="SubHead" valign="top" style="width: 300px">
                        <dnn:Label ID="lblMonthCellEvents" runat="server" Text="Enable Month View Cell Events"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkMonthCellEvents" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plShowEventsAlways" Text="Show Events in Next/Prev Month" runat="server" ControlName="txtShowEventsAlways"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkShowEventsAlways" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plFridayWeekend" Text="Event Height/Width:" runat="server" ControlName="txtEventWidth"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkFridayWeekend" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plTimeInTitle" Text="Show Event Start Time in Title" runat="server" ControlName="txtTimeInTitle"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkTimeInTitle" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="lblEventDayNewPage" runat="server" Text="Event Day New Page:" ControlName="txtEventDayNewPage"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkEventDayNewPage" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="lblMonthDaySelect" runat="server" Text="Enable selectable day:" ControlName="chkMonthDaySelect"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkMonthDaySelect" Checked="false" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="lblIconsMonth" runat="server" Text="Show Icons:"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkIconMonthPrio" Checked="true" runat="server"></asp:CheckBox>&nbsp;<asp:Image ID="imgIconMonthPrioHigh" ImageUrl="Images/HighPrio.gif" runat="server"></asp:Image>&nbsp;<asp:Image ID="imgIconMonthPrioLow" ImageUrl="Images/LowPrio.gif" runat="server"></asp:Image><br />
                        <asp:CheckBox ID="chkIconMonthRec" Checked="true" runat="server"></asp:CheckBox>&nbsp;<asp:Image ID="imgIconMonthRec" ImageUrl="Images/rec.gif" runat="server"></asp:Image><br />
                        <asp:CheckBox ID="chkIconMonthReminder" Checked="true" runat="server"></asp:CheckBox>&nbsp;<asp:Image ID="imgIconMonthReminder" ImageUrl="Images/bell.gif" runat="server"></asp:Image><br />
                        <asp:CheckBox ID="chkIconMonthEnroll" Checked="true" runat="server"></asp:CheckBox>&nbsp;<asp:Image ID="imgIconMonthEnroll" ImageUrl="Images/enroll.gif" runat="server"></asp:Image>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="lblEventImageMonth" runat="server" Text=""></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkEventImageMonth" runat="server"></asp:CheckBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <dnn:SectionHead ID="dshWeekSettings" Text="Week View Settings" CssClass="Head" Section="tblWeekSettings" IncludeRule="True" ResourceKey="WeekSettings" runat="server" IsExpanded="False"></dnn:SectionHead>
            <table id="tblWeekSettings" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td class="SubHead" valign="top" style="width: 300px">
                        <dnn:Label ID="lblFullTimeScale" runat="server" Text="Week View Full Time Scale" ControlName="txtFullTimeScale"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkFullTimeScale" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="lblIncludeEndValue" runat="server" Text="Include End Value" ControlName="txtIncludeEndValue"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkIncludeEndValue" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="lblShowValueMarks" runat="server" Text="Week View Value Marks" ControlName="txtShowValueMarks"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkShowValueMarks" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="lblIconsWeek" runat="server" Text="Show Icons:"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkIconWeekPrio" Checked="true" runat="server"></asp:CheckBox>&nbsp;<asp:Image ID="imgIconWeekPrioHigh" ImageUrl="Images/HighPrio.gif" runat="server"></asp:Image>
                        <asp:Image ID="imgIconWeekPrioLow" ImageUrl="Images/LowPrio.gif" runat="server"></asp:Image>
                        <br />
                        <asp:CheckBox ID="chkIconWeekRec" Checked="true" runat="server"></asp:CheckBox>&nbsp;<asp:Image ID="imgIconWeekRec" ImageUrl="Images/rec.gif" runat="server"></asp:Image><br />
                        <asp:CheckBox ID="chkIconWeekReminder" Checked="true" runat="server"></asp:CheckBox>&nbsp;<asp:Image ID="imgIconWeekReminder" ImageUrl="Images/bell.gif" runat="server"></asp:Image>
                        <br />
                        <asp:CheckBox ID="chkIconWeekEnroll" Checked="true" runat="server"></asp:CheckBox>&nbsp;<asp:Image ID="imgIconWeekEnroll" ImageUrl="Images/enroll.gif" runat="server"></asp:Image>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="lblEventImageWeek" runat="server" Text=""></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkEventImageWeek" runat="server"></asp:CheckBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <dnn:SectionHead ID="dshListSettings" Text="Event List Settings" CssClass="Head" Section="tblEventListSettings" IncludeRule="True" ResourceKey="EventListSettings" runat="server" IsExpanded="False"></dnn:SectionHead>
            <table id="tblEventListSettings" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td class="SubHead" valign="top" style="width: 300px">
                        <dnn:Label ID="plShowHeader" Text="Show Table Header:" runat="server" ControlName="rblShowHeader"></dnn:Label>
                    </td>
                    <td class="SubHead" style="white-space: nowrap" colspan="2">
                        <asp:RadioButtonList ID="rblShowHeader" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Value="Yes" Selected="True" resourcekey="plYes">Yes</asp:ListItem>
                            <asp:ListItem Value="No" resourcekey="plNo">No</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plSelectedDays" Text="Selected Days:" runat="server" ControlName="rblSelectionTypeDays"></dnn:Label>
                    </td>
                    <td class="SubHead" style="width: 28px; white-space: nowrap" valign="top" align="left">
                        <input id="rblSelectionTypeDays" type="radio" value="DAYS" name="rblSelectionType" runat="server" />
                    </td>
                    <td class="SubHead" style="white-space: nowrap;" valign="top">
                        <asp:TextBox ID="txtDaysBefore" runat="server" CssClass="NormalTextBox" Width="32px">1</asp:TextBox><asp:Label ID="Label4" resourcekey="plDaysBeforeCurrent" runat="server" EnableViewState="False">days before current date</asp:Label><br />
                        <asp:TextBox ID="txtDaysAfter" runat="server" CssClass="NormalTextBox" Width="32px">7</asp:TextBox><asp:Label ID="Label8" resourcekey="plDaysAfterCurrent" runat="server" EnableViewState="False">days after current date</asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plSelectedNumEvents" Text="Select Number of Events:" runat="server" ControlName="rblSelectionTypeEvents"></dnn:Label>
                    </td>
                    <td class="SubHead" style="white-space: nowrap" valign="top" align="left">
                        <input id="rblSelectionTypeEvents" type="radio" value="EVENTS" name="rblSelectionType" runat="server" checked />
                    </td>
                    <td class="SubHead" style="white-space: nowrap" valign="top">
                        <asp:Label ID="Label5" resourcekey="plNext" runat="server" EnableViewState="False">Next</asp:Label>&nbsp;
                        <asp:TextBox ID="txtNumEvents" runat="server" CssClass="NormalTextBox" Width="32px">10</asp:TextBox><asp:Label ID="Label6" resourcekey="plEventsCurrentDate" runat="server" EnableViewState="False">events from current date</asp:Label><br />
                        <asp:Label ID="Label9" resourcekey="plWithinNext" runat="server" EnableViewState="False">within the next</asp:Label><asp:TextBox ID="txtEventDays" runat="server" CssClass="NormalTextBox" Width="40px">365</asp:TextBox><asp:Label ID="Label10" resourcekey="plDays" runat="server" EnableViewState="False">days</asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plEventsFields" Text="Select the Events Fields to Display:" runat="server" ControlName="tblListColumns"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top" style="white-space: nowrap" align="left" colspan="2">
                        <table id="tblListColumns" cellspacing="0" cellpadding="2" border="0">
                            <tr>
                                <td class="NormalBold" align="center">
                                    <asp:Label ID="plAvailable" resourcekey="plAvailable" runat="server" EnableViewState="False">Available</asp:Label>
                                </td>
                                <td align="center">
                                    &nbsp;
                                </td>
                                <td class="NormalBold" align="center">
                                    <asp:Label ID="plSelected" resourcekey="plSelected" runat="server" EnableViewState="False">Selected</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" align="center">
                                    <asp:ListBox class="NormalTextBox" ID="lstAvailable" runat="server" Width="200px" SelectionMode="Multiple" Height="150px"></asp:ListBox>
                                </td>
                                <td valign="middle" align="center">
                                    <table id="Table3" cellspacing="0" cellpadding="0" border="0">
                                        <tr>
                                            <td valign="top" align="center">
                                                <asp:LinkButton ID="cmdAdd" CssClass="CommandButton" runat="server" EnableViewState="False" Text="&nbsp;>&nbsp;"></asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" align="center">
                                                <asp:LinkButton ID="cmdRemove" CssClass="CommandButton" runat="server" EnableViewState="False" Text="&nbsp;<&nbsp;"></asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="bottom" align="center">
                                                <asp:LinkButton ID="cmdAddAll" CssClass="CommandButton" runat="server" EnableViewState="False" Text="&nbsp;>>&nbsp;"></asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="bottom" align="center">
                                                <asp:LinkButton ID="cmdRemoveAll" CssClass="CommandButton" runat="server" EnableViewState="False" Text="&nbsp;<<&nbsp;"></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td valign="top" align="center">
                                    <asp:ListBox class="NormalTextBox" ID="lstAssigned" runat="server" Width="200px" SelectionMode="Multiple" Height="150px"></asp:ListBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plListPageSize" Text="Page size:" runat="server" />
                    </td>
                    <td class="SubHead" valign="top" style="white-space: nowrap" align="left" colspan="2">
                        <asp:DropDownList ID="ddlPageSize" CssClass="NormalTextBox" Width="200px" runat="server">
                            <asp:ListItem Text="10" Value="10" />
                            <asp:ListItem Text="20" Value="20" />
                            <asp:ListItem Text="50" Value="50" />
                            <asp:ListItem Text="100" Value="100" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plListDefaultSort" Text="Default sorting:" runat="server" />
                    </td>
                    <td class="SubHead" valign="top" style="white-space: nowrap" align="left" colspan="2">
                        <asp:DropDownList ID="ddlListSortedFieldDirection" CssClass="NormalTextBox" Width="200px" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plListDefaultColumn" Text="Default sort column:" runat="server" />
                    </td>
                    <td class="SubHead" valign="top" style="white-space: nowrap" align="left" colspan="2">
                        <asp:DropDownList ID="ddlListDefaultColumn" CssClass="NormalTextBox" Width="200px" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="lblCollapseRecurring" runat="server" Text="Collapse Recurring" ControlName="txtCollapseRecurring"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkCollapseRecurring" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="lblIconsList" runat="server" Text="Show Icons:"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top" colspan="2">
                        <asp:CheckBox ID="chkIconListPrio" Checked="true" runat="server"></asp:CheckBox>&nbsp;<asp:Image ID="imgIconListPrioHigh" ImageUrl="Images/HighPrio.gif" runat="server"></asp:Image>
                        <asp:Image ID="imgIconListPrioLow" ImageUrl="Images/LowPrio.gif" runat="server"></asp:Image>
                        <br />
                        <asp:CheckBox ID="chkIconListRec" Checked="true" runat="server"></asp:CheckBox>&nbsp;<asp:Image ID="imgIconListRec" ImageUrl="Images/rec.gif" runat="server"></asp:Image><br />
                        <asp:CheckBox ID="chkIconListReminder" Checked="true" runat="server"></asp:CheckBox>&nbsp;<asp:Image ID="imgIconListReminder" ImageUrl="Images/bell.gif" runat="server"></asp:Image>
                        <br />
                        <asp:CheckBox ID="chkIconListEnroll" Checked="true" runat="server"></asp:CheckBox>&nbsp;<asp:Image ID="imgIconListEnroll" ImageUrl="Images/enroll.gif" runat="server"></asp:Image>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <dnn:SectionHead ID="dshEventEmailSettings" Text="Event Email Settings" CssClass="Head" Section="tblEventEmailSettings" IncludeRule="True" ResourceKey="EventEmailSettings" runat="server" IsExpanded="False"></dnn:SectionHead>
            <table id="tblEventEmailSettings" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td class="SubHead" valign="top" style="width: 300px;">
                        <dnn:Label ID="lblNewEventEmail" runat="server" Text="Send New Event Email" ControlName="lblNewEventEmail"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tr>
                                <td>
                                    <asp:RadioButtonList ID="rblNewEventEmail" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow">
                                        <asp:ListItem Value="Never" Selected="True" resourcekey="plNewEventEmailNever"></asp:ListItem>
                                        <asp:ListItem Value="Subscribe" resourcekey="plNewEventEmailSubscribe"></asp:ListItem>
                                        <asp:ListItem Value="Role" resourcekey="plNewEventEmailRole"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td class="SubHead" valign="bottom">
                                    <asp:DropDownList ID="ddNewEventEmailRoles" AutoPostBack="False" runat="server" Width="300px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top" style="width: 300px;">
                        <dnn:Label ID="plNewPerEventEmail" Text="Allow New Per Event Email:" runat="server" ControlName="plNewPerEventEmail"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkNewPerEventEmail" runat="server" Checked="False"></asp:CheckBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <dnn:SectionHead ID="dshNotificationSettings" Text="Reminder Settings" CssClass="Head" Section="tblNotificationSettings" IncludeRule="True" ResourceKey="NotificationSettings" runat="server" IsExpanded="False"></dnn:SectionHead>
            <table id="tblNotificationSettings" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td>
                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tr>
                                <td class="SubHead" valign="top" style="width: 300px;">
                                    <dnn:Label ID="plShowEventNotify" Text="Allow Event Reminders" runat="server" ControlName="plShowEventNotify"></dnn:Label>
                                </td>
                                <td class="SubHead" valign="top">
                                    <asp:CheckBox ID="chkEventNotify" runat="server" Checked="True"></asp:CheckBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table id="tblEventNotify" runat="server"  cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tr>
                                <td class="SubHead" valign="top" style="width: 300px;">
                                    <dnn:Label ID="lblNotifyAnon" runat="server" Text="Remind Anonymous" ControlName="lblNotifyAnon"></dnn:Label>
                                </td>
                                <td class="SubHead" valign="top">
                                    <asp:CheckBox ID="chkNotifyAnon" runat="server" Checked="True"></asp:CheckBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="SubHead" valign="top">
                                    <dnn:Label ID="lblSendReminderDefault" runat="server" Text="Reminder Default Value" ControlName="lblSendReminderDefault"></dnn:Label>
                                </td>
                                <td class="SubHead" valign="top">
                                    <asp:CheckBox ID="chkSendReminderDefault" runat="server" Checked="False"></asp:CheckBox>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td class="SubHead">
                                    <dnn:Label ID="lblReminderFrom" runat="server" Text="Reminder Email From:" ControlName="txtReminderFrom"></dnn:Label>
                                </td>
                                <td class="SubHead" valign="top">
                                    <asp:TextBox ID="txtReminderFrom" runat="server" MaxLength="100" Wrap="False" CssClass="NormalTextBox" Width="300px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="valReminderFrom" runat="server" ControlToValidate="txtReminderFrom" ErrorMessage="Valid Email Address required" resourcekey="valReminderFrom" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <dnn:SectionHead ID="dshEnrollmentSettings" Text="Enrollment Settings" CssClass="Head" Section="tblEnrollmentSettings" IncludeRule="True" ResourceKey="EnrollmentSettings" runat="server" IsExpanded="False"></dnn:SectionHead>
            <table id="tblEnrollmentSettings" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td>
                        <table cellspacing="0" cellpadding="2" width="100%" border="0">
                            <tr>
                                <td>
                                    <table  cellspacing="0" cellpadding="0" width="100%" border="0">
                                        <tr>
                                            <td class="SubHead" valign="top" style="width: 300px">
                                                <dnn:Label ID="plEnrollment" Text="" runat="server" ControlName="chkEventSignup"></dnn:Label>
                                            </td>
                                            <td class="SubHead" valign="top" >
                                                <asp:CheckBox ID="chkEventSignup" runat="server" Checked="True"></asp:CheckBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="tblEventSignup" runat="server"  cellspacing="0" cellpadding="0" width="100%" border="0">
                                        <tr>
                                            <td class="SubHead" valign="top"  style="width: 300px">
                                                <dnn:Label ID="plPayPal" Text="PayPal Account (paid enrollments):" runat="server" ControlName="txtPayPalAccount"></dnn:Label>
                                            </td>
                                            <td class="SubHead" valign="top">
                                                <asp:TextBox ID="txtPayPalAccount" runat="server" CssClass="NormalTextBox" Wrap="False" MaxLength="100" Width="300px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SubHead" valign="top">
                                                <dnn:Label ID="plPayPalURL" Text="PayPal Account (paid enrollments):" runat="server" ControlName="txtPayPalAccount"></dnn:Label>
                                            </td>
                                            <td class="SubHead" valign="top">
                                                <asp:TextBox ID="txtPayPalURL" runat="server" CssClass="NormalTextBox" Width="300px">https://www.paypal.com</asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SubHead" valign="top">
                                                <dnn:Label ID="plDefaultEnrollView" Text="Display Enroll List by Default:" runat="server" ControlName="chkDefaultEnrollView"></dnn:Label>
                                            </td>
                                            <td class="SubHead" valign="top">
                                                <asp:CheckBox ID="chkDefaultEnrollView" runat="server" Checked="False"></asp:CheckBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SubHead" valign="top">
                                                <dnn:Label ID="plHideFullEnroll" Text="Hide Full enrolled events:" runat="server" ControlName="chkHideFullEnroll"></dnn:Label>
                                            </td>
                                            <td class="SubHead" valign="top">
                                                <asp:CheckBox ID="chkHideFullEnroll" runat="server" Checked="False"></asp:CheckBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SubHead" valign="top">
                                                <dnn:Label ID="plMaxNoEnrolees" Text="Allow Multiple Enrolees:" runat="server" ControlName="txtMaxNoEnrolees"></dnn:Label>
                                            </td>
                                            <td class="SubHead" valign="top">
                                                <asp:TextBox ID="txtMaxNoEnrolees" runat="server" CssClass="NormalTextBox" Width="40px">1</asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SubHead" valign="top">
                                                <dnn:Label ID="plCancelDays" Text="Cancel Before Days:" runat="server" ControlName="txtCancelDays"></dnn:Label>
                                            </td>
                                            <td class="SubHead" valign="top">
                                                <asp:TextBox ID="txtCancelDays" runat="server" CssClass="NormalTextBox" Width="40px">0</asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SubHead" valign="top">
                                                <dnn:Label ID="plEnrollColumns" Text="Select the User Fields to display:" runat="server" ControlName="tblEnrollColumns"></dnn:Label>
                                            </td>
                                            <td>
                                                <table id="tblEnrollColumns" cellspacing="0" cellpadding="2" border="0" style="width:400px">
                                                    <tr align="center">
                                                        <td align="left" class="NormalBold" style="width: 30%">
                                                            <asp:Label ID="plEnVisibility" resourcekey="plEnVisibility" runat="server" EnableViewState="False">Visibility</asp:Label>
                                                        </td>
                                                        <td style="width:15%" class="NormalBold">
                                                            <asp:Label ID="plEnNone" resourcekey="plEnNone" runat="server" EnableViewState="False">None</asp:Label>
                                                        </td>
                                                        <td style="width:15%" class="NormalBold">
                                                            <asp:Label ID="plEnEditors" resourcekey="plEnEditors" runat="server" EnableViewState="False">Editors</asp:Label>
                                                        </td>
                                                        <td style="width:15%" class="NormalBold">
                                                            <asp:Label ID="plEnViewers" resourcekey="plEnViewers" runat="server" EnableViewState="False">Viewers</asp:Label>
                                                        </td>
                                                        <td style="width:15%" class="NormalBold">
                                                            <asp:Label ID="plEnAnon" resourcekey="plEnAnon" runat="server" EnableViewState="False">All</asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr align="center">
                                                        <td align="left" class="NormalBold">
                                                            <asp:Label ID="plEnUser" resourcekey="plEnUser" runat="server" EnableViewState="False">User Name</asp:Label>
                                                        </td>
                                                        <td>
                                                            <input id="rblEnUserNone" type="radio" name="rblEnUser" runat="server" />
                                                        </td>
                                                        <td>
                                                            <input id="rblEnUserEdit" type="radio" name="rblEnUser" runat="server" />
                                                        </td>
                                                        <td>
                                                            <input id="rblEnUserView" type="radio" name="rblEnUser" runat="server" />
                                                        </td>
                                                        <td>
                                                            <input id="rblEnUserAnon" type="radio" name="rblEnUser" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr align="center">
                                                        <td align="left" class="NormalBold">
                                                            <asp:Label ID="plEnDisp" resourcekey="plEnDisp" runat="server" EnableViewState="False">Display Name</asp:Label>
                                                        </td>
                                                        <td>
                                                            <input id="rblEnDispNone" type="radio" name="rblEnDisp" runat="server" />
                                                        </td>
                                                        <td>
                                                            <input id="rblEnDispEdit" type="radio" name="rblEnDisp" runat="server" />
                                                        </td>
                                                        <td>
                                                            <input id="rblEnDispView" type="radio" name="rblEnDisp" runat="server" />
                                                        </td>
                                                        <td>
                                                            <input id="rblEnDispAnon" type="radio" name="rblEnDisp" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr align="center">
                                                        <td align="left" class="NormalBold">
                                                            <asp:Label ID="plEnEmail" resourcekey="plEnEmail" runat="server" EnableViewState="False">Email Address</asp:Label>
                                                        </td>
                                                        <td>
                                                            <input id="rblEnEmailNone" type="radio" name="rblEnEmail" runat="server" />
                                                        </td>
                                                        <td>
                                                            <input id="rblEnEmailEdit" type="radio" name="rblEnEmail" runat="server" />
                                                        </td>
                                                        <td>
                                                            <input id="rblEnEmailView" type="radio" name="rblEnEmail" runat="server" />
                                                        </td>
                                                        <td>
                                                            <input id="rblEnEmailAnon" type="radio" name="rblEnEmail" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr align="center">
                                                        <td align="left" class="NormalBold">
                                                            <asp:Label ID="plEnPhone" resourcekey="plEnPhone" runat="server" EnableViewState="False">Phone No</asp:Label>
                                                        </td>
                                                        <td>
                                                            <input id="rblEnPhoneNone" type="radio" name="rblEnPhone" runat="server" />
                                                        </td>
                                                        <td>
                                                            <input id="rblEnPhoneEdit" type="radio" name="rblEnPhone" runat="server" />
                                                        </td>
                                                        <td>
                                                            <input id="rblEnPhoneView" type="radio" name="rblEnPhone" runat="server" />
                                                        </td>
                                                        <td>
                                                            <input id="rblEnPhoneAnon" type="radio" name="rblEnPhone" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr align="center">
                                                        <td align="left" class="NormalBold">
                                                            <asp:Label ID="plEnApprove" resourcekey="plEnApprove" runat="server" EnableViewState="False">Approved</asp:Label>
                                                        </td>
                                                        <td>
                                                            <input id="rblEnApproveNone" type="radio" name="rblEnApprove" runat="server" />
                                                        </td>
                                                        <td>
                                                            <input id="rblEnApproveEdit" type="radio" name="rblEnApprove" runat="server" />
                                                        </td>
                                                        <td>
                                                            <input id="rblEnApproveView" type="radio" name="rblEnApprove" runat="server" />
                                                        </td>
                                                        <td>
                                                            <input id="rblEnApproveAnon" type="radio" name="rblEnApprove" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr align="center">
                                                        <td align="left" class="NormalBold">
                                                            <asp:Label ID="plEnNo" resourcekey="plEnNo" runat="server" EnableViewState="False">No. Enrolled</asp:Label>
                                                        </td>
                                                        <td>
                                                            <input id="rblEnNoNone" type="radio" name="rblEnNo" runat="server" />
                                                        </td>
                                                        <td>
                                                            <input id="rblEnNoEdit" type="radio" name="rblEnNo" runat="server" />
                                                        </td>
                                                        <td>
                                                            <input id="rblEnNoView" type="radio" name="rblEnNo" runat="server" />
                                                        </td>
                                                        <td>
                                                            <input id="rblEnNoAnon" type="radio" name="rblEnNo" runat="server" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <dnn:SectionHead ID="dshModerationSettings" Text="Moderation Settings" CssClass="Head" Section="tblModerationSettings" IncludeRule="True" ResourceKey="ModerationSettings" runat="server" IsExpanded="False"></dnn:SectionHead>
            <table id="tblModerationSettings" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td class="SubHead" valign="top" style="width: 300px">
                        <dnn:Label ID="plModerateAll" Text="Moderate ALL Event/Enrollment Changes" runat="server" ControlName="chkModerateAll"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkModerateAll" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="SubHead">
                        <dnn:Label ID="lblModeratorEmail" runat="server" Text="PayPal Account (paid enrollments):" ControlName="txtPayPalAccount"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:TextBox ID="txtModeratorEmail" runat="server" MaxLength="100" Wrap="False" CssClass="NormalTextBox" Width="300px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <dnn:SectionHead ID="dshMasterSettings" Text="Master Settings" CssClass="Head" Section="tblMasterSettings" IncludeRule="True" ResourceKey="MasterSettings" runat="server" IsExpanded="False"></dnn:SectionHead>
            <table id="tblMasterSettings" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td>
                        <table cellspacing="0" cellpadding="2" border="0" width="100%">
                            <tr>
                                <td>
                                    <table  cellspacing="0" cellpadding="0" width="100%" border="0">
                                        <tr>
                                            <td class="SubHead" valign="top" style="width: 300px">
                                                <dnn:Label ID="plMaster" Text="Master Event" runat="server" ControlName="chkMasterEvent"></dnn:Label>
                                            </td>
                                            <td class="SubHead" valign="top">
                                                <asp:CheckBox ID="chkMasterEvent" runat="server" AutoPostBack="True"></asp:CheckBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="tblMasterEvent" runat="server"  cellspacing="0" cellpadding="0" width="100%" border="0">
                                        <tr>
                                            <td class="SubHead" valign="top" style="width: 300px">
                                                <dnn:Label ID="lblAddSubModuleName" runat="server" Text="Master Event" ControlName="chkMasterEvent"></dnn:Label>
                                            </td>
                                            <td class="SubHead" valign="top">
                                                <asp:CheckBox ID="chkAddSubModuleName" runat="server" Checked="True"></asp:CheckBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SubHead" valign="top">
                                                <dnn:Label ID="lblEnforceSubCalPerms" runat="server" Text="Enforce View Permissions" ControlName="chkEnforceSubCalPerms"></dnn:Label>
                                            </td>
                                            <td class="SubHead" valign="top">
                                                <asp:CheckBox ID="chkEnforceSubCalPerms" runat="server" Checked="True"></asp:CheckBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SubHead" valign="top">
                                                <dnn:Label ID="plSubEvent" Text="Add/Remove Sub-Calendars:" runat="server" ControlName="ddlPortalEvents"></dnn:Label>
                                            </td>
                                            <td>
                                                <table cellspacing="0" cellpadding="2" border="0">
                                                    <tr>
                                                        <td class="NormalBold" align="center">
                                                            <asp:Label ID="plAvailableCals" resourcekey="plAvailableCals" runat="server" EnableViewState="False">Available</asp:Label>
                                                        </td>
                                                        <td align="center">
                                                            &nbsp;
                                                        </td>
                                                        <td class="NormalBold" align="center">
                                                            <asp:Label ID="plSelectedCals" resourcekey="plSelectedCals" runat="server" EnableViewState="False">Selected</asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="top" align="center">
                                                            <asp:ListBox class="NormalTextBox" ID="lstAvailableCals" runat="server" Width="200px" SelectionMode="Multiple" Height="150px"></asp:ListBox>
                                                        </td>
                                                        <td valign="middle" align="center">
                                                            <table id="Table2" cellspacing="0" cellpadding="0" border="0">
                                                                <tr>
                                                                    <td valign="top" align="center">
                                                                        <asp:LinkButton ID="cmdAddCals" CssClass="CommandButton" runat="server" EnableViewState="False" Text="&nbsp;>&nbsp;"></asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td valign="top" align="center">
                                                                        <asp:LinkButton ID="cmdRemoveCals" CssClass="CommandButton" runat="server" EnableViewState="False" Text="&nbsp;<&nbsp;"></asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td valign="bottom" align="center">
                                                                        <asp:LinkButton ID="cmdAddAllCals" CssClass="CommandButton" runat="server" EnableViewState="False" Text="&nbsp;>>&nbsp;"></asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td valign="bottom" align="center">
                                                                        <asp:LinkButton ID="cmdRemoveAllCals" CssClass="CommandButton" runat="server" EnableViewState="False" Text="&nbsp;<<&nbsp;"></asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td valign="top" align="center">
                                                            <asp:ListBox class="NormalTextBox" ID="lstAssignedCals" runat="server" Width="200px" SelectionMode="Multiple" Height="150px"></asp:ListBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <dnn:SectionHead ID="dshCustomFields" runat="server" ResourceKey="CustomFields" IncludeRule="True" Section="tblCustomFields" CssClass="Head" Text="Custom Fields" IsExpanded="False"></dnn:SectionHead>
            <table id="tblCustomFields" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td class="SubHead" valign="top" style="width: 300px">
                        <dnn:Label ID="plCustomField1" Text="Display Custom Field 1" runat="server" ControlName="chkCustomField1"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top" style="white-space: nowrap; width: 10px">
                        <asp:CheckBox ID="chkCustomField1" runat="server"></asp:CheckBox>
                    </td>
                    <td class="SubHead" valign="top" style="white-space: nowrap">
                        <p>
                            <asp:Label ID="lblCustomField1" runat="server" CssClass="SubHead" resourcekey="plCustomField">Set name in Admin/Languages</asp:Label></p>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plCustomField2" Text="Display Custom Field 2" runat="server" ControlName="chkCustomField2"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkCustomField2" runat="server"></asp:CheckBox>
                    </td>
                    <td class="SubHead" valign="top" style="white-space: nowrap">
                        <p>
                            <asp:Label ID="lblCustomField2" runat="server" CssClass="SubHead" resourcekey="plCustomField">Set name in Admin/Languages</asp:Label></p>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <dnn:SectionHead ID="dshTootipSettings" runat="server" ResourceKey="TooltipSettings" IncludeRule="True" Section="tblTooltipSettings" CssClass="Head" Text="Tooltip Settings" IsExpanded="False"></dnn:SectionHead>
            <table id="tblTooltipSettings" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td class="SubHead" valign="top" style="width: 300px">
                        <dnn:Label ID="plToolTipMonth" Text="Display Month View Tooltip:" runat="server" ControlName="chkToolTipMonth"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkToolTipMonth" runat="server" Checked="True"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top" style="width: 300px">
                        <dnn:Label ID="plToolTipWeek" Text="Display Week View Tooltip:" runat="server" ControlName="chkToolTipWeek"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkToolTipWeek" runat="server" Checked="True"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top" style="width: 300px">
                        <dnn:Label ID="plToolTipDay" Text="Display Day View Tooltip:" runat="server" ControlName="chkToolTipDay"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkToolTipDay" runat="server" Checked="True"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top" style="width: 300px">
                        <dnn:Label ID="plToolTipList" Text="Display List View Tooltip:" runat="server" ControlName="chkToolTipList"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:CheckBox ID="chkToolTipList" runat="server" Checked="True"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label ID="plTooltipLength" Text="Tooltip Length:" runat="server" ControlName="txtTooltipLength"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:TextBox ID="txtTooltipLength" runat="server" CssClass="NormalTextBox" Width="60px">10000</asp:TextBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <dnn:SectionHead ID="dshRSSSettings" runat="server" ResourceKey="RSSSettings" IncludeRule="True" Section="tblRSSSettings" CssClass="Head" Text="RSS Settings" IsExpanded="False"></dnn:SectionHead>
            <table id="tblRSSSettings" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td>
                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tr>
                                <td class="SubHead" valign="top" style="width: 300px">
                                    <dnn:Label ID="plRSSEnable" Text="Enable RSS:" runat="server" ControlName="chkRSSEnable"></dnn:Label>
                                </td>
                                <td class="SubHead" valign="top" style="white-space: nowrap">
                                    <asp:CheckBox ID="chkRSSEnable" runat="server"></asp:CheckBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table id="tblRSSEnable" runat="server"  cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tr>
                                <td class="SubHead" valign="top"  style="width: 300px">
                                    <dnn:Label ID="plRSSDateField" Text="Date to use:" runat="server" ControlName="ddlRSSDateField"></dnn:Label>
                                </td>
                                <td class="SubHead" valign="top" style="white-space: nowrap" align="left">
                                    <asp:DropDownList ID="ddlRSSDateField" CssClass="NormalTextBox" Width="200px" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="SubHead" valign="top">
                                    <dnn:Label ID="plRSSDays" Text="Days to include:" runat="server" ControlName="txtRSSDays"></dnn:Label>
                                </td>
                                <td class="SubHead" valign="top" style="white-space: nowrap">
                                    <asp:TextBox ID="txtRSSDays" runat="server" CssClass="NormalTextBox" Width="40px">365</asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="SubHead" valign="top">
                                    <dnn:Label ID="plRSSTitle" Text="Feed Title:" runat="server" ControlName="txtRSSTitle"></dnn:Label>
                                </td>
                                <td class="SubHead" valign="top">
                                    <asp:TextBox ID="txtRSSTitle" runat="server" CssClass="NormalTextBox" Width="100%">Enter title</asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="SubHead" valign="top">
                                    <dnn:Label ID="plRSSDesc" Text="Feed Description:" runat="server" ControlName="txtRSSDesc"></dnn:Label>
                                </td>
                                <td class="SubHead" valign="top">
                                    <asp:TextBox ID="txtRSSDesc" runat="server" CssClass="NormalTextBox" Width="100%">Enter description</asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <dnn:SectionHead ID="dshvCalSettings" runat="server" ResourceKey="vCalSettings" IncludeRule="True" Section="tblvCalSettings" CssClass="Head" Text="Calendar Export Settings" IsExpanded="False"></dnn:SectionHead>
            <table id="tblvCalSettings" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td class="SubHead" valign="top" style="width: 300px">
                        <dnn:Label ID="plExportOwnerEmail" Text="Owner Email Address Export:" runat="server" ControlName="chkExportOwnerEmail"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top" style="white-space: nowrap">
                        <asp:CheckBox ID="chkExportOwnerEmail" runat="server" Checked="False"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top" style="width: 230px">
                        <dnn:Label ID="plExportAnonOwnerEmail" Text="Owner Email for Unregistered User:" runat="server" ControlName="chkExportAnonOwnerEmail"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top" style="white-space: nowrap">
                        <asp:CheckBox ID="chkExportAnonOwnerEmail" runat="server" Checked="False"></asp:CheckBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <dnn:SectionHead ID="dshTemplateSettings" runat="server" ResourceKey="TemplateSettings" IncludeRule="True" Section="tblTemplateSettings" CssClass="Head" Text="Template Settings" IsExpanded="False"></dnn:SectionHead>
            <table id="tblTemplateSettings" cellspacing="0" cellpadding="2" width="100%" border="0" runat="server">
                <tr>
                    <td class="SubHead" valign="top" style="width: 240px; height: 30px;">
                        <dnn:Label ID="plTemplates" runat="server" Text="Event Templates" ControlName="ddlTemplates"></dnn:Label>
                        <a runat="server" id="lnkTemplatesHelp" target="_blank">Help</a>
                    </td>
                    <td class="SubHead" valign="top">
                        <asp:DropDownList ID="ddlTemplates" runat="server" AutoPostBack="true" CssClass="NormalTextBox">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" colspan="2" valign="top">
                        <asp:TextBox ID="txtEventTemplate" runat="server" TextMode="MultiLine" Width="95%" Height="300px">
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top" align="left" colspan="2">
                        <dnn:CommandButton ID="cmdUpdateTemplate" ResourceKey="cmdUpdateTemplate" runat="server" CssClass="CommandButton" imageurl="~/images/save.gif" EnableViewState="False" />&nbsp;
                        <dnn:CommandButton ID="cmdResetTemplate" ResourceKey="cmdResetTemplate" runat="server" CssClass="CommandButton" imageurl="~/images/restore.gif" EnableViewState="False" />&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblTemplateUpdated" runat="server" CssClass="SubHead" Visible="false">Template Updated</asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="SubHead" colspan="3">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" Width="100%"></asp:ValidationSummary>
            <dnn:CommandButton ID="updateButton" ResourceKey="updateButton" runat="server" CssClass="CommandButton" imageurl="~/images/save.gif" />&nbsp;
            <dnn:CommandButton ID="cancelButton" ResourceKey="cancelButton" runat="server" CssClass="CommandButton" imageurl="~/images/cancel.gif" CausesValidation="False" />&nbsp;
        </td>
    </tr>
</table>
