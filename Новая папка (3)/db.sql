USE [master]
GO
/****** Object:  Database [masterFloor]    Script Date: 27.05.2025 14:58:21 ******/
CREATE DATABASE [masterFloor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'masterFloor', FILENAME = N'D:\SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\masterFloor.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'masterFloor_log', FILENAME = N'D:\SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\masterFloor_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [masterFloor] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [masterFloor].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [masterFloor] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [masterFloor] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [masterFloor] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [masterFloor] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [masterFloor] SET ARITHABORT OFF 
GO
ALTER DATABASE [masterFloor] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [masterFloor] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [masterFloor] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [masterFloor] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [masterFloor] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [masterFloor] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [masterFloor] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [masterFloor] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [masterFloor] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [masterFloor] SET  DISABLE_BROKER 
GO
ALTER DATABASE [masterFloor] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [masterFloor] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [masterFloor] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [masterFloor] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [masterFloor] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [masterFloor] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [masterFloor] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [masterFloor] SET RECOVERY FULL 
GO
ALTER DATABASE [masterFloor] SET  MULTI_USER 
GO
ALTER DATABASE [masterFloor] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [masterFloor] SET DB_CHAINING OFF 
GO
ALTER DATABASE [masterFloor] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [masterFloor] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [masterFloor] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [masterFloor] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'masterFloor', N'ON'
GO
ALTER DATABASE [masterFloor] SET QUERY_STORE = ON
GO
ALTER DATABASE [masterFloor] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [masterFloor]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 27.05.2025 14:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostNumber] [nvarchar](50) NOT NULL,
	[RegionName] [nvarchar](50) NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
	[StreetName] [nvarchar](50) NOT NULL,
	[HomeNumber] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerProduct]    Script Date: 27.05.2025 14:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductArticle] [varchar](7) NOT NULL,
	[PartnerId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[SellDate] [date] NOT NULL,
 CONSTRAINT [PK_PartnerProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 27.05.2025 14:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PartnerTypeId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DirectorId] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[AddressId] [int] NOT NULL,
	[INN] [nvarchar](11) NOT NULL,
	[Rating] [int] NOT NULL,
 CONSTRAINT [PK_Partners] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerType]    Script Date: 27.05.2025 14:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PartnerType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 27.05.2025 14:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 27.05.2025 14:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductTypeId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ArticleNumber] [varchar](7) NOT NULL,
	[MinimumCoast] [float] NOT NULL,
 CONSTRAINT [PK_Product_1] PRIMARY KEY CLUSTERED 
(
	[ArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 27.05.2025 14:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Coefficient] [float] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 27.05.2025 14:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 27.05.2025 14:58:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Id], [PostNumber], [RegionName], [CityName], [StreetName], [HomeNumber]) VALUES (1, N'652050', N' Кемеровская область', N' город Юрга', N' ул. Лесная', 15)
INSERT [dbo].[Address] ([Id], [PostNumber], [RegionName], [CityName], [StreetName], [HomeNumber]) VALUES (2, N'164500', N' Архангельская область', N' город Северодвинск', N' ул. Строителей', 18)
INSERT [dbo].[Address] ([Id], [PostNumber], [RegionName], [CityName], [StreetName], [HomeNumber]) VALUES (3, N'188910', N' Ленинградская область', N' город Приморск', N' ул. Парковая', 21)
INSERT [dbo].[Address] ([Id], [PostNumber], [RegionName], [CityName], [StreetName], [HomeNumber]) VALUES (4, N'143960', N' Московская область', N' город Реутов', N' ул. Свободы', 51)
INSERT [dbo].[Address] ([Id], [PostNumber], [RegionName], [CityName], [StreetName], [HomeNumber]) VALUES (5, N'309500', N' Белгородская область', N' город Старый Оскол', N' ул. Рабочая', 122)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerProduct] ON 

