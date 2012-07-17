<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="EditEvents.ascx.vb" Inherits="DotNetNuke.Modules.Events.EditEvents" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/texteditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" TagPrefix="dnn" %>
<asp:Panel id="pnlEventsModuleEdit" runat="server">
<style type="text/css">
    .CalIcon {cursor:pointer;}
</style>
<table id="tblMain" cellpadding="2" cellspacing="2" width="90%" border="0">
    <tr>
        <td class="SubHead" valign="top">
            <dnn:SectionHead id="dshEventSettings" resourcekey="EventSettings" includerule="True" section="tblEvent" text="Event Settings"
                cssclass="Head" runat="server">
            </dnn:SectionHead>
            <table id="tblEvent" width="100%" cellpadding="2" cellspacing="2" runat="server">
                <tr>
                    <td class="SubHead"  style="width: 200px;">
                        <dnn:Label id="lblTitle" runat="server">
                        </dnn:Label>
                    </td>
                    <td class="SubHead">
                        <asp:TextBox id="txtTitle" cssclass="NormalTextBox" runat="server" MaxLength="100" Columns="30" width="250px" Font-Size="8pt"></asp:TextBox>
                        <asp:RequiredFieldValidator id="valRequiredTitle" runat="server" cssclass="Normal" resourcekey="valRequiredTitle" ControlToValidate="txtTitle"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator id="valConflict" runat="server" cssclass="Normal"  
                                ControlToValidate="txtP1Every" Visible="False" EnableViewState="false"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator id="valLocationConflict" runat="server" cssclass="Normal" 
                                ControlToValidate="txtP1Every" Visible="False" EnableViewState="false"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label id="lblAllDayEvent" runat="server"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top" style="white-space:nowrap;">
                        <asp:CheckBox id="chkAllDayEvent" runat="server" cssclass="SubHead" ></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead">
                        <dnn:Label id="lblStartDateTime" runat="server">
                        </dnn:Label>
                    </td>
                    <td class="SubHead">
                        <asp:TextBox id="txtStartDate" runat="server" Font-Size="8pt" cssclass="NormalTextBox" width="74px"></asp:TextBox>
                        <asp:Image id="imgStartDate" runat="server" cssclass="CalIcon" EnableViewState="False" ImageUrl="~/DesktopModules/Events/Images/SmallCalendar.gif"></asp:Image>
                        <asp:DropDownList id="cmbStartTime" runat="server" Font-Size="8pt" cssclass="NormalTextBox" width="90px"></asp:DropDownList>
                        <asp:RequiredFieldValidator id="valRequiredStartDate" runat="server" Display="Dynamic" cssclass="Normal" resourcekey="valRequiredStartDate" ControlToValidate="txtStartDate" EnableViewState="false" ValidationGroup="startdate" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:CompareValidator id="valValidStartDate" Operator="GreaterThanEqual" Display="Dynamic" ControlToValidate="txtStartDate"  
                            type="Date" resourcekey="valValidStartDate" runat="server" ValidationGroup="startdate" SetFocusOnError="True"></asp:CompareValidator>
                        <asp:RequiredFieldValidator id="valValidRecurStartDate" runat="server" cssclass="Normal" resourcekey="valValidRecurStartDate" 
                                ControlToValidate="txtStartDate" Visible="False" EnableViewState="false"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator id="valValidRecurStartDate2" runat="server" cssclass="Normal" resourcekey="valValidRecurStartDate2" 
                                ControlToValidate="txtStartDate" Visible="False" EnableViewState="false"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator id="valValidStartDate2" runat="server" cssclass="Normal"  
                                ControlToValidate="txtStartDate" Visible="False" EnableViewState="false"></asp:RequiredFieldValidator>
                        <asp:LinkButton id="btnCopyStartdate" resourcekey="btnCopyStartdate" runat="server"  text="Copy to enddate." cssclass="CommandButton" BorderStyle="none" CausesValidation="False"/>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead">
                        <dnn:Label id="lblEndDateTime" runat="server">
                        </dnn:Label>
                    </td>
                    <td class="SubHead">
                        <asp:TextBox id="txtEndDate" runat="server" Font-Size="8pt" cssclass="NormalTextBox" width="74px"></asp:TextBox>
                        <asp:Image id="imgEndDate" runat="server" EnableViewState="False" cssclass="CalIcon" ImageUrl="~/DesktopModules/Events/Images/SmallCalendar.gif"></asp:Image>
                        <asp:DropDownList id="cmbEndTime" runat="server" Font-Size="8pt" cssclass="NormalTextBox" width="90px"></asp:DropDownList>
                        <asp:RequiredFieldValidator id="valRequiredEndDate" runat="server" Display="Dynamic" cssclass="Normal" resourcekey="valRequiredEndDate" ControlToValidate="txtEndDate" EnableViewState="false"></asp:RequiredFieldValidator>
                        <asp:CompareValidator id="valValidEndDate" Operator="GreaterThanEqual" Display="Dynamic" ControlToValidate="txtEndDate"  
                            type="Date" resourcekey="valValidEndDate" runat="server" ValidationGroup="enddate" SetFocusOnError="True" ControlToCompare="txtStartDate"></asp:CompareValidator>
                        <asp:RequiredFieldValidator id="valValidEndTime" runat="server" Display="Dynamic" cssclass="Normal" resourcekey="valValidEndTime" ControlToValidate="txtEndDate" EnableViewState="false"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label id="lblDisplayEndDate" runat="server"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top" style="white-space:nowrap;">
                        <asp:CheckBox id="chkDisplayEndDate" runat="server" cssclass="SubHead" ></asp:CheckBox>
                    </td>
                </tr>
                <tr id="trTimeZone" runat="server" visible="false">
                    <td class="SubHead" valign="top">
                        <dnn:Label id="lblTimeZone" runat="server">
                        </dnn:Label>
                    </td>
                    <td class="SubHead">
                        <asp:Label id="lblEventTimeZone" runat="server" cssclass="Normal"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label id="lblImportance" runat="server">
                        </dnn:Label>
                    </td>
                    <td class="SubHead">
                        <asp:DropDownList id="cmbImportance" runat="server" Font-Size="8pt" cssclass="NormalTextBox">
                            <asp:ListItem resourcekey="Low" Value="3">Low</asp:ListItem>
                            <asp:ListItem resourcekey="Normal" Value="2" Selected="True">Normal</asp:ListItem>
                            <asp:ListItem resourcekey="High" Value="1">High</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label id="lblCategory" runat="server">
                        </dnn:Label>
                    </td>
                    <td class="SubHead">
                        <asp:DropDownList id="cmbCategory" runat="server" Font-Size="8pt" cssclass="NormalTextBox" width="194px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top">
                        <dnn:Label id="lblLocation" runat="server">
                        </dnn:Label>
                    </td>
                    <td class="SubHead">
                        <asp:DropDownList id="cmbLocation" runat="server" Font-Size="8pt" cssclass="NormalTextBox" width="194px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr id="trCustomField1" runat="server">
	                <td class="SubHead">
		                <dnn:label id="lblCustomField1" runat="server"></dnn:label></td>
	                <td class="SubHead">
		                <asp:textbox id="txtCustomField1" runat="server" cssclass="NormalTextBox" width="250px"
			                Columns="30" maxlength="100"></asp:textbox></td>
                </tr>
                <tr id="trCustomField2" runat="server">
	                <td class="SubHead">
		                <dnn:label id="lblCustomField2" runat="server"></dnn:label></td>
	                <td class="SubHead">
		                <asp:textbox id="txtCustomField2" runat="server" cssclass="NormalTextBox"  width="250px"
			                Columns="30" maxlength="100"></asp:textbox></td>
                </tr>
                <tr id="trOwner" runat="server">
                    <td class="SubHead" valign="top">
                        <dnn:Label id="lblOwner" runat="server">
                        </dnn:Label>
                    </td>
                    <td class="SubHead">
                        <asp:DropDownList id="cmbOwner" runat="server" Font-Size="8pt" cssclass="NormalTextBox" width="194px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="SubHead" valign="top">
                        <dnn:Label id="lblNotes" runat="server">
                        </dnn:Label>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top" colspan="2">
                        <dnn:TextEditor id="ftbDesktopText" runat="server" width="600" height="400">
                        </dnn:TextEditor>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <asp:Panel id="pnlDetailPage" runat="server" width="100%">
                <hr />
                <table id="tblDetailPage" width="100%" cellpadding="0" cellspacing="0" border="0" runat="server">
                    <tr>
                        <td>
                            <table id="tblDetailPageChk" width="100%" cellpadding="2" cellspacing="2" border="0" runat="server">
                                <tr>
                                    <td class="SubHead" valign="top" style="width:200px;">
                                        <dnn:Label id="lblDetailPage" runat="server"></dnn:Label>
                                    </td>
                                    <td class="SubHead" valign="top" style="white-space:nowrap;">
                                        <asp:CheckBox id="chkDetailPage" runat="server" cssclass="SubHead" ></asp:CheckBox>
                                    </td>
                                </tr>
                            </table>
                            <table id="tblDetailPageDetail" width="100%" cellpadding="2" cellspacing="2" border="0" runat="server">
                                <tr>
                                    <td class="SubHead" valign="top"  style="width:200px;">
                                        <dnn:Label id="lblDetailURL" runat="server"></dnn:Label>
                                    </td>
                                    <td class="SubHead" valign="top" style="white-space:nowrap;">
                                        <dnn:URL id="URLDetail" runat="server" width="300" showfiles="False" showurls="True" shownewwindow="True" showtrack="False"
                                            showlog="False" urltype="U" showtabs="True"></dnn:URL>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <asp:Panel id="pnlReminder" runat="server" width="100%">
                <hr />
                <table id="tblReminder" width="100%" cellpadding="0" cellspacing="0" border="0" runat="server">
                    <tr>
                        <td>
                            <table id="tblReminderChk" width="100%" cellpadding="2" cellspacing="2" border="0" runat="server">
                                <tr>
                                    <td class="SubHead" valign="top" style="width:200px;">
                                        <dnn:Label id="lblSendReminder" runat="server"></dnn:Label>
                                    </td>
                                    <td class="SubHead" valign="top" style="white-space:nowrap;">
                                        <asp:CheckBox id="chkReminder" runat="server" cssclass="SubHead"></asp:CheckBox>
                                    </td>
                                </tr>
                            </table>
                            <table id="tblReminderDetail" width="100%" cellpadding="2" cellspacing="2" border="0" runat="server">
                                <tr>
                                    <td class="SubHead" valign="top" style="width:200px;">
                                        <dnn:Label id="lblTimeBefore" runat="server"></dnn:Label>
                                    </td>
                                    <td class="SubHead" style="white-space:nowrap;" valign="top">
                                        <asp:TextBox id="txtReminderTime" cssclass="NormalTextBox" runat="server" MaxLength="3" width="50" Font-Size="8pt">8</asp:TextBox><asp:DropDownList
                                                id="ddlReminderTimeMeasurement" runat="server" Font-Size="8pt" cssclass="NormalTextBox">
                                                <asp:ListItem Value="m" resourcekey="Minutes">Minutes</asp:ListItem>
                                                <asp:ListItem Value="h" resourcekey="Hours" Selected="True">Hours</asp:ListItem>
                                                <asp:ListItem Value="d" resourcekey="Days">Days</asp:ListItem>
                                            </asp:DropDownList>
                                        <asp:RequiredFieldValidator id="valBadReminderTime" runat="server" cssclass="Normal" ErrorMessage="Invalid Reminder Time (1-30 days, 15-60 minutes, 1-24 hours)" resourcekey="valBadReminderTime" 
                                            ControlToValidate="txtReminderTime" Visible="False" EnableViewState="false"></asp:RequiredFieldValidator>                        </td>
                                </tr>
                                <tr>
                                    <td class="SubHead" valign="top">
                                        <dnn:Label id="lblEmailFrom" runat="server"></dnn:Label>
                                    </td>
                                    <td class="SubHead" valign="top" style="white-space:nowrap;">
                                        <asp:TextBox id="txtReminderFrom" runat="server" Font-Size="8pt" cssclass="NormalTextBox" width="157px" MaxLength="100" Wrap="False"></asp:TextBox>
                                        <asp:RegularExpressionValidator id="valEmail" runat="server" ControlToValidate="txtReminderFrom" ErrorMessage="Valid Email Address required" resourcekey="valEmail" 
                                            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SubHead" valign="top" style="width:200px;">
                                        <dnn:Label id="lblNotifyEmailSubject" runat="server"></dnn:Label>
                                    </td>
                                    <td class="SubHead" valign="top" style="white-space:nowrap;">
                                        <asp:TextBox id="txtSubject" runat="server" Font-Size="8pt" cssclass="NormalTextBox" width="100%" TextMode="MultiLine" MaxLength="300"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SubHead" valign="top"  style="width:200px;">
                                        <dnn:Label id="lblNotifyEmailMessage" runat="server"></dnn:Label>
                                    </td>
                                    <td class="SubHead" valign="top" style="white-space:nowrap;">
                                        <asp:TextBox id="txtReminder" cssclass="NormalTextBox" runat="server" Font-Size="8pt" width="100%" height="80px" TextMode="MultiLine" MaxLength="2048"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <asp:Panel id="pnlImage" runat="server" width="100%">
                <hr />
                <table id="tblImage" width="100%" cellpadding="0" cellspacing="0" border="0" runat="server">
                    <tr>
                        <td>
                            <table id="tblImageChk" width="100%" cellpadding="2" cellspacing="2" border="0" runat="server">
                                <tr>
                                    <td class="SubHead" valign="top" style="width:200px;">
                                        <dnn:Label id="lblDisplayImage" runat="server"></dnn:Label>
                                    </td>
                                    <td class="SubHead" valign="top" style="white-space:nowrap;">
                                        <asp:CheckBox id="chkDisplayImage" runat="server" cssclass="SubHead"></asp:CheckBox>
                                    </td>
                                </tr>
                            </table>
                            <table id="tblImageURL" width="100%" cellpadding="2" cellspacing="2" border="0" runat="server">
                                <tr>
                                    <td class="SubHead" valign="top"  style="width:200px;">
                                        <dnn:Label id="lblImageURL" runat="server"></dnn:Label>
                                    </td>
                                    <td class="SubHead" valign="top" style="white-space:nowrap;">
                                        <dnn:URL id="ctlURL" runat="server" width="300" showfiles="True" showurls="True" shownewwindow="False" showtrack="False"
                                            showlog="False" urltype="F" showtabs="False"></dnn:URL>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SubHead" valign="top">
                                        <dnn:Label id="lblWidth" runat="server"></dnn:Label>
                                    </td>
                                    <td class="SubHead" valign="top" style="white-space:nowrap;">
                                        <asp:TextBox id="txtWidth" runat="server" cssclass="NormalTextBox" Columns="50" width="37px"></asp:TextBox>
                                        <asp:RegularExpressionValidator id="valWidth" runat="server" ControlToValidate="txtWidth" ErrorMessage="Width must be a valid Integer or Blank" resourcekey="valWidth" 
                                            ValidationExpression="^[1-9]+[0-9]*$"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SubHead" valign="top">
                                        <dnn:Label id="lblHeight" runat="server"></dnn:Label>
                                    </td>
                                    <td class="SubHead" valign="top" style="white-space:nowrap;">
                                        <asp:TextBox id="txtHeight" runat="server" cssclass="NormalTextBox" Columns="50" width="37px"></asp:TextBox>
                                        <asp:RegularExpressionValidator id="valHeight" runat="server" ControlToValidate="txtHeight" ErrorMessage="Height must be a valid Integer or Blank" resourcekey="valHeight" 
                                            ValidationExpression="^[1-9]+[0-9]*$"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>       
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <asp:Panel id="pnlRecurring" runat="server" width="100%">
                <hr />
                <table id="tblRecurring" width="100%" border="0" cellpadding="0" cellspacing="0" runat="server">
                    <tr>
                        <td>
                            <table id="tblRecurringChk" width="100%" border="0" cellpadding="2" cellspacing="2" runat="server">
                                <tr>
                                    <td class="SubHead" style="width:200px;">
                                        <dnn:Label id="lblRecEvent" runat="server"></dnn:Label>
                                    </td>
                                    <td class="SubHead">
                                        <asp:CheckBox id="chkReccuring" runat="server" cssclass="SubHead" ></asp:CheckBox>    <br />                            
                                        <input id="rblRepeatTypeN" type="radio" checked style="display:none;" value="N" name="rblRepeatType" runat="server" />
                                    </td>
                                </tr>
                             </table>
                             <table id="tblRecurringDetails" style="width:100%;" cellpadding="4" cellspacing="2" runat="server">
                                <tr>
                                    <td class="SubHead" colspan="2" style="white-space:nowrap;width:200px;">
                                        <dnn:Label id="lblEndDate" runat="server"></dnn:Label>
                                    </td>
                                    <td class="SubHead" colspan="3">
                                        <asp:Label id="lblMaxRecurrences" runat="server" cssclass="Normal">Maximum 1000 event occurences.</asp:Label>
                                        <br />
                                        <asp:TextBox id="txtRecurEndDate" runat="server" cssclass="NormalTextBox"></asp:TextBox>
                                        <asp:Image id="imgRecurEndDate" runat="server" cssclass="CalIcon" 
                                            EnableViewState="False" 
                                            ImageUrl="~/DesktopModules/Events/Images/SmallCalendar.gif" />
                                        <asp:RequiredFieldValidator id="valRequiredRecurEndDate" runat="server" 
                                            ControlToValidate="txtRecurEndDate" cssclass="Normal" Display="Dynamic" 
                                            EnableClientScript="False" EnableViewState="false" 
                                            resourcekey="valRequiredRecurEndDate"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator id="valValidRecurEndDate" runat="server" 
                                            ControlToCompare="txtStartDate" ControlToValidate="txtRecurEndDate" 
                                            cssclass="Normal" Display="Dynamic" EnableClientScript="False" 
                                            EnableViewState="false" Operator="GreaterThanEqual" 
                                            resourcekey="valValidRecurEndDate" Type="Date"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator id="valValidRecurEndDate2" runat="server" 
                                            ControlToValidate="txtRecurEndDate" cssclass="Normal" EnableViewState="false" 
                                            resourcekey="valValidRecurEndDate2" Visible="False"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5" style="height:10px;"><hr /></td>
                                </tr>
                                <tr>
                                    <td class="SubHead" style="width:10px;">
                                        &nbsp;</td>
                                    <td class="SubHead">
                                        <dnn:Label id="lblPeriodicEvent" runat="server"></dnn:Label>
                                    </td>
                                    <td class="SubHead">
                                        <input id="rblRepeatTypeP1" type="radio" value="P1" name="rblRepeatType" runat="server"/>
                                    </td>
                                    <td class="SubHead">
                                        &nbsp;</td>
                                    <td class="SubHead">
                                        <table id="tblDetailP1" runat="server" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="SubHead" style="text-align: left">
                                                    <asp:Label id="lblEvery" runat="server" cssclass="SubHead" 
                                                        resourcekey="lblEvery">Repeated every:</asp:Label>
                                                    <asp:TextBox id="txtP1Every" runat="server" Columns="3" 
                                                        cssclass="NormalTextBox" MaxLength="3" width="31px">1</asp:TextBox>
                                                    <asp:DropDownList id="cmbP1Period" runat="server" cssclass="NormalTextBox">
                                                        <asp:ListItem resourcekey="Days" Selected="True" Value="D">Day(s)</asp:ListItem>
                                                        <asp:ListItem resourcekey="Weeks" Value="W">Week(s)</asp:ListItem>
                                                        <asp:ListItem resourcekey="Months" Value="M">Month(s)</asp:ListItem>
                                                        <asp:ListItem resourcekey="Years" Value="Y">Year(s)</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RangeValidator id="valP1Every" runat="server" 
                                                        ControlToValidate="txtP1Every" MinimumValue="1" Display="Dynamic" MaximumValue="999" Type="Integer" cssclass="Normal" EnableViewState="false" 
                                                       resourcekey="valP1Every" EnableClientScript="False"></asp:RangeValidator>
                                                    <asp:RequiredFieldValidator id="valP1Every2" runat="server" ControlToValidate="txtP1Every" resourcekey="valP1Every" 
                                                        cssclass="Normal" EnableViewState="false" EnableClientScript="False" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td class="SubHead">
                                        &nbsp;</td>
                                    <td class="SubHead" valign="middle">
                                        <dnn:Label id="lblWeeklyEvent" runat="server"></dnn:Label>
                                    </td>
                                    <td class="SubHead">
                                        <input id="rblRepeatTypeW1" type="radio" value="W1" name="rblRepeatType" runat="server"/>
                                    </td>
                                    <td class="SubHead">
                                        &nbsp;</td>
                                    <td class="SubHead">
                                        <table id="tblDetailW1" runat="server" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="SubHead" style="text-align: left">
                                                    <asp:Label id="lblRepetitionWeek" runat="server" cssclass="SubHead" 
                                                        resourcekey="lblRepetitionWeek">Repetition frequency (weeks):</asp:Label>
                                                    <asp:TextBox id="txtW1Every" runat="server" Columns="3" 
                                                        cssclass="NormalTextBox" MaxLength="2" width="31px">1</asp:TextBox>
                                                    
                                                    <asp:RangeValidator id="valW1Day" runat="server" Display="Dynamic" 
                                                        ControlToValidate="txtW1Every" MinimumValue="1" MaximumValue="99" Type="Integer" cssclass="Normal" EnableViewState="false" 
                                                        resourcekey="valW1Day" EnableClientScript="False"></asp:RangeValidator>
                                                    <asp:RequiredFieldValidator id="valW1Day2" runat="server" ControlToValidate="txtW1Every" resourcekey="valW1Day" 
                                                        cssclass="Normal" EnableViewState="false" EnableClientScript="False" Display="Dynamic"></asp:RequiredFieldValidator>
                                                       
                                                    <br/>
                                                    <asp:Label id="lblWeekDays" runat="server" resourcekey="lblWeekDays">On:</asp:Label>
                                                    <asp:CheckBox id="chkW1Sun" runat="server" cssclass="SubHead" Text="Sun" />
                                                    &nbsp;
                                                    <asp:CheckBox id="chkW1Mon" runat="server" cssclass="SubHead" Text="Mon" />
                                                    &nbsp;
                                                    <asp:CheckBox id="chkW1Tue" runat="server" cssclass="SubHead" Text="Tue" />
                                                    &nbsp;
                                                    <asp:CheckBox id="chkW1Wed" runat="server" cssclass="SubHead" Text="Wed" />
                                                    &nbsp;
                                                    <asp:CheckBox id="chkW1Thu" runat="server" cssclass="SubHead" Text="Thu" />
                                                    &nbsp;
                                                    <asp:CheckBox id="chkW1Fri" runat="server" cssclass="SubHead" Text="Fri" />
                                                    &nbsp;
                                                    <asp:CheckBox id="chkW1Sat" runat="server" cssclass="SubHead" Text="Sat" />
                                                    &nbsp;
                                                    <asp:CheckBox id="chkW1Sun2" runat="server" cssclass="SubHead" Text="Sun" />
                                                    <br />                                                    
                                                    <asp:RequiredFieldValidator id="valW1Day3" runat="server" cssclass="Normal"  
                                                        ControlToValidate="txtW1Every" Visible="False" EnableViewState="false"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                        </table>
                                     </td>
                                    </tr>
                                    <tr>
                                        <td class="SubHead">
                                            &nbsp;</td>
                                        <td class="SubHead" valign="middle">
                                            <dnn:Label id="lblMonthlyEvent" runat="server"></dnn:Label>
                                        </td>
                                        <td class="SubHead">
                                            <input id="rblRepeatTypeM" type="radio" value="M" name="rblRepeatType" runat="server"/>
                                        </td>
                                    
                                        <td class="SubHead">
                                            &nbsp;</td>
                                        <td class="SubHead">

                                        <table id="tblDetailM1" runat="server" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="SubHead" style="width:20px;">
                                                    <input id="rblRepeatTypeM1" runat="server" name="rblRepeatTypeMM" type="radio" 
                                                        value="M1"/></td>
                                                <td class="SubHead" style="text-align: left">
                                                    <asp:Label id="lblRepeatedOn1" runat="server" cssclass="SubHead" 
                                                        resourcekey="lblRepeatedOn1">Repeated on:</asp:Label>
                                                    <asp:DropDownList id="cmbM1Every" runat="server" width="79px">
                                                        <asp:ListItem resourcekey="First" Selected="True" Value="1">First</asp:ListItem>
                                                        <asp:ListItem resourcekey="Second" Value="2">Second</asp:ListItem>
                                                        <asp:ListItem resourcekey="Third" Value="3">Third</asp:ListItem>
                                                        <asp:ListItem resourcekey="Fourth" Value="4">Fourth</asp:ListItem>
                                                        <asp:ListItem resourcekey="Last" Value="5">Last</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:DropDownList id="cmbM1Period" runat="server" width="86px">
                                                        <asp:ListItem Value="0">Sunday</asp:ListItem>
                                                        <asp:ListItem Value="1">Monday</asp:ListItem>
                                                        <asp:ListItem Value="2">Tuesday</asp:ListItem>
                                                        <asp:ListItem Value="3">Wednesday</asp:ListItem>
                                                        <asp:ListItem Value="4">Thursday</asp:ListItem>
                                                        <asp:ListItem Value="5">Friday</asp:ListItem>
                                                        <asp:ListItem Value="6">Saturday</asp:ListItem>
                                                    </asp:DropDownList>
                                                 </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="SubHead" style="width:20px;">
                                                    <input id="rblRepeatTypeM2" runat="server" name="rblRepeatTypeMM" type="radio" 
                                                        value="M2"/></td>
                                                <td class="SubHead" style="text-align: left">
                                                    <asp:Label id="lblRepeatedOn2" runat="server" cssclass="SubHead" 
                                                        resourcekey="lblRepeatedOn2">Repeated on day:</asp:Label>
                                                    <asp:DropDownList id="cmbM2Period" runat="server" width="58px">
                                                        <asp:ListItem resourcekey="01" Selected="True" Value="1">1st</asp:ListItem>
                                                        <asp:ListItem resourcekey="02" Value="2">2nd</asp:ListItem>
                                                        <asp:ListItem resourcekey="03" Value="3">3rd</asp:ListItem>
                                                        <asp:ListItem resourcekey="04" Value="4">4th</asp:ListItem>
                                                        <asp:ListItem resourcekey="05" Value="5">5th</asp:ListItem>
                                                        <asp:ListItem resourcekey="06" Value="6">6th</asp:ListItem>
                                                        <asp:ListItem resourcekey="07" Value="7">7th</asp:ListItem>
                                                        <asp:ListItem resourcekey="08" Value="8">8th</asp:ListItem>
                                                        <asp:ListItem resourcekey="09" Value="9">9th</asp:ListItem>
                                                        <asp:ListItem resourcekey="10" Value="10">10th</asp:ListItem>
                                                        <asp:ListItem resourcekey="11" Value="11">11th</asp:ListItem>
                                                        <asp:ListItem resourcekey="12" Value="12">12th</asp:ListItem>
                                                        <asp:ListItem resourcekey="13" Value="13">13th</asp:ListItem>
                                                        <asp:ListItem resourcekey="14" Value="14">14th</asp:ListItem>
                                                        <asp:ListItem resourcekey="15" Value="15">15th</asp:ListItem>
                                                        <asp:ListItem resourcekey="16" Value="16">16th</asp:ListItem>
                                                        <asp:ListItem resourcekey="17" Value="17">17th</asp:ListItem>
                                                        <asp:ListItem resourcekey="18" Value="18">18th</asp:ListItem>
                                                        <asp:ListItem resourcekey="19" Value="19">19th</asp:ListItem>
                                                        <asp:ListItem resourcekey="20" Value="20">20th</asp:ListItem>
                                                        <asp:ListItem resourcekey="21" Value="21">21st</asp:ListItem>
                                                        <asp:ListItem resourcekey="22" Value="22">22nd</asp:ListItem>
                                                        <asp:ListItem resourcekey="23" Value="23">23rd</asp:ListItem>
                                                        <asp:ListItem resourcekey="24" Value="24">24th</asp:ListItem>
                                                        <asp:ListItem resourcekey="25" Value="25">25th</asp:ListItem>
                                                        <asp:ListItem resourcekey="26" Value="26">26th</asp:ListItem>
                                                        <asp:ListItem resourcekey="27" Value="27">27th</asp:ListItem>
                                                        <asp:ListItem resourcekey="28" Value="28">28th</asp:ListItem>
                                                        <asp:ListItem resourcekey="29" Value="29">29th</asp:ListItem>
                                                        <asp:ListItem resourcekey="30" Value="30">30th</asp:ListItem>
                                                        <asp:ListItem resourcekey="31" Value="31">31st</asp:ListItem>
                                                    </asp:DropDownList><br/>
                                                    <asp:Label id="lblRepetitionMonth" runat="server" cssclass="SubHead" 
                                                        resourcekey="lblRepetitionMonth">Repetition frequency (months)</asp:Label>
                                                    <asp:TextBox id="txtM2Every" runat="server" Columns="3" 
                                                        cssclass="NormalTextBox" Font-Size="8pt" MaxLength="2" width="31px">1</asp:TextBox>
                                                    <asp:RangeValidator id="valM2Every" runat="server" Display="Dynamic"
                                                        ControlToValidate="txtM2Every" MinimumValue="1" MaximumValue="99" Type="Integer" cssclass="Normal" EnableViewState="false" 
                                                        resourcekey="valM2Every" EnableClientScript="false"></asp:RangeValidator>
                                                    <asp:RequiredFieldValidator id="valM2Every2" runat="server" ControlToValidate="txtM2Every" resourcekey="valM2Every" 
                                                        cssclass="Normal" EnableViewState="false" EnableClientScript="False" Display="Dynamic"></asp:RequiredFieldValidator>

                                                </td>
                                            </tr>
                                        </table>
                                     </td>
                                   </tr>
                                   <tr>
                                       <td class="SubHead">
                                            &nbsp;</td>
                                       <td class="SubHead" valign="top">
                                            <dnn:Label id="lblYearlyEvent" runat="server"></dnn:Label>
                                        </td>
                                        <td class="SubHead">
                                            <input id="rblRepeatTypeY1" type="radio" value="Y1" name="rblRepeatType" runat="server"/>
                                        </td>
                                        <td class="SubHead">
                                        &nbsp;</td>
                                        <td class="SubHead">
                                        <table id="tblDetailY1" runat="server" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="SubHead" style="text-align: left">
                                                    <asp:Label id="lblRepeatOnDate" runat="server" cssclass="SubHead" 
                                                        resourcekey="lblRepeatOnDate">Repeated on this date:</asp:Label>
                                                    <asp:TextBox id="txtY1Period" runat="server" cssclass="NormalTextBox" 
                                                        width="74px"></asp:TextBox>
                                                    <asp:Image id="imgY1Period" runat="server" cssclass="CalIcon" EnableViewState="False" 
                                                        ImageUrl="~/DesktopModules/Events/Images/SmallCalendar.gif" />
                                                    <asp:RequiredFieldValidator id="valRequiredYearEventDate" runat="server" 
                                                        ControlToValidate="txtY1Period" cssclass="Normal" EnableViewState="false" 
                                                        ErrorMessage="Invalid Annual Repeat Date" Display="Dynamic" EnableClientScript="False" resourcekey="valRequiredYearEventDate">
                                                      </asp:RequiredFieldValidator>
                                                    <asp:CompareValidator id="valValidYearEventDate" runat="server" ControlToValidate="txtY1Period" ControlToCompare="txtStartDate" resourcekey="valValidYearEventDate" 
                                                        cssclass="Normal" EnableClientScript="False" EnableViewState="false" Display="Dynamic" Visible="false" Operator="GreaterThanEqual" Type="Date"></asp:CompareValidator>
                                                        
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>                  
            </asp:Panel>
        </td>   
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <asp:Panel id="pnlEnroll" runat="server" width="100%">
                <hr />
                <table id="tblEnrollment" width="100%" border="0" cellpadding="2" cellspacing="2" runat="server">
                    <tr>
                        <td class="SubHead" valign="top" style="width:200px;">
                            <dnn:Label id="lblAllowErollment" runat="server"></dnn:Label>
                        </td>
                        <td class="SubHead" valign="top">
                            <asp:CheckBox id="chkSignups" runat="server" cssclass="SubHead" Visible="False"></asp:CheckBox>
                        </td>
                    </tr>
                 </table>
                 <table id="tblEnrollmentDetails" width="100%" border="0" cellpadding="2" cellspacing="2" runat="server">
                    <tr>
                        <td>
                            <table width="100%" border="0" cellpadding="2" cellspacing="2">
                    <tr>
                        <td class="SubHead" valign="top" style="width:200px;">
                            <dnn:Label id="lblTypeOfEnrollment" runat="server"></dnn:Label>
                        </td>
                        <td class="SubHead" valign="top">
                            <input id="rblFree" type="radio" checked value="FREE" name="rblEnrollType" runat="server"/>&nbsp;
                            <asp:Label id="lblFree" resourcekey="lblFree" runat="server" cssclass="SubHead">Free</asp:Label><asp:Label id="lblModerated"
                                resourcekey="lblModerated.Text" runat="server" cssclass="SubHead">(Moderated)</asp:Label>
                            <br/>
                            <input id="rblPaid" type="radio" value="PAID" name="rblEnrollType" runat="server"/>&nbsp;
                            <asp:Label id="lblPaidFee" resourcekey="lblPaidFee" runat="server" cssclass="SubHead">Paid   Fee:</asp:Label>&nbsp;<asp:TextBox
                                id="txtEnrollFee" runat="server" Font-Size="8pt" cssclass="NormalTextBox" 
                                width="56px" MaxLength="8" Wrap="False" style="text-align: right"></asp:TextBox>
                            <asp:Label id="lblTotalCurrency" runat="server" cssclass="NormalBold"></asp:Label>
                            <br/>
                            <asp:RequiredFieldValidator id="valBadFee" runat="server" cssclass="Normal" ErrorMessage="Numeric fee > 0.00 required for Paid Enrollment" resourcekey="valBadFee" 
                                ControlToValidate="txtEnrollFee" Visible="False" EnableViewState="false"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator id="valPayPalAccount" runat="server" cssclass="Normal" ErrorMessage="PayPal Account required for Paid Enrollment" resourcekey="valPayPalAccount" ControlToValidate="txtPayPalAccount"
                                    Visible="False" EnableViewState="false"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="SubHead" valign="top" style="width:200px;">
                            <dnn:Label id="lblPayPalAccount" runat="server"></dnn:Label>
                        </td>
                        <td>
                            <asp:TextBox id="txtPayPalAccount" runat="server" Font-Size="8pt" cssclass="NormalTextBox" width="147px" MaxLength="100" Wrap="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="SubHead" valign="top" style="width:200px;">
                            <dnn:Label id="lblMaxEnrollment" runat="server"></dnn:Label>
                        </td>
                        <td class="SubHead" valign="top">
                            <asp:TextBox id="txtMaxEnrollment" runat="server" cssclass="NormalTextBox" width="32px" MaxLength="3">0</asp:TextBox>&nbsp;
                            <asp:Label id="lblCurrentEnrolled" resourcekey="lblCurrentEnrolled" runat="server" cssclass="SubHead">Currently Enrolled:</asp:Label>
                            &nbsp;<asp:TextBox id="txtEnrolled" runat="server" Font-Size="8pt" cssclass="SubHead" width="32px" MaxLength="3" ReadOnly="True" BorderStyle="None">0</asp:TextBox>
                            <asp:RangeValidator id="valMaxEnrollment" runat="server" resourcekey="valMaxEnrollment" 
                                ControlToValidate="txtMaxEnrollment" MinimumValue="0" MaximumValue="9999" Display="Dynamic" Type="Integer" cssclass="Normal" 
                                EnableClientScript="False" ></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="SubHead" valign="top" style="width:200px;">
                            <dnn:Label id="lblEnrollListView" text="Enroll List on Detail View:" runat="server" controlname="chkEnrollListView"></dnn:Label>
                        </td>
                        <td class="SubHead" valign="top">
                            <asp:CheckBox id="chkEnrollListView" runat="server" Checked="False"></asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="SubHead" valign="top" style="width:200px;">
                            <dnn:Label id="lblEnrollmentRole" runat="server"></dnn:Label>
                        </td>
                        <td class="SubHead" valign="top">
                            <asp:DropDownList id="ddEnrollRoles" AutoPostBack="True" runat="server" Font-Size="8pt" width="214px">
                            </asp:DropDownList>
                            <br/>
                            <asp:Label id="lblEnrollRoleNote" resourcekey="lblEnrollRoleNote" runat="server" cssclass="SubHead">(select "None" for All Registered)</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="SubHead" valign="middle">
                            <dnn:Label id="lblRegUser" runat="server"></dnn:Label>
                        </td>
                        <td class="SubHead">
                            <asp:DropDownList id="cmbRegUser" runat="server" Font-Size="8pt" cssclass="NormalTextBox" width="184px">
                            </asp:DropDownList>&nbsp;&nbsp;
                            <dnn:CommandButton id="lnkAddRegUser" ImageUrl="~/images/add.gif" resourcekey="lnkAddRegUser" runat="server" cssclass="CommandButton" />
                            <div id="divNoEnrolees" runat="server" visible="false">
                                <asp:Label id="lblNoEnrolee" runat="server" resourcekey="lblNoEnrolee">No. of Enrolees</asp:Label>&nbsp;
                                <asp:TextBox id="txtNoEnrolees" runat="server" cssclass="NormalTextBox" 
                                    Font-Size="8pt" MaxLength="3" width="30">1</asp:TextBox>&nbsp;
                                <asp:Label id="lblMaxNoEnrolees" runat="server">(Max 1)</asp:Label>&nbsp;
                                <asp:RangeValidator id="valNoEnrolees" runat="server" 
                                    ControlToValidate="txtNoEnrolees" MinimumValue="1" MaximumValue="1" Display="Dynamic" Type="Integer" cssclass="Normal" 
                                    EnableClientScript="False" ></asp:RangeValidator>
                            </div>
                                
                        </td>
                    </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="SubHead" valign="top">
                            <asp:Label id="lblEnrolledUsers" resourcekey="lblEnrolledUsers" runat="server">Enrolled Users</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="SubHead" valign="top" >
                            <div>
                                <asp:DataGrid id="grdEnrollment" runat="server" AutoGenerateColumns="False" BorderStyle="Outset" Borderwidth="2px" cssclass="Normal"
                                    DataKeyField="SignupID" GridLines="Horizontal" Visible="False" width="100%">
                                    <EditItemStyle VerticalAlign="Bottom"></EditItemStyle>
                                    <AlternatingItemStyle BackColor="WhiteSmoke"></AlternatingItemStyle>
                                    <ItemStyle VerticalAlign="Top"></ItemStyle>
                                    <HeaderStyle Font-Bold="True" BackColor="Silver"></HeaderStyle>
                                    <Columns>
                                        <asp:TemplateColumn HeaderText="Select">
                                            <ItemTemplate>
                                                <asp:CheckBox id="chkSelect" runat="server"></asp:CheckBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:BoundColumn DataField="EnrollUserName" HeaderText="UserName"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="EnrollDisplayName" HeaderText="DisplayName"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="EnrollEmail" HeaderText="Email"></asp:BoundColumn>
                                        <asp:BoundColumn DataField="Enrollphone" HeaderText="Phone"></asp:BoundColumn>
                                        <asp:TemplateColumn headerText="EnrollApproved">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkEnrollApproved" runat="server" Enabled="false" Checked='<%# DataBinder.Eval(Container.DataItem,"EnrollApproved") %>'/>
                                        </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:BoundColumn DataField="EnrollNo" HeaderText="Qty"></asp:BoundColumn>
                                        <asp:TemplateColumn HeaderText="Event Date">
                                            <ItemTemplate>
                                                <asp:Label id="lblEventBegin" runat="server" Text='<%# Format(DataBinder.Eval(Container.DataItem,"EnrollTimeBegin","{0:d}")) %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                    </Columns>
                                </asp:DataGrid>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="SubHead">
                            <dnn:CommandButton id="lnkSelectedEmail" ImageUrl="~/DesktopModules/Events/Images/email.gif" resourcekey="lnkSelectedEmail" runat="server" cssclass="CommandButton" />&nbsp;&nbsp;
                            <dnn:CommandButton id="lnkSelectedDelete" ImageUrl="~/images/delete.gif" resourcekey="lnkSelectedDelete" runat="server" cssclass="CommandButton" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <asp:Panel id="pnlEventEmailRole" runat="server" width="100%">
                <hr />
                <table id="tblEventEmailRole" width="100%" cellpadding="0" cellspacing="0" border="0" runat="server">
                    <tr>
                        <td>
                            <table id="tblEventEmailRoleChk" width="100%" cellpadding="2" cellspacing="2" border="0" runat="server">
                                <tr>
                                    <td class="SubHead" valign="top" style="width:200px;">
                                        <dnn:Label id="lblEventEmailChk" runat="server"></dnn:Label>
                                    </td>
                                    <td class="SubHead" valign="top" style="white-space:nowrap;">
                                        <asp:CheckBox id="chkEventEmailChk" runat="server" cssclass="SubHead"></asp:CheckBox>
                                    </td>
                                </tr>
                            </table>
                            <table id="tblEventEmailRoleDetail" width="100%" cellpadding="2" cellspacing="2" border="0" runat="server">
                                <tr>
                                    <td class="SubHead" valign="top" style="width:200px;">
                                        <dnn:Label id="lblEventEmailRole" runat="server"></dnn:Label>
                                    </td>
                                    <td class="SubHead" valign="top">
                                        <asp:DropDownList id="ddEventEmailRoles" AutoPostBack="False" runat="server" Font-Size="8pt" width="214px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td class="SubHead" >
            <table id="tblEventEmail" cellpadding="2" cellspacing="2" border="0" runat="server" style="width:100%">
                <tr>
                    <td class="SubHead" valign="top">
                        <hr />
                        <asp:Label id="lblEventEmail" runat="server" resourcekey="lblEventEmail" cssclass="Head" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table cellpadding="2" cellspacing="2" border="0" style="width:100%">
                <tr>
                    <td class="SubHead" valign="top" style="width:200px">
                        <dnn:Label id="lblEventEmailFrom" runat="server"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top" style="white-space:nowrap;">
                        <asp:TextBox id="txtEventEmailFrom" runat="server" Font-Size="8pt" cssclass="NormalTextBox" width="157px" MaxLength="100" Wrap="False"></asp:TextBox>
                        <asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" ControlToValidate="txtEventEmailFrom" ErrorMessage="Valid Email Address required" resourcekey="valEmail" 
                            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top" style="width:200px;">
                        <dnn:Label id="lblEventEmailSubject" runat="server"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top" style="white-space:nowrap;">
                        <asp:TextBox id="txtEventEmailSubject" runat="server" Font-Size="8pt" cssclass="NormalTextBox" width="100%" TextMode="MultiLine" MaxLength="300"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" valign="top"  style="width:200px;">
                        <dnn:Label id="lblEventEmailBody" runat="server"></dnn:Label>
                    </td>
                    <td class="SubHead" valign="top" style="white-space:nowrap;">
                        <asp:TextBox id="txtEventEmailBody" cssclass="NormalTextBox" runat="server" Font-Size="8pt" width="100%" height="80px" TextMode="MultiLine" MaxLength="2048"></asp:TextBox>
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
            <hr />
            <dnn:CommandButton id="updateButton" runat="server" ImageUrl="~/images/save.gif" cssclass="CommandButton" />&nbsp;
            <dnn:CommandButton id="cancelButton" resourcekey="cancelButton" runat="server" ImageUrl="~/images/cancel.gif" cssclass="CommandButton" CausesValidation="False" />&nbsp;
            <dnn:CommandButton id="deleteButton" runat="server" ImageUrl="~/images/delete.gif" cssclass="CommandButton" CausesValidation="False" />&nbsp;
            <dnn:CommandButton id="copyButton" runat="server" ImageUrl="~/images/copy.gif" cssclass="CommandButton" /><br/>
            <asp:ValidationSummary id="ValidationSummary1" runat="server" width="100%"></asp:ValidationSummary>
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top">
            <asp:Panel id="pnlAudit" Visible="false" HorizontalAlign="Left" runat="server" width="100%">
                <hr />
                <span class="Normal">
                    <asp:Label id="lblCreatedBy" runat="server" resourcekey="lblCreatedBy" cssclass="SubHead" Visible="False">Created by:</asp:Label>&nbsp;
                    <asp:Label id="CreatedBy" runat="server" cssclass="SubHead"></asp:Label>&nbsp;
                    <asp:Label id="lblOn" runat="server" resourcekey="lblOn" cssclass="SubHead">on</asp:Label>&nbsp;
                    <asp:Label id="CreatedDate" runat="server" cssclass="SubHead"></asp:Label></span>
            </asp:Panel>
            <asp:DropDownList id="cboTimeZone" cssclass="NormalTextBox" runat="server" Font-Size="8pt" Visible="False">
            </asp:DropDownList>
        </td>
    </tr>
</table>
</asp:Panel>
