<%@ Control Language="C#" Inherits="Philip.Modules.SSM_Interest.ViewSSM_Interest"
    CodeFile="ViewSSM_Interest.ascx.cs" AutoEventWireup="true" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>

<script type="text/javascript">


    //-------------perform calculatoion on row data---------------//
    function RowCalculation(controlID) {
        var ofEvents;
        var AvgAttendance;
        var ctrlIDParts = controlID.toString().split('_');

        //--------check which input box is clieck-------// 
        if (ctrlIDParts[0] == "EventInputBoy" || ctrlIDParts[0] == "EventInputGirl" || ctrlIDParts[0] == "AvgAttendanceBoy" || ctrlIDParts[0] == "AvgAttendanceGirl") {
            //------check it for null value------//
            if (document.getElementById("EventInputBoy_" + ctrlIDParts[1]) != null || document.getElementById("AvgAttendanceBoy_" + ctrlIDParts[1]) != null) {
                //--------check it for empty input box---------//
                if (document.getElementById("EventInputBoy_" + ctrlIDParts[1]).value != "" && document.getElementById("AvgAttendanceBoy_" + ctrlIDParts[1]).value != "") {
                    //-------add event input box value and assign it multiplication to new input box------//
                    document.getElementById("TotalBoy_" + ctrlIDParts[1]).value = parseFloat(document.getElementById("EventInputBoy_" + ctrlIDParts[1]).value) * parseFloat(document.getElementById("AvgAttendanceBoy_" + ctrlIDParts[1]).value);
                }
            }

            //------check it for null value------//
            if (document.getElementById("EventInputGirl_" + ctrlIDParts[1]) != null || document.getElementById("AvgAttendanceGirl_" + ctrlIDParts[1]) != null) {
                //--------check it for empty input box---------//
                if (document.getElementById("EventInputGirl_" + ctrlIDParts[1]).value != "" && document.getElementById("AvgAttendanceGirl_" + ctrlIDParts[1]).value != "") {
                    //-------add event input box value and assign it multiplication to new input box------//
                    document.getElementById("TotalGirl_" + ctrlIDParts[1]).value = parseFloat(document.getElementById("EventInputGirl_" + ctrlIDParts[1]).value) * parseFloat(document.getElementById("AvgAttendanceGirl_" + ctrlIDParts[1]).value);
                }
            }

        }
    }

    //----------Perform Row Wise Calculation For Hosted Table----------------//
    function HostedTableRowCal(controlID) {
        var ctrlIDParts = controlID.toString().split('_');
        //--------check which input box is click-------// 
        if (ctrlIDParts[0] == "NoOfDays" || ctrlIDParts[0] == "HostedAvgAttendance") {
            //------check it for null value------//
            if (document.getElementById("NoOfDays_" + ctrlIDParts[1]) != null || document.getElementById("HostedAvgAttendance_" + ctrlIDParts[1]) != null) {
                //--------check it for empty input box---------//
                if (document.getElementById("NoOfDays_" + ctrlIDParts[1]).value != "" && document.getElementById("HostedAvgAttendance_" + ctrlIDParts[1]).value != "") {
                    //-------add event input box value and assign it multiplication to new input box------//
                    document.getElementById("HostedTotalAttendance_" + ctrlIDParts[1]).value = parseFloat(document.getElementById("NoOfDays_" + ctrlIDParts[1]).value) * parseFloat(document.getElementById("HostedAvgAttendance_" + ctrlIDParts[1]).value);
                }
            }
        }
    }

    //----------------Add element to hosted tournament drop down-------------------//
    function SportsList() {

        for (var j = 0; j < 3; j++) {
            var selectBox = document.getElementById("SportList_" + j);
            if (selectBox != null) {

                selectBox.innerHTML = "";
                //-----create object of regularseason grid--------//  
                var tabl = document.getElementById("<%=dgRegularSeason.ClientID%>");
                if (tabl.rows.length > 0) {
                    var l = tabl.rows.length;
                    var i = 0;
                    var s = "";
                    //----read each row of sports coloum and add create dropdown------//
                    for (i = 1; i < l - 1; i++) {
                        var tr = tabl.rows[i];
                        var sportName = tr.cells[0].innerHTML;
                        var opt = document.createElement("option");
                        opt.value = "Option_" + i.toString();
                        opt.innerText = sportName;
                        selectBox.appendChild(opt);
                    }
                }
            }
        }

    }

    //-----validate textbox for integer on keyup event----------//
    function validateInput(controlID) {
        var strValue = document.getElementById(controlID).value;
        var fValue = parseFloat(strValue);

        if (isNaN(fValue)) {
            //alert("Please enter a number only");
            document.getElementById(controlID).value = "";
        }
    }


    //----Creaet html that is send with email for regulare season grid----//
    function EmailStringRegualrSeason() {
        var flag = true;
        var ofEvents;
        var AvgAttendance;
        var ofEvent = 0;
        var AvgAttendance = 0;
        var TotalAttendance = 0;
        var regularSeason = "<table  cellpadding='0'; cellspacing='0';><tr><th style='border-style:solid none solid none; border-top-width: 1px; border-color: #000000; border-bottom-width: 1px;width:150px;font-size:10.0pt;'>Sports</th><th style='border-style: solid none solid none; border-top-width: 1px; border-color: #000000; border-bottom-width: 1px;width:100px;font-size:10.0pt;'># of events</th><th style='border-style: solid none solid none; border-top-width: 1px; border-color: #000000; border-bottom-width: 1px;width:100px;font-size:10.0pt;'>Average atteandence</th><th style='border-style: solid none solid none; border-top-width: 1px; border-color: #000000; border-bottom-width: 1px;width:100px;font-size:10.0pt;'>Total attendence</th></tr>";
        var tabl = document.getElementById("<%=dgRegularSeason.ClientID%>");
        if (tabl.rows.length > 0) {
            var l = tabl.rows.length;
            var i = 0;
            var s = "";
            for (i = 1; i < l; i++) {
                var tr = tabl.rows[i];
                var eventName = tr.cells[0].innerHTML

                //-----to read data of # event colom for boys sports------//  
                if (document.getElementById("EventInputBoy_" + i) != null) {
                    if (document.getElementById("EventInputBoy_" + i).value != "") {
                        ofEvent = document.getElementById("EventInputBoy_" + i).value;
                    }
                }
                //-----to read data of # event colom for girls sports------//  
                if (document.getElementById("EventInputGirl_" + i) != null) {
                    if (document.getElementById("EventInputGirl_" + i).value != "") {
                        ofEvent = document.getElementById("EventInputGirl_" + i).value;
                    }
                }
                //-----to read data of Average attendance colom for boys sports------//  
                if (document.getElementById("AvgAttendanceBoy_" + i) != null) {
                    if (document.getElementById("AvgAttendanceBoy_" + i).value != "") {
                        AvgAttendance = document.getElementById("AvgAttendanceBoy_" + i).value;
                    }
                }
                //-----to read data of Average attendance colom for girl sports------//  
                if (document.getElementById("AvgAttendanceGirl_" + i) != null) {
                    if (document.getElementById("AvgAttendanceGirl_" + i).value != "") {
                        AvgAttendance = document.getElementById("AvgAttendanceGirl_" + i).value;
                    }
                }
                //-----to read data of total attendance colom for boys sports------//
                if (document.getElementById("TotalBoy_" + i) != null) {
                    if (document.getElementById("TotalBoy_" + i).value != "") {
                        TotalAttendance = document.getElementById("TotalBoy_" + i).value;
                    }
                }
                //-----to read data of total attendance colom for girls sports------//
                if (document.getElementById("TotalGirl_" + i) != null) {
                    if (document.getElementById("TotalGirl_" + i).value != "") {
                        TotalAttendance = document.getElementById("TotalGirl_" + i).value;
                    }
                }
                //--------to add diffrent color on alternate row of table-------------//
                if (flag == true) {
                    regularSeason += "<tr><td style='height:25px;' bgcolor='#D1D1D1'>" + eventName + "</td><td style='height:25px;' bgcolor='#D1D1D1' align='center'>" + ofEvent + "</td><td style='height:25px;' bgcolor='#D1D1D1' align='center'>" + AvgAttendance + "</td><td style='height:25px;' bgcolor='#D1D1D1' align='center'>" + TotalAttendance + "</td></tr>";
                    flag = false;

                }
                else {
                    regularSeason += "<tr><td style='height:25px;' bgcolor='#F8F8F8'>" + eventName + "</td><td style='height:25px;' bgcolor='#F8F8F8' align='center'>" + ofEvent + "</td><td style='height:25px;' bgcolor='#F8F8F8' align='center'>" + AvgAttendance + "</td><td style='height:25px;' bgcolor='#F8F8F8' align='center'>" + TotalAttendance + "</td></tr>";
                    flag = true;
                }

            }

        } //if end

        regularSeason += "</table><hr></hr>";
        //------store value to hidden field----------//
        document.getElementById("<%=hdnRegularSeasonEmailStr.ClientID%>").value = regularSeason;
        return true;
    } 
