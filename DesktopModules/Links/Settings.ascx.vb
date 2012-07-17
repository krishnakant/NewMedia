'
' DotNetNuke® - http://www.dotnetnuke.com
' Copyright (c) 2002-2008
' by DotNetNuke Corporation
'
' Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
' documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
' the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
' to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'
' The above copyright notice and this permission notice shall be included in all copies or substantial portions 
' of the Software.
'
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
' DEALINGS IN THE SOFTWARE.
'

Imports System.Web.UI.WebControls

Imports DotNetNuke
Imports DotNetNuke.Entities.Modules
Imports System.Collections.Generic
Imports DotNetNuke.Security.Permissions
Imports System.Xml

Namespace DotNetNuke.Modules.Links

    ''' -----------------------------------------------------------------------------
    ''' <summary>
    ''' The Settings ModuleSettingsBase is used to manage the 
    ''' settings for the Links Module
    ''' </summary>
    ''' <remarks>
    ''' </remarks>
    ''' <history>
    ''' 	[cnurse]	9/23/2004	Moved Links to a separate Project
    ''' 	[cnurse]	9/23/2004	Updated to reflect design changes for Help, 508 support
    '''                       and localisation
    '''		[cnurse]	10/20/2004	Converted to a ModuleSettingsBase class
    ''' </history>
    ''' -----------------------------------------------------------------------------
    Partial Class Settings
        Inherits Entities.Modules.ModuleSettingsBase