INSERT [dbo].[PartnerProduct] ([Id], [ProductArticle], [PartnerId], [Count], [SellDate]) VALUES (33, N'5012543', 1, 15500, CAST(N'2023-03-23' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductArticle], [PartnerId], [Count], [SellDate]) VALUES (34, N'7750282', 1, 12350, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductArticle], [PartnerId], [Count], [SellDate]) VALUES (35, N'8758385', 1, 37400, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductArticle], [PartnerId], [Count], [SellDate]) VALUES (36, N'7028748', 2, 35000, CAST(N'2022-12-02' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductArticle], [PartnerId], [Count], [SellDate]) VALUES (37, N'8858958', 2, 1250, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductArticle], [PartnerId], [Count], [SellDate]) VALUES (38, N'7750282', 2, 1000, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductArticle], [PartnerId], [Count], [SellDate]) VALUES (39, N'5012543', 2, 7550, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductArticle], [PartnerId], [Count], [SellDate]) VALUES (40, N'5012543', 3, 7250, CAST(N'2023-01-22' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductArticle], [PartnerId], [Count], [SellDate]) VALUES (41, N'7028748', 3, 2500, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductArticle], [PartnerId], [Count], [SellDate]) VALUES (42, N'8758385', 4, 59050, CAST(N'2023-03-20' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductArticle], [PartnerId], [Count], [SellDate]) VALUES (43, N'7750282', 4, 37200, CAST(N'2024-03-12' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductArticle], [PartnerId], [Count], [SellDate]) VALUES (44, N'8858958', 4, 4500, CAST(N'2024-05-14' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductArticle], [PartnerId], [Count], [SellDate]) VALUES (45, N'7750282', 5, 50000, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductArticle], [PartnerId], [Count], [SellDate]) VALUES (46, N'8758385', 5, 670000, CAST(N'2023-11-10' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductArticle], [PartnerId], [Count], [SellDate]) VALUES (47, N'5012543', 5, 35000, CAST(N'2024-04-15' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductArticle], [PartnerId], [Count], [SellDate]) VALUES (48, N'7028748', 5, 25000, CAST(N'2024-06-12' AS Date))
SET IDENTITY_INSERT [dbo].[PartnerProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Partners] ON 

INSERT [dbo].[Partners] ([Id], [PartnerTypeId], [Name], [DirectorId], [Email], [Phone], [AddressId], [INN], [Rating]) VALUES (1, 1, N'База Строитель', 1, N'aleksandraivanova@ml.ru', N'493 123 45 67', 1, N'2222455179', 7)
INSERT [dbo].[Partners] ([Id], [PartnerTypeId], [Name], [DirectorId], [Email], [Phone], [AddressId], [INN], [Rating]) VALUES (2, 2, N'Паркет 29', 2, N'vppetrov@vl.ru', N'987 123 56 78', 2, N'3333888520', 7)
INSERT [dbo].[Partners] ([Id], [PartnerTypeId], [Name], [DirectorId], [Email], [Phone], [AddressId], [INN], [Rating]) VALUES (3, 3, N'Стройсервис', 3, N'ansolovev@st.ru', N'812 223 32 00', 3, N'4440391035', 7)
INSERT [dbo].[Partners] ([Id], [PartnerTypeId], [Name], [DirectorId], [Email], [Phone], [AddressId], [INN], [Rating]) VALUES (4, 4, N'Ремонт и отделка', 4, N'ekaterina.vorobeva@ml.ru', N'444 222 33 11', 4, N'1111520857', 5)
INSERT [dbo].[Partners] ([Id], [PartnerTypeId], [Name], [DirectorId], [Email], [Phone], [AddressId], [INN], [Rating]) VALUES (5, 1, N'МонтажПро', 5, N'stepanov@stepan.ru', N'912 888 33 33', 5, N'5552431140', 10)
SET IDENTITY_INSERT [dbo].[Partners] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerType] ON 

