--儲存雙數月份的 Elmah 應用程式執行錯誤
CREATE TABLE [dbo].[ElmahError-0] (
	[No] INT IDENTITY(1, 1) NOT NULL
	,[Application] NVARCHAR(60)
	,[Host] NVARCHAR(50)
	,[Type] NVARCHAR(100)
	,[Source] NVARCHAR(60)
	,[Message] NVARCHAR(500)
	,[User] NVARCHAR(50)
	,[StatusCode] INT
	,[TimeUtc] DATETIME DEFAULT(GETDATE())
	,[AllXml] NVARCHAR(MAX)
	,CONSTRAINT [PK_dbo_ElmahError-0_No] PRIMARY KEY CLUSTERED ([No] ASC) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

--儲存單數月份的 Elmah 應用程式執行錯誤
CREATE TABLE [dbo].[ElmahError-1] (
	[No] INT IDENTITY(1, 1) NOT NULL
	,[Application] NVARCHAR(60)
	,[Host] NVARCHAR(50)
	,[Type] NVARCHAR(100)
	,[Source] NVARCHAR(60)
	,[Message] NVARCHAR(500)
	,[User] NVARCHAR(50)
	,[StatusCode] INT
	,[TimeUtc] DATETIME DEFAULT(GETDATE())
	,[AllXml] NVARCHAR(MAX)
	,CONSTRAINT [PK_dbo_ElmahError-1_No] PRIMARY KEY CLUSTERED ([No] ASC) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

--
--儲存 Elmah 應用程式執行錯誤的使用者自訂預存程序內容
--
CREATE PROCEDURE [dbo].[ELMAH_LogError] (
	@ErrorId UNIQUEIDENTIFIER
	,@Application NVARCHAR(60)
	,@Host NVARCHAR(30)
	,@Type NVARCHAR(100)
	,@Source NVARCHAR(60)
	,@Message NVARCHAR(500)
	,@User NVARCHAR(50)
	,@AllXml NVARCHAR(MAX)
	,@StatusCode INT
	,@TimeUtc DATETIME
	)
AS
SET NOCOUNT ON
SET @TimeUtc = (GETDATE())

--判斷資料要被儲存在那一個資料表
IF (DATEPART(MONTH, @TimeUtc) % 2) = 0
BEGIN
	INSERT INTO [dbo].[ElmahError-0] (
		--[ErrorId],
		[Application]
		,[Host]
		,[Type]
		,[Source]
		,[Message]
		,[User]
		,[AllXml]
		,[StatusCode]
		,[TimeUtc]
		)
	VALUES (
		--@ErrorId,
		@Application
		,@Host
		,@Type
		,@Source
		,@Message
		,@User
		,@AllXml
		,@StatusCode
		,@TimeUtc
		)
END
ELSE
BEGIN
	INSERT INTO [dbo].[ElmahError-1] (
		--[ErrorId],
		[Application]
		,[Host]
		,[Type]
		,[Source]
		,[Message]
		,[User]
		,[AllXml]
		,[StatusCode]
		,[TimeUtc]
		)
	VALUES (
		--@ErrorId,
		@Application
		,@Host
		,@Type
		,@Source
		,@Message
		,@User
		,@AllXml
		,@StatusCode
		,@TimeUtc
		)
END
GO
