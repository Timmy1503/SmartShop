/****** Object:  Table [dbo].[About]    Script Date: 27/6/2021 8:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[AboutID] [bigint] IDENTITY(1,1) NOT NULL,
	[AboutName] [nvarchar](max) NULL,
	[MetaTitle] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Detail] [ntext] NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_About_CreateDate]  DEFAULT (getdate()),
	[CreateBy] [nvarchar](250) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](250) NULL,
	[MetaKeywords] [nvarchar](550) NULL,
	[MetaDescriptions] [nvarchar](max) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_About_Status]  DEFAULT ((1)),
	[Tag] [nvarchar](max) NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[AboutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 27/6/2021 8:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL CONSTRAINT [DF_Category_DisplayOrder]  DEFAULT ((0)),
	[CreateDate] [datetime] NULL CONSTRAINT [DF_Category_CreateDate]  DEFAULT (getdate()),
	[CreateBy] [nvarchar](250) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](250) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Category_Status]  DEFAULT ((1)),
	[ShowOnHome] [bit] NULL CONSTRAINT [DF_Category_ShowOnHome]  DEFAULT ((0)),
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 27/6/2021 8:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactID] [bigint] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Contact_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Credential]    Script Date: 27/6/2021 8:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credential](
	[UserGroupID] [nvarchar](50) NOT NULL,
	[RoleID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Credential] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 27/6/2021 8:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[FeedBackID] [int] IDENTITY(1,1) NOT NULL,
	[FeedBackName] [nvarchar](450) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[Subject] [nvarchar](250) NULL,
	[Content] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_FeedBack_CreateDate]  DEFAULT (getdate()),
	[Status] [bit] NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[FeedBackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Footer]    Script Date: 27/6/2021 8:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Footer](
	[FooterID] [varchar](250) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[FooterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HelpQuestion]    Script Date: 27/6/2021 8:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HelpQuestion](
	[HelpQuestionID] [bigint] IDENTITY(1,1) NOT NULL,
	[MetaTitle] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[DisplayOrder] [int] NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_HelpQuestion_CreateDate]  DEFAULT (getdate()),
	[CreateBy] [nvarchar](250) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](250) NULL,
	[MetaKeywords] [nvarchar](550) NULL,
	[MetaDescriptions] [nvarchar](max) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_HelpQuestion_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_HelpQuestion] PRIMARY KEY CLUSTERED 
(
	[HelpQuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 27/6/2021 8:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](50) NULL,
	[Link] [nvarchar](50) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_Menu_CreateDate]  DEFAULT (getdate()),
	[CreateBy] [nvarchar](250) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Menu_Status]  DEFAULT ((1)),
	[MenuTypeID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 27/6/2021 8:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[MenuTypeID] [int] IDENTITY(1,1) NOT NULL,
	[MenuTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[MenuTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 27/6/2021 8:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatDate] [datetime] NULL,
	[UserName] [nvarchar](250) NULL,
	[ShipName] [nvarchar](250) NULL,
	[ShipMobile] [nvarchar](250) NULL,
	[ShipAddress] [nvarchar](max) NULL,
	[ShipEmail] [nvarchar](max) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Order_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 27/6/2021 8:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[Quantity] [int] NULL CONSTRAINT [DF_OrderDetail_Quantity]  DEFAULT ((1)),
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 27/6/2021 8:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](250) NULL,
	[Code] [nvarchar](50) NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[MoreImage] [nvarchar](max) NULL,
	[Price] [decimal](18, 0) NULL CONSTRAINT [DF_Product_Price]  DEFAULT ((0)),
	[PromotionPrice] [decimal](18, 0) NULL,
	[SaveImage] [nvarchar](max) NULL,
	[Quantity] [int] NULL CONSTRAINT [DF_Product_Quantity]  DEFAULT ((0)),
	[CategoryID] [bigint] NULL,
	[Origin] [nvarchar](250) NULL,
	[Warranty] [int] NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_Product_CreateDate]  DEFAULT (getdate()),
	[CreateBy] [nvarchar](250) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](250) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Product_Status]  DEFAULT ((1)),
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL CONSTRAINT [DF_Product_ViewCount]  DEFAULT ((0)),
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 27/6/2021 8:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ProductCategoryID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductCategoryName] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL CONSTRAINT [DF_ProductCategory_DisplayOrder]  DEFAULT ((0)),
	[SeoTitle] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_ProductCategory_CreateDate]  DEFAULT (getdate()),
	[CreateBy] [nvarchar](250) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](250) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_ProductCategory_Status]  DEFAULT ((1)),
	[ShowOnHome] [bit] NULL CONSTRAINT [DF_ProductCategory_ShowOnHome]  DEFAULT ((0)),
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 27/6/2021 8:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [nvarchar](250) NOT NULL,
	[RoleName] [nvarchar](250) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Slide]    Script Date: 27/6/2021 8:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[SlideID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL CONSTRAINT [DF_Slide_DisplayOrder]  DEFAULT ((1)),
	[Link] [nvarchar](250) NULL,
	[ParentID] [bigint] NULL,
	[Description] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_Slide_CreateDate]  DEFAULT (getdate()),
	[CreateBy] [nvarchar](250) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](250) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Slide_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[SlideID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 27/6/2021 8:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](250) NULL,
	[Password] [nvarchar](250) NULL,
	[UserGroupID] [varchar](50) NULL CONSTRAINT [DF_User_GroupID]  DEFAULT ('MEMBER'),
	[Name] [nvarchar](250) NULL,
	[Address] [nvarchar](max) NULL,
	[Email] [nvarchar](250) NULL,
	[Phone] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_User_CreateDate]  DEFAULT (getdate()),
	[CreateBy] [nvarchar](250) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](250) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_User_Status]  DEFAULT ((1)),
	[ResetPassword] [nvarchar](100) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 27/6/2021 8:18:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[UserGroupID] [nchar](20) NOT NULL,
	[UserGroupName] [nvarchar](250) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[About] ON 

INSERT [dbo].[About] ([AboutID], [AboutName], [MetaTitle], [Description], [Image], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [Tag]) VALUES (1, N'Cửa hàng tạp hóa', NULL, N'<p class="top">Đi từ một cửa hàng nhỏ, đến ngày hôm này chúng tôi đã phát triển nó thành một cửa hàng có quy mô lớn hơn, nhằm phục vụ cho khách hàng được tốt hơn. Cửa hàng đã mở rộng để có thể chứa thêm những gian hàng mới, cung cấp thêm nhiều sản phẩm cho khách hàng.</p>
					<p>Chúng tôi có đội ngũ nhân viên nhiệt tình, tận tình giải đáp các thắc mắc cho khách hàng, hướng dẫn và giải thích những thắc mắc khi mua hàng của mọi người. </p>
					<p> Cuối cùng, xin cảm ơn mọi người đã ủng hộ cửa hàng của chúng tôi, mong rằng mọi người sẽ tiếp tục ủng hộ cửa hàng chúng tôi, và mong mọi người có thể góp ý để cửa hàng có thể phát triển hơn nữa trong tương lai.</p>', NULL, NULL, CAST(N'2021-05-07 22:04:15.957' AS DateTime), N'ADMIN', NULL, NULL, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[About] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (1, N'Cửa hàng tạp hoá', N'cua-hang-tap-hoa', NULL, 0, CAST(N'2021-04-14 21:46:07.803' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (2, N'Đồ dùng gia đình', N'do-dung-gia-dinh', NULL, 1, CAST(N'2021-04-14 21:46:28.380' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (3, N'Đồ dùng cá nhân', N'do-dung-ca-nhan', NULL, 1, CAST(N'2021-05-09 20:41:23.233' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (4, N'Thực phẩm đóng gói', N'thuc-pham-dong-goi', NULL, 1, CAST(N'2021-05-09 20:41:43.667' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (5, N'Đồ uống', N'do-uong', NULL, 1, CAST(N'2021-05-09 20:41:53.833' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (6, N'Trái cây khô', N'trai-cay-kho', 1, 1, CAST(N'2021-05-09 20:48:40.913' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (7, N'Thực phẩm đóng gói', N'thuc-pham-dong-goi', 1, 1, CAST(N'2021-05-09 20:51:06.393' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (8, N'Sữa', N'sua', 1, 1, CAST(N'2021-05-09 20:51:54.023' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (9, N'Dụng cụ nấu ăn', N'dung-cu-nau-an', 2, 1, CAST(N'2021-05-09 20:52:09.450' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (10, N'Dụng cụ lau nhà', N'dung-cu-lau-nhà', 2, 1, CAST(N'2021-05-09 20:52:24.867' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (11, N'Dụng cụ đựng đồ ăn', N'dung-cu-dung-do-an', 2, 1, CAST(N'2021-05-09 20:52:44.103' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (12, N'Gia vị', N'gia-vi', 2, 1, CAST(N'2021-05-09 20:52:53.970' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (13, N'Xà phòng trẻ em', N'xa-phong-tre-em', 3, 1, CAST(N'2021-05-09 20:53:39.160' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (14, N'Phụ kiện chăm sóc trẻ em', N'phu-kien-cham-soc-tre-em', 3, 1, CAST(N'2021-05-09 20:53:59.533' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (15, N'Kem dưỡng da dành cho trẻ em', N'kem-duong-da-danh-cho-tre-em', 3, 1, CAST(N'2021-05-09 20:54:27.303' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (16, N'Bột trẻ em', N'bot-tre-em', 3, 1, CAST(N'2021-05-09 20:54:43.313' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (17, N'Tã & khăn lau', N'ta-&-khan-lau', 3, 1, CAST(N'2021-05-09 20:55:13.553' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (18, N'Mì ăn liền', N'mi-an-lien', 4, 1, CAST(N'2021-05-09 20:55:27.197' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (19, N'Mứt', N'mut', 4, 1, CAST(N'2021-05-09 20:55:33.870' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (20, N'Bánh', N'banh', 4, 1, CAST(N'2021-05-09 20:55:41.917' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (21, N'Ngũ cốc ăn sáng', N'ngu-coc-an-sang', 4, 1, CAST(N'2021-05-09 20:55:56.370' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (22, N'Đồ ăn đóng hộp', N'do-an-dong-hop', 4, 1, CAST(N'2021-05-09 20:56:11.780' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (23, N'Sản phẩm đặc biệt', N'san-pham-dac-biet', NULL, 0, CAST(N'2021-06-02 16:29:00.097' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (24, N'Rau & củ', N'rau-&cu', 23, 0, CAST(N'2021-06-02 16:41:02.427' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (25, N'Nước giải khát', N'nguoc-giai-khat', 5, 0, CAST(N'2021-06-02 16:41:41.220' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [MetaTitle], [ParentID], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (26, N'Cafe', N'cafe', 5, 0, CAST(N'2021-06-02 16:41:51.263' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ContactID], [Content], [Status]) VALUES (1, N'<p>Số 5, Đường Phượng Hoàng, Thành phố Vinh.</p>
                    <ul class="wthree_contact_info_address">
                        <li><i class="fa fa-envelope" aria-hidden="true"></i><a href="mailto:info@example.com">nhom29@gmail.com</a></li>
                        <li><i class="fa fa-phone" aria-hidden="true"></i>+0123 456 789</li>
                    </ul>', 1)
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[FeedBack] ON 

INSERT [dbo].[FeedBack] ([FeedBackID], [FeedBackName], [Phone], [Email], [Address], [Subject], [Content], [CreateDate], [Status]) VALUES (1, N'Trần văn A', N'2423434', N'nguyenviettoan05@gmail.com', N'Vinh', N'Đánh giá', N'Hài lòng', CAST(N'2021-04-19 23:22:41.300' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[FeedBack] OFF
INSERT [dbo].[Footer] ([FooterID], [Content], [Status]) VALUES (N'footer', N'<div class="container">
            <div class="w3_footer_grids">
                <div class="col-md-3 w3_footer_grid">
                    <h3>Liên hệ</h3>

                    <ul class="address">
                        <li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>Số 5, Đường Phượng Hoàng, <span>Thành phố Vinh.</span></li>
                        <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:nhom29@gmail.com">nhom29@gmail.com</a></li>
                        <li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>+0123 456 789</li>
                    </ul>
                </div>
                <div class="col-md-3 w3_footer_grid">
                    <h3>Thông tin</h3>
                    <ul class="info">
                        <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="/gioi-thieu">Về chúng tôi</a></li>
                        <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="/lien-he">Liên hệ chúng tôi</a></li>
                        <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="/cau-hoi-tro-giup">Câu hỏi thường gặp</a></li>
                        <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="/san-pham-dac-biet">Sản phẩm đặc biệt</a></li>
                    </ul>
                </div>
                <div class="col-md-3 w3_footer_grid">
                    <h3>thể loại</h3>
                    <ul class="info">
                        <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="/cua-hang-tap-hoa">Cửa hàng tạp hóa</a></li>
                        <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="/do-dung-gia-dinh">Đồ dùng gia đình</a></li>
                        <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="/do-dung-ca-nhan">Đồ dùng cá nhân</a></li>
                        <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="/thuc-pham-dong-goi">Thực phẩm đóng gói</a></li>
                        <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="/do-uong">Đồ uống</a></li>
                    </ul>
                </div>
                <div class="col-md-3 w3_footer_grid">
                    <h3>Hồ sơ</h3>
                    <ul class="info">
                        <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="/">Cửa hàng</a></li>
                        <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="/gio-hang">Giỏ hàng của tôi</a></li>
                        <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="/dang-nhap">Đăng nhập</a></li>
                        <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="/tao-tai-khoan">Tạo tài khoản</a></li>
                    </ul>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>', 1)
SET IDENTITY_INSERT [dbo].[HelpQuestion] ON 

INSERT [dbo].[HelpQuestion] ([HelpQuestionID], [MetaTitle], [Description], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (1, N'Thời gian hoạt động của cửa hàng ?', N'Cửa hàng mở cửa vào lúc 7.30 AM và đóng cửa vào lúc 21.30 PM .', 1, CAST(N'2021-05-07 21:06:40.033' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[HelpQuestion] ([HelpQuestionID], [MetaTitle], [Description], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (2, N'Các sản phẩm mua tại cửa hàng liệu có được đổi trả ?', N' Các sản phẩm mua tại cửa hàng được đổi trả khi còn nguyên vẹn, chưa bóc tem và có hóa đơn mua hàng.', 2, CAST(N'2021-05-07 21:06:57.800' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[HelpQuestion] ([HelpQuestionID], [MetaTitle], [Description], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status]) VALUES (3, N'Sản phẩm mua tại cửa hàng được đổi trả trong vòng bao nhiêu ngày ?', N'Sản phẩm mua tại cửa hàng được đổi trả trong vòng 2 ngày kể từ lúc mua.', 3, CAST(N'2021-05-07 21:07:24.057' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[HelpQuestion] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([MenuID], [MenuName], [Link], [ParentID], [DisplayOrder], [Target], [CreateDate], [CreateBy], [Status], [MenuTypeID]) VALUES (1, N'Tạo Tài Khoản ', N'/tao-tai-khoan', NULL, 1, N'_self', CAST(N'2021-04-20 21:12:46.200' AS DateTime), N'ADMIN', 1, 2)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [Link], [ParentID], [DisplayOrder], [Target], [CreateDate], [CreateBy], [Status], [MenuTypeID]) VALUES (2, N'Đăng Nhập', N'/dang-nhap', NULL, 2, N'_self', CAST(N'2021-04-20 21:12:46.200' AS DateTime), N'ADMIN', 1, 2)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [Link], [ParentID], [DisplayOrder], [Target], [CreateDate], [CreateBy], [Status], [MenuTypeID]) VALUES (3, N'Trợ Giúp', N'/cau-hoi-tro-giup', NULL, 3, N'_self', CAST(N'2021-04-20 21:12:46.200' AS DateTime), N'ADMIN', 1, 2)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [Link], [ParentID], [DisplayOrder], [Target], [CreateDate], [CreateBy], [Status], [MenuTypeID]) VALUES (4, N'Trang chủ', N'/', NULL, 1, N'_self', CAST(N'2021-04-20 21:35:02.770' AS DateTime), N'ADMIN', 1, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [Link], [ParentID], [DisplayOrder], [Target], [CreateDate], [CreateBy], [Status], [MenuTypeID]) VALUES (5, N'Giới thiệu', N'/gioi-thieu', NULL, 2, N'_self', CAST(N'2021-04-20 21:44:04.500' AS DateTime), N'ADMIN', 1, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [Link], [ParentID], [DisplayOrder], [Target], [CreateDate], [CreateBy], [Status], [MenuTypeID]) VALUES (6, N'Cửa hàng tạp hoá', N'/cua-hang-tap-hoa', NULL, 3, N'_self', CAST(N'2021-04-20 21:46:00.400' AS DateTime), N'ADMIN', 1, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [Link], [ParentID], [DisplayOrder], [Target], [CreateDate], [CreateBy], [Status], [MenuTypeID]) VALUES (7, N'Đồ dùng gia đình', N'/do-dung-gia-dinh', NULL, 4, N'_self', CAST(N'2021-04-20 21:53:59.493' AS DateTime), N'ADMIN', 1, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [Link], [ParentID], [DisplayOrder], [Target], [CreateDate], [CreateBy], [Status], [MenuTypeID]) VALUES (8, N'Đồ dùng cá nhân', N'/do-dung-ca-nhan', NULL, 5, N'_self', CAST(N'2021-04-20 22:05:25.513' AS DateTime), N'ADMIN', 1, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [Link], [ParentID], [DisplayOrder], [Target], [CreateDate], [CreateBy], [Status], [MenuTypeID]) VALUES (9, N'Thực phẩm đóng gói', N'/thuc-pham-dong-goi', NULL, 6, N'_self', CAST(N'2021-04-20 22:05:35.670' AS DateTime), N'ADMIN', 1, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [Link], [ParentID], [DisplayOrder], [Target], [CreateDate], [CreateBy], [Status], [MenuTypeID]) VALUES (10, N'Đồ uống', N'/do-uong', NULL, 7, N'_self', CAST(N'2021-04-20 22:23:24.883' AS DateTime), N'ADMIN', 1, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [Link], [ParentID], [DisplayOrder], [Target], [CreateDate], [CreateBy], [Status], [MenuTypeID]) VALUES (11, N'Sản phẩm đặc biệt', N'/san-pham-dac-biet', NULL, 8, N'_self', CAST(N'2021-04-20 22:23:58.257' AS DateTime), N'ADMIN', 1, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [Link], [ParentID], [DisplayOrder], [Target], [CreateDate], [CreateBy], [Status], [MenuTypeID]) VALUES (12, N'Liên hệ', N'/lien-he', NULL, 9, N'_self', CAST(N'2021-04-20 22:24:25.550' AS DateTime), N'ADMIN', 1, 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuType] ON 

INSERT [dbo].[MenuType] ([MenuTypeID], [MenuTypeName]) VALUES (1, N'Menu chính')
INSERT [dbo].[MenuType] ([MenuTypeID], [MenuTypeName]) VALUES (2, N'Menu top')
SET IDENTITY_INSERT [dbo].[MenuType] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [CreatDate], [UserName], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (12, CAST(N'2021-06-26 13:05:10.860' AS DateTime), N'dungaka', N'Trần thị dung', N'01235122653', N'Tp Vinh', N'dung@gmail.com', 1)
INSERT [dbo].[Order] ([OrderID], [CreatDate], [UserName], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (13, CAST(N'2021-06-27 10:16:45.530' AS DateTime), N'dungaka', N'Trần thị dung', N'01235122653', N'Tp Vinh', N'dung@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (1, 4, 1, CAST(30000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (11, 13, 5, CAST(80000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (1, N'Socola ', N'A01', N'socola', N'<p>❗️Lưu &yacute;: do trời điều kiện thời tiết socola c&oacute; khả năng bị chảy tr&ecirc;n đường vận chuyển, kh&aacute;ch mua h&agrave;ng ở xa lưu &yacute; c&acirc;n nhắc trước khi mua gi&uacute;p shop ạ. Với hương vị ca cao đậm đ&agrave;, d&ograve;ng sản phẩm socola compound sẽ l&agrave; lựa chọn ho&agrave;n hảo cho c&aacute;c loại b&aacute;nh ngọt. Sản phẩm sẽ l&agrave;m h&agrave;i l&ograve;ng c&aacute;c t&iacute;n đồ y&ecirc;u th&iacute;ch s&ocirc; c&ocirc; la. Lợi thế sản phẩm: - Dễ sử dụng - Vị s&ocirc; c&ocirc; la đậm đ&agrave; - Lớp phủ s&ocirc; c&ocirc; la s&aacute;ng b&oacute;ng - Bề mặt s&ocirc; c&ocirc; la kh&ocirc;ng bị hiện tượng nứt, dễ cắt - Khả năng chịu nhiệt cao, chống d&iacute;nh bao b&igrave; - Ph&ugrave; hợp với nhiều ứng dụng b&aacute;nh kh&aacute;c nhau như trang tr&iacute; b&aacute;nh, đổ khu&ocirc;n socola l&agrave;m kẹo, nướng b&aacute;nh...</p>
', N'/Assets/client/images/1.png', NULL, CAST(35000 AS Decimal(18, 0)), CAST(30000 AS Decimal(18, 0)), NULL, 15, 18, N'Việt Nam', NULL, CAST(N'2021-04-11 16:00:17.513' AS DateTime), N'ADMIN', NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (7, N'Đường trắng', N'A02', N'duong-trang', N'Hạn sử dụng : 24 tháng 
Đường kính trắng xuất khẩu Toàn Lộc sử dụng nguồn nguyên liệu tự nhiên được chiết xuất từ 100% từ mía do các nhà máy đường uy tín tại Việt Nam sản xuất. Thành phần hoàn toàn tự nhiên không chứa chất hóa học độc hại nên Đường kính trắng xuất khẩu tuyệt đối an toàn cho sức khỏe khi sử dụng. Sử dụng Đường kính trắng xuất khẩu Toàn Lộc trong chế biến món ăn, pha chế đồ uống giúp mang lại vị ngọt tự nhiên, kích thích vị giác khi thưởng thức. Sản phẩm được đóng gói nhỏ gọn, rất tiện lợi cho việc bảo quản và sử dụng trong gia đình cũng như các bếp ăn tập thể.
Xuất xứ : việt nam 
Đường trắng được sản xuất trên dây  chuyền công nghệ hiện đại 
Đường trắng xuất khẩu được làm từ 100% mía đường nguyên chất, được sử dụng để pha nước uống, chế biến trong nấu ăn, làm phụ gia trong chế biến bánh ngot...và nhiều công dụng như làm dịu bỏng lưỡi, tẩy tế bào chết trên da, dưỡng môi, tiêu diệt côn trùng,...
Hạn sử dụng: 2 năm kể từ nsx
#đường #Đườngtrắng #đường trắng  #đường vàng , #làmbánh', N'/Assets/client/images/5.png', NULL, CAST(45000 AS Decimal(18, 0)), CAST(30000 AS Decimal(18, 0)), NULL, 10, 6, N'Thái Lan', NULL, CAST(N'2021-04-11 16:20:27.623' AS DateTime), N'ADMIN', NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (8, N'Bánh Saffola', N'A03', N'banh-saffola', N'Set này đúng là một siêu phẩm của shop nè.

Nụ Hồng có hương thơm nhẹ nhàng, đủ làm lan tỏa trong khoang mũi, đủ để chạy vào mạch máu đi đến các tế bào, đủ làm tan ngay mọi cơn mệt nhọc, mọi buồn phiền lo Âu. Vị ngọt hậu nơi đầu lưỡi đủ để làm cho ta có những phát ngôn có cánh đấy ạ 

Safron lại có mùi hoa cỏ, nó kết hợp với hương thơm hoa hồng thì đúng là một sự hoàn hảo đến mỹ mãn.

Saffron hoa hồng cải thiện chức năng tiêu hóa, hỗ trợ giảm cân hiệu quả

Bạn hãy cho Set safron hoa hồng vào cốc nước nóng khuấy đều cho tinh chất có trong hoa hồng và Saffron dễ dàng lan tỏa. Có thể sử dụng nước uống này với một vài viên đá, uống lạnh.

Thức uống này vừa giúp giảm cân, giải tỏa căng thẳng, mang lại cảm giác thư thái sau ngày dài làm việc căng thẳng.

Ngày sx: xem trên bao bì
Hạn sd: 2 năm kể từ ngày sx', N'/Assets/client/images/6.png', NULL, CAST(105000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)), NULL, 45, 18, N'Việt Nam', NULL, CAST(N'2021-04-11 16:21:26.860' AS DateTime), N'ADMIN', NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (9, N'Gạo bình dân', N'A04', N'gao-binh-dan', N'Là giống lúa mùa, gạo có màu trắng, dài hạt, thon, ẩm độ rất khô, có thể dự trữ cả năm. Đối với gạo mới thu hoạch khi nấu cơm có mùi rất thơm, hương vị tự nhiên, ngọt nhẹ, cơm mềm dẻo. Gạo thơm lài thích hợp cho trẻ em hoặc người thích cơm dẻo. Cơm vẫn thơm và dẻo khi nguội. Chính vì vậy mà gạo Thơm Lài luôn được các mẹ và các chị em ưu tiên lựa chọn cho bữa cơm ngon của gia đình. Là một trong những loại gạo thơm cao cấp
Hạn sử dụng : 6 tháng [ 2021]
Xuất sứ Vệt Nam
Hàng đóng bao 50kg, tách lẻ đóng bao 5-10kg 
Quý khách mua nhiều hoặc tư vấn vận chuyển vui lòng liên hệ 
028.6265.1136  hoặc 0906.852.036 (zalo)
#thomlai #gao #gaothomlai', N'/Assets/client/images/7.png', NULL, CAST(55000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), NULL, 12, 18, N'Hàn Quốc', NULL, CAST(N'2021-05-09 23:06:35.117' AS DateTime), N'ADMIN', NULL, NULL, NULL, NULL, 1, CAST(N'2021-07-10 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (10, N'Kẹo sữa', N'A05', N'keo-sua', N'+ Giới thiệu về bánh sữa Mộc Châu:
- Cô đọng từ 100% sữa bò tươi nguyên chất, bánh sữa Mộc Châu Milk giữ trọn hương vị và giá trị dinh dưỡng từ sữa. Cắn một cái rộp, vị ngọt đậm chạm ngay đầu lưỡi, thích thú vô cùng! Còn gì tuyệt hơn khi tiết trời giá lạnh đầu xuân được quây quần bên gia đình nhâm nhi chén trà nóng và nhấm nháp thanh bánh sữa Mộc Châu.
- Bánh sữa Mộc Châu được sản xuất từ sữa tươi nguyên chất. Là một trong những đặc sản Mộc Châu không thể thiếu khi đến cao nguyên Mộc Châu. Sản phẩm ăn ngay, dễ sử dụng, phù hợp cho tất cả mọi người từ trẻ nhỏ đến người già. 

+ Qui trình chế biến:
- Qua quá trình đun liên tục nhỏ lửa và đảo đều, người ta thu được sữa cô đặc. Cô đặc thêm bước nữa ta thu được sữa cứng. Đổ ra khuôn, để nguội thu được bánh sữa có màu vàng hấp dẫn, vị thơm, ngọt, ngậy. Sản phẩm là sự kết hợp độc đáo giữa công thức truyền thống và quy trình chế biến hiện đại đem lại chất lượng tốt nhất.
 
+ Giá trị dinh dưỡng:
- Bánh giúp cung cấp năng lượng, vitamin, dưỡng chất cần thiết cho các hoạt động hàng ngày. Sản phẩm được đóng gói nhỏ gọn, tiện lợi cho bạn mang theo bên mình trong các dịp dã ngoại, picnic... để chia sẻ với bạn bè, người thân hương vị thơm ngon.

MỘC CHÂU – THẢO NGUYÊN XANH, SỮA MÁT LÀNH
', N'/Assets/client/images/8.png', NULL, CAST(45000 AS Decimal(18, 0)), CAST(35000 AS Decimal(18, 0)), NULL, 13, 18, N'Nhật Bản', NULL, CAST(N'2021-05-09 23:06:59.093' AS DateTime), N'ADMIN', NULL, NULL, NULL, NULL, 1, CAST(N'2021-07-11 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (11, N'Bánh gạo', N'A06', N'banh-gao', N'BÁNH GẠO HÀN QUỐC 500G KÈM SỐT
Xuất Xứ: Việt Nam
HSD: 2 tháng

- Bánh gạo (kèm sốt) được làm từ gạo và muối, đảm bảo an toàn vệ sinh thực phẩm, không chứa chất độc hại. Bánh gạo có độ dai, dẻo của thanh bánh gạo, chứ không bở như những loại khác.  

- Đặc biệt, với combo này Shop đã kèm theo sẵn cho bạn gói sốt chuẩn vị Hàn Quốc rồi bạn nha!

- Ngoài ra các bạn có thể thêm một số loại rau, thực phẩm để chế biến cho món bánh gạo của mình thêm thơm ngon hơn như chả cá, hành tây, nấm hương, trứng luộc, hành lá, vừng,…

>> Combo bao gồm: 500gr bánh gạo và 100gr sốt tương', N'/Assets/client/images/9.png', NULL, CAST(105000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)), NULL, 11, 18, N'Việt Nam', NULL, CAST(N'2021-05-09 23:07:46.503' AS DateTime), N'ADMIN', NULL, NULL, NULL, NULL, 1, CAST(N'2021-07-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (12, N'Nước rửa chén', N'A07', N'nuoc-rua-chen', N'KOJI_ Health & Beauty - Phân phối hàng tiêu dùng, mỹ phẩm chính hãng Hàn Quốc
KOJI_ Health & Beauty cam kết:
- Nếu quý khách phát hiện hàng giả hàng nhái KOJI_ Health & Beauty cam kết hoàn tiền gấp 10 lần cho quý khách. Tất cả sản phẩm của KOJI đều là sản phẩm chính hãng có giấy tờ nhập khẩu đầy đủ.
- Thương hiệu tạo niềm tin!
--------------------------------------
Bạn đã quen thuộc với việc sử dụng các loại nước rửa chén thông thường trên thị trường giá tuy rẻ nhưng sau khi rửa bát, tay bạn có cảm giác khô, rít, lâu ngày bị bong da tay. Để giữ đôi bàn tay mịn và đẹp bạn chọn cách đeo găng tay cao su khi rửa bát.
==> Không cần phải vất vả như thế nữa, hãy biến việc rửa bát trở thành niềm đam mê của bạn vì đã có Nước rửa chén sinh học Bazzle công nghệ Hàn Quốc hoàn toàn từ thảo dược thiên nhiên không làm hại da tay không gây kích ứng.

Công thức độc quyền cực mạnh dựa trên tổ hợp Enzyme HỮU CƠ bao gồm tinh chất nano cucurmin từ củ nghệ đánh bay mọi vết dầu mỡ làm cho chén bát và các dụng cụ thủy tinh SẠCH BONG - SẠCH NHANH - SÁNG BÓNG chỉ với một vài giọt, trong khi rất thân thiện với da tay, không lo kích ứng da.
Hương cam, quế thơm nhẹ sẽ khiến bạn đê mê mỗi khi rửa chén.
-----------------------------------------------------
Hạn sử dụng: 03 năm kể từ ngày sản xuất       
Ngày sản xuất: Xem trên bao bì sản phẩm         
Xuất xứ: Việt Nam
Nhà sản xuất: Công ty cổ phần Dược Mỹ Phẩm KOJI
Sản xuất theo nhượng quyền của công ty: Dongbang B&H Co.Ltd 480-132 Jangan-ro, Jangan-myeon, Hwaseong-si Gyonggi-do, Korea

* GIỚI THIỆU VỀ DONGBANG B&H :
Kể từ khi thành lập vào năm 1986, lịch sử của Dongbang B&H đã được biết đến là 1 doanh nghiệp lớn chuyên sản xuất các sản phẩm về chăm sóc sức khỏe và sắc đẹp tại Hàn Quốc.

Từ năm 1999 Donbang đã sản xuất và bắt đầu phân phối xà phòng tại các hệ thống siêu thị Lotte Mart ở Hàn Quốc.

Với hệ thống phân phối toàn cầu, các sản phẩm của Dongbang B&H đã có mặt tại hầu hết các châu lục trên Thế Giới với doanh thu tăng trưởng liên tục qua các năm.

Năm 2015 sản phẩm của Dongbang B&H nhận danh hiệu sản phẩm đạt Tiêu chuẩn quốc tế ISO 9001 (xà phòng, chất tẩy rửa tổng hợp)

- Khi nhận được hàng Quý khách vui lòng bỏ chút thời gian để đánh giá cho shop, để shop có chiều hướng phục vụ tốt hơn cho Quý khách.', N'/Assets/client/images/10.png', NULL, CAST(35000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)), NULL, 41, 9, N'Hàn Quốc', NULL, CAST(N'2021-05-09 23:08:31.117' AS DateTime), N'ADMIN', NULL, NULL, NULL, NULL, 1, CAST(N'2021-07-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (13, N'Sữa Nestle', N'A08', N'sua-nestle', N'Khuyến mại dùng thử đặc biệt: Sữa Nestlé Gấu - TẶNG 12 HỘP KHI MUA 36 HỘP, sản phẩm được đóng theo lốc 4 có thông điệp ""mua 3 tặng 1"" trên màng co, thùng 48 hộp đã bao gồm 12 hộp hàng tặng & 36 hộp hàng bán. - Sữa nước NESTLÉ chất lượng Thụy Sĩ. - Mỗi hộp cung cấp đến 25% nhu cầu Canxi mỗi ngày cùng các dưỡng chất khác, cho xương chắc khỏe, giúp trẻ MẠNH MẼ.
- 4 hương vị thơm ngon, mới lạ, giúp trẻ dễ dàng thay đổi khẩu vị. Mẹ đang tìm kiếm 1 sản phẩm sữa đầy đủ dinh dưỡng để cùng đồng hành với trẻ trong chặng đường phát triển quan trọng của con? Sữa Nestle Gấu có nhiều ưu điểm nổi trội sẽ cùng mẹ mang đến cho trẻ những sản phẩm chất lượng cao với hương vị thơm ngon: 
- Thương hiệu Nestle, chất lượng Thụy Sĩ. 
- Với công thức NutriStrong, mỗi hộp Sữa Nestle Gấu cung cấp đến 25% nhu cầu Canxi mỗi ngày & các dưỡng chất thiết yếu như Vitamin D, A, B3, B6, B8, B9, chất đạm... cho xương chắc khỏe, giúp trẻ MẠNH MẼ để luôn sẵng sàng trước mọi thử thách! 
- Nhiều lựa chọn mỗi ngày với 4 hương vị thơm ngon của Sữa Nestle Gấu: + Sữa Nestle Gấu Có Đường + Sữa Nestle Gấu Ít Đường + Sữa Nestle Gấu Hương Dâu Trắng + Sữa Nestle Gấu Hương Việt Quất Mẹ có thể cho trẻ sử dụng sữa Nestlé Gấu vào bất cứ thời điểm nào trong ngày, tốt nhất là 1 hộp buổi sáng & 1 hộp buổi tối trước khi đi ngủ 1-2 tiếng để trẻ có giấc ngủ ngon. 
 		Sản xuất tại Việt Nam 
_ Nhu cầu khuyến nghị: Sử dụng 2 hộp Sữa Nestlé Gấu mỗi ngày
_ Cách bảo quản: Bảo quản sản phẩm nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp.
_ Cách sử dụng: Lắc đều trước khi uống. Ngon hơn khi uống lạnh
_ Hạn sử dụng: 8 tháng kể từ ngày sản xuất', N'/Assets/client/images/12.png', NULL, CAST(55000 AS Decimal(18, 0)), CAST(40000 AS Decimal(18, 0)), NULL, 36, 6, N'Nhật Bản', NULL, CAST(N'2021-05-09 23:10:12.407' AS DateTime), N'ADMIN', NULL, NULL, NULL, NULL, 1, CAST(N'2021-07-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (14, N'Bánh mì', N'A09', N'banh-mi', N'Năng lượng 412kcal/100g
Thành phần Bột mì, dầu cọ tinh luyện, nước, đường, phô mai (8.16%), chà bông (2.46%), trứng, men, bơ dầu thay thế, muối, sữa bột, calci carbonat, chanh tươi, bột trứng, chất bảo quản, enzym, chất nhũ hoá, chất điều vị, chất nhũ hoá, chất điều chỉnh độ acid, chất xử lý bột
Cách sử dụng Dùng ăn trực tiếp
Bảo quản Lưu trữ ở nơi khô ráo và mát mẻ
Lưu ý Thành phần có chứa bột mì, trứng, sữa, lecithin
Thương hiệu Staff (Việt Nam)
Nơi sản xuất Việt Nam
Hạn sử dụng: 2020', N'/Assets/client/images/13.png', NULL, CAST(65000 AS Decimal(18, 0)), CAST(55000 AS Decimal(18, 0)), NULL, 12, 18, N'Thái Lan', NULL, CAST(N'2021-05-09 23:11:31.090' AS DateTime), N'ADMIN', NULL, NULL, NULL, NULL, 1, CAST(N'2021-07-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (16, N'Đậu tương', N'A10', N'dau-tuong', N'Đậu nành nấu chín ủ cùng khuẩn bacillus thành Natto.

Natto là đậu nành nấu chín, ủ với men Bacillus, để lên men thành những hạt đậu có màu nâu, nhiều sợi nhớt, mùi hơi nồng

Tác dụng của natto:

- Natto làm sạch mạch và máu:

 natto chứa nhiều Menaquinone 7 (MK7), là một loại vitamin K2 duy nhất có nguồn gốc thiên nhiên, cứ 100g Natto cung cấp 870 microgram vitamin K2.

-Natto với xương khớp:

Natto với MK7 làm xương chắc khỏe, làm dịu các chứng đau khớp, khô khớp và nhức mỏi trong xương. 

-Natto với hệ tiêu hoá :

Vi khuẩn natto có sức sống rất mạnh mẽ, chịu được nước sôi 100 độ C trong vài chục phút, chịu được môi trường axit nên dễ dàng vượt qua dịch vị của dạ dày. Vi khuẩn Natto còn sống sẽ đi khắp hệ thống tiêu hóa, tạo môi trường thuận lợi tiêu hóa thức ăn, tiêu diệt các vi khuẩn có hại, khôi phục hệ thống vi khuẩn có lợi trong ruột.
Natto được người Nhật áp dụng trị táo bón cực kì hiệu quả. ', NULL, N'/Assets/client/images/14.png', CAST(55000 AS Decimal(18, 0)), CAST(45000 AS Decimal(18, 0)), NULL, 14, 18, N'Việt Nam', NULL, CAST(N'2021-05-09 23:35:21.697' AS DateTime), N'ADMIN', NULL, NULL, NULL, NULL, 1, NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (17, N'Hạt ngũ cốc', N'A11', N'hat-ngu-coc', N'𝑴𝒊𝒙 7 𝒉𝒂̣𝒕 𝒅𝒊𝒏𝒉 𝒅𝒖̛𝒐̛̃𝒏𝒈 𝒔𝒐̂́ 1 𝒅𝒂̀𝒏𝒉 𝒄𝒉𝒐 𝒎𝒆̣ 𝒃𝒂̂̀𝒖
ÓC CHÓ - MACCA - HẠNH NHÂN - ĐIỀU - BÍ
Chỉ cần nhắc đến những loại hạt trên mọi người đều gọi tắt là hạt dinh dưỡng, cái tên nói lên tất cả rồi đúng không?
 Rất tốt cho mẹ và và sự phát triển của thai nhi với nhiều chấ dinh dưỡng, Vitamin
- Bổ sung omega 3,6,9, folate, vitamin A,B,E,K,..., khoáng
chất sắt, canxi, magie, đồng, kẽm.
- Mẹ ăn giảm nghén, ăn ngủ tốt.
- Là món ăn vặt tuyệt vời, ăn mọi lúc mọi nơi

- Mix 5 hạt  bao gồm óc chó, hạnh nhân, macca, hạt điều, hạt bí đã được bóc vỏ và sấy, rang chín, thơm và bùi, rất dễ ăn, không chán.
- Mix 7 loại có thêm nho vàng chua dẻo, nho nâu ngọt dẻo tăng thêm vị hấp dẫn của túi mix
=> Cam kết hàng chất lượng, đảm bảo an toàn, giá cả cạnh tranh', NULL, N'/Assets/client/images/15.png', CAST(75000 AS Decimal(18, 0)), CAST(60000 AS Decimal(18, 0)), NULL, 10, 18, N'Nhật Bản', NULL, CAST(N'2021-05-09 23:36:41.217' AS DateTime), N'ADMIN', NULL, NULL, NULL, NULL, 1, NULL, 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (18, N'Lạc', N'A12', N'lac', N'Đậu phộng rang tỏi ớt gói 500G
Xuất xứ : Việt Nam
Hạn sử dụng : 12 tháng
Bảo quản nơi thoáng mắt tránh ánh nắng trực tiếp
Đậu Phộng rang tỏi ớt cay cay, giòn giòn và rất vừa miêng, đặc biệt nguyên liệu từ 100% hạt đậu phộng sạch, tự nhiên. Khách có thể mua dùng lai rai khi nhậu hoặc tám chyện hay làm quà tặng cho bạn bè , người thân…', NULL, N'/Assets/client/images/16.png', CAST(105000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)), NULL, 11, 24, N'Hàn Quốc', NULL, CAST(N'2021-05-09 23:37:06.720' AS DateTime), N'ADMIN', NULL, NULL, NULL, NULL, 1, NULL, 3)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (19, N'Ngô', N'A13', N'ngo', N'Mồi hạt ngô ủ với các chất phụ gia và đặc biệt thêm tinh chế từ nhiều loài trái cây tạo nên hương vị hấp dẫn các loài như trắm cỏ, mè, mè hoa, cá trích, rô..
Giá: 50.000
Trọng lượng: 1kg\gói 

* CAM KẾT CỦA SHOP: 

- Tất cả các sản phẩm do shop tự chụp và đăng tải 

- Sản phẩm của shop đều là hàng chất lượng , giá cả hợp lý nhất thị trường 

- Các sản phẩm đóng gói chắc chắn khi vận chuyển đi 

- Sản phầm giống như hình ảnh shop đăng tải 

- Giá tốt nhất thị trường 

- Hoàn hàng, đổi trả ngay nếu có lỗi từ nhà sản xuất 

- Đặt uy tín, sự tin tưởng của khách hàng lên hàng đầu 
', NULL, N'/Assets/client/images/17.png', CAST(55000 AS Decimal(18, 0)), CAST(35000 AS Decimal(18, 0)), NULL, 15, 24, N'Thái Lan', NULL, CAST(N'2021-05-09 23:37:32.440' AS DateTime), N'ADMIN', NULL, NULL, NULL, NULL, 1, NULL, 4)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (21, N'Nước lọc', N'A14', N'nuoc-loc', N'Nước khoáng tinh khiết Lavie bổ sung oxy cho cơ bắp của bạn, hỗ trợ cơ bắp hoạt động hiệu quả và bền bỉ. Nước khiến dạ dày cảm thấy đầy do lượng calo từ nước bạn uống vì thế bạn sẽ cảm thấy no lâu hơn. Khi muốn giảm cân bạn hãy uống nhiều nước hơn bình thường nhé!
Nước cần thiết cho việc:
Cơ thể sẽ chuyên chở đầy đủ oxy, chất dinh dưỡng nuôi tế bào.
Chuyển hóa thực phẩm thành các năng lượng cần thiết cho cơ thể.
Giúp cơ thể dễ dàng hấp thụ các chất dinh dưỡng.', N'/Assets/client/images/pf9.png', NULL, CAST(15000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), NULL, 102, 25, N'Việt Nam', NULL, CAST(N'2021-06-05 21:10:18.413' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (22, N'Coca Cola', N'A15', N'coca-cola', N'Thông tin sản phẩm
Thương hiệu Coca Cola (Mỹ)
Sản xuất tại Việt Nam
Loại nước nước ngọt
Lượng ga Có ga
Lượng đường Có đường
Thể tích 330ml
Số lượng 6 lon
Sử dụng Ngon hơn khi uống lạnh
Nước ngọt Coca Cola với thương hiệu uy tín hàng đầu thế giới, được nhiều người yêu thích với hương vị thơm ngon, hấp dẫn.
Sản phẩm không chỉ giúp giải tỏa cơn khát mà còn cung cấp nguồn năng lượng cùng hàm lượng khoáng chất dồi dào, cho bạn khơi lại hứng khởi ngay từ ngụm đầu tiên.
Với hương Cola truyền thống mang lại cảm giác sảng khoái, giải nhiệt tức thì, nước giải khát Coca Cola với lượng gas lớn sẽ giúp bạn xua tan nhanh mọi cảm giác mệt mỏi, căng thẳng, đặc biệt thích hợp sử dụng với các hoạt động ngoài trời  và các hoạt động thể thao...', N'/Assets/client/images/bv5.png', NULL, CAST(12000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), NULL, 500, 25, N'Việt Nam', NULL, CAST(N'2021-06-05 21:12:16.767' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (23, N'Nước ép táo', N'A16', N'nuoc-ep-tao', N'Tên sản phẩm: Combo Nước Ép Lợi Khuẩn Táo Và Nước Ép Lợi Khuẩn Đào Woongjin 1.5L
Xuất xứ:	Hàn Quốc
Dung tích: 1.5L
Ngày sản xuất: xem trên bao bì
Hạn sử dụng:  9 tháng kể từ ngày sản xuất

Nước Ép Lợi Khuẩn Táo Và Nước Ép Lợi Khuẩn Đào Woongjin 1.5L là sản phẩm bán chạy trên thị trường nước đóng chai ở Hàn Quốc. 
Nước Ép Lợi Khuẩn Táo Và Nước Ép Lợi Khuẩn Đào Woongjin 1.5L là thức uống tự nhiên, tươi mát, kết hợp giữa hương vị sữa và trái cây thơm mát.

Nước Ép Lợi Khuẩn Táo Và Nước Ép Lợi Khuẩn Đào Woongjin 1.5L tự nhiên giúp làm mát cơ thể và tăng cường năng lượng. Sản phẩm được đóng chai nhựa tiện lợi, an toàn, dễ dàng mang theo trong những chuyến vui chơi, dã ngoại để thưởng thức cùng gia đình, bạn bè.

Hướng dẫn bảo quản: Bảo quản nơi khô mát, tránh ánh nắng trực tiếp', N'/Assets/client/images/bv1.png', NULL, CAST(60000 AS Decimal(18, 0)), CAST(55000 AS Decimal(18, 0)), NULL, 1000, 25, N'Hàn Quốc', NULL, CAST(N'2021-06-05 21:18:16.540' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (24, N'Nước cam', N'A17', N'nuoc-cam', N'Nước ngọt được sản xuất trên dây chuyền hiện đại, không chứa chất bảo quản và hóa chất độc hại cho người sử dụng, bạn có thể hoàn toàn yên tâm về chất lượng sản phẩm.Hương vị đặc trưng, không chỉ giải khát, mà còn giúp bạn lấy lại năng lượng cho hoạt động hàng ngày.Vỏ chai được sản xuất từ nguyên liệu sạch thân thiện với môi trường, giúp bảo quản nước giữ nguyên mùi vị mà không sợ hư hỏng. Hướng dẫn sử dụng: Dùng trực tiếp, ngon hơn khi uống lạnh.Bảo quản:Để nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp. Xuất xứ : Việt Nam, Hạn sử dụng : 2 năm kể từ ngày sản xuất ', N'/Assets/client/images/bv2.png', NULL, CAST(20000 AS Decimal(18, 0)), CAST(15000 AS Decimal(18, 0)), NULL, 1253, 25, N'Việt Nam', NULL, CAST(N'2021-06-05 21:19:28.970' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (25, N'Bia', N'A18', N'bia', N'Thông tin sản phẩm 
Xuất xứ	Việt Nam
Dung tích	330ml
Thành phần	Nước, malt đại mạch, gạo, houblon
Độ cồn	4,6%
Hạn sử dụng	12 tháng kể từ ngày sản xuất
Hướng dẫn bảo quản	Bảo quản nơi khô ráo, thoáng mát, tránh va đập mạnh
Hướng dẫn sử dụng	Uống trực tiếp, ngon hơn khi uống lạnh. Không sử dụng khi lái xe', N'/Assets/client/images/bv8.jpg', NULL, CAST(20000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), NULL, 1000, 25, N'Việt Nam', NULL, CAST(N'2021-06-05 21:20:28.703' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (26, N'Cafe Trung Nguyên', N'A19', N'cafe-trung-nguyen', N'😍😍😍😍XIN CẢM ƠN QUÝ KHÁCH ĐÃ GHÉ THĂM GIAN HÀNG CỦA SHOP😍😍😍😍

[Thông tin chi tiết]

√√√Điểm nổi bật: với công nghệ rang & chế biến tại Buôn Mê Thuột. Duy nhất Trung Nguyên sở hữu công nghệ từ Châu Âu và bí quyết không thể sao chép.
√√√Thông tin sản phẩm: Cà phê hòa tan G7 3 trong 1 chiết xuất trực tiếp từ những hạt cà phê sạch, thuần khiết từ vùng đất đỏ bazan huyền thoại Buôn Ma Thuột kết hợp với công nghệ rang và trung tâm điều khiển tại Đức, Trung Nguyên đã tạo ra một loại cà phê hòa tan G7 thứ thiệt thơm lừng, tuyệt ngon, giúp bạn nhanh chóng tỉnh táo để tập trung làm việc. 
√√√Cà phê hòa tan G7 3 trong 1 mang đến sự tiện lợi cho người sử dụng, giúp những người thích cà phê đúng vị có được một ly cà phê như ý nhưng vẫn tiết kiệm được thời gian. 
√√√Hướng dẫn sử dụng Uống nóng: Hòa 1 gói cà phê với 75ml nước nóng và khuấy đều. Uống lạnh: Hòa 2 gói cà phê với 75ml nước nóng, khuấy đều và thêm đá. 
√√√Bảo quản Nơi khô ráo, thoáng mát. Tránh ánh nắng trực tiếp.
√√√Quy cách đóng gói: 816g (48+3gói x 16g)', N'/Assets/client/images/gu2.png', NULL, CAST(79000 AS Decimal(18, 0)), CAST(70000 AS Decimal(18, 0)), NULL, 1500, 25, N'Việt Nam', NULL, CAST(N'2021-06-05 21:21:53.470' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (27, N'Chảo chống dính', N'A20', N'chao-chong-dinh', N'[Xin chào các bạn đến với trang bán hàng của Nhasachngoncom.vn, sau đây là phần giới thiệu của sản phẩm chảo chiên thông dụng thuộc thương hiệu Tefal]

Series So Chef là series thiết kế đẹp nhất trong các dòng chảo chống dính của Tefal. Màu đỏ mận vừa làm không gian bếp sang trọng hơn lại không quá mạnh như đỏ đô. Sản phẩm nặng, cầm lên cho cảm giác chắc chắn, tin tưởng về chất lượng. Kệ đi mình Việt Nam ham đồ to nặng 😊

Chảo chiên lòng sâu chống dính đáy từ của Tefal là một sản phẩm có thiết kế đẹp, đáy thép không gỉ chắc chắn, đường kính 24cm, có cán dài, mặt đáy phẳng, cầm vừa tay, là sản phẩm chảo đa năng dùng để nấu nướng, chiên xào, phù hợp với tất cả gia đình nhỏ. Trong một quyển mẹo vặt nhà bếp người ta nói rằng nếu chỉ có thể đem 1 nồi, chảo đi theo người thì chắc chắn người ta sẽ chọn chảo lòng sâu bởi sự đa năng của nó.

Dòng So Chef của Tefal là dòng nồi chảo hợp kim nhôm phủ titanium – reinforce đảm bảo an toàn cho sức khỏe. Đặc biệt chảo thuộc dòng này còn có chấm đỏ Thermal-spot ở giữa, có chức năng cảm biến và thông báo nhiệt độ tối ưu cho khách hàng khi sử dụng sản phẩm. Hình mình họa team Dừa có giải thích, khi nhiệt độ sẵn sàng, phần viền đỏ bên ngoài sẽ chuyển sang đỏ trơn. *Lưu ý khẽ là chức năng này chỉ có ở chảo, không có ở nồi nhé các bạn. Nói chung nếu các bạn thấy vòng tròn đỏ tâm chữ T thì đó là chức năng Thermal spot.', N'/Assets/client/images/hh7.png', NULL, CAST(300000 AS Decimal(18, 0)), CAST(350000 AS Decimal(18, 0)), NULL, 5022, 9, N'Việt Nam', NULL, CAST(N'2021-06-05 21:21:59.107' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (28, N'Chảo trơn chống dính', N'A21', N'chao-tron-chong-dinh', N'Giới thiệu sản phẩm Chảo trơn chống dính sâu lòng 2 quai Kyofa công nghệ Hàn Quốc có nhiều size cho các bạn nội trợ thoải mái chọn gồm: từ 22-42cm, vào phân loại chọn size có giá kèm theo nhé
Chảo có phần men trong màu đen và bên ngoài sơn tĩnh điện nhiều màu đa số màu đỏ như hình, nhiều khi màu đỏ hết hàng thì shop giao qua màu khác nhé , các bạn yên tâm chất lượng như nhau nhé
 - Bên ngoài thân chảo chống dính sâu lòng 2 quai Kyofa được sơn bằng lớp chống cháy, chịu nhiệt cao, màu  sắc trang nhã, chịu được nhiệt độ  300C – 500 C, đặc biệt loại sơn này được sản xuất độc quyền của công ty Thái Bình Minh chuyên dùng cho xoong nồi chảo…
- Thân chảo được làm bằng kim loại nhôm cao cấp, lòng chảo thiết kế bầu, tiết kiệm dầu ăn, bên trong lòng chảo được phủ 2 lớp chống dính Teflon đạt tiêu chuẩn chất lượng hợp quy, chịu sự mài mòn tác động trong khi nấu ăn.
- chảo chống dính sâu lòng 2 quai Kyofa chịu được nhiệt cao, chống trầy xước, có khả năng phân tán và giữ nhiệt tốt, giúp thức ăn chín nhanh và đều khắp, tiết kiệm năng lượng khi nấu.
- chảo chống dính sâu lòng 2 quai Kyofa được làm bằng hợp kim nhôm nguyên chất siêu bền, chống trầy xước tốt cũng như có khả năng chịu được nhiệt độ cao.
- Chất liệu hợp kim cao cấp không sản sinh ra các hóa chất gây hại tác động đến thực phẩm, đảm bảo an toàn cho sức khỏe người sử dụng.
- Bên trong chảo được tráng 2 lớp chống dính Teflon siêu bền và an toàn cho sức khỏe.', N'/Assets/client/images/hh9.png', NULL, CAST(450000 AS Decimal(18, 0)), CAST(430000 AS Decimal(18, 0)), NULL, 300, 9, N'Việt Nam', NULL, CAST(N'2021-06-05 21:22:11.660' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (29, N'Tã trẻ em', N'A22', N'ta-tre-em', N'Tã Quần Giữ Dáng Pampers - Thoáng Mát - Chống Xệ & Không Vón Cục, cho bé yêu Tung Tăng Vận Động 
 Nghiên cứu khoa học đã chỉ ra rằng, trong giai đoạn bé tập đi, nếu bé mang tã xệ sẽ ảnh hưởng đến khả năng vận động và dáng đi của bé, khiến bé có thể đi hai hàng.
 
 1. Thông tin sản phẩm: 
 - Thấm hút và dàn đều chất lỏng, giúp giữ dáng, chống xệ và không vón cục nhờ công nghệ rãnh Gel độc đáo từ Nhật Bản. 
 - Thấm hút gấp 6 lần bé tè với lõi gel độc đáo
 - Khoá chặt chất lỏng gấp 30 lần, ngăn thấm ngược trở lại để mông con luôn khô thoáng
 - Đai hông chữ S, siêu co giãn & thoải mái
 - Bề mặt mềm mịn, nâng niu làn da mỏng manh của con
 - Vạch báo tiểu để dễ dàng biết thời điểm cần thay tã
 - Miếng dán cuốn tã tiện lợi, giúp gói gọn sau khi dùng và giữ vệ sinh.', N'/Assets/client/images/pc6.png', NULL, CAST(300000 AS Decimal(18, 0)), CAST(250000 AS Decimal(18, 0)), NULL, 323, 13, N'Philippin', NULL, CAST(N'2021-06-05 21:23:34.603' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (30, N'Giấy lau', N'A23', N'giay-lau', N'THÔNG TIN SẢN PHẨM:
-  Nguyên liệu: Sản xuất từ bột gỗ - không chất tẩy trắng
-  Quy cách đóng gói: Thùng 40 gói
-  Kích thước tờ giấy: 110x170mm
-  Gói màu xanh thỏ trắng,thiết kế vuông vắn hình hộp đầy đặn, xếp gọn dễ dàng
----------------------------------------
TÍNH NĂNG NỔI BẬT:
- Giấy dai, bền, đẹp, mà đặc biệt KHÔNG CHẤT TẨY TRẮNG.
- Một tờ 4 lớp-chống ẩm-chống rách-chịu lực ép cao. 
- Có độ dai tự nhiên
----------------------------------------
CAM KẾT :
- Shop cam kết sản phẩm đúng như quảng cáo , hàng chuẩn chất lượng cao!
- Shop chấp nhận đổi trả free cho hàng không đúng mẫu mã, mầu sắc hoặc hoàn tiền nếu là lỗi của shop!', N'/Assets/client/images/anh44.png', NULL, CAST(120000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)), NULL, 326, 13, N'Nhật Bản', NULL, CAST(N'2021-06-05 21:27:57.663' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (31, N'Xúc xích', N'A24', N'xuc-xich', N'cùng bắt tay vào làm cho gia đình những món ăn khoái khấu nhé thay vì sử dụng ruột non mọi người sử dụng vỏ collagen đảm bảo vệ sinh và sạch sẽ
Chúng tôi chuyên cung cấp vỏ xúc xích chất lượng . Vỏ xúc xích bằng collagen có thể ăn được, đảm bảo vệ sinh an toàn thực phẩm theo tiêu chuẩn thị trường Châu Âu, được ứng dụng để làm xúc xích tại gia. Vỏ xúc xích có đường kính phù hợp với kích cỡ xúc xích thông thường, tổng chiều dài khi kéo giãn là 15m.
LH: 085 39 38 309', N'/Assets/client/images/anh4.png', NULL, CAST(25000 AS Decimal(18, 0)), CAST(15000 AS Decimal(18, 0)), NULL, 123, 18, N'Đức', NULL, CAST(N'2021-06-05 21:27:59.123' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (32, N'Bánh bông lan', N'A25', N'banh-bong-lan', N' Bạn đang tìm bột làm bánh Flamington, bánh bông lan xốp thì bạn tìm đúng rồi đấy 
 
- Xuất xứ : Úc
- HSD : 1 năm

🍞🌰 Thành phần
- bột mì, sữa bột, đường, muối, chất tạo xốp, chất nhũ hóa, chất ổn định, màu tổng hợp

🥧 Tỉ lệ : 
- Bột bánh bông lan    : 1kg
- Trứng                         : 0.3 - 0.4 kg
- Nước                          : 0.35 lít', N'/Assets/client/images/anh9.png', NULL, CAST(55000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), NULL, 1235, 18, N'Hàn Quốc', NULL, CAST(N'2021-06-05 21:28:01.027' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (33, N'RedBull', N'A26', N'redbull', N'Nước tăng lực Redbull là một loại thức uống phổ biến và quen thuộc với nhiều người không chỉ tại Việt Nam mà còn ở nhiều khu vực châu Á.
- Nước tăng lực Red bull công nghệ Thái được sản xuất trực tiếp tại Việt Nam với tên gọi gốc là Krating Daeng.
- Red Bull giúp phấn chấn và tỉnh táo sau những giờ làm việc căng thẳng, mệt mỏi nhờ có một tỷ lệ nhất định taurine, đường, nước,...
- Sản phẩm có hương vị thơm ngon, dễ uống và được đóng lon nhỏ gọn nên rất thích hợp mang theo bên mình mọi lúc mọi nơi, từ phòng tập thể thao đến trường lớp, cơ quan hay trong những chuyến du lịch,...
- Quy cách thùng: 24 lon × 250ml
- Sản phẩm sản xuất tại Việt Nam và nhập trực tiếp  không qua trung gian
- Xuất xứ: Thái Lan', N'/Assets/client/images/anh19.png', NULL, CAST(60000 AS Decimal(18, 0)), CAST(55000 AS Decimal(18, 0)), NULL, 1236, 25, N'Việt Nam', NULL, CAST(N'2021-06-05 21:28:02.303' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (34, N'Mirinda', N'A27', N'mirinda', N'Nước giải khát có gas Mirinda vị Cam lon 330ml với nguồn nguyên liệu được sản xuất theo dây chuyền công nghệ hiện đại dưới quy trình kiểm định nghiêm ngặt, đảm bảo an toàn khi sử dụng. Sản phẩm cho cảm giác thanh mát với vị soda kem mang đến cho bạn cảm giác mát lạnh, sảng khoái khi thưởng thức.
Nước giải khát có gas Mirinda vị Cam được đóng lon có nắp bật tiện lợi trong việc sử dụng và bảo quản, có thể mang theo khi đi dã ngoại, chơi thể thao... Sản phẩm do Vinmart phân phối luôn mang đến chất lượng tốt cho người tiêu dùng', N'/Assets/client/images/anh12.png', NULL, CAST(15000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), NULL, 2133, 25, N'Thái Lan', NULL, CAST(N'2021-06-05 21:51:48.967' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (35, N'Cá ngừ đóng hộp', N'A28', N'ca-ngu-dong-hop', N'Cá biển tươi ngon thấm đẫm nước sốt cà chua đậm đà trong lon kim loại có khoá tiện lợi. Hoàn toàn KHÔNG có hoá chất bảo quản.

Sản phẩm được sản xuất từ nguyên liệu cá nục / cá trích / cá mòi / cá ngừ và cà chua trái được đánh bắt và canh tác tại Việt Nam, cùng các thành phần nguyên liệu phụ đã được Bộ Y Tế cấp phép. Quy trình sản xuất sản phẩm này được chứng nhận các tiêu chuẩn chất lượng HACCP và ISO 9001. 

Thành phần: Cá (55%), nước, cà chua cô đặc (5%), đường, muối, chất điều vị, chất làm dày, chiết xuất ớt. Không có chất bảo quản.
Hạn sử dụng 3 năm kể từ ngày sản xuất.

Quy trình sản xuất: Cá biển tươi được sơ chế, làm sạch > Hấp chín và loại bỏ bớt nước > Cân trọng lượng sắp vô lon kim loại > Rót nước sốt cà chua đã được nấu sôi > Ghép nắp kín > Tiệt trùng với nhiệt độ và áp suất cao > Theo dõi chất lượng > Đóng thùng thành phẩm.', N'/Assets/client/images/anh26.png', NULL, CAST(45000 AS Decimal(18, 0)), CAST(35000 AS Decimal(18, 0)), NULL, 123, 18, N'Lào', NULL, CAST(N'2021-06-05 21:51:50.650' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (36, N'Nồi chống dính', N'A29', N'noi-chong-dinh', N'Nồi chống dính thân cao Tefal Day By Day G1436105 dùng cho mọi loại bếp kể cả bếp bếp từ, phủ chống dính mặt trong và mặt ngoài dễ lau chùi vệ sinh, tay cầm chống nóng cùng nắp thủy tinh trong suốt

* Thông số kỹ thuật nồi thân cao Tefal Day By Day G1436105 
- Mã sản phẩm: G1436105
- Thương hiệu: Tefal
- Xuất xứ: Pháp
- Loại nồi: Nồi thân cao
- Tay cầm: Tay cầm nhựa cách nhiệt
- Nắp nồi : Nắp kính trong suốt
- Chất liệu: Hợp kim nhôm phủ titanium, nắp kính, tay nhựa cách nhiệt
- Kích thước: Ø22cm x cao 12.5cm (dài cả 2 quai 36cm)
- Trọng lượng: 1,4kg', N'/Assets/client/images/hh2.png', NULL, CAST(750000 AS Decimal(18, 0)), CAST(700000 AS Decimal(18, 0)), NULL, 52, 9, N'Việt Nam', NULL, CAST(N'2021-06-05 21:51:52.133' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (37, N'Bánh mì tươi', N'A30', N'banh-mi-tuoi', N'Năng lượng 412kcal/100g
Thành phần Bột mì, dầu cọ tinh luyện, nước, đường, phô mai (8.16%), chà bông (2.46%), trứng, men, bơ dầu thay thế, muối, sữa bột, calci carbonat, chanh tươi, bột trứng, chất bảo quản, enzym, chất nhũ hoá, chất điều vị, chất nhũ hoá, chất điều chỉnh độ acid, chất xử lý bột
Cách sử dụng Dùng ăn trực tiếp
Bảo quản Lưu trữ ở nơi khô ráo và mát mẻ
Lưu ý Thành phần có chứa bột mì, trứng, sữa, lecithin
Thương hiệu Staff (Việt Nam)
Nơi sản xuất Việt Nam', N'/Assets/client/images/anh6.png', NULL, CAST(15000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), NULL, 134, 18, N'Việt Nam', NULL, CAST(N'2021-06-05 21:56:35.603' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (38, N'Bánh tiêu', N'A31', N'banh-tieu', N'Bánh bò đường thốt nốt nướng – bánh của người Việt Nam mình, bánh ngọt nhẹ và béo thơm nước cốt dừa, hay thanh mát với đường thốt nốt hảo hạng – chiếc bánh dành cho mọi thành viên trong gia đình bạn!

Một combo làm bánh hoàn chỉnh sẽ cung cấp cho bạn đầy đủ các nguyên liệu và dụng cụ cần thiết bên cạnh các nguyên liệu và dụng cụ quen thuộc mà dường như nhà nào cũng có.', N'/Assets/client/images/anh10.png', NULL, CAST(25000 AS Decimal(18, 0)), CAST(15000 AS Decimal(18, 0)), NULL, 32, 18, N'Việt Nam', NULL, CAST(N'2021-06-05 21:56:39.143' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (39, N'Bánh cua', N'A32', N'banh-cua', N'Vì NSX tạo hình miếng bánh ra con cua nên bánh được gọi là BÁNH CUA. 
Nhưng mà ăn thì nó cũng có xíu xíu mùi thơm của cua đó các bạn.
KHUYẾT ĐIỂM : Con Cua không có mắt, mũi. miệng
ƯU ĐIỂM: nêm nếm đậm đà, ăn vừa miệng, cắn giòn rôm rốp, âm thanh chân thực không cần lồng tiếng.

- TỤI MÌNH  cam kết nhập hàng mới để giao cho khách. 
Khách cần thêm thông tin cứ inbox cho TỤI MÌNH nha! 

- Chúc khách sau khi mua hàng sẽ có người yêu. Khách nào có người yêu,  có gia đình rồi thì sẽ luôn vui vẻ, hạnh phúc nhé! ', N'/Assets/client/images/anh1.png', NULL, CAST(10000 AS Decimal(18, 0)), CAST(8000 AS Decimal(18, 0)), NULL, 125, 18, N'Lào', NULL, CAST(N'2021-06-05 21:56:40.423' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (40, N'Mỳ chính', N'A33', N'my-chinh', N'KYOTOSHO siêu thị hàng nhật miền trung
MÔ TẢ SẢN PHẨM
Mỳ chính Nhật - với chiết xuất Glutamate mỗi ngày và là sự lựa chọn thông minh của các bà nội trợ đảm đang. Nhật Bản được xếp vào quốc gia có tuổi thọ trung bình cao nhất thế giới và những đứa trẻ Nhật Bản vẫn luôn khiến cả thế giới ngưỡng mộ vì sự thông minh và khoẻ mạnh của chúng.
Đặc biệt khi sử dụng mỳ chính Nhật rùi các mẹ sẽ nghiện luôn nhé vì vị ngọt thanh rất tự nhiên làm món ăn của các mẹ sẽ trở nên hấp dẫn hơn bao giờ hết. 
- Hãng sản xuất: Ajnomoto
- Xuất xứ: hàng nội địa Nhật Bản
- Quy cách đóng gói: túi 1kg', N'/Assets/client/images/anh30.png', NULL, CAST(48000 AS Decimal(18, 0)), CAST(42000 AS Decimal(18, 0)), NULL, 3443, 9, N'Mỹ', NULL, CAST(N'2021-06-05 21:56:41.713' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (41, N'Bột canh', N'A34', N'bot-canh', N'Thông tin chi tiết về sản phẩm bột canh hải châu
Thành phần: Muối I ốt, đường trắng, chất điều vị (môn natri glutamat), bột tiêu, bột tỏi, chất điều vị(Dinatri 5''- Isonat và dinatri 5'' Guanylat) 
Chú ý:do trọng lượng của sp khá nặng nên shop chỉ bán tối đa 50 gói thôi ạ', N'/Assets/client/images/anh36.png', NULL, CAST(36000 AS Decimal(18, 0)), CAST(25000 AS Decimal(18, 0)), NULL, 234, 9, N'Hàn Quốc', NULL, CAST(N'2021-06-05 21:56:43.820' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (42, N'Nước lọc đóng thùng', N'A35', N'nuoc-loc-dong-thung', N'nước lọc th nửa thùng nước lọc th nửa thùng nước lọc th nửa thùng nước lọc th nửa thùng nước lọc th nửa thùng', N'/Assets/client/images/pf8.png', NULL, CAST(84000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), NULL, 4324, 25, N'Đức', NULL, CAST(N'2021-06-05 21:56:45.893' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (43, N'Thức ăn cho chó', N'A36', N'thuc-an-cho-cho', N'✅ Những lý do khiến bạn nên mua sản phẩm bánh thưởng này: 
- Thịt được chế biến thơm ngon, đảm bảo chất dinh dưỡng cho cún.
- Thưởng cho cún khi cún ngoãn ngoãn hoặc cho ăn vặt.
- Hỗ trợ cho việc huấn luyện chó và nâng cao khả năng học hỏi của chó.
- Có hàm lượng chất béo, muối và calo thấp trong khi hàm lượng protein cao, hỗ trợ hệ tiêu hóa và khả năng hấp thụ dưỡng chất.
- Được chế biến đáp ứng các quy định về vệ sinh an toàn thực phẩm và nguyên liệu hoàn toàn tự nhiên', N'/Assets/client/images/anh25.png', NULL, CAST(75000 AS Decimal(18, 0)), CAST(62000 AS Decimal(18, 0)), NULL, 123, 6, N'Mỹ', NULL, CAST(N'2021-06-05 22:40:00.230' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (44, N'Đồ chơi trẻ em', N'A37', N'do-choi-tre-em', N'NULL
🔰Thông tin chi tiết:
Đồ chơi phát triển trí tuệ: Các combo được chia linh hoạt cho các mom lựa chọn cho bé nhé
- Chất liệu : Gỗ tự nhiên
- Hàng chất lượng cao Trung Quốc
- Các sản phẩm đồ chơi gỗ phân chia linh hoạt theo các combo như: 

⚜️ Combo 2A - 2 món:  Con sâu gỗ và Cầu vồng nhỏ
⚜️ Combo 3.A - 3 món: Tàu chở khối, cầu vồng nhỏ, thả khối 4 trụ
⚜️ Combo 3.B - 3 món: Tàu chở khối, tàu chở số, đồng hồ thỏ
⚜️ Combo 3.C - 3 món: Tày chở khối, xe luồn hạt, bộ xây dựng 5 trụ
⚜️ Combo 3.D - 3 món: Thả khối 4 trụ, Tàu chở khối, bộ xây dựng 4 trụ
⚜️ Combo 3.E - 3 món: Tàu chở khối, tàu chở số, cầu vồng nhỏ
⚜️ Combo 3.F - 3 món: bộ Puzzle 6 hình size to, Đồng hồ hoạt hình, băng trượt ziczac 3 tầng
⚜️ Combo 4.A - 4 món: Đàn gỗ 8 thanh, luồn hạt mini, con sâu gỗ, thả khối 4 trụ
⚜️ Combo 4.B - 4 món: Thả khối 4 trụ, con sâu gỗ, bộ đập chuột hình thỏ, cầu vồng gỗ
⚜️ Combo 4.C - 4 món: Đàn gỗ 8 thanh, con sâu gỗ, luồn hạt mini, cầu vồng gỗ 
⚜️ Combo 4.F - 4 món: Đàn gỗ 8 thanh, đồng hồ hoạt hình, bộ Puzzle 6 hình size to, Ghép Hình Montessori Fun Bo', N'/Assets/client/images/pc2.png', NULL, CAST(125000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), NULL, 333, 13, N'Việt Nam', NULL, CAST(N'2021-06-05 22:40:03.737' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (45, N'Bàn chải vệ sinh', N'A38', N'ban-chai-ve-sinh', N'Thông tin chi tiết sản phẩm:
  
  Chào mừng bạn đến với Cửa hàng thương hiệu Oenen, cửa hàng hàng đầu tại nhà theo phong cách Bắc Âu.
  Các sản phẩm của chúng tôi đều đang có hàng trong kho.
  Chúng tôi chỉ bán những sản phẩm chất lượng cao nhất, chúng tôi có thương hiệu sản phẩm của riêng mình.
  Cuối cùng, nếu bạn có bất kỳ câu hỏi nào, xin vui lòng trò chuyện với chúng tôi!
  
  Tên sản phẩm: Bàn chải vệ sinh lông TPR mềm 
  Trọng lượng: 276g
  Chất liệu: ABS + TPR + PP
  Thiết kế sản phẩm tùy chọn: Loại để sàn nhà, loại treo tường
  Màu sắc: Xám, Đen', N'/Assets/client/images/pc3.png', NULL, CAST(230000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), NULL, 333, 9, N'Việt Nam', NULL, CAST(N'2021-06-05 22:40:04.977' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (46, N'Màu vẽ', N'A39', N'mau-ve', N'+ màu sắc nét ( shop có đầy đủ các loại màu thuộc nhiều mã khác nhau) cho quý khách lựa chọn
+bút có 2 đầu vừa có thể vẽ hoặc viết rất tiện lợi (xem chi tiết trên hình ảnh sản phẩm)
+màu tốt và cực an toàn cho bé 
+thuộc dòng sản phẩm chất lượng cao
+ đảm bảo giao hàng dùng tốt,được đổi trả nếu quý khách nhận ko đúng hàng hay hàng ko đúng chất lượng.
+sản phẩm luôn có sẵn tại kho hà nội
# bút màu
# bút màu nước
#bút dạ
#bút đánh dấu
#bút vẽ
#bút lông
#bút viết 2 đầu
#bút viết hai đầu', N'/Assets/client/images/pc7.png', NULL, CAST(15000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), NULL, 222, 13, N'Hàn Quốc', NULL, CAST(N'2021-06-05 22:40:06.303' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (47, N'Bột súp canh cua', N'A40', N'bot-sup-canh-cua', N'Bột súp lơ bông cải xanh sản xuất từ 100% súp lơ tươi, không phụ gia và chất  bảo quản. Đây thực sự là một sản phẩm an toàn, đáp ứng đầy đủ yêu cầu dinh dưỡng như rau súp lơ (bông cải xanh) tự nhiên.
Súp lơ là loại rau củ giàu dinh dưỡng. Nó là nguồn phong phú của nhiều vitamin, khoáng chất và chất xơ. Bột súp lơ bông cải xanh chính là nguồn cung đầy đủ dinh dưỡng khi mà 1 muỗng bột súp lơ (3gr) tương đương với 2 chén súp lơ tươi (50gr).

- Súp lơ chứa nhiều chất chống oxy hóa mạnh có thể hỗ trợ các tế bào và mô khỏe mạnh trên khắp cơ thể

- Súp lơ giúp làm giảm lượng đường trong máu và cải thiện, kiểm soát bệnh tiểu đường

- Nhiều chất dinh dưỡng trong súp lơ - bao gồm canxi, vitamin K và phốt pho - là cần thiết để duy trì xương khỏe mạnh.

- Thành phần: 100% súp lơ. Không phụ gia, chất bảo quản.

- Công dụng: Làm đồ uống, nấu ăn, salad, nước sốt và các món tráng miệng

- Bảo quản: Giữ kín bao gói sau khi mở. Bảo quản nơi khô ráo, thoáng mát tránh xa ánh sáng trực tiếp', N'/Assets/client/images/anh28.png', NULL, CAST(45000 AS Decimal(18, 0)), CAST(35000 AS Decimal(18, 0)), NULL, 222, 9, N'Lào', NULL, CAST(N'2021-06-05 22:40:07.470' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (48, N'Mứt cam', N'A41', N'mut-cam', N'▶ ƯU ĐIỂM:
- Mứt táo kết hợp cùng với hương thơm tự nhiên từ quế, giúp hương vị trở nên độc đáo hơn, thành phần tự nhiên, không chất bảo quản, đựng trong lọ thủy tinh trong an toàn thực phẩm, tiện lợi, dễ sử dụng và dễ bảo quản.
- Nhập khẩu trực tiếp từ Nhật Bản.

▶ HƯỚNG DẪN SỬ DỤNG:
Có thể sử dụng để ăn với bánh mì cho bữa sáng, bánh kem, hoặc trộn với sữa chua, pha với trà làm nước giải khát... 
▶ CÔNG DỤNG:
- Ăn với bánh mì cho bữa sáng, bánh kem, hoặc trộn với sữa chua
- Pha với trà làm nước giải khát...
▶ THÀNH PHẦN :
Táo, đường, quế, tinh chất cam, axitulant, chất bảo quản (axit sorbic K)
Không chất bảo quản, không phẩm màu', N'/Assets/client/images/gu5.png', NULL, CAST(250000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), NULL, 323, 18, N'Nga', NULL, CAST(N'2021-06-05 22:40:08.600' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (49, N'Kẹo cam', N'A42', N'keo-cam', N'🤪 TRỞ VỀ TUỔI THƠ VỚI KẸO C TRÁI TIM THÁI LAN
❤❤❤ Kẹo C Trái Tim Thái Lan - hàng có sẵn nhé❤❤❤

Thêm 1 siêu phẩm gắn liền vs tuổi thơ thế hệ 8x 9x ạ :)) đến vs e là khách tha hồ xin vé trở lại tuổi thơ nhé =))

♂🙆 Còn ai nhớ cả 1 trời tuổi thơ với Kẹo C Trái Tim Thái Lan này ko ạ?
😂 Tan trường ra là chạy ngay lại sạp bánh mua 2 3 hộp về ăn dần.

🍊 Kẹo C Trái Tim Thái Lan với viên kẹo vị cam chua chua ngọt ngọt, tiện bổ sung Vitamin C cho cơ thể luôn 😆

 Viên kẹo hình trái tim ♥️ siêu dễ thương tạo cảm giác thích thú
Kẹo C Trái Tim Thái Lan thích hợp cho các thánh ăn vặt, mê hàng Thái Lan, các buổi tiệc sinh nhật, picnic hoặc nhâm nhi cùng bạn bè khi xem phim, hoạt hình,....
Hạn sử dụng 6 tháng kể từ ngày sản xuất', N'/Assets/client/images/gu4.png', NULL, CAST(12000 AS Decimal(18, 0)), CAST(8000 AS Decimal(18, 0)), NULL, 111, 6, N'Thái Lan', NULL, CAST(N'2021-06-05 23:26:44.090' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (50, N'Thức ăn cho mèo', N'A43', N'thuc-an-cho-meo', N'Thức ăn hạt khô cho mèo Catsrang nhập khẩu Hàn Quốc - túi 5kg
- Thức ăn hạt dành cho mèo mọi lứa tuổi
- Xuất xứ: Nhập khẩu trực tiếp từ Hàn Quốc
-Hạn sử dụng: 2 năm kể từ ngày sản xuất

Với đặc tính dễ tiêu, Catsrang giúp mèo đi phân rắn và giảm mùi hôi khó chịu.
Với hàm lượng dinh dưỡng cân bằng, Catsrang thích hợp trong việc cải thiện da, lông và phòng tránh bệnh quáng gà ở mèo.
Không sử dụng chất kháng sinh, chất bảo quản, phẩm màu, và hương liệu nhân tạo
Sử dụng protein cao cấp rất tốt cho tiêu hoá
Trong thành phần còn chứa taurine, vitamin và các chất dinh dưỡng cần thiết khác
Hoàn toàn không sử dụng chất tạo màu, tạo mùi và chống mốc
Thức ăn hạt khô cho mèo Catsrang nhập khẩu Hàn Quốc - túi 5kg', N'/Assets/client/images/gu3.png', NULL, CAST(235000 AS Decimal(18, 0)), CAST(153000 AS Decimal(18, 0)), NULL, 111, 6, N'Mỹ', NULL, CAST(N'2021-06-05 23:26:50.497' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (51, N'Bánh Nice', N'A44', N'banh-nice', N'BÁNH CHẢ DỪA MINH THÀNH - GÓI 20 MIẾNG

️🎯 Bánh chả dừa thơm ngon hào quyện cùng vị dừa ngọt thanh, giòn tan chắc chắn sẽ là một sự lựa chọn tuyệt vời để nhâm nhi cùng gia đình và bạn bè vào mỗi buổi dã ngoại hoặc rảnh rỗi cùng gia đình và bạn bè.

️🎯 Bánh giao tới khách hàng luôn là DATE MỚI NHẤT.

️🎯 THÔNG TIN SẢN PHẨM
   - Xuất xứ: Việt Nam
   - HSD: 6 tháng kể từ NSX in  trên bao bì
   - Bảo quản nơi khô ráo,thoáng mát', N'/Assets/client/images/gu8.png', NULL, CAST(16000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), NULL, 321, 6, N'Nga', NULL, CAST(N'2021-06-05 23:26:52.313' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Code], [SeoTitle], [Description], [Image], [MoreImage], [Price], [PromotionPrice], [SaveImage], [Quantity], [CategoryID], [Origin], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [TopHot], [ViewCount]) VALUES (52, N'Bánh đậu xanh', N'A45', N'banh-dau-xanh', N'BÁNH ĐẬU XANH TRÀ XANH
🔥 RỒNG VÀNG HOÀNG GIA - CHẤT LƯỢNG TẠO DỰNG THƯƠNG HIỆU 🔥
♻️ Rồng Vàng Hoàng Gia phát triển dựa trên cơ sở cha truyền con nối tạo dựng thương hiệu trên 30 năm với phương thức sản xuất #TIÊN_TIẾN - #HIỆN_ĐẠI #Hoàng_Gia đảm bảo đem những sản phẩm chất lượng nhất tới người dùng 💕
♻️ Để có được những chiếc bánh đậu xanh thơm ngon hấp dẫn, những nghệ nhân của HOÀNG GIA đã phải sử dụng những nguyên liệu thuần khiết: Đậu xanh, đường kính trắng và dầu ăn thực vật tinh luyện 👍
✔️ Hạt đậu xanh phải có lòng vàng, hạt đều và chín già
✔️ Đảm bảo vệ sinh an toàn thực phẩm
💥 Ngoài bánh đậu xanh truyền thống chúng tôi còn cho ra mắt hàng loạt các siêu phẩm MỚI - NGON - LẠ ❗️
⭐️ Bánh Đậu Trà Xanh Rồng Vàng Hoàng Gia 
⭐️ Bánh Đậu Sầu Riêng Rồng Vàng Hoàng Gia 
⭐️ Bánh Đậu trái cây Rồng Vàng Hoàng Gia 
⭐️ Bánh Đậu Xanh Khoai môn Rồng Vàng Hoàng Gia 
⭐️ Bánh Đậu Xanh Dừa Xiêm Rồng Vàng Hoàng Gia 
⭐️ Bánh Đậu Xanh Hạt Sen Rồng Vàng Hoàng Gia 
⭐️ Bánh Đậu Xanh Cốm Rồng Vàng Hoàng Gia ', N'/Assets/client/images/anh11.png', NULL, CAST(23500 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)), NULL, 111, 6, N'Việt Nam', NULL, CAST(N'2021-06-06 16:43:03.937' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (1, N'Của hàng tạp hoá', N'cua-hang-tap-hoa', 1, 0, NULL, CAST(N'2021-06-02 21:29:10.990' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (2, N'Đồ dùng gia đình', N'do-dung-gia-dinh', 2, 0, NULL, CAST(N'2021-06-02 21:29:32.503' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (3, N'Đồ dùng cá nhân', N'do-dung-ca-nhan', 3, 0, NULL, CAST(N'2021-06-02 21:29:43.213' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (4, N'Thực phẩm đóng gói', N'thuc-pham-dong-goi', 4, 0, NULL, CAST(N'2021-06-02 21:30:02.410' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (5, N'Đồ uống', N'do-uong', 5, 0, NULL, CAST(N'2021-06-02 21:30:10.513' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (6, N'Sản phẩm đặc biệt', N'san-pham-dac-biet', 23, 0, NULL, CAST(N'2021-06-02 21:30:33.410' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (7, N'Trái cây khô', N'trai-cay-kho', 6, 0, NULL, CAST(N'2021-06-02 21:30:48.083' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (8, N'Thực phẩm đóng gói', N'thuc-pham-dong-goi', 7, 0, NULL, CAST(N'2021-06-02 21:31:03.437' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (9, N'Sữa', N'sua', 8, 0, NULL, CAST(N'2021-06-02 21:31:11.213' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (10, N'Dụng cụ nấu ăn', N'dung-cu-nau-an', 9, 0, NULL, CAST(N'2021-06-02 21:31:21.697' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (11, N'Dụng cụ lau nhà', N'dung-cu-lau-nha', 10, 0, NULL, CAST(N'2021-06-02 21:31:35.097' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (12, N'Dụng cụ đựng đồ ăn', N'dung-cu-dung-do-an', 11, 0, NULL, CAST(N'2021-06-02 21:31:48.733' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (13, N'Gia vị', N'gia-vi', 12, 0, NULL, CAST(N'2021-06-02 21:32:00.077' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (14, N'Xà phòng trẻ em', N'xa-phong-tre-em', 13, 0, NULL, CAST(N'2021-06-02 21:32:13.827' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (15, N'Phụ kiện chăm sóc trẻ em', N'phu-kien-cham-soc-tre-em', 14, 0, NULL, CAST(N'2021-06-02 21:32:36.917' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (16, N'Kem dưỡng gia dành cho trẻ em', N'kem-duong-gia-danh-cho-tre-em', 15, 0, NULL, CAST(N'2021-06-02 21:33:02.660' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (17, N'Bột trẻ em', N'bot-tre-em', 16, 0, NULL, CAST(N'2021-06-02 21:33:22.880' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (18, N'Tã & khăn lau', N'ta-&-kha-lau', 17, 0, NULL, CAST(N'2021-06-02 21:33:32.833' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (19, N'Mỳ ăn liền', N'my--an-lien', 18, 0, NULL, CAST(N'2021-06-02 21:33:46.790' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (20, N'Mứt', N'mut', 19, 0, NULL, CAST(N'2021-06-02 21:33:52.127' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (21, N'Bánh', N'banh', 20, 0, NULL, CAST(N'2021-06-02 21:33:56.463' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (22, N'Ngũ cốc ăn sáng', N'ngu-coc-an-sang', 21, 0, NULL, CAST(N'2021-06-02 21:34:10.193' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (23, N'Đồ ăn đóng hộp', N'do-an-dong-hop', 22, 0, NULL, CAST(N'2021-06-02 21:34:20.750' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (24, N'Rau & củ', N'rau-&-cu', 24, 0, NULL, CAST(N'2021-06-02 21:34:34.420' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (25, N'Nước giải khát', N'nuoc-giai-khat', 25, 0, NULL, CAST(N'2021-06-02 21:34:42.923' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [ProductCategoryName], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ShowOnHome]) VALUES (26, N'Cafe', N'cafe', 26, 0, NULL, CAST(N'2021-06-02 21:34:49.003' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (N'ADD_CONTENT', N'Thêm tin tức')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (N'ADD_USER', N'Thêm user')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (N'DELETE_USER', N'Xoá user')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (N'EDIT_CONTENT', N'Sửa tin tức')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (N'EDIT_USER', N'Sửa user')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (N'VIEW_USER', N'Xem danh sách')
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([SlideID], [Image], [DisplayOrder], [Link], [ParentID], [Description], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'/Assets/client/images/11.jpg', 1, NULL, NULL, N'Mua các sản phẩm chất lượng từ cửa hàng của chúng tôi', CAST(N'2021-04-11 13:09:54.050' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([SlideID], [Image], [DisplayOrder], [Link], [ParentID], [Description], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, N'/Assets/client/images/22.jpg', 2, NULL, NULL, N'Toàn bộ các sản phẩm đều được cung cấp từ các nhà sản xuất rõ nguồn gốc', CAST(N'2021-04-11 13:11:00.593' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([SlideID], [Image], [DisplayOrder], [Link], [ParentID], [Description], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, N'/Assets/client/images/44.jpg', 3, NULL, NULL, N'Hãy đến và lựa chọn những sản phẩm phù hợp với quý vị!', CAST(N'2021-04-11 13:13:29.060' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([SlideID], [Image], [DisplayOrder], [Link], [ParentID], [Description], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (8, N'/Assets/client/images/p2.jpg', 1, NULL, 2, NULL, CAST(N'2021-05-10 00:49:58.717' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([SlideID], [Image], [DisplayOrder], [Link], [ParentID], [Description], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (9, N'/Assets/client/images/p3.jpg', 1, NULL, 2, NULL, CAST(N'2021-05-10 00:50:21.437' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([SlideID], [Image], [DisplayOrder], [Link], [ParentID], [Description], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (10, N'/Assets/client/images/p4.jpg', 1, NULL, 2, NULL, CAST(N'2021-05-10 00:50:32.460' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([SlideID], [Image], [DisplayOrder], [Link], [ParentID], [Description], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (11, N'/Assets/client/images/111.jpg', 1, NULL, 3, NULL, CAST(N'2021-05-10 01:23:59.077' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Slide] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [Password], [UserGroupID], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ResetPassword]) VALUES (1, N'admin', N'827ccb0eea8a706c4c34a16891f84e7b', N'ADMIN', N'Admin', NULL, N'nguyenviettoan05@gmail.com', N'1266', CAST(N'2021-04-08 22:52:36.463' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [UserGroupID], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ResetPassword]) VALUES (16, N'toan23', N'25f9e794323b453885f5181f1b624d0b', N'MEMBER', N'Nguyễn Viết Toàn', N'Vinh', N'vu23@gmail.com', N'234324324', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [UserGroupID], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ResetPassword]) VALUES (17, N'cece', N'34e41cd9616e91ca7e132e21dea5cf08', N'MOD', N'Trần thị huyền', N'Vinh', N'nguyenviettoan05@gmail.com', N'2141414', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [UserGroupID], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ResetPassword]) VALUES (18, N'tam923', N'ef260c7fcceaba50ebc42cac6a57b1ce', N'MEMBER', N'Tâm', N'Vinh', N'nguyenthitam@gmail.com', N'023223', CAST(N'2021-05-04 22:30:41.640' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [UserGroupID], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ResetPassword]) VALUES (19, N'dungaka', N'5c0b6e99eb20f8000e5b186159f1466f', N'MEMBER              ', N'Dung Nguyễn', N'Vĩnh Phúc', N'thuc3849@gmail.com', N'03256', CAST(N'2021-05-04 22:46:22.013' AS DateTime), NULL, NULL, NULL, 1, N'')
INSERT [dbo].[User] ([UserID], [UserName], [Password], [UserGroupID], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ResetPassword]) VALUES (20, N'van324', N'a591af89e9d9169830a41488891526c5', N'MEMBER', N'lê thị vân', N'vinh Phúc', N'van@gmail.com', N'035355', CAST(N'2021-05-05 20:59:20.593' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [UserGroupID], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ResetPassword]) VALUES (21, N'lam234', N'13521a6a4031c927a060d7230cd8b5f8', N'MEMBER', N'trần văn lâm', N'vinh Phúc', N'lam234324@gmail.com', N'03859565', CAST(N'2021-05-05 21:03:23.757' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [UserGroupID], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ResetPassword]) VALUES (22, N'nguyenviettoan05@gmail.com', NULL, N'MEMBER', N'ToànNguyễn', NULL, N'nguyenviettoan05@gmail.com', NULL, CAST(N'2021-05-05 23:06:59.670' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [UserName], [Password], [UserGroupID], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ResetPassword]) VALUES (23, N'dung12', N'120ad090b9881b555b7e0e8de92001bd', N'MEMBER', N'dung12345', N'Huế', N'dung@gmail.com', N'013252', NULL, NULL, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[UserGroup] ([UserGroupID], [UserGroupName]) VALUES (N'Admin               ', N'Quản trị')
INSERT [dbo].[UserGroup] ([UserGroupID], [UserGroupName]) VALUES (N'MEMBER              ', N'Thành viên')
INSERT [dbo].[UserGroup] ([UserGroupID], [UserGroupName]) VALUES (N'MOD                 ', N'Quản lý')