INSERT [dbo].[PartnerType] ([Id], [Name]) VALUES (1, N'ЗАО')
INSERT [dbo].[PartnerType] ([Id], [Name]) VALUES (2, N'ООО')
INSERT [dbo].[PartnerType] ([Id], [Name]) VALUES (3, N'ПАО')
INSERT [dbo].[PartnerType] ([Id], [Name]) VALUES (4, N'ОАО')
SET IDENTITY_INSERT [dbo].[PartnerType] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [Name], [LastName], [Surname]) VALUES (1, N'Иванова', N'Александра', N'Ивановна')
INSERT [dbo].[Person] ([Id], [Name], [LastName], [Surname]) VALUES (2, N'Петров', N'Василий', N'Петрович')
INSERT [dbo].[Person] ([Id], [Name], [LastName], [Surname]) VALUES (3, N'Соловьев', N'Андрей', N'Николаевич')
INSERT [dbo].[Person] ([Id], [Name], [LastName], [Surname]) VALUES (4, N'Воробьева', N'Екатерина', N'Валерьевна')
INSERT [dbo].[Person] ([Id], [Name], [LastName], [Surname]) VALUES (5, N'Степанов', N'Степан', N'Сергеевич')
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
INSERT [dbo].[Product] ([ProductTypeId], [Name], [ArticleNumber], [MinimumCoast]) VALUES (4, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', N'5012543', 5450.59)
INSERT [dbo].[Product] ([ProductTypeId], [Name], [ArticleNumber], [MinimumCoast]) VALUES (1, N'Ламинат Дуб серый 32 класс 8 мм с фаской', N'7028748', 3890.41)
INSERT [dbo].[Product] ([ProductTypeId], [Name], [ArticleNumber], [MinimumCoast]) VALUES (1, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', N'7750282', 1799.33)
INSERT [dbo].[Product] ([ProductTypeId], [Name], [ArticleNumber], [MinimumCoast]) VALUES (3, N'Паркетная доска Ясень темный однополосная 14 мм', N'8758385', 4456.9)
INSERT [dbo].[Product] ([ProductTypeId], [Name], [ArticleNumber], [MinimumCoast]) VALUES (3, N'Инженерная доска Дуб Французская елка однополосная 12 мм', N'8858958', 7330.99)
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([Id], [Name], [Coefficient]) VALUES (1, N'Ламинат', 2.35)
INSERT [dbo].[ProductType] ([Id], [Name], [Coefficient]) VALUES (2, N'Массивная доска', 5.15)
INSERT [dbo].[ProductType] ([Id], [Name], [Coefficient]) VALUES (3, N'Паркетная доска', 4.34)
INSERT [dbo].[ProductType] ([Id], [Name], [Coefficient]) VALUES (4, N'Пробковое покрытие', 1.5)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Title]) VALUES (1, N'Manager')
INSERT [dbo].[Role] ([Id], [Title]) VALUES (2, N'Worker')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Username], [Password], [RoleId]) VALUES (1, N'Manager', N'Manager123', 1)
INSERT [dbo].[User] ([Id], [Username], [Password], [RoleId]) VALUES (2, N'Worker', N'Woker123', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[PartnerProduct]  WITH CHECK ADD  CONSTRAINT [FK_PartnerProduct_Partners] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partners] ([Id])
GO
ALTER TABLE [dbo].[PartnerProduct] CHECK CONSTRAINT [FK_PartnerProduct_Partners]
GO
ALTER TABLE [dbo].[PartnerProduct]  WITH CHECK ADD  CONSTRAINT [FK_PartnerProduct_Product1] FOREIGN KEY([ProductArticle])
REFERENCES [dbo].[Product] ([ArticleNumber])
GO
ALTER TABLE [dbo].[PartnerProduct] CHECK CONSTRAINT [FK_PartnerProduct_Product1]
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD  CONSTRAINT [FK_Partners_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_Address]
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD  CONSTRAINT [FK_Partners_PartnerType] FOREIGN KEY([PartnerTypeId])
REFERENCES [dbo].[PartnerType] ([Id])
GO
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_PartnerType]
GO
ALTER TABLE [dbo].[Partners]  WITH CHECK ADD  CONSTRAINT [FK_Partners_Person] FOREIGN KEY([DirectorId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_Person]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType1] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType1]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [masterFloor] SET  READ_WRITE 
GO
