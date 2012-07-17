<%@ Control language="vb" CodeBehind="Settings.ascx.vb" AutoEventWireup="false" Explicit="true" Inherits="DotNetNuke.Modules.Feedback.Settings" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>

<table id="tblFeedbackSettings" runat="server" cellspacing="0" cellpadding="4" summary="Feedback Settings Design Table" border="0" width="100%">
	<tr>
	    <td><asp:Label ID="lblErrorMsg" runat="server" visible="false"></asp:Label></td>
	</tr>
	<tr>
	   <td><dnn:SectionHead ID="scnEmail" runat="server" CssClass="Head" Text="Email Address Setup" Section="tblEmail"
	              ResourceKey="scnEmail" IncludeRule="True" IsExpanded="True"/></td>
	</tr>
	<tr>
	   <td>
	      <table id="tblEmail" runat="server" cellspacing="0" cellpadding="2" style="width: 100%" border="0">
	        <tr>
		       <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plSendTo" runat="server" controlname="txtSendTo" suffix=":"></dnn:label></td>
		       <td class="Feedback_Settings_Field"><asp:textbox id="txtSendTo" runat="server" width="100%" cssclass="NormalTextBox"></asp:textbox>
			      <asp:regularexpressionvalidator id="valSendTo" resourcekey="valSendTo.ErrorMessage" runat="server" cssclass="NormalRed" controltovalidate="txtSendTo"
				      errormessage="<br/>Email Must be Valid" validationexpression="(([\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+);?)+" display="Dynamic"></asp:regularexpressionvalidator>
		       </td>
	        </tr>
	        <tr>
		       <td class="SubHead Feedback_Settings_FieldLabel" style="vertical-align:top"><dnn:label id="plSendToRoles" runat="server" controlname="dgSelectedRoles" suffix=":"></dnn:label></td>
		       <td class="Feedback_Settings_Field" style="white-space:nowrap">
		          <dnn:RolesSelectionGrid runat="server" ID="dgSelectedRoles" />
		       </td>
	        </tr>
	        <tr>
		       <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plSendFrom" runat="server" controlname="txtSendFrom" suffix=":"></dnn:label></td>
		       <td class="Feedback_Settings_Field">
		          <asp:textbox id="txtSendFrom" runat="server" width="300px" cssclass="NormalTextBox" columns="35" maxlength="100"></asp:textbox>
			      <asp:regularexpressionvalidator id="valSendFrom" resourcekey="valSendFrom.ErrorMessage" runat="server" cssclass="NormalRed" controltovalidate="txtSendFrom"
				       errormessage="<br/>Email Must be Valid" validationexpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+" display="Dynamic"></asp:regularexpressionvalidator>
		       </td>
	        </tr>
	        <tr>
		       <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plSendCopy" runat="server" controlname="chkSendCopy" suffix=":"></dnn:label></td>
		       <td class="Feedback_Settings_Field" >
			      <asp:CheckBox id="chkSendCopy" runat="server" cssclass="normal" AutoPostBack="true"></asp:CheckBox>
		       </td>
	        </tr>
	        <tr>
		       <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plOptout" runat="server" controlname="chkOptout" suffix=":"></dnn:label></td>
		       <td class="Feedback_Settings_Field">
			      <asp:CheckBox id="chkOptout" runat="server" cssclass="normal"></asp:CheckBox>
		       </td>
	        </tr>
	        <tr>
		       <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plAsync" runat="server" controlname="chkAsync" suffix=":"></dnn:label></td>
		       <td class="Feedback_Settings_Field">
			       <asp:CheckBox id="chkAsync" runat="server" cssclass="normal"></asp:CheckBox>
		       </td>
	        </tr>
	      </table>
	   </td>
	</tr>
	<tr>
	   <td><dnn:SectionHead ID="scnCategories" runat="server" CssClass="Head" Text="Feedback Categories"
	           Section="tblCategories" ResourceKey="scnCategories" IncludeRule="True" IsExpanded="False"/></td>
	</tr>
	<tr>
	   <td>
	      <table id="tblCategories" runat="server" cellspacing="0" cellpadding="2" style="width: 100%" border="0">
	         <tr>
		        <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plCategory" runat="server" controlname="cboCategory" suffix=":"></dnn:label></td>
		        <td class="Feedback_Settings_Field">
			       <asp:DropDownList id="cboCategory" runat="server" cssclass="normal"></asp:DropDownList>
		        </td>
	         </tr>
	         <tr>
		        <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plCategorySelectable" runat="server" controlname="chkCategory" suffix=":"></dnn:label></td>
		        <td class="Feedback_Settings_Field">
			       <asp:CheckBox id="chkCategory" runat="server" cssclass="normal"></asp:CheckBox>
		        </td>
	         </tr>
	         <tr>
		        <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plUseCategoryAsEmail" runat="server" controlname="chkCategoryMailto" suffix=":"></dnn:label></td>
		        <td class="Feedback_Settings_Field">
			       <asp:CheckBox id="chkCategoryMailto" runat="server" cssclass="normal"></asp:CheckBox>
		        </td>
	         </tr>
	      </table>
	   </td>
	</tr>
	<tr>
	   <td><dnn:SectionHead ID="scnFields" runat="server" CssClass="Head" Text="Form and Fields Setup"
	              Section="tblFields" ResourceKey="scnFields" IncludeRule="True" IsExpanded="False" /></td>
	</tr>
	<tr>
	   <td>
	      <table id="tblFields" runat="server" cellspacing="0" cellpadding="2" style="width: 100%" border="0">
	         <tr>
		        <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plLabelDisplay" runat="server" controlname="rblLabelDisplay" suffix=":"></dnn:label></td>
		        <td class="Feedback_Settings_Field">
			       <asp:RadioButtonList id="rblLabelDisplay" runat="server" cssclass="normal" RepeatLayout="Flow" RepeatDirection="Horizontal">
			          <asp:ListItem Text="Same Line As Field" Value="1" ResourceKey="liLabelSameLine"></asp:ListItem>
			          <asp:ListItem Text="Above Field" Value="2" ResourceKey="liLabelAboveField"></asp:ListItem>
			       </asp:RadioButtonList>
		       </td>
	         </tr>
	         <tr>
		        <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plWidth" runat="server" controlname="txtWidth" suffix=":"></dnn:label></td>
		        <td class="Feedback_Settings_Field">
		             <asp:textbox id="txtWidth" runat="server" width="300px" cssclass="NormalTextBox" columns="35" maxlength="100"></asp:textbox>
	        		 <asp:regularexpressionvalidator id="valWidth" resourcekey="valWidth.ErrorMessage" runat="server" cssclass="NormalRed" controltovalidate="txtWidth"
				         errormessage="" validationexpression="^\d{1,}$|(^(100|\d{1,2}((\.\d{1,2})?)?)%$)" display="Dynamic"></asp:regularexpressionvalidator>
    	        </td>
	         </tr>
	         <tr>
		        <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plSubject" runat="server" controlname="txtSubject" suffix=":"></dnn:label></td>
		        <td class="Feedback_Settings_Field">
			       <asp:DropDownList id="cboSubject" runat="server" cssclass="normal"/>
		        </td>
	         </tr>
	         <tr>
		        <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plSubjectEditField" runat="server" controlname="rblSubjectEdit" suffix=":"></dnn:label></td>
		        <td class="Feedback_Settings_Field">
			       <asp:RadioButtonList id="rblSubjectEditField" runat="server" cssclass="normal" RepeatLayout="Flow" RepeatDirection="Horizontal">
			          <asp:ListItem Text="List" Value="1" ResourceKey="liSubjectList"></asp:ListItem>
			          <asp:ListItem Text="Text Box" Value="2" ResourceKey="liSubjectTextBox"></asp:ListItem>
			          <asp:ListItem Text="Hidden" Value="3" ResourceKey="liSubjectHidden"></asp:ListItem>
			       </asp:RadioButtonList>
		       </td>
	         </tr>
	         <tr>
		        <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plNameField" runat="server" controlname="rblNameField" suffix=":"></dnn:label></td>
		        <td class="Feedback_Settings_Field">
			       <asp:RadioButtonList id="rblNameField" runat="server" cssclass="normal" RepeatLayout="Flow" RepeatDirection="Horizontal"></asp:RadioButtonList>
		        </td>
	         </tr>
	         <tr>
		        <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plStreetField" runat="server" controlname="rblStreetField" suffix=":"></dnn:label></td>
		        <td class="Feedback_Settings_Field">
			       <asp:RadioButtonList id="rblStreetField" runat="server" cssclass="normal" RepeatLayout="Flow" RepeatDirection="Horizontal"></asp:RadioButtonList>
		        </td>
	         </tr>
	         <tr>
		        <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plCityField" runat="server" controlname="rblCityField" suffix=":"></dnn:label></td>
		        <td class="Feedback_Settings_Field">
			        <asp:RadioButtonList id="rblCityField" runat="server" cssclass="normal" RepeatLayout="Flow" RepeatDirection="Horizontal"></asp:RadioButtonList>
		        </td>
	         </tr>
	         <tr>
		        <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plRegionField" runat="server" controlname="rblRegionField" suffix=":"></dnn:label></td>
		        <td class="Feedback_Settings_Field">
			        <asp:RadioButtonList id="rblRegionField" runat="server" cssclass="normal" RepeatLayout="Flow" RepeatDirection="Horizontal"></asp:RadioButtonList>
		        </td>
	         </tr>
	         <tr>
		        <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plCountryField" runat="server" controlname="rblCountryField" suffix=":"></dnn:label></td>
		        <td class="Feedback_Settings_Field">
			        <asp:RadioButtonList id="rblCountryField" runat="server" cssclass="normal" RepeatLayout="Flow" RepeatDirection="Horizontal"></asp:RadioButtonList>
		        </td>
	         </tr>
	         <tr>
		        <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plPostalCodeField" runat="server" controlname="rblPostalCodeField" suffix=":"></dnn:label></td>
		        <td class="Feedback_Settings_Field">
			        <asp:RadioButtonList id="rblPostalCodeField" runat="server" cssclass="normal" RepeatLayout="Flow" RepeatDirection="Horizontal"></asp:RadioButtonList>
		        </td>
	         </tr>
	         <tr>
		        <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plTelephoneField" runat="server" controlname="rblTelephoneField" suffix=":"></dnn:label></td>
		        <td class="Feedback_Settings_Field">
			        <asp:RadioButtonList id="rblTelephoneField" runat="server" cssclass="normal" RepeatLayout="Flow" RepeatDirection="Horizontal"></asp:RadioButtonList>
		        </td>
	         </tr>
	         <tr>
		        <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plEmailRegex" runat="server" controlname="txtEmailRegex" suffix=":"></dnn:label></td>
		        <td class="Feedback_Settings_Field">
		           <asp:textbox id="txtEmailRegex" runat="server" width="425px" cssclass="NormalTextBox" columns="200" maxlength="200"></asp:textbox>&nbsp;
		           <asp:Button ID="btnResetEmailRegex" runat="server" CssClass="CommandButton" CausesValidation="False" Text="Reset Default" ResourceKey="btnResetDefault" />
		           <asp:requiredfieldvalidator id="valEmailRegex" runat="server" cssclass="NormalRed" Display="Dynamic" errormessage="<br />Email Regex is required."
				          controltovalidate="txtEmailRegex" resourcekey="valEmailRegex.Error"></asp:requiredfieldvalidator>		           
		        </td>
	         </tr>
	         <tr>
		        <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plPostalCodeRegex" runat="server" controlname="txtPostalCodeRegex" suffix=":"></dnn:label></td>
		        <td class="Feedback_Settings_Field">
		           <asp:textbox id="txtPostalCodeRegex" runat="server" width="425px" cssclass="NormalTextBox" columns="200" maxlength="200"></asp:textbox>&nbsp;
		           <asp:Button ID="btnResetPostalCodeRegex" runat="server" CssClass="CommandButton" CausesValidation="False" Text="Reset Default" ResourceKey="btnResetDefault" />
		        </td>
	         </tr>
	         <tr>
		        <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plTelephoneRegex" runat="server" controlname="txtTelephoneRegex" suffix=":"></dnn:label></td>
		        <td class="Feedback_Settings_Field">
		           <asp:textbox id="txtTelephoneRegex" runat="server" width="425px" cssclass="NormalTextBox" columns="200" maxlength="200"></asp:textbox>&nbsp;
		           <asp:Button ID="btnResetTelephoneRegex" runat="server" CssClass="CommandButton" CausesValidation="False" Text="Reset Default" ResourceKey="btnResetDefault" />
		        </td>
	         </tr>
	         <tr>
		        <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plRows" runat="server" controlname="txtrows" suffix=":"></dnn:label></td>
		        <td class="Feedback_Settings_Field"><asp:textbox id="txtrows" runat="server" width="300px" cssclass="NormalTextBox" columns="35"
				        maxlength="100"></asp:textbox>
			        <asp:regularexpressionvalidator id="valRows" resourcekey="valRows.ErrorMessage" controltovalidate="txtrows" validationexpression="^[1-9]+[0-9]*$"
				        display="Dynamic" cssclass="NormalRed" errormessage="<br/>Rows Must Be A Valid Integer" runat="server" />
		        </td>
	         </tr>
	      </table>
	   </td>
	</tr>
	<tr>
	   <td><dnn:SectionHead ID="scnSubmission" runat="server" CssClass="Head" Text="Submission and Security Settings" 
	              Section="tblSubmission" ResourceKey="scnSubmission" IncludeRule="True" IsExpanded="False" /></td>
	</tr>
	<tr>
	   <td>
	      <table id="tblSubmission" runat="server" cellspacing="0" cellpadding="2" style="width: 100%" border="0">
             <tr>
	            <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plCaptchaVisibility" runat="server" controlname="rblCaptchaVisibility" suffix=":"></dnn:label></td>
	            <td class="Feedback_Settings_Field">
		            <asp:RadioButtonList ID="rblCaptchaVisibility" runat="server" CssClass="Normal" RepeatLayout="Flow" RepeatDirection="Horizontal">
		               <asp:ListItem Text="All Users" resourcekey="AllUsers" Value="1"></asp:ListItem>
		               <asp:ListItem Text="Anonymous Users Only" resourcekey="AnonymousUsers" Value="2"></asp:ListItem>
		               <asp:ListItem Text="Disabled" resourcekey="Disabled" Value="3"></asp:ListItem>
		            </asp:RadioButtonList>
	            </td>
             </tr>
             <tr>
	            <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plRepeatSubmissionFilter" runat="server" controlname="rblRepeatSubmissionFilter" suffix=":"></dnn:label></td>
	            <td class="Feedback_Settings_Field">
		            <asp:RadioButtonList ID="rblRepeatSubmissionFilter" runat="server" CssClass="Normal" RepeatLayout="Flow" RepeatDirection="Horizontal">
		               <asp:ListItem Text="No Filtering" resourcekey="NoFiltering" Value="1"></asp:ListItem>
		               <asp:ListItem Text="DotNetNuke UserID" resourcekey="UserIDFilter" Value="2"></asp:ListItem>
		               <asp:ListItem Text="User IP Address" resourcekey="UserIPFilter" Value="3"></asp:ListItem>
		               <asp:ListItem Text="Email Address" resourcekey="UserEmailFilter" Value="4"></asp:ListItem>
		            </asp:RadioButtonList>
	            </td>
             </tr>
             <tr>
	            <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plMinSubmissionInteval" runat="server" controlname="txtMinSubmissionInteval" suffix=":"></dnn:label></td>
	            <td class="Feedback_Settings_Field"><asp:textbox id="txtMinSubmissionInteval" runat="server" width="300px" cssclass="NormalTextBox" columns="6"
			            maxlength="6"></asp:textbox>
		            <asp:regularexpressionvalidator id="valMinSubmissionInteval" resourcekey="valMinSubmissionInteval.ErrorMessage" controltovalidate="txtMinSubmissionInteval" validationexpression="^\d{1,5}$"
			            display="Dynamic" cssclass="NormalRed" errormessage="<br/>Minimum Submission Inteval Must Be Integer 0-99999" runat="server" />
	            </td>
             </tr>
             <tr>
                <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label ID="plRedirectTabOnSubmission" runat="server" ControlName="ddlRedirectTabOnSubmission" Suffix=":" /></td>
                <td class="Feedback_Settings_Field">
                    <asp:DropDownList ID="ddlRedirectTabOnSubmission" runat="server"></asp:DropDownList>
                </td>
             </tr>
          </table>
	   </td>
	</tr>
	<tr>
	   <td><dnn:SectionHead ID="scnModeration" runat="server" CssClass="Head" Text="Moderation Setup"
	              Section="tblModeration" ResourceKey="scnModeration" IncludeRule="True" IsExpanded="False" /></td>
	</tr>
	<tr>
	   <td>
	      <table id="tblModeration" runat="server" cellspacing="0" cellpadding="2" style="width: 100%" border="0">
	         <tr>
		        <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plScope" runat="server" controlname="rblScope" suffix=":"></dnn:label></td>
		        <td class="Feedback_Settings_Field">
			       <asp:RadioButtonList ID="rblScope" runat="server" CssClass="Normal" RepeatLayout="Flow" RepeatDirection="Horizontal">
			       <asp:ListItem Text="Instance (for this Feedback module only)" resourcekey="Instance" Value="1"></asp:ListItem>
			          <asp:ListItem Text="Portal (across all Feedback module of portal)" resourcekey="Portal" Value="2"></asp:ListItem>
			       </asp:RadioButtonList>
		        </td>
	        </tr>
	        <tr id="trOrphanedData" runat="server">
	            <td class="SubHead Feedback_Settings_FieldLabel" style="vertical-align:top"><dnn:label id="plOrphanedData" runat="server" controlname="dgOrphanedData" suffix=":"></dnn:label></td>
	            <td class="Feedback_Settings_Field">
	                <asp:DataGrid ID="dgOrphanedData" runat="server" AutoGenerateColumns="false" GridLines="None" CellPadding="2">
	                   <HeaderStyle CssClass="DataGrid_Header" HorizontalAlign="Center" />
	                   <ItemStyle CssClass="DataGrid_Item" HorizontalAlign="Center" />
	                   <Columns>
	                      <asp:BoundColumn DataField="Key" HeaderText="ModuleID"></asp:BoundColumn>
	                      <asp:BoundColumn DataField="Value" HeaderText="Items"></asp:BoundColumn>
	                   </Columns>
	                </asp:DataGrid><asp:Button ID="cmdDeleteOrphanedData" ResourceKey="cmdDeleteOrphanedData" CausesValidation="false" runat="server" />
	            </td>
	        </tr>
	        <tr>
		        <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plModerated" runat="server" controlname="chkModerated" suffix=":"></dnn:label></td>
		        <td class="Feedback_Settings_Field">
			       <asp:CheckBox id="chkModerated" runat="server" cssclass="normal" AutoPostBack="true"></asp:CheckBox>
		        </td>
	         </tr>
	        <tr id="trModerationCategories" runat="server">
		       <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plModerationCategory" runat="server" controlname="cboModerationCategory" suffix=":"></dnn:label></td>
		       <td class="Feedback_Settings_Field">
			      <asp:CheckBoxList id="cblModerationCategories" runat="server" cssclass="normal" RepeatColumns="2" RepeatDirection="Horizontal"></asp:CheckBoxList>
		       </td>
	        </tr>
	        <tr id="trUnmoderatedStatus" runat="server">
	           <td class="SubHead Feedback_Settings_FieldLabel"><dnn:Label ID="plUnmoderatedStatus" runat="server" ControlName="ddlUnmoderatedStatus" Suffix=":" /></td>
	           <td class="Feedback_Settings_Field">
	              <asp:DropDownList ID="ddlUnmoderatedStatus" runat="server" CssClass="Normal"></asp:DropDownList>
	           </td>
	        </tr>        
	        <tr valign="top">
               <td class="SubHead Feedback_Settings_FieldLabel">
                    <dnn:Label ID="plPrintTemplate" runat="server" ControlName="txtPrintTemplate" Suffix=":"></dnn:Label>
               </td>
               <td class="Feedback_Settings_Field">
                  <asp:TextBox ID="txtPrintTemplate" CssClass="NormalTextBox" Width="425" TextMode="MultiLine"
                        Rows="10" MaxLength="2000" runat="server" />&nbsp;
                  <asp:Button ID="btnLoadDefaultPrintTemplate" runat="server" Text="Reset Default" CausesValidation="False" CssClass="CommandButton" resourcekey="btnResetDefault"></asp:Button>
               </td>
            </tr>
            <tr>
		       <td class="SubHead Feedback_Settings_FieldLabel"><dnn:label id="plPrintAction" runat="server" controlname="rblPrintAction" suffix=":"></dnn:label></td>
		       <td class="Feedback_Settings_Field">
			      <asp:RadioButtonList ID="rblPrintAction" runat="server" CssClass="Normal" RepeatLayout="Flow" RepeatDirection="Horizontal">
			           <asp:ListItem Text="In-Line (Same Page)" resourcekey="InLine" Value="1"></asp:ListItem>
			           <asp:ListItem Text="Popup (New Page)" resourcekey="Popup" Value="2"></asp:ListItem>
			      </asp:RadioButtonList>
		       </td>
	        </tr>
	      </table>
	   </td>
	</tr>	
</table>