#Region " Base Method Implementations "

        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' LoadSettings loads the settings from the Databas and displays them
        ''' </summary>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        '''		[cnurse]	10/20/2004	created
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Public Overrides Sub LoadSettings()
            Try
                If (Page.IsPostBack = False) Then

                    If CType(TabModuleSettings(SettingName.DisplayMode), String) <> String.Empty Then
                        optControl.Items.FindByValue(CType(TabModuleSettings(SettingName.DisplayMode), String)).Selected = True
                        pnlWrap.Visible = ShowWrapPanel
                    Else
                        optControl.SelectedIndex = 0                         ' list
                    End If

                    If CType(TabModuleSettings(SettingName.Direction), String) <> String.Empty Then
                        optView.Items.FindByValue(CType(TabModuleSettings(SettingName.Direction), String)).Selected = True
                    Else
                        optView.SelectedIndex = 0                        ' vertical
                    End If

                    If CType(TabModuleSettings(SettingName.LinkDescriptionMode), String) <> "" Then
                        optInfo.Items.FindByValue(CType(TabModuleSettings(SettingName.LinkDescriptionMode), String)).Selected = True
                    Else
                        optInfo.SelectedIndex = 1
                    End If

                    trOptView.Visible = Not optControl.SelectedValue = Consts.DisplayModeDropdown

                    If Not String.IsNullOrEmpty(Me.PortalSettings.Version) _
                    AndAlso Me.PortalSettings.Version.StartsWith("5") Then
                        optInfo.Items(2).Enabled = True
                    Else
                        optInfo.Items(2).Enabled = False
                    End If

                    If CType(TabModuleSettings(SettingName.Icon), String) <> String.Empty Then
                        ctlIcon.Url = CType(TabModuleSettings(SettingName.Icon), String)
                    End If

                    If CType(TabModuleSettings("nowrap"), String) <> String.Empty Then
                        optNoWrap.Items.FindByValue(CType(TabModuleSettings("nowrap"), String)).Selected = True
                    Else
                        optNoWrap.SelectedIndex = 1
                    End If

                    If CType(TabModuleSettings(SettingName.UsePermissions), String) <> String.Empty Then
                        optUsePermissions.Items.FindByValue(CType(TabModuleSettings(SettingName.UsePermissions), String)).Selected = True
                    Else
                        optUsePermissions.SelectedIndex = 1
                    End If

                    If CType(TabModuleSettings(SettingName.ModuleContentType), String) <> String.Empty Then

                        optLinkModuleType.Items.FindByValue(CType(TabModuleSettings(SettingName.ModuleContentType), String)).Selected = True
                        pnlIcon.Visible = ShowIconPanel

                    End If

                    LoadContentData(optLinkModuleType.SelectedValue)

                End If

            Catch exc As Exception

                ProcessModuleLoadException(Me, exc)

            End Try

        End Sub

        Public Sub LoadContentData(ByVal pContentType As String)

            Select Case CType(pContentType, Enums.ModuleContentTypes)

                Case Enums.ModuleContentTypes.Links

                    optUsePermissions.Visible = True
                    plUsePermissions.Visible = True
                    optTypeContentSelection.Visible = False

                Case Enums.ModuleContentTypes.Menu

                    optTypeContentSelection.Visible = True

                    Dim dnnTabController As New TabController
                    Dim portalTabs As TabCollection = dnnTabController.GetTabsByPortal(PortalId)
                    Dim hostTabs As TabCollection = dnnTabController.GetTabsByPortal(-1)

                    Dim tabs As New TabCollection
                    AddTabsToCollection(portalTabs, tabs)
                    AddTabsToCollection(hostTabs, tabs)

                    Dim listTabs As New List(Of DotNetNuke.Entities.Tabs.TabInfo)
                    For Each kvp As Generic.KeyValuePair(Of Integer, DotNetNuke.Entities.Tabs.TabInfo) In tabs
                        listTabs.Add(kvp.Value)
                    Next

                    optTypeContentSelection.DataSource = listTabs
                    optTypeContentSelection.DataValueField = "TabID"
                    optTypeContentSelection.DataTextField = "TabPath"
                    optTypeContentSelection.DataBind()

                    If CType(TabModuleSettings(Consts.ModuleContentItem), String) <> String.Empty Then

                        Dim item As ListItem = optTypeContentSelection.Items.FindByValue(CType(TabModuleSettings(Consts.ModuleContentItem), String))

                        If item IsNot Nothing Then

                            item.Selected = True

                        End If

                    End If

                    optUsePermissions.Visible = False
                    plUsePermissions.Visible = False

                Case Enums.ModuleContentTypes.Folder

                    Dim folderCont As New DotNetNuke.Services.FileSystem.FolderController

                    Dim dic As Generic.Dictionary(Of String, DotNetNuke.Services.FileSystem.FolderInfo) = folderCont.GetFolders(Me.PortalId)

                    Dim folders As New Generic.List(Of DotNetNuke.Services.FileSystem.FolderInfo)

                    Dim folderPermissionsController As New FolderPermissionController

                    For Each item As Generic.KeyValuePair(Of String, DotNetNuke.Services.FileSystem.FolderInfo) In dic

                        If FolderPermissionController.HasFolderPermission(Me.PortalId, item.Value.FolderPath, "READ") Then

                            folders.Add(item.Value)

                        End If

                    Next

                    optTypeContentSelection.DataSource = folders
                    optTypeContentSelection.DataValueField = "FolderID"
                    optTypeContentSelection.DataTextField = "FolderPath"
                    optTypeContentSelection.DataBind()

                    For Each item As ListItem In optTypeContentSelection.Items

                        If String.IsNullOrEmpty(item.Text) Then

                            item.Text = "Root"

                        End If

                    Next

                    optTypeContentSelection.Visible = True
                    optUsePermissions.Visible = False
                    plUsePermissions.Visible = False

                    If Not String.IsNullOrEmpty(TabModuleSettings(Consts.ModuleContentItem)) Then

                        Dim moduleContentItem As String = TabModuleSettings(Consts.ModuleContentItem)

                        Dim hasItem As Boolean = False
                        For Each item As ListItem In optTypeContentSelection.Items
                            If item.Value = moduleContentItem Then
                                hasItem = True
                                Exit For
                            End If
                        Next

                        If hasItem Then
                            optTypeContentSelection.SelectedValue = TabModuleSettings(Consts.ModuleContentItem)
                        End If

                    End If

            End Select

        End Sub

        Private Sub AddTabsToCollection(ByVal inTabs As TabCollection, ByVal outtabs As TabCollection)

            ' 1.0.2 - Workaround for dnn powered content localization - [alexander.zimmer] & [simon.meraner]
            ' serialize tab object in order to be able to identify whether the content localization is active. 
            Dim tabSerializer As New System.Xml.Serialization.XmlSerializer(GetType(DotNetNuke.Entities.Tabs.TabInfo))
            For Each kvp As Generic.KeyValuePair(Of Integer, DotNetNuke.Entities.Tabs.TabInfo) In inTabs
                If Not outtabs.ContainsKey(kvp.Key) Then

                    Dim stream As New System.IO.StringWriter()

                    tabSerializer.Serialize(stream, kvp.Value)

                    Dim sr As System.IO.StringReader = New System.IO.StringReader(stream.ToString)
                    Dim xmlDoc As New XmlDocument
                    xmlDoc.Load(sr)

                    stream.Close()

                    Dim tabCulture As XmlElement = xmlDoc.SelectSingleNode("/tab/cultureCode")

                    Dim showCulture As Boolean = True

                    If tabCulture IsNot Nothing Then
                        Dim cultureNode As XmlNode = tabCulture.FirstChild

                        ' dnn 5.5.x detected ... exclude tabs where the cultures doesn`t matcj the current culture
                        If cultureNode IsNot Nothing AndAlso cultureNode.Value <> System.Threading.Thread.CurrentThread.CurrentCulture.Name Then
                            showCulture = False
                        End If
                    End If
                    ' -------------------------------------------------------------------------------------------------------

                    If showCulture Then
                        outtabs.Add(kvp.Key, kvp.Value)
                    End If

                End If
            Next
        End Sub

        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' UpdateSettings saves the modified settings to the Database
        ''' </summary>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        '''		[cnurse]	10/20/2004	created
        '''		[cnurse]	10/25/2004	upated to use TabModuleId rather than TabId/ModuleId
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Public Overrides Sub UpdateSettings()

            Try

                Dim objModules As New Entities.Modules.ModuleController

                objModules.UpdateTabModuleSetting(TabModuleId, SettingName.DisplayMode, optControl.SelectedItem.Value)
                objModules.UpdateTabModuleSetting(TabModuleId, SettingName.Direction, optView.SelectedItem.Value)
                objModules.UpdateTabModuleSetting(TabModuleId, SettingName.LinkDescriptionMode, optInfo.SelectedItem.Value)
                objModules.UpdateTabModuleSetting(TabModuleId, SettingName.Icon, ctlIcon.Url)
                objModules.UpdateTabModuleSetting(TabModuleId, "nowrap", optNoWrap.SelectedItem.Value)
                objModules.UpdateTabModuleSetting(TabModuleId, SettingName.ModuleContentType, optLinkModuleType.SelectedValue)
                objModules.UpdateTabModuleSetting(TabModuleId, SettingName.UsePermissions, optUsePermissions.SelectedValue)
                'objModules.UpdateTabModuleSetting(TabModuleId, "usepopup", optUsePopup.SelectedValue)

                Select Case CType(optLinkModuleType.SelectedValue, Enums.ModuleContentTypes)

                    Case Enums.ModuleContentTypes.Menu

                        objModules.UpdateTabModuleSetting(TabModuleId, Consts.ModuleContentItem, optTypeContentSelection.SelectedValue)

                    Case Enums.ModuleContentTypes.Folder

                        objModules.UpdateTabModuleSetting(TabModuleId, Consts.ModuleContentItem, optTypeContentSelection.SelectedValue)
                        objModules.UpdateTabModuleSetting(TabModuleId, Consts.FolderId, optTypeContentSelection.SelectedValue)

                    Case Else

                End Select

                Dim allowCaching As Boolean = True

                If optControl.SelectedItem.Value = Consts.DisplayModeDropdown Then
                    allowCaching = False
                End If

                If optInfo.SelectedItem.Value = "Y" Then
                    allowCaching = False
                End If

                If Not allowCaching Then
                    Dim objModule As DotNetNuke.Entities.Modules.ModuleInfo = objModules.GetModule(ModuleId, TabId, False)
                    If objModule.CacheTime > 0 Then
                        objModule.CacheTime = 0
                        objModules.UpdateModule(objModule)
                    End If
                End If

                ModuleController.SynchronizeModule(ModuleId)

            Catch exc As Exception

                ProcessModuleLoadException(Me, exc)

            End Try

        End Sub

#End Region

#Region " Event Handlers "

        Protected Sub optLinkModuleType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optLinkModuleType.SelectedIndexChanged

            Try

                pnlIcon.Visible = ShowIconPanel

                LoadContentData(optLinkModuleType.SelectedValue)

            Catch ex As Exception

                ProcessModuleLoadException(Me, ex)

            End Try

        End Sub

        Protected Sub optControl_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optControl.SelectedIndexChanged

            pnlWrap.Visible = ShowWrapPanel

            If ShowWrapPanel Then
                optNoWrap.SelectedValue = "NW"
            End If

            trOptView.Visible = Not optControl.SelectedValue = Consts.DisplayModeDropdown

        End Sub

#End Region

#Region " Properties "

        Public ReadOnly Property ShowIconPanel() As Boolean
            Get

                Dim result As Boolean = False

                If optLinkModuleType.SelectedValue = 1 Then
                    result = True
                End If

                Return result

            End Get
        End Property

        Public ReadOnly Property ShowWrapPanel() As String
            Get

                Dim result As Boolean = False

                If optControl.SelectedValue <> Consts.DisplayModeDropdown Then
                    result = True
                End If

                Return result

            End Get
        End Property

#End Region

    End Class

End Namespace