</script>

<style type="text/css">
    fieldset
    {
        border: 1px solid #ccc;
        min-height: 350px;
        padding: 10px;
        background: #F8F8F8;
        margin-right: 10px;
        width: 263px;
    }
    legend
    {
        padding: 0.1px 0.4em;
        border: 1px solid #ccc;
        color: black;
        background: #F2F2F2;
        text-align: left;
        font-size: 70%;
        padding: 5px;
        margin-left: 15px;
    }
    legend h2
    {
        font-size: 12pt !important;
    }
    .footerTempletStyle
    {
    }
     .overlay {
        position: fixed;
        z-index: 99;
        top: 0px;
        left: 0px;
        background-color: #FFFFFF;
        width: 100%;
        height: 100%;
        filter: Alpha(Opacity=70);
        opacity: 0.70;
        -moz-opacity: 0.70;
    }
    * html .overlay {
        position: absolute;
        height: expression(document.body.scrollHeight > document.body.offsetHeight ? document.body.scrollHeight : document.body.offsetHeight + 'px');
        width: expression(document.body.scrollWidth > document.body.offsetWidth ? document.body.scrollWidth : document.body.offsetWidth + 'px');
    }
    .loader {
        z-index: 100;
        position: fixed;
        width: 120px;
        margin-left: -60px;
        top: 50%;
        left: 50%;
    }
    * html .loader {
        position: absolute;
        margin-top: expression((document.body.scrollHeight / 4) + (0 - parseInt(this.offsetParent.clientHeight / 2) + (document.documentElement && document.documentElement.scrollTop || document.body.scrollTop)) + 'px');
    }
