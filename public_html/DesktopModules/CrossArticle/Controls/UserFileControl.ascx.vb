
'2009/07/22 基于dnn framework 的urlcontrol修改，用于显示特定用户的所属文件夹和文件
'1.set file id后的刷新
'2.UserFolderRoot属性
'3.UserDiskQuote属性，用户当前文件达到此限制时，将不能上传文件
Imports System.IO
Imports DotNetNuke.Services.Localization
Imports DotNetNuke.Services.FileSystem
Imports DotNetNuke.UI.Utilities
Imports DotNetNuke.Security.Permissions

Namespace Cross.UI.UserControls

    Public MustInherit Class UserFileControl

        Inherits Framework.UserControlBase



#Region "Private Members"

        Private _localResourceFile As String
        Private _loadData As Boolean = True
#End Region

#Region "Public Properties"

        Public Property FileFilter() As String
            Get
                If Not ViewState("FileFilter") Is Nothing Then
                    Return CType(ViewState("FileFilter"), String)
                Else
                    Return ""
                End If
            End Get
            Set(ByVal Value As String)
                ViewState("FileFilter") = Value
               
            End Set
        End Property

        Public Property LoadData() As Boolean
            Get
                Return _loadData
            End Get
            Set(ByVal Value As Boolean)
                _loadData = Value
            End Set
        End Property

        Public Property LocalResourceFile() As String
            Get
                Dim fileRoot As String

                If _localResourceFile = "" Then
                    fileRoot = Me.TemplateSourceDirectory & "/" & Localization.LocalResourceDirectory & "/UserFileControl.ascx"
                Else
                    fileRoot = _localResourceFile
                End If
                Return fileRoot
            End Get
            Set(ByVal Value As String)
                _localResourceFile = Value
            End Set
        End Property

       

        Public Property ModuleID() As Integer
            Get
                Dim myMid As Integer = -2
                If Not ViewState("ModuleId") Is Nothing Then
                    myMid = Convert.ToInt32(ViewState("ModuleId"))
                ElseIf Not Request.QueryString("mid") Is Nothing Then
                    myMid = Int32.Parse(Request.QueryString("mid"))
                End If
                Return myMid
            End Get
            Set(ByVal value As Integer)
                ViewState("ModuleId") = value
            End Set
        End Property

     
        Public Property UserFolderRootPrefix() As String
            Get
                If Not ViewState("UserFolderRootPrefix") Is Nothing Then
                    Return CType(ViewState("UserFolderRootPrefix"), String)
                Else
                    Return ""
                End If
            End Get
            Set(ByVal Value As String)
                ViewState("UserFolderRootPrefix") = Value
            End Set
        End Property

        Public Property UserDiskQuote() As Integer
            Get
                If Not ViewState("UserDiskQuote") Is Nothing Then
                    Return CType(ViewState("UserDiskQuote"), Integer)
                Else
                    Return 0 ' Set as 0 to not limit disk quoto
                End If
            End Get
            Set(ByVal Value As Integer)
                ViewState("UserDiskQuote") = Value
            End Set
        End Property

        Public ReadOnly Property UserCurrentDiskUsage() As Long
            Get
                Return Cross.DNN.Common.Utility.Utils.GetDirectorySize(UserFolderPhysicalPath)
            End Get
        End Property

        Public ReadOnly Property CurrentUserId() As Integer
            Get
                Dim currentUser As DotNetNuke.Entities.Users.UserInfo = DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo()
                Return currentUser.UserID
            End Get

        End Property
        Public ReadOnly Property UserFolderPath() As String
            Get
                Return UserFolderRootPrefix + "\" + CurrentUserId.ToString() + "\"
            End Get

        End Property

        Public ReadOnly Property UserFolderRelativePath() As String
            Get
                Return UserFolderRootPrefix + "/" + CurrentUserId.ToString() + "/"
            End Get

        End Property

        Public ReadOnly Property UserFolderPhysicalPath() As String
            Get
                Return PortalSettings.HomeDirectoryMapPath + UserFolderPath
            End Get
        End Property
  

        Public Property Url() As String
            Get
                Dim r As String = ""
                If Not cboFiles.SelectedItem Is Nothing Then
                    If Not cboFiles.SelectedItem.Value = "" Then
                        r = "FileID=" & cboFiles.SelectedItem.Value
                    Else
                        r = ""
                    End If
                End If
                Return r
            End Get
            Set(ByVal Value As String)
                ViewState("Url") = Value
                Dim r As String = Value.Replace("FileID=", "")
                Dim ctlFile As DotNetNuke.Services.FileSystem.FileController = New DotNetNuke.Services.FileSystem.FileController()
                Dim fi As DotNetNuke.Services.FileSystem.FileInfo = ctlFile.GetFileById(Convert.ToInt32(r), PortalSettings.PortalId)


                If Not fi Is Nothing Then
                    Dim ctlFolder As DotNetNuke.Services.FileSystem.FolderController = New DotNetNuke.Services.FileSystem.FolderController()
                    Dim folder As DotNetNuke.Services.FileSystem.FolderInfo = ctlFolder.GetFolderInfo(PortalSettings.PortalId, fi.FolderId)
                    If Not cboFolders.Items.FindByValue(folder.FolderPath) Is Nothing Then
                        cboFolders.SelectedIndex = -1
                        cboFolders.Items.FindByValue(folder.FolderPath).Selected = True
                    End If
                    GetFileList(True)
                    If Not cboFiles.Items.FindByValue(r) Is Nothing Then
                        cboFiles.SelectedIndex = -1
                        cboFiles.Items.FindByValue(r).Selected = True
                    End If
                End If

            End Set
        End Property

       

        Public Property Width() As String
            Get
                Width = Convert.ToString(ViewState("SkinControlWidth"))
            End Get
            Set(ByVal Value As String)
                If Value <> "" Then
                 
                    cboFolders.Width = System.Web.UI.WebControls.Unit.Parse(Value)
                    cboFiles.Width = System.Web.UI.WebControls.Unit.Parse(Value)

                    ViewState("SkinControlWidth") = Value
                End If
            End Set
        End Property
        Public Property ShowUpLoad() As Boolean
            Get
                If Not ViewState("ShowUpLoad") Is Nothing Then
                    Return CType(ViewState("ShowUpLoad"), Boolean)
                Else
                    Return True ' Set as default in the old variable
                End If
            End Get
            Set(ByVal Value As Boolean)
                ViewState("ShowUpLoad") = Value
               
            End Set
        End Property

