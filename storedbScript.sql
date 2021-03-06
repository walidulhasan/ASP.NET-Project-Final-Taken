USE [master]
GO
/****** Object:  Database [storedb]    Script Date: 06-Mar-17 11:49:13 PM ******/
CREATE DATABASE [storedb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'storedb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\storedb.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'storedb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\storedb_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [storedb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [storedb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [storedb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [storedb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [storedb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [storedb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [storedb] SET ARITHABORT OFF 
GO
ALTER DATABASE [storedb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [storedb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [storedb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [storedb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [storedb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [storedb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [storedb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [storedb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [storedb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [storedb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [storedb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [storedb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [storedb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [storedb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [storedb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [storedb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [storedb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [storedb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [storedb] SET RECOVERY FULL 
GO
ALTER DATABASE [storedb] SET  MULTI_USER 
GO
ALTER DATABASE [storedb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [storedb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [storedb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [storedb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [storedb]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 06-Mar-17 11:49:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 06-Mar-17 11:49:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[CartItemId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_dbo.CartItems] PRIMARY KEY CLUSTERED 
(
	[CartItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 06-Mar-17 11:49:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 06-Mar-17 11:49:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](120) NOT NULL,
	[CustomerName] [nvarchar](60) NULL,
	[Address] [nvarchar](500) NULL,
	[CCNumber] [nvarchar](max) NULL,
	[CCExpire] [date] NULL,
 CONSTRAINT [PK_dbo.Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 06-Mar-17 11:49:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_dbo.OrderItems] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 06-Mar-17 11:49:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[ShippedDate] [date] NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 06-Mar-17 11:49:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[PictureFile] [nvarchar](150) NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201703051331542_InitialCreate', N'ShopOnline_Project.Models.ShopDbContext', 0x1F8B0800000000000400DD5CDB6EE436127D5F60FF41D0D3EEC2B16C0F26488CEE04DEB61D181B5F32ED09F266D012DDE6AE442922657463B15FB60FF9A4FC42A81B45F122516A75BB339897B648168B55875545EA687EFFFF6FB3EFD751E8BCC194A018CFDDD3E313D781D88F0384577337A32F5F7DE37EFFDD5FFF32BB0AA2B5F373DDEF43DE8F8DC464EEBE529A9C7B1EF15F6104C87184FC3426F10B3DF6E3C80341EC9D9D9C7CEB9D9E7A908970992CC7997DCA3045112CFE607F2E62ECC3846620BC8D031892EA396B5916529D3B104192001FCEDDE56B9CDCE31061F8F490C6FF863E3D2E07B9CE458800536809C317D70118C71450A6EEF9670297348DF16A99B007207CDC2490F57B012181D532CE9BEEB62B3A39CB57E435036B517E46681C0D1478FAA13291270F1F6568979B9019F18A199B6EF25517869CBB0B90D21B0A23D791273B5F8469DEB1C3CEC7F5E82347ED73C431C2A094FF3B72165948B314CE31CC680AC223E7217B0E91FF2FB8798CFF03F11C676128AACB14666DAD07EC11939FC0946E3EC11769113781EB78EDF19E2C800FD78C2D977B83E98733D7B963CA80E710727408A659D238853F400C534061F00028852973EE4D000BFB2A5A4873B23F83CCA7FD53768B59141E83E9B6727ECA40A5B6BD9499D740A9076014AEE274331660E5E8770758A9C638803563F705B07ACEFCAF7A5616F75824779D5BB0FE11E2157D65B19B85EE6BB48641FDA052E433462CEEB33134CD603F9CEEC01B5A157AEB71CEE2F12718161DC82B4ACAB07C5C353E3500B94EE3E8531C360379DBD323485790B2A5C4860ECB384BFDB118ADA48D836835F89D112A8494A100B58E469307C01E787E9C069ED2DC6C347D4891CF67BE843E8A40E83A0F29FB55553FDFB8CED207B9D0E1F1F412123F454999B13B56B793E53D203F07D8350ABB4C7B6A695BBB30333801192346130CB68D18754030468C3AA4D8AA769F062CD5B24A411FCE78F3138F268D764AA312D0D41E5B45342E6E5C4CE3C3DF39AA957A28316DEA08C8A7D9A68A9AA8A81B538CF5C2B607B1551F1D5E8B5FCA6692DB87EE25BE45B6DF4866D5E4AD367E236DB1890E73034DB625A62B098A092FD9509E96D9EF47140DCF804B86A504067A593B3A5199135A25D10CF5A7A68B8473DEA20779D3BCB354D61B18CC69AC1D38C61D1DB961461D1DABD1EF7D74142035F8E8680DC7E9F6E16722CEA72B1DCF7652B7D66BED39137C3D45DD7A110429246482E2BC674D8BBB2C7ACE016C9C88FD9C64A2AB7582D2FE78D71D123AC2814D94D206033588D9C4820B42621F159AB44B86A6F86F2FEC0A074EDF49A0F4817092609E60BB1E256C9F331DE6EE3F147B7588E5AB6DC4360793B6DC53578E13F7F812869042E7C22FEF851780F820501DC6EC13B49FB0D002D37C2F8370C1FCC48215C2548D4308FB2801618FF6D2B881975FB97E7C26B9E5122610E741A7C72FDBABC067924CD767A99927C0AC1B7DD21E3081C494B61B885419D51E77A63D26A08EEFCC43439D5E772B871BB3E620CCE9FDB1BD02FB429C508475E24377549330575E060CC49DAED2EBC1F281A04ED5DCC6EBE6FB868198531DB2E5F47B455C9D1EFBB1A19CC227439D7251D69BBD0F097992F636CE37DE5F8D449FE49AAD55981C8165E5C7C6503602A6FCF41E2797CFF953B8D6BD9161E793EAF047AADA58C6522E7509A9F47E97D5B64DA9C9EBB5FAE5B702485948517F20A89752577D3D529AD7618A0C0EE91E11E2C95D1122EC381B314611FDE6A892A3D61ABC1A91840828504C225CE90BDD4CD7FE32342D6A7FBE02D10B0AC62DAA7D4190080A399EB4176B6108F990A59AA1AB04B5294205CD6BF77718C050768ACB6F4030CDEAC51B27C3F24DF5905545241BA0DA467D46D0D440BDA6DCCA043C167419419BA22D93F4368690D3B2C5C6EA30467DFCE74980B7CDBC92EF553D98790662D8EC162409C22B8128563D7196254B6CF1D572386F2A2A65783ED1D0A7B8B67C261AA76005A5563635D3F41AA5845E020A9E417EADB30822A55B3BE519426F3D979CD554A7D501B91E91FF6E726B37914B53265462AED90AA3BCCE28EE175B61D034D4C9497B20046907E56A11875984FB685C5DD284A24514D651CB7468269CFA5A9A759C06CDD29A5779A2ACE6A92A69E649D656AA30C5BD4A21DBC68B259A78269B0A4EFA546D0527D350339C9ACBA1369CCC9746FDD2CA7B689DBCB2E5609CC7C3EE34AE3324160BCF1947EE63E7B618451A6926A799E4092C21519AF0D85E568B0F244A6B350C58AB48F169AD556C180EF9611BE89DE02E542CD300BE39350D877CC75893B1F91D8F6869E3C54F070826DC3C7F9A445555DB133A7EACD3F7EF708120A1482A1FDBCB6A51244469AD865DD74DEF55EDF083EB44C58EE1486E53EC1887EEA742AD5FF6B7521C192AA5FDEA5EA7D5D0ECCB5FD08BC2F8C3019AF117F02DADF8D32192EA37EC6D49F5D33DA35B3938CB5DF8ECFC002D1D9467D5A1B5FF332BE5145B76C9F9D2F11B0A8A13EC86B024789C77385EFE1A2E42C4D6DB74B80518BD40424B268D7B76727A267DA275389F4B798404A1E6D0AFFB66AAEDAF77F85409E556EE25FC6C4B642D66D9FADBA4315264326CBF8CE1DF258D72E2949F03EDC489BA2F80F01B48FD57902ADF004D6351FD5BC3BD7FBDB2CB3DD16BCD8F7DD654452BDFA3047BF81EC5A0FC70ED359F9B68659FB62D33EEEB92C2B5CA1BC11B1CC0F5DCFD6F31ECDCB9F9E5A91979E414F5F1B973E2FC6F2A9C1B0E7D87FC4583ADE1AA6103AC66BB212D26E703B79A7E87294347C4D92B0B7F27A14D21DE07EC379D88781F14BF07EE7B7DE960B3EFF9C85DEC7B03FBEF1D58E03BC1419BF8AD0FE267C313848ED7AD15FEF5E00421D1B86D72DA18D6762DF76F1158FF7DB8B03633BB7F43EC8012DDB02BF64D56561815E368D8A3D8581D2FA1764D72FEA248CD0D2965DFA46389803086483D0E39E61BBDDD5295BF406AF29E19C31ACECA5856EA780AE8FEB9C65F14BD7840AAF8A2B03324794CCC16FED3D083554A95EC433DFDB793FD5B5E68B3E2EC39660E2F0B3381376C470EDE745283F5531809A406EA701773583783919267E41577D38A7573982984FA59CCAC63A3740B1FF072A48390ACF58191C5BA0FBEB20C9D3603CA82A0AC23601E161B59F64CFBBD672FE95465AB1E24DDB85F4D537ED1B2490E904E3C00703B5AEA00B2B0FA6E932522E13F9A648990A0552322FF6F2731F45B2988F7B9C12F719D0C258DEA2ED2A1FF1652C00EFAE022A5E805F89435FB9090E2DBEF9F4198B12E57D1330C6EF07D46938CB225C3E8396CEDF83CA376CD5F30A2DB3ACFEE8B3B7E32C512989A28BFABB8C7FFCC501870BDAF351768061179AAAEEEA7725FD2FC9E6AB5E192EE626C29A8321FAF301E6194844C18B9C74BF006C7E8F699C01FE10AF89BFA15B55948BF23DA669F5D22B04A41442A19CD78F627C37010ADBFFB036F2B171F6F550000, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (1, N'Desktop')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (2, N'Laptop')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (3, N'Printer')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (4, N'Router')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (5, N'Storage Devices')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (6, N'Tablet')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (51, N'Apple', CAST(90000.00 AS Decimal(18, 2)), N'Apple iMac 21.5" 4K Retina MK452ZAA  3.1GHz quad-core Intel Core i5 processor Turbo Boost up to 3.6GHz 8GB of onboard memory, configurable up to 16GB 1TB hard drive1 Intel Iris Pro Graphics 6200', N'Apple.jpg', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (52, N'CSM CSM FERRARI PC', CAST(56000.00 AS Decimal(18, 2)), N'SHORT SPECIFICATIONS *Processor: INTEL 6 GEN CORE I5-6500, 3.20 GHZ,6MB (6th Gen) *Motherboard: Intel Chipset (MSI B150M Series) *Ram: 4 GB DDR4 2400 Bus (Apacer/Transcend) *HDD: 1 TB SATA ( Western Digital/Toshiba) *DVD-RW: DVD-RW Drive( Samsung)', N'CSM CSM FERRARI PC.jpg', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (53, N'Dell DELL Vostro 3650', CAST(48000.00 AS Decimal(18, 2)), N'DELL Vostro 3650 MT Core i3 (Free Dos)  DETAIL SPECIFICATIONS Processor	:	Intel Core i3- 6th Generation 6100 Processor 3.7GHz, 3MB, 4T,  65W Chipset	:	Intel® H110 Chipset RAM	:	4GB (1x4GB) 1600MHz DDR3L Memory, expandable  up to 16 GB Hard Drive	:	500 GB SATA, 7200 rpm OS	:	FREE DOS Monitor	:	18.5" LCD with LED Technology Graphics	:	Integrated Intel® HD Graphics 530 Audio	:	Integrated Realtek LOM Optical Drive	:	DVDRW, Slim ODD tray type 9.5mm', N'Dell DELL Vostro 3650.jpg', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (54, N'Esprimo P420 E85', CAST(35000.00 AS Decimal(18, 2)), N'Fujitsu German Made Brand PC Esprimo P420 E85+ MT,Intel Core i5 4590 Processor(3.3GHz), 4GB RAM, 500GB HDD, Fujitsu 18.5" LED Wide Monitor, DVD Rw,Fujitsu Mouse, Fujitsu Keyboard', N'Fujitsu Brand PC Esprimo P420 E85.jpg', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (55, N'HP ProDesk 400 G3', CAST(47000.00 AS Decimal(18, 2)), N'Model : ProDesk 400 G3 Business Series Desktop (6th Gen) CPU : Intel® Core™ i3-6100 Processor, 3.7 GHz Display: HP 18.5'''' LED Backlit LCD Wide Screen RAM : 4 GB HDD : 1 TB', N'HP ProDesk 400 G3.jpg', 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (56, N'Apple 13 inch Macbook Air MMGG2ZA/A', CAST(130000.00 AS Decimal(18, 2)), N'Apple New 13 inch Macbook Air MMGG2ZA/A, 1.6GHz dual-core Intel Core i5 (Turbo Boost up to 2.7GHz) 3MB shared L3 cache Intel HD Graphics 6000 8GB of 1600MHz LPDDR3 onboard memory', N'apple-13-inch-macbook-air-mmgg2za-a.jpg', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (57, N'Macbook pro Retina (MF839ZA/A) ', CAST(105000.00 AS Decimal(18, 2)), N'Apple 13 inch retina display (MF839ZA/A) 2.7GHz dual-core Intel Core i5 processor 3MB shared L3 cache Turbo Boost up to 3.1GHz Intel Iris Graphics 6100', N'apple-13-inch-macbook-pro-retina-display-2015-mf839za-a-.jpg', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (58, N'Apple 13 inch (MF840ZA/A)', CAST(110000.00 AS Decimal(18, 2)), N'Apple 13 inch retina display (MF840ZA/A) 2.7GHz dual-core Intel Core i5 processor 2.9GHz 3MB shared L3 cache Turbo Boost up to 3.1GHz', N'apple-13-inch-macbook-pro-retina-display-2015-mf840za-a-.jpg', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (59, N'Dell Inspiron 15- N7359 Core i3', CAST(57000.00 AS Decimal(18, 2)), N'DELL INSPIRON 7359 SILVER,CORE I3-6100U(2.3 GHZ)-4GB-1TB,13.3"(TOUCH),3 CELL,CASE,2YR 6th Generation Intel(R) Core(TM) i3-6100U 4GB, 1TB HDD 13.3 Inch LED Backlit Display (Touch) (2-in-1) 2 Year Parts and Service (Battery & Adapter 1 Year)', N'dell-inspiron-15-7000-series-2-in-1-n7359-core-i3-touch-.jpg', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (60, N'Dell Inspiron 15- N7568 Core i7 (Touch)', CAST(79500.00 AS Decimal(18, 2)), N'DELL INSPIRON 7568 BLACK,CORE I7-6500U(2.5GHZ),8GB-1TB,15.6"(TOUCH)2 IN 1,3 CELLCASE,2YR  SHORT SPECIFICATIONS 6th Generation Intel Core i7-6500U 8GB, 1TB HDD 15.6 inch LED Backlit Display (Touch) (2-in-1) 2 Year Parts and Service (Battery & Adapter 1 Year)', N'dell-inspiron-15-7000-series-2-in-1-n7568-core-i7-touch-.jpg', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (61, N'Dell-inspiron-n5459-core-i7', CAST(47500.00 AS Decimal(18, 2)), N'DELL INSPIRON N5459 SILVER,CORE-I5 6200U(2.3GHZ),4GB-1TB,14"-DVDRW,DOS,4 CELL,CASE,2YR  SHORT SPECIFICATIONS 6th Generation Intel Core i5-6200U 4GB Ram, 1TB HDD 14.0 inch LED Backlit Display 2 Year Warranty (Battery & Adapter 1 Year)', N'dell-inspiron-n5459-core-i7.jpg', 2)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (62, N'Epson-l130-printer', CAST(10500.00 AS Decimal(18, 2)), N'Single-function printer with integrated ink tank system for cost-effective, reliable colour printing including two years'' worth of ink; Print Resolution: 5760dpi Print Speed: Approx. 27ppm (B/W) & 15ppm (Color) Draft ISO Print Speed: Approx. 7.0 ipm / 3.5 ipm (Bk/Cl)) Lowest Print Costs Ever', N'epson-l130-printer-color-single-function-.jpg', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (63, N'Epson-l220', CAST(14500.00 AS Decimal(18, 2)), N'Epson-l220-all-in-one-print-copy-scan;  KEEP PRINTING. KEEP SAVING. NON-STOP.  SHORT SPECIFICATIONS Print Resolution: 5760dpi Print Speed: Approx. 27ppm (B/W) & 15ppm (Color) Draft ISO Print Speed: Approx. 7.0 ipm / 3.5 ipm (Bk/Cl)) Lowest Print Costs Ever', N'epson-l220-all-in-one-print-copy-scan.jpg', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (64, N'Epson-l310', CAST(13500.00 AS Decimal(18, 2)), N'ULTRA HIGH PERFORMANCE. ULTRA LOW RUNNING COSTS.  SHORT SPECIFICATIONS Print Resolution: 5760dpi Print Speed: Approx. 33 ppm (B/W) & 15ppm (Color) Draft ISO Print Speed: Approx. 9.2 ipm / 4.5 ipm (Bk/Cl)) Lowest Print Costs Ever', N'epson-l310-color-single-function-.jpg', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (65, N'Epson-l360', CAST(14500.00 AS Decimal(18, 2)), N'Epson L360 INKTANK SYSTEM All In One PRINTER  SHORT SPECIFICATIONS 5760 x 1440 dpi (with Variable-Sized Droplet Technology) Max Black Draft Text - Memo A4: Approx. 33/15 ppm #1 (Bk/Cl) ISO 24734, A4: Approx. 9.2/4.5 ipm #2 (Bk/Cl) Maximum Copies From Standalone: 20 sheets (Button pressing frequency) Maximum Hardware Resolution: 600 x 1200 dpi', N'epson-l360-all-in-one-printer-print-copy-scan.jpg', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (66, N'Epson L1300 Photo Printer', CAST(38000.00 AS Decimal(18, 2)), N'Epson L1300 Photo Printer has advantage of ultra-low cost printing, up to A3+ size, for all types of documents.   SHORT SPECIFICATIONS Print Resolution: 5760dpi Print Speed: Approx. 30#1/17#2ppm (Bk/Cl) Draft ISO Print Speed: Approx. 15/5.5ipm (Bk/Cl) Lowest Print Costs Ever', N'epson-l1300-printer-a3-color-single-function-.jpg', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (67, N'Epson-m100-inkjet-printer', CAST(13800.00 AS Decimal(18, 2)), N'A Mono Ink Tank Printer for the most economical office printing ever  SHORT SPECIFICATIONS High-yield pigment ink bottles Print speed up to 34 ppm Print Resolution: 1440 dpi High Speed USB 2.0 & Network connectivity', N'epson-m100-inkjet-printer-monochrome-printer-network-ready.jpg', 3)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (68, N'Cisco-rv042', CAST(16500.00 AS Decimal(18, 2)), N'Standard	:	IEEE 802.3, 802.3u Security	:	Firewall: SPI firewall Interface	:	 SPI firewall for maximum security Two WAN ports for load-balanced connectivity to the Internet 4-port 10/100 switch supports automatic medium dependent interface (MDI) and MDI crossover (MDI-X) and up to 200 Mbps of throughput per port Dynamic URL and email scanning through the Trend Micro ProtectLink Gateway Security Service (optional)', N'cisco-cisco-rv042.jpg', 4)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (69, N'Cisco-wrvs4400n', CAST(30000.00 AS Decimal(18, 2)), N'Wireless LAN	:	Wireless VLANs: 4 with SSID Security	:	Wi-Fi Protected Access (WPA) and Advanced Encryption Standard (AES) (WPA2) Interface	:	Four 10/100/1000 Ethernet port and one 10/100/1000 WAN Port Antenna Connector	:	3 External Data Rate	:	NAT throughput: 800 Mbps when IPS is disabled Receiver Sensitivity	:	 802.11n: 270 Mbps @ -65 dBm 802.11g: 54 Mbps @ -70 dBm 802.11b: 11 Mbps @ -85 dBm Weight	:	1.21 lb (0.55 kg)', N'cisco-wrvs4400n.jpg', 4)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (70, N'D-link-3g-modem wifi-router-dwr-710-', CAST(2450.00 AS Decimal(18, 2)), N'Standard	:	 3 G Modem with WiFi Router Standard 6-Pin SIM card interface Download Speed Up to 21 Mbps Supports Upto 32 GB MicroSD Card Support 8 Users Wireless 802.11 b/g/n Wireless LAN	:	Wireless 802.11 b/g/n Antenna Connector	:	Internal 3G Main Antenna', N'd-link-3g-modem-with-3g-wifi-router-dwr-710-.jpg', 4)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (71, N'D-link-n150-wireless-600m-', CAST(1600.00 AS Decimal(18, 2)), N'Standard	:	 1 WAN Port 4 LAN Port 150 Mbps Wireless Speed Security	:	Wi-Fi Protected Setup (WPS) Frequency Range	:	5 dBi 1 WAN Port 4 LAN Port 150 Mbps Wireless Speed 1 External Antenna WPA/WPA2 Encryption', N'd-link-n150-wireless-router-dir-600m-.jpg', 4)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (72, N'Prolink WNR1004', CAST(3000.00 AS Decimal(18, 2)), N'Standard	:	IEEE 802.11 b/g/n standards Security	:	WEP, WPA-PSK, WPA2-PSK, Hide SSID Interface	:	Ethernet Port (LAN/WAN), Reset Button, WPS Button, Mode Slider (Router, AP, Client) Frequency Range	:	2.412GHz ~ 2.483GHz (subject to local regulations) Antenna Connector	:	Chip Antenna (2T2R) No. of Selectable Channels	:	 USA (FCC) 11 channels; EU (ETSI) 13 channels; Japan (TELEC) 13 channels *802.11n: 20MHz/40MHz', N'prolink-wnr1004-p.jpg', 4)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (73, N'Apacer APSAC233B 1TB', CAST(5700.00 AS Decimal(18, 2)), N'Additional Information  Brand	Apacer Model	Apacer APSAC233B Storage	1TB Type	External HDD RPM	5400 rpm Seek time	- Buffer	- From factor	2.5Inch Interface	USB 3.0 Transfer Rate	up to 5 Gbps', N'ext_hdd_apacer_01_001.jpg', 5)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (74, N'Western Digital Ultra WDBMWV0020BBK', CAST(5000.00 AS Decimal(18, 2)), N'Brand - Western Digital, Model - Western Digital My Passport Ultra, Storage - 2TB, Type - SATA External, RPM - 5400, Buffer (MB) - 8, Interface - USB 2.0/ 3.0, Transfer Rate (MB/s) - USB 2.0 up to 480 Mb/s; USB 3.0 up to 5Gb/s, Warranty - 3 year, Part No - WDBMWV0020BBK', N'external_hdd_wd_45.png', 5)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (75, N'Transcend_ts1tsj25m3_1tb', CAST(7000.00 AS Decimal(18, 2)), N'Brand - Transcend, Model - Transcend TS1TSJ25M3, Storage - 1TB, Type - SATA External, RPM - 5400, Buffer (MB) - 8, From Factor (Inch) - 2.5, Interface - USB 2.0/ 3.0, Transfer Rate (MB/s) - USB 2.0 up to 480 Mb/s; USB 3.0 up to 5Gb/s, Warranty - 3 year', N'transcend_ts1tsj25m3_1tb.jpg', 5)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (76, N'Western Digital WDBCTL0040HWT My Cloud 4TB', CAST(8000.00 AS Decimal(18, 2)), N'Brand - Western Digital, Model - WDBCTL0040HWT, Storage - 4TB, Type - External Power Hard Drive, RPM - 7200 rpm, Interface - 1 x Ethernet 1000Base-T - RJ-45,1 x USB 3.0, Transfer Rate (MB/s) - USB 3.0 up to 5Gb/s,USB 2.0 up to 480Mb/s, Warranty - 3 year, Others - Features:iTunes server, UPnP Media Server, Part No - WDBCTL0040HWT', N'wd-my-cloud.jpg', 5)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (77, N'Western Digital Book WDBFJK0030HBK 3TB', CAST(9000.00 AS Decimal(18, 2)), N'Brand - Western Digital, Model - My Book WDBFJK0030HBK, Storage - 3TB, Type - External HDD, Interface - USB3.0/USB2.0, Transfer Rate (MB/s) - USB3.0 up to 5 Gb/s, USB2.0 up to 480Mb/s, Warranty - 3 year', N'western_digital_my_book_wdb.jpg', 5)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (78, N'Western Digital Ultra WDBBEPOO10BBL 1TB', CAST(8000.00 AS Decimal(18, 2)), N'Brand - Western Digital, Model - WDBBEPOO10BBL, Storage - 1TB, Type - My Passport USB-3.0, RPM - 5400, Interface - USB-3.0, Color - Blue, Warranty - 3 year, Part No - WDBGPU0010BBL', N'western_digital_my_passport_ultra_wdbbepoo10bbl_1tb_blue_usb-3.0_hdd.jpg', 5)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (79, N'Apple 9.7-inch iPad Pro', CAST(90000.00 AS Decimal(18, 2)), N'iPad Pro is more than the next generation of iPad — it’s an uncompromising vision of personal computing for the modern world. It puts incredible power at your fingertips that leaps past most portable PCs. It makes even complex work as natural as touching, swip  SHORT SPECIFICATIONS 9.7-inch Retina display A9X chip, M9 coprocessor Touch ID fingerprint sensor 12MP iSight camera with 4K video 5MP FaceTime HD camera', N'Apple 9.7-inch iPad Pro.jpg', 6)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (80, N'Apple iPad Air 2 16GB', CAST(65000.00 AS Decimal(18, 2)), N'iPad Air puts all the computer you may ever need into a simple piece of glass. Both versions of iPad Air are incredibly capable, with desktop-class 64bit architecture, gorgeous 9.7-inch Retina displays, and all-day battery life.  SHORT SPECIFICATIONS 9.7-inch Retina display1 A8X chip, M8 coprocessor Touch ID fingerprint sensor 8MP iSight camera with 1080p video FaceTime HD camera', N'Apple iPad Air 2 16GB.jpg', 6)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (81, N'Apple iPad Air 2 64GB', CAST(75000.00 AS Decimal(18, 2)), N'iPad Air puts all the computer you may ever need into a simple piece of glass. Both versions of iPad Air are incredibly capable, with desktop-class 64bit architecture, gorgeous 9.7-inch Retina displays, and all-day battery life.  9.7-inch Retina display1 A8X chip, M8 coprocessor Touch ID fingerprint sensor 8MP iSight camera with 1080p video FaceTime HD camera', N'Apple iPad Air 2 64GB.jpg', 6)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (82, N'Apple iPad mini 4 16GB', CAST(53000.00 AS Decimal(18, 2)), N'SHORT SPECIFICATIONS 7.9-inch Retina display1 A8 chip, M8 coprocessor Touch ID fingerprint sensor 8MP iSight camera with 1080p video FaceTime HD camera', N'Apple iPad mini 4 16GB.jpg', 6)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (83, N'Apple iPad mini 4 64GB', CAST(65000.00 AS Decimal(18, 2)), N'There’s more to mini than meets the eye. The new iPad mini 4 puts uncompromising performance and potential in your hand. It’s thinner and lighter than ever before, yet powerful enough to help you take your ideas even further.  SHORT SPECIFICATIONS 7.9-inch Retina display1 A8 chip, M8 coprocessor Touch ID fingerprint sensor 8MP iSight camera with 1080p video FaceTime HD camera', N'Apple iPad mini 4 64GB.jpg', 6)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (84, N'Apple iPad Pro 128GB', CAST(115000.00 AS Decimal(18, 2)), N'12.9-inch (diagonal) LED-backlit widescreen Multi-Touch display 2732-by-2048 resolution at 264 pixels per inch (ppi) Fingerprint-resistant oleophobic coating Fully laminated display Antireflective coating  SHORT SPECIFICATIONS 12.9-inch (diagonal) LED-backlit widescreen Multi-Touch display 2732-by-2048 resolution at 264 pixels per inch (ppi) Fingerprint-resistant oleophobic coating Fully laminated display Antireflective coating', N'NoPicture.jpg', 6)
INSERT [dbo].[Products] ([ProductId], [ProductName], [UnitPrice], [Description], [PictureFile], [CategoryId]) VALUES (85, N'Apple iPad Pro 256GB', CAST(150000.00 AS Decimal(18, 2)), N'12.9-inch (diagonal) LED-backlit widescreen Multi-Touch display 2732-by-2048 resolution at 264 pixels per inch (ppi) Fingerprint-resistant oleophobic coating Fully laminated display Antireflective coating SHORT SPECIFICATIONS 12.9-inch (diagonal) LED-backlit widescreen Multi-Touch display 2732-by-2048 resolution at 264 pixels per inch (ppi) Fingerprint-resistant oleophobic coating Fully laminated display Antireflective coating', N'Apple-iPad-Pro.jpg', 6)
SET IDENTITY_INSERT [dbo].[Products] OFF
/****** Object:  Index [IX_OrderId]    Script Date: 06-Mar-17 11:49:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderId] ON [dbo].[OrderItems]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductId]    Script Date: 06-Mar-17 11:49:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductId] ON [dbo].[OrderItems]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CustomerId]    Script Date: 06-Mar-17 11:49:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_CustomerId] ON [dbo].[Orders]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryId]    Script Date: 06-Mar-17 11:49:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderItems_dbo.Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_dbo.OrderItems_dbo.Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderItems_dbo.Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_dbo.OrderItems_dbo.Products_ProductId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Orders_dbo.Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_dbo.Orders_dbo.Customers_CustomerId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.Categories_CategoryId]
GO
USE [master]
GO
ALTER DATABASE [storedb] SET  READ_WRITE 
GO