</style>
<div id="container">
    <!--subcontainer start here-->
    <div class="subcontainer">
        <!--ouraudience_content start here-->
        <div class="map_content">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="chkListBoysSports" />
                    <asp:AsyncPostBackTrigger ControlID="chkListGirlsSports" />
                    <asp:AsyncPostBackTrigger ControlID="dgRegularSeason" />
                    <asp:AsyncPostBackTrigger ControlID="btnSend" /> 
                      
                </Triggers>
                <ContentTemplate>
                    <table style="width: 100%">
                        <tr valign="top">
                            <td colspan="3">
                                <h3 style="padding-bottom: 15px;">
                                    Enroll</h3>
                            </td>
                        </tr>
                        <tr valign="top">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr valign="top">
                            <td>
                                <asp:Panel ID="pnlAboutAs" runat="server" GroupingText="&lt;h2&gt;About you&lt;/h2&gt;">
                                    <table cellpadding="1px" cellspacing="4px">
                                        <tr>
                                            <td>
                                                First name:
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtFirstName" runat="server" MaxLength="30"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName"
                                                    ErrorMessage="<span style='color:Red;'>*</span>"></asp:RequiredFieldValidator>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Last name:
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtLastName" runat="server" MaxLength="30"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName"
                                                    ErrorMessage="<span style='color:Red;'>*</span>" ></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Your title:
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtYourTitle" runat="server" MaxLength="30"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtYourTitle" 
                                                    ErrorMessage="<span style='color:Red;'>*</span>"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Email address:
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtEmailAddress" runat="server" MaxLength="30"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmailAddress"
                                                    ErrorMessage="<span style='color:Red;'>*</span>" ></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="rexvEmailAddress" runat="server" ControlToValidate="txtEmailAddress"
                                                    ErrorMessage="<span style='color:Red;'>*</span>" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                Phone number:
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtPhoneNo" runat="server" MaxLength="15"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhoneNo"
                                                    ErrorMessage="<span style='color:Red;'>*</span>" ></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td>
                                <asp:Panel ID="pnlAboutYourSchool" runat="server" GroupingText="&lt;h2&gt;About your school&lt;/h2&gt;">
                                    <table cellpadding="1px" cellspacing="4px">
                                        <tr>
                                            <td colspan="5">
                                                School name:
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <asp:TextBox ID="txtSchoolName" runat="server" MaxLength="30" Style="width: 98%"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfvSchoolName" runat="server" ControlToValidate="txtSchoolName"
                                                    ErrorMessage="<span style='color:Red;'>*</span>"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="5">
                                                School district:
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <asp:TextBox ID="txtSchoolDistrict" runat="server" MaxLength="30" Style="width: 98%"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfvSchoolDistrict" runat="server" ControlToValidate="txtSchoolDistrict"
                                                    ErrorMessage="<span style='color:Red;'>*</span>"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="5" class="style2">
                                                School address:
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <asp:TextBox ID="txtSchoolAddress" runat="server" MaxLength="10" TextMode="MultiLine"
                                                    Width="140px" Style="width: 98%; height: 50px;"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfvSchoolAddress" runat="server" ControlToValidate="txtSchoolAddress"
                                                    ErrorMessage="<span style='color:Red;'>*</span>"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                City:
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <asp:TextBox ID="txtCity" runat="server" MaxLength="20" Style="margin-right: 0px;
                                                    width: 98%;"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfvSchoolCity" runat="server" ControlToValidate="txtCity"
                                                    ErrorMessage="<span style='color:Red;'>*</span>"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                State:
                                            </td>
                                            <td>
                                                Zip:
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 40%;">
                                                <asp:DropDownList ID="ddlState0" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="ddlState0"
                                                    ErrorMessage="<span style='color:Red;'>*</span>"></asp:RequiredFieldValidator>
                                            </td>
                                            <td style="width: 40%;">
                                                <asp:TextBox ID="txtZip" runat="server" MaxLength="10" Width="100px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfvZipCode" runat="server" ControlToValidate="txtZip"
                                                    ErrorMessage="<span style='color:Red;'>*</span>"></asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="cvZipCode0" runat="server" ControlToValidate="txtZip" ErrorMessage="<span style='color:Red;'>*</span>"
                                                    Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="5">
                                                <br />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td>
                                <asp:Panel ID="pnlAthleticInfo" runat="server" GroupingText="&lt;h2&gt;Athletic info&lt;/h2&gt;"
                                    Width="92%">
                                    <table cellpadding="1px" cellspacing="4px">
                                        <tr>
                                            <td colspan="2">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                Conference name:
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:TextBox ID="txtConferenceName" runat="server" Width="80%" MaxLength="30"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <b>Sports we play</b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Boys:
                                            </td>
                                            <td style="padding-left: 20px;">
                                                Girls:
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <asp:CheckBoxList ID="chkListBoysSports" runat="server" OnSelectedIndexChanged="chkListBoysSports_SelectedIndexChanged"
                                                    AutoPostBack="True">
                                                    <asp:ListItem>football</asp:ListItem>
                                                    <asp:ListItem>soccer</asp:ListItem>
                                                    <asp:ListItem>basketball</asp:ListItem>
                                                    <asp:ListItem>wrestling</asp:ListItem>
                                                    <asp:ListItem>lacrosse</asp:ListItem>
                                                    <asp:ListItem>track &amp; field</asp:ListItem>
                                                </asp:CheckBoxList>
                                            </td>
                                            <td style="padding-left: 20px;" valign="top">
                                                <asp:CheckBoxList ID="chkListGirlsSports" runat="server" OnSelectedIndexChanged="chkListGirlsSports_SelectedIndexChanged"
                                                    AutoPostBack="True">
                                                    <asp:ListItem>volleyball</asp:ListItem>
                                                    <asp:ListItem>soccer</asp:ListItem>
                                                    <asp:ListItem>basketball</asp:ListItem>
                                                    <asp:ListItem>dance</asp:ListItem>
                                                    <asp:ListItem>lacrosse</asp:ListItem>
                                                    <asp:ListItem>track &amp; field</asp:ListItem>
                                                </asp:CheckBoxList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" colspan="2" height="10">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" colspan="2" align="center">
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2" colspan="3">
                                &nbsp;
                                <hr />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <div>
                                    <table>
                                        <tr style="width: 50%;">
                                            <td class="style1">
                                                <b>Regular Season</b>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr style="width: 50%;">
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr valign="top">
                                            <td colspan="2">
                                                <asp:Label ID="lblRegularSessionHeading" runat="server" Text="Please provide the number of regular season events, and the average attendance for those. Be sure to include spectators that did not buy a ticket (season passes, band members, participants, etc.).Also, when calculating your &quot;average&quot; number, consider the big rivals and non-conference events too."></asp:Label>
                                            </td>
                                        </tr>
                                        <tr valign="top">
                                            <td colspan="2">
                                                &nbsp;
                                                <div id="regularSession" style="height: auto; width: 100%; margin-top: 10px;">
                                                    <asp:DataGrid ID="dgRegularSeason" Width="98%" runat="server" AutoGenerateColumns="False"
                                                        HorizontalAlign="Center">
                                                        <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                                        <Columns>
                                                            <asp:TemplateColumn HeaderText="<b>ID</b>" Visible="false">
                                                                <ItemTemplate>
                                                                    <%# DataBinder.Eval(Container.DataItem, "ID")%>
                                                                </ItemTemplate>
                                                                <HeaderStyle></HeaderStyle>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn HeaderText="<b>Sports</b>">
                                                                <ItemTemplate>
                                                                    <%# DataBinder.Eval(Container.DataItem, "Sports")%>
                                                                </ItemTemplate>
                                                                <HeaderStyle></HeaderStyle>
                                                                <FooterTemplate>
                                                                    Reg Season Total
                                                                </FooterTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn HeaderText="<b># of events</b>">
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "Of Events")%>
                                                                </ItemTemplate>
                                                                <HeaderStyle></HeaderStyle>
                                                                <ItemStyle></ItemStyle>
                                                                <FooterTemplate>
                                                                    <p>
                                                                        <input id="txtOfEventTotal" type="text" readonly="readonly" disabled="disabled" style="width: 85px;
                                                                            border-style: none;" />
                                                                    </p>
                                                                </FooterTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn HeaderText="<b>Average Attendence</b>">
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "Average Attendance")%>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <p>
                                                                        <input id="txtAvgAttendenceTotal" type="text" readonly="readonly" disabled="disabled"
                                                                            style="width: 85px; border-style: none;" />
                                                                    </p>
                                                                </FooterTemplate>
                                                                <HeaderStyle></HeaderStyle>
                                                                <ItemStyle></ItemStyle>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn HeaderText="<b>Total Attendence</b>">
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "TotalAttendance")%>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <p>
                                                                        <input id="txtTotalAttendenceSum" type="text" readonly="readonly" disabled="disabled"
                                                                            style="width: 80px; border-style: none;" />
                                                                    </p>
                                                                </FooterTemplate>
                                                                <HeaderStyle></HeaderStyle>
                                                                <ItemStyle></ItemStyle>
                                                            </asp:TemplateColumn>
                                                        </Columns>
                                                        <HeaderStyle CssClass="HeaderStyle" Height="20px" BorderColor="Black" BorderStyle="Solid"
                                                            BorderWidth="2px" Wrap="True" />
                                                    </asp:DataGrid>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr valign="top">
                                            <td class="style1" colspan="2">
                                                <hr />
                                                <br />
                                            </td>
                                        </tr>
                                        <tr valign="top">
                                            <td class="style1">
                                                <b>Hosted Tournaments &amp; Speacial Events</b>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr valign="top">
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr valign="top">
                                            <td class="style1" colspan="2">
                                                <asp:Label ID="lblSpecialEvents" runat="server" Text="If your school regularly hosts tournaments or special events, including playoff, please provide that information here. If events is biarrual please note that in the comments below."></asp:Label>
                                            </td>
                                        </tr>
                                        <tr valign="top">
                                            <td class="style1" colspan="2">
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="dgHostedTournaments" />
                                                    </Triggers>
                                                    <ContentTemplate>
                                                        <div id="specialEvents" style="height: auto; overflow: auto; width: 97%; padding: 20px">
                                                            <asp:DataGrid ID="dgHostedTournaments" Width="98%" runat="server" AutoGenerateColumns="False"
                                                                HorizontalAlign="Center" ShowFooter="True" DataKeyField="ID" OnItemCommand="AddSportsEvents"
                                                                Visible="False" OnDeleteCommand="DelCustomEvents">
                                                                <FooterStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                                                <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="Id" Visible="false">
                                                                        <ItemTemplate>
                                                                            <%# DataBinder.Eval(Container.DataItem, "ID")%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="<b>Event Name</b>">
                                                                        <ItemTemplate>
                                                                            <%# DataBinder.Eval(Container.DataItem, "HostedEventsName")%>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle></HeaderStyle>
                                                                        <FooterTemplate>
                                                                            <asp:TextBox ID="txtEventName" runat="server" Style='width: 80px; margin: 4px;' MaxLength="30"></asp:TextBox>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="<b>Sports</b>">
                                                                        <ItemTemplate>
                                                                            <%# DataBinder.Eval(Container.DataItem, "HostedSports")%>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle></HeaderStyle>
                                                                        <FooterTemplate>
                                                                            <asp:DropDownList ID="ddlSportsList" runat="server">
                                                                            </asp:DropDownList>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="<b># of days</b>">
                                                                        <ItemTemplate>
                                                                            <%#DataBinder.Eval(Container.DataItem, "No_Of_Days")%>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle></HeaderStyle>
                                                                        <ItemStyle></ItemStyle>
                                                                        <FooterTemplate>
                                                                            <asp:TextBox ID="txtNoOfDays" MaxLength="8" Style='width: 80px; margin: 4px;' onkeyup='javascript:validateInput(this.id);'
                                                                                runat="server"></asp:TextBox>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="<b>Average Attendence</b>">
                                                                        <ItemTemplate>
                                                                            <%#DataBinder.Eval(Container.DataItem, "Hosted_Average_Attendance")%>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:TextBox ID="txtAvgAttendence" MaxLength="8" Style='width: 80px; margin: 4px;'
                                                                                onkeyup='javascript:validateInput(this.id);' runat="server"></asp:TextBox>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle></HeaderStyle>
                                                                        <ItemStyle></ItemStyle>
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="<b>Total Attendence</b>">
                                                                        <ItemTemplate>
                                                                            <%#DataBinder.Eval(Container.DataItem, "Hosted_Total_Attendance")%>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle></HeaderStyle>
                                                                        <ItemStyle></ItemStyle>
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="lbtnDelete" CausesValidation="false" runat="Server" CommandName="Delete">
                                                                                <asp:Image ID="Image1Delete" ToolTip="Delete" AlternateText="Delete" BorderStyle="None"
                                                                                    runat="server" ImageUrl="~/DesktopModules/SSM_Interest/Images/delete.png" Height="19"
                                                                                    Width="19" />
                                                                            </asp:LinkButton>
                                                                            <%-- <%# DataBinder.Eval(Container.DataItem, "ID")%>--%>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:LinkButton ID="lbtnAdd" runat="Server" CommandName="AddSchoolEvents" OnClick="lbtnAdd_Click"
                                                                                CausesValidation="False">
                                                                                <asp:Image ID="Image1Add" ToolTip="Add" AlternateText="Add" BorderStyle="None" runat="server"
                                                                                    ImageUrl="~/DesktopModules/SSM_Interest/Images/plus.png" Height="19" Width="19" />
                                                                            </asp:LinkButton>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                                <HeaderStyle CssClass="HeaderStyle" Height="20px" BorderColor="Black" BorderStyle="Solid"
                                                                    BorderWidth="2px" />
                                                            </asp:DataGrid>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                        <tr valign="top">
                                            <td class="style1" colspan="2">
                                                <hr />
                                            </td>
                                            <tr valign="top">
                                                <td class="style1">
                                                    <b>Comments &amp; Other&nbsp; Info</b>
                                                </td>
                                                <td class="style3">
                                                &nbsp;
                                            </tr>
                                            <tr valign="top">
                                                <td colspan="2">
                                                    <asp:Label ID="Label1" runat="server" Text="if there's is any else you think would be useful for us to know,please let us know here."></asp:Label>
                                                </td>
                                            </tr>
                                            <tr valign="top">
                                                <td colspan="2" height="10">
                                                </td>
                                            </tr>
                                            <tr valign="top">
                                                <td colspan="2">
                                                    <div id="Div1" style="height: auto; overflow: auto; width: 97%;">
                                                        <asp:TextBox ID="txtComment" runat="server" Height="78px" TextMode="MultiLine" Width="784px"></asp:TextBox>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr valign="top">
                                                <td colspan="2" height="10">
                                                </td>
                                            </tr>
                                            <tr valign="top">
                                                <td colspan="2">
                                                    <asp:Button ID="btnSend" runat="server" Style="text-align: right" Text="Send" OnClick="btnSend_Click"
                                                        OnClientClick="javascript:return EmailStringRegualrSeason();" />
                                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel2"
                                                        DynamicLayout="true" DisplayAfter="0">
                                                        <ProgressTemplate>
                                                        <asp:Panel ID="Panel1" CssClass="overlay" runat="server">
                                                         <asp:Panel ID="Panel2" CssClass="loader" runat="server">
                                                          <span><img src="/SSM_DNN/DesktopModules/SSM_Interest/Images/Progress.gif" /></span></asp:Panel>
                                                        </asp:Panel>
                                                            
                                                        </ProgressTemplate>
                                                    </asp:UpdateProgress>
                                                </td>
                                            </tr>
                                            <tr valign="top">
                                                <td colspan="2" height="10">
                                                </td>
                                            </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <!--ouraudience_content start here-->
</div>
<input id="hdnRegularSeasonEmailStr" type="hidden" runat="server" />
