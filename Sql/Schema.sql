USE [XinatorCentral]
GO
/****** Object:  Table [dbo].[tbl_Apps]    Script Date: 18/04/2025 23:24:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Apps](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AppName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[RedirectUri] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Company]    Script Date: 18/04/2025 23:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Company](
	[CompanyID] [nvarchar](100) NOT NULL,
	[CompanyName] [nvarchar](200) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[ZipCode] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Fax] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[AddressType] [nvarchar](50) NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[IsActive] [bit] NULL,
	[IsTrial] [bit] NULL,
	[TrialEndDate] [datetime] NULL,
	[LogoFile] [nvarchar](200) NULL,
	[EmailBranding] [nvarchar](200) NULL,
	[CC] [nvarchar](200) NULL,
	[BCC] [nvarchar](200) NULL,
	[CompanyType] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Financial_Goal]    Script Date: 18/04/2025 23:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Financial_Goal](
	[CompanyID] [nvarchar](50) NULL,
	[UserID] [nvarchar](50) NULL,
	[QuickRatioDaily] [decimal](18, 2) NULL,
	[QuickRatioWeek] [decimal](18, 2) NULL,
	[QuickRatioMonth] [decimal](18, 2) NULL,
	[QuickRatioYear] [decimal](18, 2) NULL,
	[RevenuePerEmployeeDaily] [int] NULL,
	[RevenuePerEmployeeWeek] [decimal](18, 2) NULL,
	[RevenuePerEmployeeMonth] [decimal](18, 2) NULL,
	[RevenuePerEmployeeYear] [decimal](18, 2) NULL,
	[GrossProfitMarginDaily] [decimal](18, 2) NULL,
	[GrossProfitMarginWeek] [decimal](18, 2) NULL,
	[GrossProfitMarginMonth] [decimal](18, 2) NULL,
	[GrossProfitMarginYear] [decimal](18, 2) NULL,
	[ProfitMarginDaily] [decimal](18, 2) NULL,
	[ProfitMarginWeek] [decimal](18, 2) NULL,
	[ProfitMarginMonth] [decimal](18, 2) NULL,
	[ProfitMarginYear] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_FormAssignments]    Script Date: 18/04/2025 23:24:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_FormAssignments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FormLibraryID] [varchar](255) NULL,
	[Application] [varchar](50) NULL,
	[AssignedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_FormFields]    Script Date: 18/04/2025 23:24:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_FormFields](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateID] [int] NULL,
	[FieldType] [varchar](50) NULL,
	[FieldName] [varchar](255) NULL,
	[FieldValue] [varchar](500) NULL,
	[IsLinkedToApp] [bit] NULL,
	[AppDataCode] [varchar](100) NULL,
	[PositionX] [int] NULL,
	[PositionY] [int] NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_FormLibrary]    Script Date: 18/04/2025 23:24:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_FormLibrary](
	[ID] [nvarchar](50) NULL,
	[PdfUrl] [nvarchar](max) NULL,
	[CreatedDateTime] [date] NULL,
	[CompanyID] [nvarchar](50) NULL,
	[TemplateName] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](200) NULL,
	[CompanyGuid] [nvarchar](50) NULL,
	[FormTypeID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_FormTemplates]    Script Date: 18/04/2025 23:24:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_FormTemplates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [varchar](255) NULL,
	[TemplateCategory] [varchar](50) NULL,
	[PdfUrl] [varchar](255) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDateTime] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_FormType]    Script Date: 18/04/2025 23:24:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_FormType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FormType] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Goal_Appointments]    Script Date: 18/04/2025 23:24:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Goal_Appointments](
	[CompanyID] [nvarchar](50) NOT NULL,
	[UserID] [nvarchar](50) NULL,
	[AppointmentRequestsDaily] [int] NOT NULL,
	[AppointmentRequestsWeek] [int] NOT NULL,
	[AppointmentRequestsMonth] [int] NOT NULL,
	[AppointmentRequestsYear] [int] NOT NULL,
	[AppointmentsCreatedDaily] [int] NOT NULL,
	[AppointmentsCreatedWeek] [int] NOT NULL,
	[AppointmentsCreatedMonth] [int] NOT NULL,
	[AppointmentsCreatedYear] [int] NOT NULL,
	[AppointmentsCancelledDaily] [int] NOT NULL,
	[AppointmentsCancelledWeek] [int] NOT NULL,
	[AppointmentsCancelledMonth] [int] NOT NULL,
	[AppointmentsCancelledYear] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Goal_Invoices]    Script Date: 18/04/2025 23:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Goal_Invoices](
	[CompanyID] [nvarchar](50) NULL,
	[UserID] [nvarchar](50) NULL,
	[InvoicesCreatedDaily] [int] NULL,
	[InvoicesCreatedWeek] [int] NULL,
	[InvoicesCreatedMonth] [int] NULL,
	[InvoicesCreatedYear] [int] NULL,
	[InvoicesCreatedAmountDaily] [decimal](18, 2) NULL,
	[InvoicesCreatedAmountWeek] [decimal](18, 2) NULL,
	[InvoicesCreatedAmountMonth] [decimal](18, 2) NULL,
	[InvoicesCreatedAmountYear] [decimal](18, 2) NULL,
	[InvoicesPaidDaily] [int] NULL,
	[InvoicesPaidWeek] [int] NULL,
	[InvoicesPaidMonth] [int] NULL,
	[InvoicesPaidYear] [int] NULL,
	[InvoicesPaidAmountDaily] [decimal](18, 2) NULL,
	[InvoicesPaidAmountWeek] [decimal](18, 2) NULL,
	[InvoicesPaidAmountMonth] [decimal](18, 2) NULL,
	[InvoicesPaidAmountYear] [decimal](18, 2) NULL,
	[InvoicesOutstandingDaily] [int] NULL,
	[InvoicesOutstandingWeek] [int] NULL,
	[InvoicesOutstandingMonth] [int] NULL,
	[InvoicesOutstandingYear] [int] NULL,
	[InvoicesOutstandingAmountDaily] [decimal](18, 2) NULL,
	[InvoicesOutstandingAmountWeek] [decimal](18, 2) NULL,
	[InvoicesOutstandingAmountMonth] [decimal](18, 2) NULL,
	[InvoicesOutstandingAmountYear] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Goal_Jobs]    Script Date: 18/04/2025 23:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Goal_Jobs](
	[CompanyID] [nvarchar](50) NOT NULL,
	[UserID] [nvarchar](50) NULL,
	[JobsCreatedDaily] [int] NOT NULL,
	[JobsCreatedWeek] [int] NOT NULL,
	[JobsCreatedMonth] [int] NOT NULL,
	[JobsCreatedYear] [int] NOT NULL,
	[JobsWorkedDaily] [int] NOT NULL,
	[JobsWorkedWeek] [int] NOT NULL,
	[JobsWorkedMonth] [int] NOT NULL,
	[JobsWorkedYear] [int] NOT NULL,
	[JobsOpenDaily] [int] NOT NULL,
	[JobsOpenWeek] [int] NOT NULL,
	[JobsOpenMonth] [int] NOT NULL,
	[JobsOpenYear] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Goal_Proposals]    Script Date: 18/04/2025 23:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Goal_Proposals](
	[CompanyID] [nvarchar](50) NULL,
	[UserID] [nvarchar](50) NULL,
	[ProposalsCreatedDaily] [int] NULL,
	[ProposalsCreatedDailyWeek] [int] NULL,
	[ProposalsCreatedDailyMonth] [int] NULL,
	[ProposalsCreatedDailyYear] [int] NULL,
	[ProposalsAmountDaily] [decimal](18, 2) NULL,
	[ProposalsAmountWeek] [decimal](18, 2) NULL,
	[ProposalsAmountMonth] [decimal](18, 2) NULL,
	[ProposalsAmountYear] [decimal](18, 2) NULL,
	[ProposalsOutstandingDaily] [int] NULL,
	[ProposalsOutstandingWeek] [int] NULL,
	[ProposalsOutstandingMonth] [int] NULL,
	[ProposalsOutstandingYear] [int] NULL,
	[ProposalsOutstandingAmountDaily] [decimal](18, 2) NULL,
	[ProposalsOutstandingAmountWeek] [decimal](18, 2) NULL,
	[ProposalsOutstandingAmountMonth] [decimal](18, 2) NULL,
	[ProposalsOutstandingAmountYear] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_GoalICollected]    Script Date: 18/04/2025 23:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_GoalICollected](
	[CompanyID] [nvarchar](50) NOT NULL,
	[CollectedQty] [int] NULL,
	[CollectedAmount] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_KPIDisplayItem]    Script Date: 18/04/2025 23:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_KPIDisplayItem](
	[ItemID] [int] NOT NULL,
	[ItemName] [nvarchar](200) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_KPIDisplaySettings]    Script Date: 18/04/2025 23:25:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_KPIDisplaySettings](
	[CompanyID] [nvarchar](50) NOT NULL,
	[ItemID] [int] NOT NULL,
	[DisplayInDB] [bit] NULL,
	[DisplayInDevice] [bit] NULL,
	[MonthlyGoal] [decimal](18, 2) NOT NULL,
	[QuarterlyGoal] [decimal](18, 2) NOT NULL,
	[YearlyGoal] [decimal](18, 2) NOT NULL,
	[DisplayInCharts] [bit] NULL,
	[OrderForTitle] [int] NOT NULL,
	[OrderForChart] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_KPIDisplaySettingsUserWise]    Script Date: 18/04/2025 23:25:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_KPIDisplaySettingsUserWise](
	[CompanyID] [nvarchar](500) NULL,
	[UserID] [nvarchar](500) NULL,
	[ItemID] [nvarchar](50) NULL,
	[IsDisplay] [bit] NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Login]    Script Date: 18/04/2025 23:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Login](
	[SessionGuid] [nvarchar](100) NULL,
	[SessionString] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Logout]    Script Date: 18/04/2025 23:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Logout](
	[ID] [int] NULL,
	[LogoutUrl] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_MenuByUser]    Script Date: 18/04/2025 23:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_MenuByUser](
	[CompanyID] [nvarchar](200) NULL,
	[UserID] [nvarchar](100) NULL,
	[Menu] [nvarchar](100) NULL,
	[IsDisplay] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Message]    Script Date: 18/04/2025 23:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Message](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Header] [nvarchar](500) NULL,
	[Body] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_Message] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Payment]    Script Date: 18/04/2025 23:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Payment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [nvarchar](100) NULL,
	[Total] [decimal](18, 0) NULL,
	[BNPLPay] [decimal](18, 2) NULL,
	[CCPay] [decimal](18, 2) NULL,
	[Paid] [decimal](18, 0) NULL,
	[Due] [decimal](18, 0) NULL,
	[EstDiscount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_tbl_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Products]    Script Date: 18/04/2025 23:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[AccessUrl] [nvarchar](1000) NULL,
	[PromoUrl] [nvarchar](1000) NULL,
	[Logo] [nvarchar](100) NULL,
	[Price] [decimal](18, 0) NULL,
	[ShowSerial] [int] NULL,
 CONSTRAINT [PK_tbl_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ProductsByCompany]    Script Date: 18/04/2025 23:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ProductsByCompany](
	[CompanyID] [nvarchar](200) NULL,
	[ProductID] [int] NULL,
	[ProductAccess] [bit] NULL,
	[ProductDisplay] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ProductsByCustomer]    Script Date: 18/04/2025 23:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ProductsByCustomer](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductType] [nvarchar](200) NULL,
	[ProductsName] [nvarchar](200) NULL,
	[Price] [decimal](18, 0) NULL,
	[CompanyID] [nvarchar](100) NULL,
 CONSTRAINT [PK_tbl_ProductByCustomer] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ProductsByUser]    Script Date: 18/04/2025 23:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ProductsByUser](
	[ProductID] [int] NULL,
	[ProductDisplay] [bit] NULL,
	[CompanyID] [nvarchar](200) NULL,
	[UserID] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_SubProducts]    Script Date: 18/04/2025 23:25:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SubProducts](
	[ProductID] [int] NOT NULL,
	[SubProductID] [int] IDENTITY(1,1) NOT NULL,
	[SubProductName] [nvarchar](100) NULL,
	[AccessUrl] [nvarchar](1000) NULL,
	[PromoUrl] [nvarchar](1000) NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_tbl_SubProducts] PRIMARY KEY CLUSTERED 
(
	[SubProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_SubProductsByCompany]    Script Date: 18/04/2025 23:25:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SubProductsByCompany](
	[CompanyID] [nvarchar](200) NULL,
	[ProductID] [int] NULL,
	[ProductAccess] [bit] NULL,
	[ProductDisplay] [bit] NULL,
	[SubProductID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_SubProductsByUser]    Script Date: 18/04/2025 23:25:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SubProductsByUser](
	[ProductID] [int] NULL,
	[SubProductID] [int] NULL,
	[ProductDisplay] [bit] NULL,
	[CompanyID] [nvarchar](200) NULL,
	[UserID] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Tag]    Script Date: 18/04/2025 23:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](200) NULL,
	[TagDescription] [nvarchar](500) NULL,
	[CompanyID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TagByCustomer]    Script Date: 18/04/2025 23:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TagByCustomer](
	[TagID] [int] NULL,
	[CustomerID] [nvarchar](50) NULL,
	[CompanyID] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TemplateDetails]    Script Date: 18/04/2025 23:25:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TemplateDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TID] [nvarchar](50) NULL,
	[FieldType] [nvarchar](50) NULL,
	[LeftPosition] [nvarchar](50) NULL,
	[TopPosition] [nvarchar](50) NULL,
	[fieldID] [nvarchar](50) NULL,
	[IsEditable] [bit] NULL,
	[PageNumber] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TemplateList]    Script Date: 18/04/2025 23:25:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TemplateList](
	[ID] [nvarchar](50) NULL,
	[PdfUrl] [nvarchar](max) NULL,
	[CreatedDateTime] [date] NULL,
	[CompanyID] [nvarchar](50) NULL,
	[TemplateName] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](200) NULL,
	[CompanyGuid] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TemplateSigning]    Script Date: 18/04/2025 23:25:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TemplateSigning](
	[ID] [nvarchar](50) NULL,
	[TID] [nvarchar](50) NULL,
	[SenderEmail] [nvarchar](50) NULL,
	[ReceiverEmail] [nvarchar](50) NULL,
	[SendDate] [date] NULL,
	[SignedDate] [date] NULL,
	[CreatedDateTime] [date] NULL,
	[CompanyID] [nvarchar](50) NULL,
	[CompanyGuid] [nvarchar](50) NULL,
	[DocName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TemplateSigning_bckp]    Script Date: 18/04/2025 23:25:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TemplateSigning_bckp](
	[ID] [nvarchar](50) NULL,
	[TID] [nvarchar](50) NULL,
	[SenderEmail] [nvarchar](50) NULL,
	[ReceiverEmail] [nvarchar](50) NULL,
	[SendDate] [date] NULL,
	[SignedDate] [date] NULL,
	[CreatedDateTime] [date] NULL,
	[CompanyID] [nvarchar](50) NULL,
	[CompanyGuid] [nvarchar](50) NULL,
	[DocName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TemplateSigningDetails]    Script Date: 18/04/2025 23:25:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TemplateSigningDetails](
	[TID] [nvarchar](50) NULL,
	[FieldID] [nvarchar](50) NULL,
	[Value] [nvarchar](max) NULL,
	[CreatedDateTime] [datetime] NULL,
	[TSID] [nvarchar](50) NULL,
	[IsEditable] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 18/04/2025 23:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [nvarchar](100) NOT NULL,
	[UserID] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Email] [nvarchar](200) NOT NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[IsMasterAdmin] [bit] NULL,
	[IsFieldTechnitian] [bit] NOT NULL,
	[IsLicenseAgreed] [bit] NOT NULL,
	[LicenseAgreedDate] [datetime] NULL,
	[RoleGuidID] [nvarchar](100) NULL,
 CONSTRAINT [PK_tbl_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UserLog]    Script Date: 18/04/2025 23:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UserLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [nvarchar](max) NULL,
	[UserID] [nvarchar](max) NULL,
	[Text] [nvarchar](max) NULL,
	[CreatedDateTIme] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_UserLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblForm]    Script Date: 18/04/2025 23:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblForm](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FormName] [nvarchar](255) NOT NULL,
	[UploadLocation] [nvarchar](500) NOT NULL,
	[FormHtml] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFormAssignments]    Script Date: 18/04/2025 23:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFormAssignments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FormID] [int] NOT NULL,
	[FormName] [nvarchar](255) NOT NULL,
	[AssignedApp] [nvarchar](100) NOT NULL,
	[AssignedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Company] ADD  CONSTRAINT [DF_tbl_Company_AddressType]  DEFAULT (N'USA') FOR [AddressType]
GO
ALTER TABLE [dbo].[tbl_Company] ADD  CONSTRAINT [DF_tbl_Company_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [dbo].[tbl_Company] ADD  CONSTRAINT [DF_tbl_Company_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tbl_Company] ADD  CONSTRAINT [DF_tbl_Company_IsTrial]  DEFAULT ((0)) FOR [IsTrial]
GO
ALTER TABLE [dbo].[tbl_FormAssignments] ADD  DEFAULT (getdate()) FOR [AssignedDate]
GO
ALTER TABLE [dbo].[tbl_FormFields] ADD  DEFAULT ((0)) FOR [IsLinkedToApp]
GO
ALTER TABLE [dbo].[tbl_FormTemplates] ADD  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [dbo].[tbl_GoalICollected] ADD  CONSTRAINT [DF_tbl_DailyGoalICollected_CollectedQty]  DEFAULT ((0)) FOR [CollectedQty]
GO
ALTER TABLE [dbo].[tbl_GoalICollected] ADD  CONSTRAINT [DF_tbl_DailyGoalICollected_CollectedAmount]  DEFAULT ((0)) FOR [CollectedAmount]
GO
ALTER TABLE [dbo].[tbl_KPIDisplaySettings] ADD  CONSTRAINT [DF_tbl_KPIDisplaySettings_DisplayInDB]  DEFAULT ((0)) FOR [DisplayInDB]
GO
ALTER TABLE [dbo].[tbl_KPIDisplaySettings] ADD  CONSTRAINT [DF_tbl_KPIDisplaySettings_DisplayInDevice]  DEFAULT ((0)) FOR [DisplayInDevice]
GO
ALTER TABLE [dbo].[tbl_KPIDisplaySettings] ADD  CONSTRAINT [DF_tbl_KPIDisplaySettings_MonthlyGoal]  DEFAULT ((0)) FOR [MonthlyGoal]
GO
ALTER TABLE [dbo].[tbl_KPIDisplaySettings] ADD  CONSTRAINT [DF_tbl_KPIDisplaySettings_QuarterlyGoal]  DEFAULT ((0)) FOR [QuarterlyGoal]
GO
ALTER TABLE [dbo].[tbl_KPIDisplaySettings] ADD  CONSTRAINT [DF_tbl_KPIDisplaySettings_YearlyGoal]  DEFAULT ((0)) FOR [YearlyGoal]
GO
ALTER TABLE [dbo].[tbl_KPIDisplaySettings] ADD  CONSTRAINT [DF_tbl_KPIDisplaySettings_DisplayInCharts]  DEFAULT ((0)) FOR [DisplayInCharts]
GO
ALTER TABLE [dbo].[tbl_KPIDisplaySettings] ADD  CONSTRAINT [DF_tbl_KPIDisplaySettings_OrderForTitle]  DEFAULT ((0)) FOR [OrderForTitle]
GO
ALTER TABLE [dbo].[tbl_KPIDisplaySettings] ADD  CONSTRAINT [DF_tbl_KPIDisplaySettings_OrderForChart]  DEFAULT ((0)) FOR [OrderForChart]
GO
ALTER TABLE [dbo].[tbl_KPIDisplaySettingsUserWise] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_Login] ADD  CONSTRAINT [DF_tbl_Login_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_MenuByUser] ADD  CONSTRAINT [DF_tbl_MenuByUser_IsAccess]  DEFAULT ((0)) FOR [IsDisplay]
GO
ALTER TABLE [dbo].[tbl_Message] ADD  CONSTRAINT [DF_tbl_Message_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tbl_TemplateDetails] ADD  CONSTRAINT [DF_tbl_TemplateDetails_IsEditable]  DEFAULT ((0)) FOR [IsEditable]
GO
ALTER TABLE [dbo].[tbl_TemplateList] ADD  CONSTRAINT [DF_tbl_TemplateList_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [dbo].[tbl_TemplateSigning] ADD  CONSTRAINT [DF_tbl_TemplateSigning_SendDate]  DEFAULT (getdate()) FOR [SendDate]
GO
ALTER TABLE [dbo].[tbl_TemplateSigning] ADD  CONSTRAINT [DF_tbl_SigningHistory_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [dbo].[tbl_TemplateSigningDetails] ADD  CONSTRAINT [DF_tbl_TemplateDetailsValue_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [dbo].[tbl_TemplateSigningDetails] ADD  CONSTRAINT [DF_tbl_TemplateSigningDetails_IsEditable]  DEFAULT ((0)) FOR [IsEditable]
GO
ALTER TABLE [dbo].[tbl_User] ADD  CONSTRAINT [DF_tbl_User_Phone]  DEFAULT ('') FOR [Phone]
GO
ALTER TABLE [dbo].[tbl_User] ADD  CONSTRAINT [DF_tbl_User_Mobile]  DEFAULT ('') FOR [Mobile]
GO
ALTER TABLE [dbo].[tbl_User] ADD  CONSTRAINT [DF_tbl_User_Email]  DEFAULT ('') FOR [Email]
GO
ALTER TABLE [dbo].[tbl_User] ADD  CONSTRAINT [DF_tbl_User_CreatedDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [dbo].[tbl_User] ADD  CONSTRAINT [DF_tbl_User_IsMasterAdmin]  DEFAULT ((0)) FOR [IsMasterAdmin]
GO
ALTER TABLE [dbo].[tbl_User] ADD  CONSTRAINT [DF_tbl_User_IsFieldTechnitian]  DEFAULT ((0)) FOR [IsFieldTechnitian]
GO
ALTER TABLE [dbo].[tbl_User] ADD  CONSTRAINT [DF_tbl_User_IsLicenseAgreed]  DEFAULT ((0)) FOR [IsLicenseAgreed]
GO
ALTER TABLE [dbo].[tbl_UserLog] ADD  CONSTRAINT [DF_tbl_UserLog_CreatedDateTIme]  DEFAULT (getdate()) FOR [CreatedDateTIme]
GO
ALTER TABLE [dbo].[tblForm] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[tblFormAssignments] ADD  DEFAULT (getdate()) FOR [AssignedDate]
GO
ALTER TABLE [dbo].[tbl_FormFields]  WITH CHECK ADD FOREIGN KEY([TemplateID])
REFERENCES [dbo].[tbl_FormTemplates] ([ID])
GO
ALTER TABLE [dbo].[tbl_FormLibrary]  WITH CHECK ADD FOREIGN KEY([FormTypeID])
REFERENCES [dbo].[tbl_FormType] ([ID])
GO
/****** Object:  StoredProcedure [dbo].[AdminServiceAppointments]    Script Date: 18/04/2025 23:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[AdminServiceAppointments]

@CompanyID nvarchar(50)

As
Begin

--Table Variable: 
DECLARE @DailyAppointments TABLE 
   ( 
   Label nvarchar(100),
   GoalDaily int,
   GoalWeek int,
   GoalMonth int,
   GoalYear int, 
   WOToday int, 
   WOThisWeek int, 
   WOThisMonth int , 
   WOThisYear int 
   ) 

declare @GoalIncomingCallsDaily int
declare @GoalIncomingCallsWeek int
declare @GoalIncomingCallsMonth int
declare @GoalIncomingCallsYear int

declare @GoalAnsweredCallsDaily int
declare @GoalAnsweredCallsWeek int
declare @GoalAnsweredCallsMonth int
declare @GoalAnsweredCallsYear int

declare @GoalReturnCallsRequiredDaily int
declare @GoalReturnCallsRequiredWeek int
declare @GoalReturnCallsRequiredMonth int
declare @GoalReturnCallsRequiredYear int

declare @GoalApptsRequestedDaily int
declare @GoalApptsRequestedWeek int
declare @GoalApptsRequestedMonth int
declare @GoalApptsRequestedYear int

declare @GoalApptsMadeDaily int
declare @GoalApptsMadeWeek int
declare @GoalApptsMadeMonth int
declare @GoalApptsMadeYear int

declare @WOToday int
declare @WOThisWeek int
declare @WOThisMonth int
declare @WOThisYear int

Select 
 @GoalIncomingCallsDaily = IncomingCallsDaily,
 @GoalIncomingCallsWeek = IncomingCallsWeek,
 @GoalIncomingCallsMonth = IncomingCallsMonth,
 @GoalIncomingCallsYear = IncomingCallsYear,
 @GoalAnsweredCallsDaily = AnsweredCallsDaily,
 @GoalAnsweredCallsWeek = AnsweredCallsWeek,
 @GoalAnsweredCallsMonth = AnsweredCallsMonth,
 @GoalAnsweredCallsYear = AnsweredCallsYear,
 @GoalReturnCallsRequiredDaily = ReturnCallsRequiredDaily,
 @GoalReturnCallsRequiredWeek = ReturnCallsRequiredWeek,
 @GoalReturnCallsRequiredMonth = ReturnCallsRequiredMonth,
 @GoalReturnCallsRequiredYear = ReturnCallsRequiredYear,
 @GoalApptsRequestedDaily = AppointmentsRequestedDaily,
 @GoalApptsRequestedWeek = AppointmentsRequestedWeek,
 @GoalApptsRequestedMonth = AppointmentsRequestedMonth,
 @GoalApptsRequestedYear = AppointmentsRequestedYear,
 @GoalApptsMadeDaily =AppointmentsMadeDaily,
 @GoalApptsMadeWeek =AppointmentsMadeWeek,
 @GoalApptsMadeMonth =AppointmentsMadeMonth,
 @GoalApptsMadeYear =AppointmentsMadeYear
 From tbl_GoalAppointments where CompanyID = @CompanyID

 insert into @DailyAppointments (Label,GoalDaily,GoalWeek,GoalMonth,GoalYear,
 WOToday,WOThisWeek,WOThisMonth,WOThisYear)
Values ('Incoming Calls', isnull(@GoalIncomingCallsDaily,0),isnull(@GoalIncomingCallsWeek,0),
isnull(@GoalIncomingCallsMonth,0),isnull(@GoalIncomingCallsYear,0),
isnull(@WOToday,''),isnull(@WOThisWeek,''),
						  isnull(@WOThisMonth,''),isnull(@WOThisYear,''))

insert into @DailyAppointments (Label,GoalDaily,GoalWeek,GoalMonth,GoalYear,
 WOToday,WOThisWeek,WOThisMonth,WOThisYear)
Values ('Answered', isnull(@GoalAnsweredCallsDaily,0),isnull(@GoalAnsweredCallsWeek,0),
isnull(@GoalAnsweredCallsMonth,0),isnull(@GoalAnsweredCallsYear,0),
isnull(@WOToday,''),isnull(@WOThisWeek,''),
						  isnull(@WOThisMonth,''),isnull(@WOThisYear,''))

insert into @DailyAppointments (Label,GoalDaily,GoalWeek,GoalMonth,GoalYear,
 WOToday,WOThisWeek,WOThisMonth,WOThisYear)
Values ('Return Calls Required', isnull(@GoalReturnCallsRequiredDaily,0),isnull(@GoalReturnCallsRequiredWeek,0),
isnull(@GoalReturnCallsRequiredMonth,0),isnull(@GoalReturnCallsRequiredYear,0),
isnull(@WOToday,''),isnull(@WOThisWeek,''),
isnull(@WOThisMonth,''),isnull(@WOThisYear,''))

insert into @DailyAppointments (Label,GoalDaily,GoalWeek,GoalMonth,GoalYear,
 WOToday,WOThisWeek,WOThisMonth,WOThisYear)
Values ('Appointments Requested', isnull(@GoalApptsRequestedDaily,0),isnull(@GoalApptsRequestedWeek,0),
isnull(@GoalApptsRequestedMonth,0),isnull(@GoalApptsRequestedYear,0),
isnull(@WOToday,''),isnull(@WOThisWeek,''),
isnull(@WOThisMonth,''),isnull(@WOThisYear,''))

insert into @DailyAppointments (Label,GoalDaily,GoalWeek,GoalMonth,GoalYear,
 WOToday,WOThisWeek,WOThisMonth,WOThisYear)
Values ('Appointments Made', isnull(@GoalApptsMadeDaily,0),isnull(@GoalApptsMadeWeek,0),
isnull(@GoalApptsMadeMonth,0),isnull(@GoalApptsMadeYear,0),
isnull(@WOToday,''),isnull(@WOThisWeek,''),
isnull(@WOThisMonth,''),isnull(@WOThisYear,''))

 --------Appointments Requested--------

set @WOToday = (select COUNT(*) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and ApptDateTime >= CONVERT(varchar(10),getdate(),101)
and ApptDateTime < CONVERT(varchar(10),getdate()+1,101)
)

update @DailyAppointments set WOToday = @WOToday where Label='Appointments Requested'

set @WOThisWeek = (select COUNT(*) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and ApptDateTime >= DATEADD(ww, DATEDIFF(ww,0,GETDATE()), 0)
and ApptDateTime < CONVERT(varchar(10),getdate()+1,101)
)

update @DailyAppointments set WOThisWeek = @WOThisWeek where Label='Appointments Requested'

set @WOThisMonth = (select COUNT(*) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and ApptDateTime >= DATEADD(MM, DATEDIFF(MM,0,GETDATE()), 0)
and ApptDateTime < CONVERT(varchar(10),getdate()+1,101)
)

update @DailyAppointments set WOThisMonth = @WOThisMonth where Label='Appointments Requested'

set @WOThisYear = (select COUNT(*) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and ApptDateTime >= DATEADD(YY, DATEDIFF(YY,0,GETDATE()), 0)
and ApptDateTime < CONVERT(varchar(10),getdate()+1,101)
)

update @DailyAppointments set WOThisYear = @WOThisYear where Label='Appointments Requested'


--------Appointments Made--------

set @WOToday = (select COUNT(*) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and ApptDateTime >= CONVERT(varchar(10),getdate(),101)
and ApptDateTime < CONVERT(varchar(10),getdate()+1,101)
and Status=2
)

update @DailyAppointments set WOToday = @WOToday where Label='Appointments Made'

set @WOThisWeek = (select COUNT(*) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and ApptDateTime >= DATEADD(ww, DATEDIFF(ww,0,GETDATE()), 0)
and ApptDateTime < CONVERT(varchar(10),getdate()+1,101)
and Status=2
)

update @DailyAppointments set WOThisWeek = @WOThisWeek where Label='Appointments Made'

set @WOThisMonth = (select COUNT(*) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and ApptDateTime >= DATEADD(MM, DATEDIFF(MM,0,GETDATE()), 0)
and ApptDateTime < CONVERT(varchar(10),getdate()+1,101)
and Status=2
)

update @DailyAppointments set WOThisMonth = @WOThisMonth where Label='Appointments Made'

set @WOThisYear = (select COUNT(*) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and ApptDateTime >= DATEADD(YY, DATEDIFF(YY,0,GETDATE()), 0)
and ApptDateTime < CONVERT(varchar(10),getdate()+1,101)
and Status=2
)

update @DailyAppointments set WOThisYear = @WOThisYear where Label='Appointments Made'


 Select * from @DailyAppointments
 
 End
GO
/****** Object:  StoredProcedure [dbo].[AdminServiceDailyJobs]    Script Date: 18/04/2025 23:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[AdminServiceDailyJobs]

@CompanyID nvarchar(50)

As
Begin

--Table Variable: 
DECLARE @DailyJobs TABLE 
   ( 
   Label nvarchar(100),
   GoalDaily int,
   GoalWeek int,
   GoalMonth int,
   GoalYear int, 
   WOToday int, 
   WOThisWeek int, 
   WOThisMonth int , 
   WOThisYear int 
   ) 

declare @GoalNewJobsDaily int
declare @GoalNewJobsWeek int
declare @GoalNewJobsMonth int
declare @GoalNewJobsYear int

declare @GoalRecallJobsDaily int
declare @GoalRecallJobsWeek int
declare @GoalRecallJobsMonth int
declare @GoalRecallJobsYear int

declare @GoalOpenJobsDaily int
declare @GoalOpenJobsWeek int
declare @GoalOpenJobsMonth int
declare @GoalOpenJobsYear int

declare @GoalClosedDaily int
declare @GoalClosedWeek int
declare @GoalClosedMonth int
declare @GoalClosedYear int

declare @WOToday int
declare @WOThisWeek int
declare @WOThisMonth int
declare @WOThisYear int

Select 
 @GoalNewJobsDaily = NewJobsDaily,
 @GoalNewJobsWeek = NewJobsWeek,
 @GoalNewJobsMonth = NewJobsMonth,
 @GoalNewJobsYear = NewJobsYear,
 @GoalRecallJobsDaily = RecallJobsDaily,
 @GoalRecallJobsWeek = RecallJobsWeek,
 @GoalRecallJobsMonth = RecallJobsMonth,
 @GoalRecallJobsYear = RecallJobsYear,
 @GoalOpenJobsDaily = OpenJobsDaily,
 @GoalOpenJobsWeek = OpenJobsWeek,
 @GoalOpenJobsMonth = OpenJobsMonth,
 @GoalOpenJobsYear = OpenJobsYear,
 @GoalClosedDaily = ClosedJobsDaily,
 @GoalClosedWeek = ClosedJobsWeek,
 @GoalClosedMonth = ClosedJobsMonth,
 @GoalClosedYear = ClosedJobsYear
 From tbl_GoalJobs where CompanyID = @CompanyID

----- New Jobs ----
set @WOToday = (select COUNT(*) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and createdDateTime >= CONVERT(varchar(10),getdate(),101)
)

set @WOThisWeek = (select COUNT(*) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and createdDateTime >= DATEADD(ww, DATEDIFF(ww,0,GETDATE()), 0)
)

set @WOThisMonth = (select COUNT(*) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and createdDateTime >= DATEADD(MM, DATEDIFF(MM,0,GETDATE()), 0)
)

set @WOThisYear = (select COUNT(*) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and createdDateTime >= DATEADD(YY, DATEDIFF(YY,0,GETDATE()), 0)
)

insert into @DailyJobs (Label,GoalDaily,GoalWeek,GoalMonth,GoalYear,
WOToday,WOThisWeek,WOThisMonth,WOThisYear)
Values ('New Jobs', isnull(@GoalNewJobsDaily,0),isnull(@GoalNewJobsWeek,0),
isnull(@GoalNewJobsMonth,0),isnull(@GoalNewJobsYear,0),
@WOToday,@WOThisWeek,@WOThisMonth,@WOThisYear)

----Recall Jobs ---

set @WOToday = (
select isnull(SUM(t1.total),0) from --select COUNT(*) from
(
select count(appt.ApptID)-1 total
from msSchedulerV3.dbo.tbl_Appointment appt
join msSchedulerV3.dbo.tbl_Customer c
on appt.companyID= c.companyID
and appt.customerID = c.customerID
and appt.companyID=@CompanyID
and appt.createdDateTime >= CONVERT(varchar(10),getdate(),101)
group by c.CustomerID,c.address1
having count(appt.ApptID) >1
) t1
)

set @WOThisWeek = 
(
select isnull(SUM(t1.total),0) from
(
select count(appt.ApptID)-1 total
from msSchedulerV3.dbo.tbl_Appointment appt
join msSchedulerV3.dbo.tbl_Customer c
on appt.companyID= c.companyID
and appt.customerID = c.customerID
and appt.companyID=@CompanyID
and appt.createdDateTime >= DATEADD(WW, DATEDIFF(WW,0,GETDATE()), 0)
group by c.CustomerID,c.address1
having count(appt.ApptID) >1
) t1
)

set @WOThisMonth = 
(
select isnull(SUM(t1.total),0) from
(
select count(appt.ApptID)-1 total
from msSchedulerV3.dbo.tbl_Appointment appt
join msSchedulerV3.dbo.tbl_Customer c
on appt.companyID= c.companyID
and appt.customerID = c.customerID
and appt.companyID=@CompanyID
and appt.createdDateTime >= DATEADD(MM, DATEDIFF(MM,0,GETDATE()), 0)
group by c.CustomerID,c.address1
having count(appt.ApptID) >1
) t1
)

set @WOThisYear = 
(
select isnull(SUM(t1.total),0) from
(
select count(appt.ApptID)-1 total
from msSchedulerV3.dbo.tbl_Appointment appt
join msSchedulerV3.dbo.tbl_Customer c
on appt.companyID= c.companyID
and appt.customerID = c.customerID
and appt.companyID=@CompanyID
and appt.createdDateTime >= DATEADD(YY, DATEDIFF(YY,0,GETDATE()), 0)
group by c.CustomerID,c.address1
having count(appt.ApptID) >1
) t1
)

insert into @DailyJobs (Label,GoalDaily,GoalWeek,GoalMonth,GoalYear,
WOToday,WOThisWeek,WOThisMonth,WOThisYear)
Values ('Recall Jobs',
isnull(@GoalRecallJobsDaily,0),isnull(@GoalRecallJobsWeek,0),
isnull(@GoalRecallJobsMonth,0),isnull(@GoalRecallJobsYear,0),
@WOToday,@WOThisWeek,@WOThisMonth,@WOThisYear)

----Open Jobs ---

set @WOToday = (select COUNT(*) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and createdDateTime >= CONVERT(varchar(10),getdate(),101)
and Status= '1'
)

set @WOThisWeek = (select COUNT(*) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and createdDateTime >= DATEADD(ww, DATEDIFF(ww,0,GETDATE()), 0)
and Status= '1'
)

set @WOThisMonth = (select COUNT(*) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and createdDateTime >= DATEADD(MM, DATEDIFF(MM,0,GETDATE()), 0)
and Status= '1'
)

set @WOThisYear = (select COUNT(*) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and createdDateTime >= DATEADD(YY, DATEDIFF(YY,0,GETDATE()), 0)
and Status= '1'
)

insert into @DailyJobs (Label,GoalDaily,GoalWeek,GoalMonth,GoalYear,
WOToday,WOThisWeek,WOThisMonth,WOThisYear)
Values ('Open Jobs',
isnull(@GoalOpenJobsDaily,0),isnull(@GoalOpenJobsWeek,0),
isnull(@GoalOpenJobsMonth,0),isnull(@GoalOpenJobsYear,0),

@WOToday,@WOThisWeek,@WOThisMonth,@WOThisYear)

----Closed Jobs ---

set @WOToday = (
select
(
(select COUNT(*) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and createdDateTime >= CONVERT(varchar(10),getdate(),101)
and Status= '4')
)
)

set @WOThisWeek = (
select
(
(select COUNT(*) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and createdDateTime >= DATEADD(ww, DATEDIFF(ww,0,GETDATE()), 0)
and Status= '4')
)
)

set @WOThisMonth = (
(select COUNT(*) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and createdDateTime >= DATEADD(MM, DATEDIFF(MM,0,GETDATE()), 0)
and Status= '4')
)

set @WOThisYear = (
(select COUNT(*) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and createdDateTime >= DATEADD(YY, DATEDIFF(YY,0,GETDATE()), 0)
and Status= '4')
)

insert into @DailyJobs (Label,GoalDaily,GoalWeek,GoalMonth,GoalYear,
WOToday,WOThisWeek,WOThisMonth,WOThisYear)
Values ('Closed Jobs',
isnull(@GoalClosedDaily,0),isnull(@GoalClosedWeek,0),
isnull(@GoalClosedMonth,0),isnull(@GoalClosedYear,0),
@WOToday,@WOThisWeek,@WOThisMonth,@WOThisYear)

select * from @DailyJobs

End
GO
/****** Object:  StoredProcedure [dbo].[AdminServiceDailyJobsPro]    Script Date: 18/04/2025 23:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[AdminServiceDailyJobsPro]

@CompanyID nvarchar(50)

As
Begin

--Table Variable: 
DECLARE @DailyJobs TABLE 
   ( 
	   Label nvarchar(100),
	   GoalDaily int,
	   GoalWeek int,
	   GoalMonth int,
	   GoalYear int, 
	   WOToday int, 
	   WOThisWeek int, 
	   WOThisMonth int , 
	   WOThisYear int 
   ) 

declare @GoalNewJobsDaily int
declare @GoalNewJobsWeek int
declare @GoalNewJobsMonth int
declare @GoalNewJobsYear int

declare @GoalRecallJobsDaily int
declare @GoalRecallJobsWeek int
declare @GoalRecallJobsMonth int
declare @GoalRecallJobsYear int

declare @GoalOpenJobsDaily int
declare @GoalOpenJobsWeek int
declare @GoalOpenJobsMonth int
declare @GoalOpenJobsYear int

declare @GoalClosedDaily int
declare @GoalClosedWeek int
declare @GoalClosedMonth int
declare @GoalClosedYear int

declare @WOToday int
declare @WOThisWeek int
declare @WOThisMonth int
declare @WOThisYear int

Select 
 @GoalNewJobsDaily = NewJobsDaily,
 @GoalNewJobsWeek = NewJobsWeek,
 @GoalNewJobsMonth = NewJobsMonth,
 @GoalNewJobsYear = NewJobsYear,
 @GoalRecallJobsDaily = RecallJobsDaily,
 @GoalRecallJobsWeek = RecallJobsWeek,
 @GoalRecallJobsMonth = RecallJobsMonth,
 @GoalRecallJobsYear = RecallJobsYear,
 @GoalOpenJobsDaily = OpenJobsDaily,
 @GoalOpenJobsWeek = OpenJobsWeek,
 @GoalOpenJobsMonth = OpenJobsMonth,
 @GoalOpenJobsYear = OpenJobsYear,
 @GoalClosedDaily = ClosedJobsDaily,
 @GoalClosedWeek = ClosedJobsDaily,
 @GoalClosedMonth = ClosedJobsDaily,
 @GoalClosedYear = ClosedJobsDaily
 From tbl_GoalJobs where CompanyID = @CompanyID

----- New Jobs ----
set @WOToday = (select COUNT(*) from Mobilize.dbo.tbl_workOrder
where companyID=@CompanyID
and createdDateTime >= CONVERT(varchar(10),getdate(),101)
)

set @WOThisWeek = (select COUNT(*) from Mobilize.dbo.tbl_workOrder
where companyID=@CompanyID
and createdDateTime >= DATEADD(ww, DATEDIFF(ww,0,GETDATE()), 0)
)

set @WOThisMonth = (select COUNT(*) from Mobilize.dbo.tbl_workOrder
where companyID=@CompanyID
and createdDateTime >= DATEADD(MM, DATEDIFF(MM,0,GETDATE()), 0)
)

set @WOThisYear = (select COUNT(*) from Mobilize.dbo.tbl_workOrder
where companyID=@CompanyID
and createdDateTime >= DATEADD(YY, DATEDIFF(YY,0,GETDATE()), 0)
)

insert into @DailyJobs (Label,GoalDaily,GoalWeek,GoalMonth,GoalYear,
WOToday,WOThisWeek,WOThisMonth,WOThisYear)
Values ('New Jobs', isnull(@GoalNewJobsDaily,0),isnull(@GoalNewJobsWeek,0),
isnull(@GoalNewJobsMonth,0),isnull(@GoalNewJobsYear,0),
@WOToday,@WOThisWeek,@WOThisMonth,@WOThisYear)

----Recall Jobs ---

set @WOToday = (
select COUNT(*) from
(
select count(w.workOrder) total
from Mobilize.dbo.tbl_workOrder w
join Mobilize.dbo.tbl_site s
on w.companyID= s.companyID
and w.customerID = s.customerID
and w.siteID = s.siteID
and w.companyID=@CompanyID
and w.createdDateTime >= CONVERT(varchar(10),getdate(),101)
group by s.siteName,s.address1
having count(w.workOrder) >1
) t1
)

set @WOThisWeek = 
(
select COUNT(*) from
(
select count(w.workOrder) total
from Mobilize.dbo.tbl_workOrder w
join Mobilize.dbo.tbl_site s
on w.companyID= s.companyID
and w.customerID = s.customerID
and w.siteID = s.siteID
and w.companyID=@CompanyID
and w.createdDateTime >= DATEADD(WW, DATEDIFF(WW,0,GETDATE()), 0)
group by s.siteName,s.address1
having count(w.workOrder) >1
) t1
)

set @WOThisMonth = 
(
select COUNT(*) from
(
select count(w.workOrder) total
from Mobilize.dbo.tbl_workOrder w
join Mobilize.dbo.tbl_site s
on w.companyID= s.companyID
and w.customerID = s.customerID
and w.siteID = s.siteID
and w.companyID=@CompanyID
and w.createdDateTime >= DATEADD(MM, DATEDIFF(MM,0,GETDATE()), 0)
group by s.siteName,s.address1
having count(w.workOrder) >1
) t1
)

set @WOThisYear = 
(
select COUNT(*) from
(
select count(w.workOrder) total
from Mobilize.dbo.tbl_workOrder w
join Mobilize.dbo.tbl_site s
on w.companyID= s.companyID
and w.customerID = s.customerID
and w.siteID = s.siteID
and w.companyID=@CompanyID
and w.createdDateTime >= DATEADD(YY, DATEDIFF(YY,0,GETDATE()), 0)
group by s.siteName,s.address1
having count(w.workOrder) >1
) t1
)

insert into @DailyJobs (Label,GoalDaily,GoalWeek,GoalMonth,GoalYear,
WOToday,WOThisWeek,WOThisMonth,WOThisYear)
Values ('Recall Jobs',
isnull(@GoalRecallJobsDaily,0),isnull(@GoalRecallJobsWeek,0),
isnull(@GoalRecallJobsMonth,0),isnull(@GoalRecallJobsYear,0),
@WOToday,@WOThisWeek,@WOThisMonth,@WOThisYear)

----Open Jobs ---

set @WOToday = (select COUNT(*) from Mobilize.dbo.tbl_workOrder
where companyID=@CompanyID
and createdDateTime >= CONVERT(varchar(10),getdate(),101)
and workOrderStatus != 'M' 
and workOrderStatus != 'C'
)

set @WOThisWeek = (select COUNT(*) from Mobilize.dbo.tbl_workOrder
where companyID=@CompanyID
and createdDateTime >= DATEADD(ww, DATEDIFF(ww,0,GETDATE()), 0)
and workOrderStatus != 'M' 
and workOrderStatus != 'C'
)

set @WOThisMonth = (select COUNT(*) from Mobilize.dbo.tbl_workOrder
where companyID=@CompanyID
and createdDateTime >= DATEADD(MM, DATEDIFF(MM,0,GETDATE()), 0)
and workOrderStatus != 'M' 
and workOrderStatus != 'C'
)

set @WOThisYear = (select COUNT(*) from Mobilize.dbo.tbl_workOrder
where companyID=@CompanyID
and createdDateTime >= DATEADD(YY, DATEDIFF(YY,0,GETDATE()), 0)
and workOrderStatus != 'M' 
and workOrderStatus != 'C'
)

insert into @DailyJobs (Label,GoalDaily,GoalWeek,GoalMonth,GoalYear,
WOToday,WOThisWeek,WOThisMonth,WOThisYear)
Values ('Open Jobs',
isnull(@GoalOpenJobsDaily,0),isnull(@GoalOpenJobsWeek,0),
isnull(@GoalOpenJobsMonth,0),isnull(@GoalOpenJobsYear,0),

@WOToday,@WOThisWeek,@WOThisMonth,@WOThisYear)

----Closed Jobs ---

set @WOToday = (
select
(
(select COUNT(*) from Mobilize.dbo.tbl_workOrder
where companyID=@CompanyID
and createdDateTime >= CONVERT(varchar(10),getdate(),101)
and workOrderStatus = 'M') +
(select COUNT(*) from Mobilize.dbo.tbl_workOrder
where companyID=@CompanyID
and createdDateTime >= CONVERT(varchar(10),getdate(),101)
and workOrderStatus = 'C')
)
)

set @WOThisWeek = (
select
(
(select COUNT(*) from Mobilize.dbo.tbl_workOrder
where companyID=@CompanyID
and createdDateTime >= DATEADD(ww, DATEDIFF(ww,0,GETDATE()), 0)
and workOrderStatus = 'M') +
(select COUNT(*) from Mobilize.dbo.tbl_workOrder
where companyID=@CompanyID
and createdDateTime >= DATEADD(ww, DATEDIFF(ww,0,GETDATE()), 0)
and workOrderStatus = 'C')
)
)

set @WOThisMonth = (
(select COUNT(*) from Mobilize.dbo.tbl_workOrder
where companyID=@CompanyID
and createdDateTime >= DATEADD(MM, DATEDIFF(MM,0,GETDATE()), 0)
and workOrderStatus = 'M') +
(select COUNT(*) from Mobilize.dbo.tbl_workOrder
where companyID=@CompanyID
and createdDateTime >= DATEADD(MM, DATEDIFF(MM,0,GETDATE()), 0)
and workOrderStatus = 'C')
)

set @WOThisYear = (
(select COUNT(*) from Mobilize.dbo.tbl_workOrder
where companyID=@CompanyID
and createdDateTime >= DATEADD(YY, DATEDIFF(YY,0,GETDATE()), 0)
and workOrderStatus = 'M') +
(select COUNT(*) from Mobilize.dbo.tbl_workOrder
where companyID=@CompanyID
and createdDateTime >= DATEADD(YY, DATEDIFF(YY,0,GETDATE()), 0)
and workOrderStatus = 'C')
)

insert into @DailyJobs (Label,GoalDaily,GoalWeek,GoalMonth,GoalYear,
WOToday,WOThisWeek,WOThisMonth,WOThisYear)
Values ('Closed Jobs',
isnull(@GoalClosedDaily,0),isnull(@GoalClosedWeek,0),
isnull(@GoalClosedMonth,0),isnull(@GoalClosedYear,0),
@WOToday,@WOThisWeek,@WOThisMonth,@WOThisYear)

select * from @DailyJobs

End
GO
/****** Object:  StoredProcedure [dbo].[GetInvoiceSummaryJobs]    Script Date: 18/04/2025 23:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetInvoiceSummaryJobs]

@CompanyID nvarchar(50)

As
Begin

--Table Variable: 

declare @GoalInvQty int
declare @GoalInvAmount decimal(18,2)
declare @TodayQty int
declare @TodayAmount decimal(18,2)
declare @WeekQty int
declare @WeekAmount decimal(18,2)
declare @MonthQty int
declare @MonthAmount decimal(18,2)
declare @YearQty int
declare @YearAmount decimal(18,2)

Select 
 @GoalInvQty = InvoicedQty,
 @GoalInvAmount = InvoicedAmount
 From tbl_DailyGoalInvoice where CompanyID = @CompanyID

Select 
@TodayQty = COUNT(*) ,
@TodayAmount= SUM(convert(decimal(18,2), isnull(Total,0)))
from myServiceJobs.dbo.Invoices
where CompanyId= @CompanyID
and InvoiceDate >= CONVERT(varchar(10),getdate(),101)

Select 
@WeekQty = COUNT(*) ,
@WeekAmount= SUM(convert(decimal(18,2), isnull(Total,0)))
from myServiceJobs.dbo.Invoices
where CompanyId= @CompanyID
and InvoiceDate >= DATEADD(ww, DATEDIFF(ww,0,GETDATE()), 0)

Select 
@MonthQty = COUNT(*) ,
@MonthAmount= SUM(convert(decimal(18,2), isnull(Total,0)))
from myServiceJobs.dbo.Invoices
where CompanyId= @CompanyID
and InvoiceDate >= DATEADD(MM, DATEDIFF(MM,0,GETDATE()), 0)

Select 
@YearQty = COUNT(*) ,
@YearAmount= SUM(convert(decimal(18,2), isnull(Total,0)))
from myServiceJobs.dbo.Invoices
where CompanyId= @CompanyID
and InvoiceDate >= DATEADD(YY, DATEDIFF(YY,0,GETDATE()), 0)

Select isnull(@GoalInvQty,0) as GoalInvQty,
isnull(@GoalInvAmount,0) as GoalInvAmount,
isnull(@TodayQty,0) as TodayQty,
isnull(@TodayAmount,0) as TodayAmount,
isnull(@WeekQty,0) as WeekQty,
isnull(@WeekAmount,0) as WeekAmount,
isnull(@MonthQty,0) as MonthQty,
isnull(@MonthAmount,0) as MonthAmount,
isnull(@YearQty,0) as YearQty,
isnull(@YearAmount,0) as YearAmount

End
GO
/****** Object:  StoredProcedure [dbo].[GetInvoiceSummaryPro]    Script Date: 18/04/2025 23:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetInvoiceSummaryPro]

@CompanyID nvarchar(50)

As
Begin

--Table Variable: 

declare @GoalInvQty int
declare @GoalInvAmount decimal(18,2)
declare @TodayQty int
declare @TodayAmount decimal(18,2)
declare @WeekQty int
declare @WeekAmount decimal(18,2)
declare @MonthQty int
declare @MonthAmount decimal(18,2)
declare @YearQty int
declare @YearAmount decimal(18,2)

Select 
 @GoalInvQty = InvoicedQty,
 @GoalInvAmount = InvoicedAmount
 From tbl_DailyGoalInvoice where CompanyID = @CompanyID

Select 
@TodayQty = COUNT(*) ,
@TodayAmount= SUM(convert(decimal(18,2), isnull(Total,0)))
from Mobilize.dbo.tbl_Invoice
where CompanyId= @CompanyID
and InvoiceStatus='C' and PostStatus='P'
and createdDateTime >= CONVERT(varchar(10),getdate(),101)

Select 
@WeekQty = COUNT(*) ,
@WeekAmount= SUM(convert(decimal(18,2), isnull(Total,0)))
from Mobilize.dbo.tbl_Invoice
where CompanyId= @CompanyID
and InvoiceStatus='C' and PostStatus='P'
and createdDateTime >= DATEADD(ww, DATEDIFF(ww,0,GETDATE()), 0)

Select 
@MonthQty = COUNT(*) ,
@MonthAmount= SUM(convert(decimal(18,2), isnull(Total,0)))
from Mobilize.dbo.tbl_Invoice
where CompanyId= @CompanyID
and InvoiceStatus='C' and PostStatus='P'
and createdDateTime >= DATEADD(MM, DATEDIFF(MM,0,GETDATE()), 0)

Select 
@YearQty = COUNT(*) ,
@YearAmount= SUM(convert(decimal(18,2), isnull(Total,0)))
from Mobilize.dbo.tbl_Invoice
where CompanyId= @CompanyID
and InvoiceStatus='C' and PostStatus='P'
and createdDateTime >= DATEADD(YY, DATEDIFF(YY,0,GETDATE()), 0)

Select isnull(@GoalInvQty,0) as GoalInvQty,
isnull(@GoalInvAmount,0) as GoalInvAmount,
isnull(@TodayQty,0) as TodayQty,
isnull(@TodayAmount,0) as TodayAmount,
isnull(@WeekQty,0) as WeekQty,
isnull(@WeekAmount,0) as WeekAmount,
isnull(@MonthQty,0) as MonthQty,
isnull(@MonthAmount,0) as MonthAmount,
isnull(@YearQty,0) as YearQty,
isnull(@YearAmount,0) as YearAmount

End
GO
/****** Object:  StoredProcedure [dbo].[InsertUserSettings]    Script Date: 18/04/2025 23:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[InsertUserSettings]
    @CompanyID NVARCHAR(50),
    @UserID NVARCHAR(50),
    @IsAdmin INT
AS
BEGIN
 
    IF @IsAdmin = 0 -- means  type user
    BEGIN
        INSERT INTO tbl_ProductsByUser (ProductID, ProductDisplay, CompanyID, UserID)
        VALUES
            (1, 1, @CompanyID, @UserID),
            (2, 1, @CompanyID, @UserID),
            (4, 0, @CompanyID, @UserID),
            (5, 1, @CompanyID, @UserID),
            (6, 0, @CompanyID, @UserID),
            (7, 1, @CompanyID, @UserID),
            (8, 0, @CompanyID, @UserID),
			(9, 0, @CompanyID, @UserID),
            (10, 0, @CompanyID, @UserID),
			(11, 1, @CompanyID, @UserID),
			(12, 0, @CompanyID, @UserID);

        INSERT INTO tbl_SubProductsByUser (ProductID, SubProductID, ProductDisplay, CompanyID, UserID)
        VALUES
            (5, 6, 1, @CompanyID, @UserID),
            (5, 7, 1, @CompanyID, @UserID),
			(5, 8, 1, @CompanyID, @UserID),
            (2, 4, 1, @CompanyID, @UserID),
            (2, 5, 0, @CompanyID, @UserID),            
			(1, 1, 1, @CompanyID, @UserID),
			(1, 2, 1, @CompanyID, @UserID),
			(1, 3, 1, @CompanyID, @UserID);

        INSERT INTO tbl_MenuByUser (CompanyID, UserID, Menu, IsDisplay)
        VALUES
            (@CompanyID, @UserID, 'Results', 0),
            (@CompanyID, @UserID, 'SetUp', 0);

    END
    ELSE
    BEGIN
        INSERT INTO tbl_ProductsByUser (ProductID, ProductDisplay, CompanyID, UserID)
        VALUES
            (1, 1, @CompanyID, @UserID),
            (2, 0, @CompanyID, @UserID),
            (4, 0, @CompanyID, @UserID),
            (5, 1, @CompanyID, @UserID),
            (6, 0, @CompanyID, @UserID),
            (7, 1, @CompanyID, @UserID),
            (8, 0, @CompanyID, @UserID),
			(9, 0, @CompanyID, @UserID),
            (10, 0, @CompanyID, @UserID),
			(11, 1, @CompanyID, @UserID),
			(12, 0, @CompanyID, @UserID);

        INSERT INTO tbl_SubProductsByUser (ProductID, SubProductID, ProductDisplay, CompanyID, UserID)
        VALUES
            (5, 6, 1, @CompanyID, @UserID),
            (5, 7, 1, @CompanyID, @UserID),
			(5, 8, 1, @CompanyID, @UserID),
            (2, 4, 0, @CompanyID, @UserID),
            (2, 5, 0, @CompanyID, @UserID),            
			(1, 1, 1, @CompanyID, @UserID),
			(1, 2, 1, @CompanyID, @UserID),
			(1, 3, 1, @CompanyID, @UserID);

        INSERT INTO tbl_MenuByUser (CompanyID, UserID, Menu, IsDisplay)
        VALUES
            (@CompanyID, @UserID, 'Results', 1),
            (@CompanyID, @UserID, 'SetUp', 1);

        
END;
END;
GO
/****** Object:  StoredProcedure [dbo].[KPI_barChart]    Script Date: 18/04/2025 23:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[KPI_barChart]

@CompanyID nvarchar(50)

As
Begin


--Appt created 0
select ApptDateTime,createdDateTime,Status from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and ApptDateTime >= Dateadd(Month, Datediff(Month, 0, DATEADD(m, -5,
current_timestamp)), 0)

select CONVERT(datetime2, CreatedDate, 1) as CreatedDate,[Type],[InvoiceDate],[AmountCollect],Total from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [InvoiceDate] >= Dateadd(Month, Datediff(Month, 0, DATEADD(m, -5,
current_timestamp)), 0)


select CONVERT(datetime2, CreatedDate, 1)   as CreatedDate,Status from [myServiceJobs].[dbo].[Invoices]
where [CompanyId]=@CompanyID
and CONVERT(datetime2, CreatedDate, 1) >= Dateadd(Month, Datediff(Month, 0, DATEADD(m, -5,
current_timestamp)), 0)



--@AppointmentRequests 1
--select createdDateTime as _Data from msSchedulerV3.dbo.tbl_Appointment
--where companyID=@CompanyID
--and createdDateTime  >= Dateadd(Month, Datediff(Month, 0, DATEADD(m, -5,
--current_timestamp)), 0)


-- AppointmentsCancelled 2
--select createdDateTime as _Data from msSchedulerV3.dbo.tbl_Appointment
--where companyID=@CompanyID
--and createdDateTime >= Dateadd(Month, Datediff(Month, 0, DATEADD(m, -5,
--current_timestamp)), 0)
--and Status= '3'

--@ProposalsCreated 3

--and [Type]= 'Proposal'

--@InvoiceCreated 4

--select  [InvoiceDate]  as _Data from [msSchedulerV3].[dbo].[tbl_Invoice]
--where [CompnyID]=@CompanyID
--and [InvoiceDate] >= Dateadd(Month, Datediff(Month, 0, DATEADD(m, -5,
--current_timestamp)), 0)
--and [Type]= 'Invoice'



--@InvoicesOutstanding 5

--select  [InvoiceDate]  as _Data from [msSchedulerV3].[dbo].[tbl_Invoice]
--where [CompnyID]=@CompanyID
--and [InvoiceDate] >= Dateadd(Month, Datediff(Month, 0, DATEADD(m, -5,
--current_timestamp)), 0)
--and [Type]= 'Invoice'
--and [AmountCollect] < Total
--and Total != 0.00

--@ProposalsOutstanding 6
--select [InvoiceDate]  as _Data from [msSchedulerV3].[dbo].[tbl_Invoice]
--where [CompnyID]=@CompanyID
--and [InvoiceDate] >= Dateadd(Month, Datediff(Month, 0, DATEADD(m, -5,
--current_timestamp)), 0)
--and [Type]= 'Proposal'
--and [AmountCollect] < Total
--and Total != 0.00

--JobsCreated 7

--if (@CompanyID NOT LIKE '%[^0-9]%')
--begin
--select CONVERT(datetime2, CreatedDate, 1)   as _Data from [myServiceJobs].[dbo].[Invoices]
--where [CompanyId]=@CompanyID
--and CONVERT(datetime2, CreatedDate, 1) >= Dateadd(Month, Datediff(Month, 0, DATEADD(m, -5,
--current_timestamp)), 0)
--end
--Else
--Begin
--select ''   as _Data
--ENd



--@InvoicesPaid 8
--select  CONVERT(datetime2, CreatedDate, 1)  as _Data from [msSchedulerV3].[dbo].[tbl_Invoice]
--where [CompnyID]=@CompanyID
--and CONVERT(datetime2, CreatedDate, 1)  >= Dateadd(Month, Datediff(Month, 0, DATEADD(m, -5,
--current_timestamp)), 0)
--and [Type]= 'Invoice'
--and [AmountCollect] >= Total
--and Total != 0.00

--JobsWorked 9

--if (@CompanyID NOT LIKE '%[^0-9]%')
--begin
--select CONVERT(datetime2, CreatedDate, 1)   as _Data from [myServiceJobs].[dbo].[Invoices]
--where [CompanyId]=@CompanyID
--and CONVERT(datetime2, CreatedDate, 1) >= Dateadd(Month, Datediff(Month, 0, DATEADD(m, -5,
--current_timestamp)), 0)
--and [Status] = 2

--end
--Else
--Begin
--select ''   as _Data
--ENd



--Jobsopen 10

--if (@CompanyID NOT LIKE '%[^0-9]%')
--begin
--select CONVERT(datetime2, CreatedDate, 1)   as _Data from [myServiceJobs].[dbo].[Invoices]
--where [CompanyId]=@CompanyID
--and CONVERT(datetime2, CreatedDate, 1) >= Dateadd(Month, Datediff(Month, 0, DATEADD(m, -5,
--current_timestamp)), 0)
--and [Status] = 0

--end
--Else
--Begin
--select ''   as _Data
--ENd



End

--exec [KPI_barChart] '7553'
GO
/****** Object:  StoredProcedure [dbo].[KPI_Customers]    Script Date: 18/04/2025 23:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--exec [KPI_Customers] 'be7c49fd','Today'
CREATE procedure [dbo].[KPI_Customers]

@CompanyID nvarchar(50),
@TimePeriod nvarchar(100)

As
Begin

--Table Variable: 
DECLARE @KPICustomer TABLE 
   ( 
   ApptConfirmedGoal int,
   ApptConfirmedActual int, 
   NewJobsGoal int, 
   NewJobsActual int, 
   ClosedJobsGoal int , 
   ClosedJobsActual int,
   AppointmentRequests int,
   AppointmentsCreated  int,
   AppointmentsCancelled int,
   ProposalsCreated int,
   InvoicesCreated int,
   InvoicesPaid int,
   InvoicesOutstanding int,
   ProposalsOutstanding int,
   JobsCreated int,
   JobsWorked int,
   Jobsopen int
   ) 
   
declare @ApptConfirmedGoal int  
declare @ApptConfirmedActual int 
declare @NewJobsGoal int
declare @NewJobsActual int
declare @ClosedJobsGoal int 
declare @ClosedJobsActual int 

declare @AppointmentRequests int 
declare @AppointmentsCreated int 
declare @AppointmentsCancelled int 
declare @ProposalsCreated int 
declare @InvoicesCreated int 
declare @InvoicesPaid int 
declare @InvoicesOutstanding int 
declare @ProposalsOutstanding int 
declare @JobsCreated int 
declare @JobsWorked int 
declare @Jobsopen int 



declare @DateStart datetime

Set @DateStart=
Case
	When @TimePeriod = 'Today' then 
		CONVERT(varchar(10),getdate(),101)
	When @TimePeriod = 'Week' then 
		DATEADD(ww, DATEDIFF(ww,0,GETDATE()), 0)
	When @TimePeriod = 'Month' then 
		DATEADD(MM, DATEDIFF(MM,0,GETDATE()), 0)
	When @TimePeriod = 'Year' then 
		DATEADD(YY, DATEDIFF(YY,0,GETDATE()), 0)
End	

--if (@TimePeriod = 'Today')
--begin
--	Select 
--	 @ApptConfirmedGoal = a.AppointmentsMadeDaily,
--	 @NewJobsGoal = b.NewJobsDaily,
--	 @ClosedJobsGoal = b.ClosedJobsDaily
--	 from tbl_GoalAppointments a
--	inner join tbl_GoalJobs b on a.CompanyID=b.CompanyID
--	and a.CompanyID=@CompanyID
--end

if (@TimePeriod = 'Today')
begin

set @AppointmentRequests = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and createdDateTime = @DateStart
)

set @AppointmentsCreated = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and ApptDateTime = @DateStart
)

set @AppointmentsCancelled = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and createdDateTime = @DateStart
and Status= '3'
)

set @ProposalsCreated = (select COUNT([Type]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [InvoiceDate] = @DateStart
and [Type]= 'Proposal'
)

set @InvoicesCreated = (select  COUNT([Type])  from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [InvoiceDate] = @DateStart
and [Type]= 'Invoice'
)

set @InvoicesPaid = (select  COUNT([Type]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [InvoiceDate] = @DateStart
and [Type]= 'Invoice'
and [AmountCollect] >= Total
and Total != 0.00
)

set @InvoicesOutstanding = (select  COUNT([Type])  from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [InvoiceDate] = @DateStart
and [Type]= 'Invoice'
and [AmountCollect] < Total
and Total != 0.00
)


END
else
Begin

if (@TimePeriod = 'Week')
begin

set @AppointmentRequests = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and  createdDateTime  >= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), -1) -- Sunday
AND createdDateTime <= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 5) -- Saturday
)

set @AppointmentsCreated = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and ApptDateTime  >= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), -1) -- Sunday
AND ApptDateTime <= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 5) -- Saturday
)


set @AppointmentsCancelled = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and createdDateTime  >= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), -1) -- Sunday
AND createdDateTime <= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 5) -- Saturday
and Status= '3'
)

set @ProposalsCreated = (select COUNT([Type]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [InvoiceDate]  >= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), -1) -- Sunday
AND [InvoiceDate] <= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 5) -- Saturday
and [Type]= 'Proposal'
)

set @InvoicesCreated = (select  COUNT([Type])  from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [InvoiceDate]  >= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), -1) -- Sunday
AND [InvoiceDate] <= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 5) -- Saturday
and [Type]= 'Invoice')

set @InvoicesPaid = (select  COUNT([Type]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [InvoiceDate]  >= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), -1) -- Sunday
AND [InvoiceDate] <= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 5) -- Saturday
and [Type]= 'Invoice'
and [AmountCollect] >= Total
and Total != 0.00
)

set @InvoicesOutstanding = (select  COUNT([Type])  from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [InvoiceDate]  >= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), -1) -- Sunday
AND [InvoiceDate] <= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 5) -- Saturday
and [Type]= 'Invoice'
and [AmountCollect] < Total
and Total != 0.00
)

END

else
begin
set @AppointmentRequests = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and createdDateTime >= @DateStart
)

set @AppointmentsCreated = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and ApptDateTime >= @DateStart
)

set @AppointmentsCancelled = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and createdDateTime >= @DateStart
and Status= '3'
)

set @ProposalsCreated = (select COUNT([Type]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [InvoiceDate] >= @DateStart
and [Type]= 'Proposal'
)

set @InvoicesCreated = (select  COUNT([Type])  from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [InvoiceDate] >= @DateStart
and [Type]= 'Invoice'
)
set @InvoicesPaid = (select  COUNT([Type]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [InvoiceDate] >= @DateStart
and [Type]= 'Invoice'
and [AmountCollect] >= Total
and Total != 0.00
)

set @InvoicesOutstanding = (select  COUNT([Type])  from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [InvoiceDate] >= @DateStart
and [Type]= 'Invoice'
and [AmountCollect] < Total
and Total != 0.00
)
end


end



if (@TimePeriod = 'Month')
begin

set @AppointmentRequests = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and  createdDateTime  >= dateadd(month,datediff(month,0,getdate()),0)
AND createdDateTime <= dateadd(day,-1,dateadd(month,datediff(month,-1,getdate()),0))
)

set @AppointmentsCreated = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and ApptDateTime  >= dateadd(month,datediff(month,0,getdate()),0)
AND ApptDateTime <= dateadd(day,-1,dateadd(month,datediff(month,-1,getdate()),0))
)


set @AppointmentsCancelled = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and createdDateTime  >= dateadd(month,datediff(month,0,getdate()),0)
AND createdDateTime <= dateadd(day,-1,dateadd(month,datediff(month,-1,getdate()),0))
and Status= '3'
)

set @ProposalsCreated = (select COUNT([Type]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [InvoiceDate]  >= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), -1) -- Sunday
AND [InvoiceDate] <= dateadd(day,-1,dateadd(month,datediff(month,-1,getdate()),0))
and [Type]= 'Proposal'
)

set @InvoicesCreated = (select  COUNT([Type])  from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [InvoiceDate]  >= dateadd(month,datediff(month,0,getdate()),0)
AND [InvoiceDate] <= dateadd(day,-1,dateadd(month,datediff(month,-1,getdate()),0))
and [Type]= 'Invoice')

set @InvoicesPaid = (select  COUNT([Type]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [InvoiceDate]  >= dateadd(month,datediff(month,0,getdate()),0)
AND [InvoiceDate] <= dateadd(day,-1,dateadd(month,datediff(month,-1,getdate()),0))
and [Type]= 'Invoice'
and [AmountCollect] >= Total
and Total != 0.00
)

set @InvoicesOutstanding = (select  COUNT([Type])  from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [InvoiceDate]  >= dateadd(month,datediff(month,0,getdate()),0)
AND [InvoiceDate] <=dateadd(day,-1,dateadd(month,datediff(month,-1,getdate()),0))
and [Type]= 'Invoice'
and [AmountCollect] < Total
and Total != 0.00
)

END



set @ApptConfirmedActual = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and ApptDateTime >= @DateStart
and ApptDateTime < CONVERT(varchar(10),getdate()+1,101)
and Status=2
)

set @NewJobsActual = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and createdDateTime >= @DateStart
)

set @ClosedJobsActual = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and createdDateTime >= @DateStart
and Status= '4'
)







set @ProposalsOutstanding = (select COUNT([Type]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [InvoiceDate] >= @DateStart
and [Type]= 'Proposal'
and [AmountCollect] < Total
and Total != 0.00
)

if (@CompanyID NOT LIKE '%[^0-9]%')
begin
 set @JobsCreated = (select COUNT([CompanyId]) from [myServiceJobs].[dbo].[Invoices]
where [CompanyId]=@CompanyID
and CONVERT(datetime2, CreatedDate, 1) >= @DateStart
)

--JobsWorked 9

set @JobsWorked = (select COUNT([CompanyId])   as _Data from [myServiceJobs].[dbo].[Invoices]
where [CompanyId]=@CompanyID
and CONVERT(datetime2, CreatedDate, 1) >= @DateStart
and [Status] = 2)


--Jobsopen 10

set @Jobsopen = ( select COUNT([CompanyId])    as _Data from [myServiceJobs].[dbo].[Invoices]
where [CompanyId]=@CompanyID
and CONVERT(datetime2, CreatedDate, 1) >= @DateStart
and [Status] = 0)
end




insert into @KPICustomer 
(ApptConfirmedGoal,
   ApptConfirmedActual, 
   NewJobsGoal, 
   NewJobsActual, 
   ClosedJobsGoal, 
   ClosedJobsActual,
   AppointmentRequests,
   AppointmentsCreated,
   AppointmentsCancelled,
   ProposalsCreated,
   InvoicesCreated,
   InvoicesPaid,
   InvoicesOutstanding,
   ProposalsOutstanding,
   JobsCreated,
   JobsWorked,
   Jobsopen)
Values 
(@ApptConfirmedGoal, 
@ApptConfirmedActual,
@NewJobsGoal,
@NewJobsActual,
@ClosedJobsGoal,
@ClosedJobsActual,
@AppointmentRequests,
@AppointmentsCreated,
@AppointmentsCancelled,
@ProposalsCreated,
@InvoicesCreated,
@InvoicesPaid,
@InvoicesOutstanding,
@ProposalsOutstanding,
@JobsCreated,
@JobsWorked,
@Jobsopen)

Select 
ISNULL(ApptConfirmedGoal,0) ApptConfirmedGoal,
ISNULL(ApptConfirmedActual,0) ApptConfirmedActual, 
ISNULL(NewJobsGoal,0) NewJobsGoal, 
ISNULL(NewJobsActual,0) NewJobsActual, 
ISNULL(ClosedJobsGoal,0) ClosedJobsGoal,
ISNULL(AppointmentRequests,0) AppointmentRequests,
ISNULL(AppointmentsCreated,0) AppointmentsCreated,
ISNULL(ProposalsCreated,0) ProposalsCreated,
ISNULL(InvoicesCreated,0) InvoicesCreated,
ISNULL(InvoicesPaid,0) InvoicesPaid,
ISNULL(InvoicesOutstanding,0) InvoicesOutstanding,
ISNULL(ProposalsOutstanding,0) ProposalsOutstanding,
ISNULL(AppointmentsCancelled,0) AppointmentsCancelled, 
ISNULL(JobsCreated,0) JobsCreated, 
ISNULL(JobsWorked,0) JobsWorked, 
ISNULL(Jobsopen,0) Jobsopen, 

ISNULL(ClosedJobsActual,0) ClosedJobsActual
from @KPICustomer


End

--exec [KPI_Customers] '13010','Week'

GO
/****** Object:  StoredProcedure [dbo].[KPI_Customers_All]    Script Date: 18/04/2025 23:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec [KPI_Customers] 'be7c49fd','Today'
CREATE procedure [dbo].[KPI_Customers_All]

@CompanyID nvarchar(200),
@TimePeriod nvarchar(100)

As
Begin
print @CompanyID
--Table Variable: 
DECLARE @KPICustomer TABLE 
   ( 
   ApptConfirmedGoal int,
   ApptConfirmedActual int, 
   NewJobsGoal int, 
   NewJobsActual int, 
   ClosedJobsGoal int , 
   ClosedJobsActual int,
   AppointmentRequests int,
   AppointmentsCreated  int,
   AppointmentsCancelled int,
   ProposalsCreated int,
   InvoicesCreated int,
   InvoicesPaid int,
   InvoicesOutstanding int,
   ProposalsOutstanding int,
   JobsCreated int,
   JobsWorked int,
   Jobsopen int
   ) 
   
declare @ApptConfirmedGoal int  
declare @ApptConfirmedActual int 
declare @NewJobsGoal int
declare @NewJobsActual int
declare @ClosedJobsGoal int 
declare @ClosedJobsActual int 

declare @AppointmentRequests int 
declare @AppointmentsCreated int 
declare @AppointmentsCancelled int 
declare @ProposalsCreated int 
declare @InvoicesCreated int 
declare @InvoicesPaid int 
declare @InvoicesOutstanding int 
declare @ProposalsOutstanding int 
declare @JobsCreated int 
declare @JobsWorked int 
declare @Jobsopen int 

declare @DateStart datetime

Set @DateStart=
Case
	When @TimePeriod = 'Today' then 
		CONVERT(varchar(10),getdate(),101)
	When @TimePeriod = 'Week' then 
		DATEADD(ww, DATEDIFF(ww,0,GETDATE()), 0)
	When @TimePeriod = 'Month' then 
		DATEADD(MM, DATEDIFF(MM,0,GETDATE()), 0)
	When @TimePeriod = 'Year' then 
		DATEADD(YY, DATEDIFF(YY,0,GETDATE()), 0)
End	

if (@TimePeriod = 'Today')
begin



set @AppointmentRequests = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID in ('13009','13015','13010','7369')
and createdDateTime = @DateStart
)

set @AppointmentsCreated = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID  in ('13009','13015','13010','7369')
and ApptDateTime = @DateStart
)

set @AppointmentsCancelled = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID  in ('13009','13015','13010','7369')
and createdDateTime = @DateStart
and Status= '3'
)

set @ProposalsCreated = (select COUNT([Type]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]  in ('13009','13015','13010','7369')
and [InvoiceDate] = @DateStart
and [Type]= 'Proposal'
)

set @InvoicesCreated = (select  COUNT([Type])  from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]  in ('13009','13015','13010','7369')
and [InvoiceDate] = @DateStart
and [Type]= 'Invoice'
)

set @InvoicesPaid = (select  COUNT([Type]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]  in ('13009','13015','13010','7369')
and [InvoiceDate] = @DateStart
and [Type]= 'Invoice'
and [AmountCollect] >= Total
and Total != 0.00
)

set @InvoicesOutstanding = (select  COUNT([Type])  from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]  in ('13009','13015','13010','7369')
and [InvoiceDate] = @DateStart
and [Type]= 'Invoice'
and [AmountCollect] < Total
and Total != 0.00
)


END
else
Begin

if (@TimePeriod = 'Week')
begin

set @AppointmentRequests = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID  in ('13009','13015','13010','7369')
and  createdDateTime  >= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), -1) -- Sunday
AND createdDateTime <= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 5) -- Saturday
)

set @AppointmentsCreated = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID  in ('13009','13015','13010','7369')
and ApptDateTime  >= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), -1) -- Sunday
AND ApptDateTime <= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 5) -- Saturday
)


set @AppointmentsCancelled = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID  in ('13009','13015','13010','7369')
and createdDateTime  >= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), -1) -- Sunday
AND createdDateTime <= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 5) -- Saturday
and Status= '3'
)

set @ProposalsCreated = (select COUNT([Type]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]  in ('13009','13015','13010','7369')
and [InvoiceDate]  >= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), -1) -- Sunday
AND [InvoiceDate] <= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 5) -- Saturday
and [Type]= 'Proposal'
)

set @InvoicesCreated = (select  COUNT([Type])  from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]  in ('13009','13015','13010','7369')
and [InvoiceDate]  >= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), -1) -- Sunday
AND [InvoiceDate] <= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 5) -- Saturday
and [Type]= 'Invoice')

set @InvoicesPaid = (select  COUNT([Type]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]  in ('13009','13015','13010','7369')
and [InvoiceDate]  >= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), -1) -- Sunday
AND [InvoiceDate] <= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 5) -- Saturday
and [Type]= 'Invoice'
and [AmountCollect] >= Total
and Total != 0.00
)

set @InvoicesOutstanding = (select  COUNT([Type])  from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]  in ('13009','13015','13010','7369')
and [InvoiceDate]  >= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), -1) -- Sunday
AND [InvoiceDate] <= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), 5) -- Saturday
and [Type]= 'Invoice'
and [AmountCollect] < Total
and Total != 0.00
)

END

else
begin
set @AppointmentRequests = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID  in ('13009','13015','13010','7369')
and createdDateTime >= @DateStart
)

set @AppointmentsCreated = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID  in ('13009','13015','13010','7369')
and ApptDateTime >= @DateStart
)

set @AppointmentsCancelled = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID  in ('13009','13015','13010','7369')
and createdDateTime >= @DateStart
and Status= '3'
)

set @ProposalsCreated = (select COUNT([Type]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]  in ('13009','13015','13010','7369')
and [InvoiceDate] >= @DateStart
and [Type]= 'Proposal'
)

set @InvoicesCreated = (select  COUNT([Type])  from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]  in ('13009','13015','13010','7369')
and [InvoiceDate] >= @DateStart
and [Type]= 'Invoice'
)
set @InvoicesPaid = (select  COUNT([Type]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]  in ('13009','13015','13010','7369')
and [InvoiceDate] >= @DateStart
and [Type]= 'Invoice'
and [AmountCollect] >= Total
and Total != 0.00
)

set @InvoicesOutstanding = (select  COUNT([Type])  from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]  in ('13009','13015','13010','7369')
and [InvoiceDate] >= @DateStart
and [Type]= 'Invoice'
and [AmountCollect] < Total
and Total != 0.00
)
end

end

if (@TimePeriod = 'Month')
begin

set @AppointmentRequests = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID  in ('13009','13015','13010','7369')
and  createdDateTime  >= dateadd(month,datediff(month,0,getdate()),0)
AND createdDateTime <= dateadd(day,-1,dateadd(month,datediff(month,-1,getdate()),0))
)

set @AppointmentsCreated = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID  in ('13009','13015','13010','7369')
and ApptDateTime  >= dateadd(month,datediff(month,0,getdate()),0)
AND ApptDateTime <= dateadd(day,-1,dateadd(month,datediff(month,-1,getdate()),0))
)


set @AppointmentsCancelled = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID  in ('13009','13015','13010','7369')
and createdDateTime  >= dateadd(month,datediff(month,0,getdate()),0)
AND createdDateTime <= dateadd(day,-1,dateadd(month,datediff(month,-1,getdate()),0))
and Status= '3'
)

set @ProposalsCreated = (select COUNT([Type]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]  in ('13009','13015','13010','7369')
and [InvoiceDate]  >= DATEADD(wk, DATEDIFF(wk,0,GETDATE()), -1) -- Sunday
AND [InvoiceDate] <= dateadd(day,-1,dateadd(month,datediff(month,-1,getdate()),0))
and [Type]= 'Proposal'
)

set @InvoicesCreated = (select  COUNT([Type])  from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]  in ('13009','13015','13010','7369')
and [InvoiceDate]  >= dateadd(month,datediff(month,0,getdate()),0)
AND [InvoiceDate] <= dateadd(day,-1,dateadd(month,datediff(month,-1,getdate()),0))
and [Type]= 'Invoice')

set @InvoicesPaid = (select  COUNT([Type]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]  in ('13009','13015','13010','7369')
and [InvoiceDate]  >= dateadd(month,datediff(month,0,getdate()),0)
AND [InvoiceDate] <= dateadd(day,-1,dateadd(month,datediff(month,-1,getdate()),0))
and [Type]= 'Invoice'
and [AmountCollect] >= Total
and Total != 0.00
)

set @InvoicesOutstanding = (select  COUNT([Type])  from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]  in ('13009','13015','13010','7369')
and [InvoiceDate]  >= dateadd(month,datediff(month,0,getdate()),0)
AND [InvoiceDate] <=dateadd(day,-1,dateadd(month,datediff(month,-1,getdate()),0))
and [Type]= 'Invoice'
and [AmountCollect] < Total
and Total != 0.00
)

END



set @ApptConfirmedActual = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID  in ('13009','13015','13010','7369')
and ApptDateTime >= @DateStart
and ApptDateTime < CONVERT(varchar(10),getdate()+1,101)
and Status=2
)

set @NewJobsActual = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID  in ('13009','13015','13010','7369')
and createdDateTime >= @DateStart
)

set @ClosedJobsActual = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID  in ('13009','13015','13010','7369')
and createdDateTime >= @DateStart
and Status= '4'
)


set @ProposalsOutstanding = (select COUNT([Type]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]  in ('13009','13015','13010','7369')
and [InvoiceDate] >= @DateStart
and [Type]= 'Proposal'
and [AmountCollect] < Total
and Total != 0.00
)

if (@CompanyID NOT LIKE '%[^0-9]%')
begin
 set @JobsCreated = (select COUNT([CompanyId]) from [myServiceJobs].[dbo].[Invoices]
where [CompanyId]  in ('13009','13015','13010','7369')
and CONVERT(datetime2, CreatedDate, 1) >= @DateStart
)

--JobsWorked 9

set @JobsWorked = (select COUNT([CompanyId])   as _Data from [myServiceJobs].[dbo].[Invoices]
where [CompanyId]  in ('13009','13015','13010','7369')
and CONVERT(datetime2, CreatedDate, 1) >= @DateStart
and [Status] = 2)


--Jobsopen 10

set @Jobsopen = ( select COUNT([CompanyId])    as _Data from [myServiceJobs].[dbo].[Invoices]
where [CompanyId]  in ('13009','13015','13010','7369')
and CONVERT(datetime2, CreatedDate, 1) >= @DateStart
and [Status] = 0)
end




insert into @KPICustomer 
(ApptConfirmedGoal,
   ApptConfirmedActual, 
   NewJobsGoal, 
   NewJobsActual, 
   ClosedJobsGoal, 
   ClosedJobsActual,
   AppointmentRequests,
   AppointmentsCreated,
   AppointmentsCancelled,
   ProposalsCreated,
   InvoicesCreated,
   InvoicesPaid,
   InvoicesOutstanding,
   ProposalsOutstanding,
   JobsCreated,
   JobsWorked,
   Jobsopen)
Values 
(@ApptConfirmedGoal, 
@ApptConfirmedActual,
@NewJobsGoal,
@NewJobsActual,
@ClosedJobsGoal,
@ClosedJobsActual,
@AppointmentRequests,
@AppointmentsCreated,
@AppointmentsCancelled,
@ProposalsCreated,
@InvoicesCreated,
@InvoicesPaid,
@InvoicesOutstanding,
@ProposalsOutstanding,
@JobsCreated,
@JobsWorked,
@Jobsopen)

Select 
ISNULL(ApptConfirmedGoal,0) ApptConfirmedGoal,
ISNULL(ApptConfirmedActual,0) ApptConfirmedActual, 
ISNULL(NewJobsGoal,0) NewJobsGoal, 
ISNULL(NewJobsActual,0) NewJobsActual, 
ISNULL(ClosedJobsGoal,0) ClosedJobsGoal,
ISNULL(AppointmentRequests,0) AppointmentRequests,
ISNULL(AppointmentsCreated,0) AppointmentsCreated,
ISNULL(ProposalsCreated,0) ProposalsCreated,
ISNULL(InvoicesCreated,0) InvoicesCreated,
ISNULL(InvoicesPaid,0) InvoicesPaid,
ISNULL(InvoicesOutstanding,0) InvoicesOutstanding,
ISNULL(ProposalsOutstanding,0) ProposalsOutstanding,
ISNULL(AppointmentsCancelled,0) AppointmentsCancelled, 
ISNULL(JobsCreated,0) JobsCreated, 
ISNULL(JobsWorked,0) JobsWorked, 
ISNULL(Jobsopen,0) Jobsopen, 

ISNULL(ClosedJobsActual,0) ClosedJobsActual
from @KPICustomer


End

--exec [KPI_Customers] '13010','Week'

GO
/****** Object:  StoredProcedure [dbo].[ReplaceCompanyID]    Script Date: 18/04/2025 23:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReplaceCompanyID]
    @OldCompanyID NVARCHAR(255),
    @NewCompanyID NVARCHAR(255)
AS
BEGIN
    DECLARE @TableName NVARCHAR(255)
    DECLARE @ColumnName NVARCHAR(255)
    DECLARE @SQL NVARCHAR(MAX)

    DECLARE tables_cursor CURSOR FOR
    SELECT TABLE_NAME, COLUMN_NAME
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'dbo' AND COLUMN_NAME = 'companyID'

    OPEN tables_cursor
    FETCH NEXT FROM tables_cursor INTO @TableName, @ColumnName

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @SQL = 'UPDATE ' + @TableName + ' SET ' + @ColumnName + ' = ''' + @NewCompanyID + ''' WHERE ' + @ColumnName + ' = ''' + @OldCompanyID + ''''
        EXEC sp_executesql @SQL

        FETCH NEXT FROM tables_cursor INTO @TableName, @ColumnName
    END

    CLOSE tables_cursor
    DEALLOCATE tables_cursor
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_AddDataToFishingCharter]    Script Date: 18/04/2025 23:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Sp_AddDataToFishingCharter]
	@CompanyID	nvarchar(100),
	@UserID	nvarchar(100)

AS
BEGIN



	IF NOT EXISTS(SELECT * From [CharterApp].[dbo].[tbl_Company] where CompanyID = @CompanyID) 
	BEGIN 

		INSERT INTO [CharterApp].[dbo].[tbl_Company]
           ([CompanyID]
           ,[CompanyName]
		   ,CompanyGUID
		   ,[Website]
			,[Facebook]
			,[Twitter]
			,[LogoFile]
           ,[Address]
           ,[City]
           ,[State]
           ,[ZipCode]
           ,[Phone]
           ,[Fax]
           ,[Email]
           ,[IsActive]
           ,[IsTrial]
           ,[TrialEndDate])
		   SELECT  [CompanyID]
		  ,[CompanyName],NEWID(),'','','',''
		  ,[Address]
		  ,[City]
		  ,[State]
		  ,[ZipCode]
		  ,[Phone]
		  ,[Fax]
		  ,[Email]
		  ,[IsActive]
		  ,[IsTrial]
		  ,[TrialEndDate]
	  FROM [XinatorCentral].[dbo].[tbl_Company] where companyid = @CompanyID
           
	END 

	IF NOT EXISTS(select * from [CharterApp].[dbo].[tbl_User] where CompanyID = @CompanyID and [UserID] = @UserID) 
	BEGIN
		
		INSERT INTO [CharterApp].[dbo].[tbl_User]
           ([CompanyID]
      ,[UserID]
      ,[Password]
      ,[FirstName]
      ,[LastName]
      ,[Phone]
      ,[Mobile]
      ,[Email])
	  select
	  [CompanyID]
      ,[UserID]
      ,[Password]
      ,[FirstName]
      ,[LastName]
      ,[Phone]
      ,[Mobile]
      ,[Email]

		from [XinatorCentral].[dbo].[tbl_User] where  CompanyID = @CompanyID and [UserID] = @UserID

	END

	

END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetChartData]    Script Date: 18/04/2025 23:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[Sp_GetChartData]

@CompanyID nvarchar(50),
@StartDate nvarchar(100),
@EndDate nvarchar(100)

As
Begin

select ApptDateTime,Status from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and ApptDateTime >= @StartDate
and ApptDateTime < @EndDate


End
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetKpiGoals]    Script Date: 18/04/2025 23:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[Sp_GetKpiGoals]

@CompanyID nvarchar(50)

As
Begin

SELECT * FROM tbl_Goal_Appointments where CompanyID=@CompanyID
SELECT * FROM tbl_Goal_Invoices where CompanyID=@CompanyID
SELECT * FROM tbl_Goal_Jobs where CompanyID=@CompanyID
SELECT * FROM tbl_Goal_Proposals where CompanyID=@CompanyID
SELECT * FROM [tbl_Financial_Goal] where CompanyID=@CompanyID



End
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetKpiResultsForAppoinments]    Script Date: 18/04/2025 23:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Sp_GetKpiResultsForAppoinments]

@CompanyID nvarchar(50),
@TimePeriod nvarchar(100)

As
Begin

declare @DateStart datetime
declare @AppointmentRequests int 
declare @AppointmentsCreated int 
declare @AppointmentsCancelled int 


Set @DateStart=
Case
	When @TimePeriod = 'Today' then 
		CONVERT(varchar(10),getdate(),101)
	When @TimePeriod = 'Week' then 
		DATEADD(ww, DATEDIFF(ww,0,GETDATE()), 0)
	When @TimePeriod = 'Month' then 
		DATEADD(MM, DATEDIFF(MM,0,GETDATE()), 0)
	When @TimePeriod = 'Year' then 
		DATEADD(YY, DATEDIFF(YY,0,GETDATE()), 0)
End

SELECT * FROM dbo.tbl_Goal_Appointments where CompanyID=@CompanyID;

set @AppointmentRequests = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and createdDateTime >= @DateStart
and CreatedBy= 'Customer'
)

set @AppointmentsCreated = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and createdDateTime >= @DateStart
)

set @AppointmentsCancelled = (select COUNT(companyID) from msSchedulerV3.dbo.tbl_Appointment
where companyID=@CompanyID
and createdDateTime >= @DateStart
and Status= '3')

 select @AppointmentRequests as AppointmentRequests,@AppointmentsCreated as AppointmentsCreated ,@AppointmentsCancelled as AppointmentsCancelled
 End
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetKpiResultsForInvoice]    Script Date: 18/04/2025 23:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Sp_GetKpiResultsForInvoice]

@CompanyID nvarchar(50),
@TimePeriod nvarchar(100)

As
Begin

declare @DateStart datetime
declare @AppointmentRequests int 
declare @AppointmentsCreated int 
declare @AppointmentsCancelled int 


Set @DateStart=
Case
	When @TimePeriod = 'Today' then 
		CONVERT(varchar(10),getdate(),101)
	When @TimePeriod = 'Week' then 
		DATEADD(ww, DATEDIFF(ww,0,GETDATE()), 0)
	When @TimePeriod = 'Month' then 
		DATEADD(MM, DATEDIFF(MM,0,GETDATE()), 0)
	When @TimePeriod = 'Year' then 
		DATEADD(YY, DATEDIFF(YY,0,GETDATE()), 0)
End

SELECT * FROM dbo.tbl_Goal_Invoices where CompanyID=@CompanyID;


declare @InvoicesCreated int 
declare @InvoicesCreatedAmount numeric(18, 2) 
declare @InvoicesPaid int 
declare @InvoicesPaidAmount numeric(18, 2) 
declare @InvoicesOutstanding int 
declare @InvoicesOutstandingAmount numeric(18, 2) 




set @InvoicesCreated = (select  COUNT([Type])  from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [CreatedDate] >= @DateStart
and [Type]= 'Invoice'
)

set @InvoicesCreatedAmount = (select  sum([Total])   from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [CreatedDate] >= @DateStart
and [Type]= 'Invoice'
)


set @InvoicesPaid = (select  COUNT([Type]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [CreatedDate] >= @DateStart
and [Type]= 'Invoice'
and [AmountCollect] >= Total
and Total != 0.00

)


set @InvoicesPaidAmount = (select  sum([Total]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [CreatedDate] >= @DateStart
and [Type]= 'Invoice'
and [AmountCollect] >= Total
and Total != 0.00
)

set @InvoicesOutstanding = (select  COUNT([Type])  from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [CreatedDate] >= @DateStart
and [Type]= 'Invoice'
and [AmountCollect] < Total
and Total != 0.00
)

set @InvoicesOutstandingAmount = (select  sum([Total])  from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [CreatedDate] >= @DateStart
and [Type]= 'Invoice'
and [AmountCollect] < Total
and Total != 0.00
)




 select @InvoicesCreated as InvoicesCreated,
		isnull(@InvoicesCreatedAmount,0.00) as InvoicesCreatedAmount,
		@InvoicesPaid as InvoicesPaid,
		isnull(@InvoicesPaidAmount,0.00) as InvoicesPaidAmount,
		@InvoicesOutstanding as InvoicesOutstanding,
		isnull(@InvoicesOutstandingAmount,0.00) as InvoicesOutstandingAmount
 End
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetKpiResultsForJobs]    Script Date: 18/04/2025 23:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Sp_GetKpiResultsForJobs]

@CompanyID nvarchar(50),
@TimePeriod nvarchar(100)

As
Begin

declare @DateStart datetime
declare @AppointmentRequests int 
declare @AppointmentsCreated int 
declare @AppointmentsCancelled int 


Set @DateStart=
Case
	When @TimePeriod = 'Today' then 
		CONVERT(varchar(10),getdate(),101)
	When @TimePeriod = 'Week' then 
		DATEADD(ww, DATEDIFF(ww,0,GETDATE()), 0)
	When @TimePeriod = 'Month' then 
		DATEADD(MM, DATEDIFF(MM,0,GETDATE()), 0)
	When @TimePeriod = 'Year' then 
		DATEADD(YY, DATEDIFF(YY,0,GETDATE()), 0)
End

SELECT * FROM dbo.[tbl_Goal_Jobs] where CompanyID=@CompanyID;
declare @JobsCreated int 


set @JobsCreated = (select COUNT(*) from [myServiceJobs].[dbo].[Invoices]
where [CompanyId]=@CompanyID
and [CreatedDate] >= @DateStart
)


 select @JobsCreated as JobsCreated
 End
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetKpiResultsForProposals]    Script Date: 18/04/2025 23:25:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Sp_GetKpiResultsForProposals]

@CompanyID nvarchar(50),
@TimePeriod nvarchar(100)

As
Begin

declare @DateStart datetime
declare @AppointmentRequests int 
declare @AppointmentsCreated int 
declare @AppointmentsCancelled int 


Set @DateStart=
Case
	When @TimePeriod = 'Today' then 
		CONVERT(varchar(10),getdate(),101)
	When @TimePeriod = 'Week' then 
		DATEADD(ww, DATEDIFF(ww,0,GETDATE()), 0)
	When @TimePeriod = 'Month' then 
		DATEADD(MM, DATEDIFF(MM,0,GETDATE()), 0)
	When @TimePeriod = 'Year' then 
		DATEADD(YY, DATEDIFF(YY,0,GETDATE()), 0)
End

SELECT * FROM dbo.tbl_Goal_Proposals where CompanyID=@CompanyID;
declare @ProposalsCreated int 
declare @ProposalsCreatedAmount numeric(18, 2) 
declare @ProposalsOutstanding int 
declare @ProposalsOutstandingAmount numeric(18, 2)



set @ProposalsCreated = (select COUNT([Type]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [CreatedDate] >= @DateStart
and [Type]= 'Proposal'
)

set @ProposalsCreatedAmount = (select sum([Total]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [CreatedDate] >= @DateStart
and [Type]= 'Proposal'
)



set @ProposalsOutstanding = (select COUNT([Type]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [CreatedDate] >= @DateStart
and [Type]= 'Proposal'
and [AmountCollect] < Total
and Total != 0.00
)

set @ProposalsOutstandingAmount = (select  sum([Total]) from [msSchedulerV3].[dbo].[tbl_Invoice]
where [CompnyID]=@CompanyID
and [CreatedDate] >= @DateStart
and [Type]= 'Proposal'
and [AmountCollect] < Total
and Total != 0.00
)



 select @ProposalsCreated as ProposalsCreated,
		isnull(@ProposalsCreatedAmount,0.00) as ProposalsCreatedAmount,
		@ProposalsOutstanding as ProposalsOutstanding,
		isnull(@ProposalsOutstandingAmount,0.00) as ProposalsOutstandingAmount
 End

 --exec [Sp_GetKpiResultsForProposals] '7518','year'
GO