#End Region

#Region "Private Methods"

        Private Sub GetFileList(ByVal NoneSpecified As Boolean)
            cboFiles.Items.Clear()
            cboFiles.DataSource = DotNetNuke.Common.Globals.GetFileList(PortalSettings.PortalId, FileFilter, NoneSpecified, cboFolders.SelectedItem.Value, False)
            cboFiles.DataBind()
        End Sub

        Private Sub LoadFolders()

            cboFolders.Items.Clear()
            Dim folders As ArrayList = FileSystemUtils.GetFolders(PortalSettings.PortalId)
            For Each folder As FolderInfo In folders
                Dim FolderItem As New ListItem
                If folder.FolderPath.StartsWith(UserFolderRelativePath) Then
                    If folder.FolderPath = UserFolderRelativePath Then
                        FolderItem.Text = Localization.GetString("UserRootPath", Me.LocalResourceFile)
                    Else
                        FolderItem.Text = FileSystemUtils.RemoveTrailingSlash(folder.FolderPath).Replace(UserFolderRelativePath, "")
                    End If
                    FolderItem.Value = folder.FolderPath
                    cboFolders.Items.Add(FolderItem)
                End If
            Next
        End Sub

        Private Sub CheckRootFolderExist()
            Dim ctlFolderController As DotNetNuke.Services.FileSystem.FolderController = New DotNetNuke.Services.FileSystem.FolderController()
            If Not System.IO.Directory.Exists(PortalSettings.HomeDirectoryMapPath + UserFolderRootPrefix + "\") Then 'CrossClassifiedProduct目录尚未创建
                System.IO.Directory.CreateDirectory(PortalSettings.HomeDirectoryMapPath + UserFolderRootPrefix) '创建CrossClassifiedProduct
            End If
            If ctlFolderController.GetFolder(PortalSettings.PortalId, UserFolderRootPrefix + "/", True) Is Nothing Then '检查该CrossClassifiedProduct是否存在数据库中，
                ctlFolderController.AddFolder(PortalSettings.PortalId, UserFolderRootPrefix + "/") '不存在则添加
            End If

            If Not System.IO.Directory.Exists(PortalSettings.HomeDirectoryMapPath + UserFolderPath) Then '用户的根目录尚未创建
                System.IO.Directory.CreateDirectory(PortalSettings.HomeDirectoryMapPath + UserFolderPath) '创建用户目录
            End If
            If ctlFolderController.GetFolder(PortalSettings.PortalId, UserFolderRelativePath, True) Is Nothing Then '检查该folder是否存在数据库中，
                ctlFolderController.AddFolder(PortalSettings.PortalId, UserFolderRelativePath) '不存在则添加
            End If
        End Sub

      

#End Region

#Region "Event Handlers"

        Private Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
            Framework.AJAX.RegisterPostBackControl(Me.FindControl("cmdSave"))

            ' prevent unauthorized access
            If Request.IsAuthenticated = False Then
                Me.Visible = False
            End If
        End Sub

        Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
            Try
                If Not IsPostBack AndAlso LoadData Then

                    If Not PortalSecurity.IsInRole(PortalSettings.AdministratorRoleName) Then 'Only check root folder for non-administrators
                        CheckRootFolderExist()
                    End If


                    If ShowUpLoad AndAlso (UserDiskQuote = 0 Or UserCurrentDiskUsage < (UserDiskQuote * 1024 * 1024)) Then
                        cmdUpload.Visible = True
                    End If
                    LoadFolders()
                    GetFileList(True)

                End If


            Catch exc As Exception    'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
        End Sub

       

        Private Sub cboFolders_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cboFolders.SelectedIndexChanged
            GetFileList(True)
        End Sub
        Private Sub cmdUpload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdUpload.Click
            Dim strSaveFolder As String = cboFolders.SelectedValue
            cboFiles.Visible = False
            cmdUpload.Visible = False
            txtFile.Visible = True
            cmdSave.Visible = True
            cmdCancel.Visible = True
        End Sub

        Private Sub cmdCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdCancel.Click
            cboFiles.Visible = True
            cmdUpload.Visible = True
            txtFile.Visible = False
            cmdSave.Visible = False
            cmdCancel.Visible = False

        End Sub
        Private Sub cmdSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSave.Click

            cmdUpload.Visible = False

            ' if no file is selected exit
            If txtFile.PostedFile.FileName = "" Then
                Exit Sub
            End If

            Dim ParentFolderName As String
          
            ParentFolderName = PortalSettings.HomeDirectoryMapPath

            ParentFolderName += cboFolders.SelectedItem.Value

            Dim strExtension As String = Replace(Path.GetExtension(txtFile.PostedFile.FileName), ".", "")
            If FileFilter <> "" And InStr("," & FileFilter.ToLower, "," & strExtension.ToLower) = 0 Then
                ' trying to upload a file not allowed for current filter
                lblMessage.Text = String.Format(Localization.GetString("UploadError", Me.LocalResourceFile), FileFilter, strExtension)
            Else
                lblMessage.Text = UploadFile(ParentFolderName.Replace("/", "\"), txtFile.PostedFile, False) '采用自己编写的upload function来完成上传
            End If

            If lblMessage.Text = String.Empty Then
                cboFiles.Visible = True
                cmdUpload.Visible = ShowUpLoad
                txtFile.Visible = False
                cmdSave.Visible = False
                cmdCancel.Visible = False

                Dim Root As New DirectoryInfo(ParentFolderName)
                GetFileList(False)


                Dim FileName As String = txtFile.PostedFile.FileName.Substring(txtFile.PostedFile.FileName.LastIndexOf("\") + 1)
                If Not cboFiles.Items.FindByText(FileName) Is Nothing Then
                    cboFiles.Items.FindByText(FileName).Selected = True
                End If

                If cboFiles.SelectedIndex >= 0 Then
                    ViewState("LastFileName") = cboFiles.SelectedValue
                Else
                    ViewState("LastFileName") = ""
                End If
            End If
        End Sub
        Private Function UploadFile(ByVal RootPath As String, ByVal objHtmlInputFile As HttpPostedFile, ByVal Unzip As Boolean) As String

            ' Obtain PortalSettings from Current Context
            Dim settings As PortalSettings = PortalController.GetCurrentPortalSettings


            Dim objPortalController As New PortalController
            Dim strMessage As String = ""
            Dim strFileName As String = objHtmlInputFile.FileName
            strFileName = RootPath & Path.GetFileName(strFileName)
            Dim strExtension As String = Replace(Path.GetExtension(strFileName), ".", "")
            Dim strFolderpath As String = GetSubFolderPath(strFileName, settings.PortalId)

            Dim objFolders As New FolderController
            Dim objFolder As FolderInfo = objFolders.GetFolder(settings.PortalId, strFolderpath, False)

            If objPortalController.HasSpaceAvailable(settings.PortalId, objHtmlInputFile.ContentLength) Then
                If InStr(1, "," & DotNetNuke.Entities.Host.Host.FileExtensions.ToUpper, "," & strExtension.ToUpper) <> 0 Then
                    'Save Uploaded file to server
                    Try

                        strMessage += AddFile(settings.PortalId, objHtmlInputFile.InputStream, strFileName, objHtmlInputFile.ContentType, objHtmlInputFile.ContentLength, strFolderpath, True, True, True)

                        'Optionally Unzip File?
                        If Path.GetExtension(strFileName).ToLower = ".zip" And Unzip = True Then
                            strMessage += FileSystemUtils.UnzipFile(strFileName, RootPath, settings)
                        End If
                    Catch Exc As Exception
                        ' save error - can happen if the security settings are incorrect on the disk
                        strMessage += "<br>" & String.Format(Localization.GetString("SaveFileError"), strFileName)
                    End Try
                Else
                    ' restricted file type
                    strMessage += "<br>" & String.Format(Localization.GetString("RestrictedFileType"), strFileName, Replace(DotNetNuke.Entities.Host.Host.FileExtensions, ",", ", *."))
                End If
            Else    ' file too large
                strMessage += "<br>" & String.Format(Localization.GetString("DiskSpaceExceeded"), strFileName)
            End If


            Return strMessage
        End Function
        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' Adds a File
        ''' </summary>
        ''' <param name="PortalId">The Id of the Portal</param>
        ''' <param name="inStream">The stream to add</param>
        ''' <param name="contentType">The type of the content</param>
        ''' <param name="length">The length of the content</param>
        ''' <param name="folderName">The name of the folder</param>
        ''' <param name="closeInputStream">A flag that dermines if the Input Stream should be closed.</param>
        ''' <param name="ClearCache">A flag that indicates whether the file cache should be cleared</param>
        ''' <remarks>This method adds a new file
        ''' </remarks>
        ''' <history>
        '''     [cnurse]    04/26/2006  Created
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Private Function AddFile(ByVal PortalId As Integer, ByVal inStream As Stream, ByVal fileName As String, ByVal contentType As String, ByVal length As Long, ByVal folderName As String, ByVal closeInputStream As Boolean, ByVal clearCache As Boolean, ByVal synchronize As Boolean) As String

            Dim objFolderController As New DotNetNuke.Services.FileSystem.FolderController
            Dim objFileController As New DotNetNuke.Services.FileSystem.FileController
            Dim sourceFolderName As String = GetSubFolderPath(fileName, PortalId)
            Dim folder As FolderInfo = objFolderController.GetFolder(PortalId, sourceFolderName, False)
            Dim sourceFileName As String = System.IO.Path.GetFileName(fileName).Replace(glbProtectedExtension, "")
            Dim intFileID As Integer
            Dim retValue As String = ""



            Dim extension As String = Path.GetExtension(fileName).Replace(".", "")
            If contentType = "" Then
                contentType = FileSystemUtils.GetContentType(extension)
            End If

            'Add file to Database
            intFileID = objFileController.AddFile(PortalId, sourceFileName, extension, length, Null.NullInteger, Null.NullInteger, contentType, folderName, folder.FolderID, clearCache)

            'Save file to File Storage

            WriteStream(intFileID, inStream, fileName, folder.StorageLocation, closeInputStream)

            'Update the FileData
            retValue += UpdateFileData(intFileID, folder.FolderID, PortalId, sourceFileName, extension, contentType, length, folderName)




            Return retValue

        End Function
        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' Writes a Stream to the appropriate File Storage
        ''' </summary>
        ''' <param name="fileId">The Id of the File</param>
        ''' <param name="inStream">The Input Stream</param>
        ''' <param name="fileName">The name of the file</param>
        ''' <param name="StorageLocation">The type of storage location</param>
        ''' <param name="closeInputStream">A flag that dermines if the Input Stream should be closed.</param>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        ''' 	[cnurse]	04/27/2006	Created
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Private Sub WriteStream(ByVal fileId As Integer, ByVal inStream As Stream, ByVal fileName As String, ByVal storageLocation As Integer, ByVal closeInputStream As Boolean)

            Dim objFileController As New DotNetNuke.Services.FileSystem.FileController

            ' Buffer to read 2K bytes in chunk:
            Dim arrData(2048) As Byte
            Dim outStream As Stream = Nothing
            Select Case storageLocation
                Case FolderController.StorageLocationTypes.DatabaseSecure
                    objFileController.ClearFileContent(fileId)
                    outStream = New MemoryStream
                Case FolderController.StorageLocationTypes.SecureFileSystem
                    If File.Exists(fileName & glbProtectedExtension) = True Then
                        File.Delete(fileName & glbProtectedExtension)
                    End If
                    outStream = New FileStream(fileName & glbProtectedExtension, FileMode.Create)
                Case FolderController.StorageLocationTypes.InsecureFileSystem
                    If File.Exists(fileName) = True Then
                        File.Delete(fileName)
                    End If
                    outStream = New FileStream(fileName, FileMode.Create)
            End Select

            Try
                ' Total bytes to read:
                Dim intLength As Integer
                ' Read the data in buffer
                intLength = inStream.Read(arrData, 0, arrData.Length)
                While intLength > 0
                    ' Write the data to the current output stream.
                    outStream.Write(arrData, 0, intLength)

                    'Read the next chunk
                    intLength = inStream.Read(arrData, 0, arrData.Length)
                End While

                If storageLocation = FolderController.StorageLocationTypes.DatabaseSecure Then
                    outStream.Seek(0, SeekOrigin.Begin)
                    objFileController.UpdateFileContent(fileId, outStream)
                End If
            Catch ex As Exception
                LogException(ex)
            Finally
                If IsNothing(inStream) = False And closeInputStream Then
                    ' Close the file.
                    inStream.Close()
                End If
                If IsNothing(outStream) = False Then
                    ' Close the file.
                    outStream.Close()
                End If
            End Try

        End Sub
        Private Function UpdateFileData(ByVal fileID As Integer, ByVal folderID As Integer, ByVal PortalId As Integer, ByVal fileName As String, ByVal extension As String, ByVal contentType As String, ByVal length As Long, ByVal folderName As String) As String
            Dim retvalue As String = ""
            Try
                Dim objFileController As New DotNetNuke.Services.FileSystem.FileController
                Dim imgImage As System.Drawing.Image
                Dim imageWidth As Integer
                Dim imageHeight As Integer

                If Convert.ToBoolean(InStr(1, glbImageFileTypes & ",", extension.ToLower & ",")) Then
                    Try
                        Dim objFile As DotNetNuke.Services.FileSystem.FileInfo = objFileController.GetFileById(fileID, PortalId)
                        Dim imageStream As Stream = FileSystemUtils.GetFileStream(objFile)
                        imgImage = Drawing.Image.FromStream(imageStream)
                        imageHeight = imgImage.Height
                        imageWidth = imgImage.Width
                        imgImage.Dispose()
                        imageStream.Close()
                    Catch
                        ' error loading image file
                        contentType = "application/octet-stream"
                    Finally
                        'Update the File info
                        objFileController.UpdateFile(fileID, fileName, extension, length, imageWidth, imageHeight, contentType, folderName, folderID)
                    End Try
                End If
            Catch ex As Exception
                retvalue = ex.Message
            End Try

            Return retvalue
        End Function
#End Region

    End Class

End Namespace
