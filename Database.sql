USE [master]
GO
/****** Object:  Database [MVCTesting]    Script Date: 7/6/2025 6:24:52 PM ******/
CREATE DATABASE [MVCTesting]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MVCTesting', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MVCTesting.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MVCTesting_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MVCTesting_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MVCTesting] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MVCTesting].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MVCTesting] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MVCTesting] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MVCTesting] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MVCTesting] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MVCTesting] SET ARITHABORT OFF 
GO
ALTER DATABASE [MVCTesting] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MVCTesting] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MVCTesting] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MVCTesting] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MVCTesting] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MVCTesting] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MVCTesting] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MVCTesting] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MVCTesting] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MVCTesting] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MVCTesting] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MVCTesting] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MVCTesting] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MVCTesting] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MVCTesting] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MVCTesting] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MVCTesting] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MVCTesting] SET RECOVERY FULL 
GO
ALTER DATABASE [MVCTesting] SET  MULTI_USER 
GO
ALTER DATABASE [MVCTesting] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MVCTesting] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MVCTesting] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MVCTesting] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MVCTesting] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MVCTesting] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MVCTesting', N'ON'
GO
ALTER DATABASE [MVCTesting] SET QUERY_STORE = ON
GO
ALTER DATABASE [MVCTesting] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MVCTesting]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/6/2025 6:24:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 7/6/2025 6:24:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/6/2025 6:24:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/6/2025 6:24:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/6/2025 6:24:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/6/2025 6:24:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/6/2025 6:24:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[LastLogin] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsSuspended] [bit] NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 7/6/2025 6:24:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/6/2025 6:24:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [text] NULL,
	[ParentCategoryID] [int] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK__Category__19093A2B06430208] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryLocation]    Script Date: 7/6/2025 6:24:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryLocation](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[WarehouseID] [int] NULL,
	[LocationCode] [varchar](20) NULL,
	[Description] [text] NULL,
	[IsActive] [bit] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK__Inventor__E7FEA4775EC1D911] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryRecord]    Script Date: 7/6/2025 6:24:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryRecord](
	[ProductId] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[QuantityOnHand] [int] NULL,
	[LastUpdated] [datetime] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK__Inventor__DA732C845CCED13B] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryTransaction]    Script Date: 7/6/2025 6:24:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryTransaction](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[TransactionType] [varchar](20) NULL,
	[FromLocationID] [int] NULL,
	[ToLocationID] [int] NULL,
	[TimeStamp] [datetime] NULL,
	[UserID] [nvarchar](450) NULL,
	[Notes] [text] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK__Inventor__55433A4BF722A5D1] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/6/2025 6:24:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Description] [text] NULL,
	[AvailableStock] [int] NULL,
	[Barcode] [varchar](50) NULL,
	[CategoryId] [int] NULL,
	[CurrentQuantity] [int] NULL,
	[MinAvailableStock] [int] NULL,
	[UnitPrice] [decimal](10, 2) NULL,
	[CostPrice] [decimal](10, 2) NULL,
	[Weight] [decimal](10, 2) NULL,
	[ImageURL] [varchar](255) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[LastUpdated] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Product__B40CC6CDF37CD5F1] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductHistory]    Script Date: 7/6/2025 6:24:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductHistory](
	[HistoryID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Status] [varchar](20) NULL,
	[PreviousQuantity] [int] NULL,
	[NewQuantity] [int] NULL,
	[Reason] [varchar](100) NULL,
	[ReferenceID] [int] NULL,
	[TimeStamp] [datetime] NULL,
	[UserID] [nvarchar](450) NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK__ProductH__4D7B4ADD89C1B525] PRIMARY KEY CLUSTERED 
(
	[HistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Return]    Script Date: 7/6/2025 6:24:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Return](
	[ReturnID] [int] IDENTITY(1,1) NOT NULL,
	[OriginalTransactionID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[Reason] [varchar](20) NULL,
	[Condition] [varchar](20) NULL,
	[ReturnDate] [datetime] NULL,
	[ProcessedBy] [nvarchar](128) NULL,
	[Notes] [text] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK__Return__F445E9884A26CC22] PRIMARY KEY CLUSTERED 
(
	[ReturnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 7/6/2025 6:24:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Company] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](20) NULL,
	[Address] [text] NULL,
	[PaymentTerm] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[Notes] [text] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK__Supplier__4BE6669461B8CFD2] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier_Product]    Script Date: 7/6/2025 6:24:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier_Product](
	[ProductId] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[SupplierSKU] [varchar](50) NULL,
	[LeadTimeDays] [int] NULL,
	[UnitCost] [decimal](10, 2) NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK__Supplier__E0B2A0A4F2FBC631] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLog]    Script Date: 7/6/2025 6:24:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[ActionType] [varchar](20) NULL,
	[TimeStamp] [datetime] NULL,
	[AdditionalInfo] [text] NULL,
 CONSTRAINT [PK__UserLog__5E5499A8A33FBCA4] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 7/6/2025 6:24:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[WarehouseID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Location] [text] NULL,
	[ContactPhone] [varchar](20) NULL,
	[Capacity] [int] NULL,
	[IsActive] [bit] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK__Warehous__2608AFD9F8746D1B] PRIMARY KEY CLUSTERED 
(
	[WarehouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250627173923_init', N'9.0.6')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'526cf445-9c9a-40e3-bf54-2565c25d350e', N'admin', N'ADMIN', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'fb3fabdc-3d5e-442e-9268-e2c07217fd57', N'user', N'USER', NULL)
GO
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] ON 

INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (1, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (2, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (3, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (4, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (5, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Address', N'From Extirnal login')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (6, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Address', N'From Extirnal login')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (7, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Address', N'From Extirnal login')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (8, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Address', N'From Extirnal login')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (9, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Address', N'From Extirnal login')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (10, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Address', N'From Extirnal login')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (11, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Address', N'From Extirnal login')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (12, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (13, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Address', N'From Extirnal login')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (14, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Address', N'From Extirnal login')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (15, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Address', N'From Extirnal login')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (16, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (17, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Address', N'From Extirnal login')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (18, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Address', N'From Extirnal login')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (19, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Address', N'From Extirnal login')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (20, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (21, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num', N'2')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (22, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (23, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num', N'2')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (24, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (25, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num', N'1')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (26, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (27, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num', N'1')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (28, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (29, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num', N'1')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (30, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (31, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num', N'1')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (32, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (33, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num', N'1')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (34, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (35, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num', N'1')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (36, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (37, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num', N'1')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (38, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (39, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num', N'1')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (40, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (41, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num', N'1dfva')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (42, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (43, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num', N'1dfva')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (44, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (45, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num', N'1dfva')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (46, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (47, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num', N'1')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (48, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (49, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num', N'1')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (50, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (51, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num', N'1')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (52, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (53, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num', N'1')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (54, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (55, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num', N'1')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (56, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (57, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num', N'1')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (58, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (59, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num', N'0')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (60, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (61, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num1122', N'0')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (62, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (63, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num1122', N'1')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (64, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (65, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num1122', N'2')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (66, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (67, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num1122', N'2')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (68, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (69, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num1122', N'2')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (70, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (71, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Num1122', N'2')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (72, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (73, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (74, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (75, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (76, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (77, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (78, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (79, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (80, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (81, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (82, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (83, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (84, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (85, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (87, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (89, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (92, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (93, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (94, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Address', N'1234assdd')
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] OFF
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'18809662-0e6c-4f13-904d-2af9d42024f0', N'526cf445-9c9a-40e3-bf54-2565c25d350e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'526cf445-9c9a-40e3-bf54-2565c25d350e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'00aa711a-c80a-418d-a03f-5a102f03a288', N'fb3fabdc-3d5e-442e-9268-e2c07217fd57')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'099428d6-3841-49f7-85c1-e6325076c6a4', N'fb3fabdc-3d5e-442e-9268-e2c07217fd57')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1019c21b-c040-4656-aa42-ee67eff165b2', N'fb3fabdc-3d5e-442e-9268-e2c07217fd57')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'419457de-c74a-4ceb-989f-4a500fa07eca', N'fb3fabdc-3d5e-442e-9268-e2c07217fd57')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b44ffbaf-0c6d-4937-8652-71a2a8d97605', N'fb3fabdc-3d5e-442e-9268-e2c07217fd57')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c4a9fb17-ec17-44a9-b4ad-113cd4d0f8b3', N'fb3fabdc-3d5e-442e-9268-e2c07217fd57')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e9da3a4d-a7e3-4cb1-b714-4a7b8c31aa36', N'fb3fabdc-3d5e-442e-9268-e2c07217fd57')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ebf470ec-bce2-4cd1-8aad-49fafc735a15', N'fb3fabdc-3d5e-442e-9268-e2c07217fd57')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Address], [IsActive], [LastLogin], [CreatedDate], [IsDeleted], [IsSuspended], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'00aa711a-c80a-418d-a03f-5a102f03a288', N'Zeyad', N'Mansoura', 0, CAST(N'2025-07-06T14:17:18.3488167' AS DateTime2), CAST(N'2025-07-06T14:17:18.1044981' AS DateTime2), 0, 0, N'Zeyad', N'ZEYAD', N'Zeyad@z.com', N'ZEYAD@Z.COM', 0, N'AQAAAAIAAYagAAAAELsP45ZGZe7CERSfQjuUjk0BYO/8p8UYN05t+DPZTCr77gFqBat9wpVFu2H2gmEINw==', N'LG4LLIRGN6KCRAOTYLBSLOBKAFIQFH2K', N'f6022fe0-7756-477a-9c61-981025aefdef', N'01000000001', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Address], [IsActive], [LastLogin], [CreatedDate], [IsDeleted], [IsSuspended], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'099428d6-3841-49f7-85c1-e6325076c6a4', N'toto3', N'123123', 0, CAST(N'2025-07-03T15:26:12.4445224' AS DateTime2), CAST(N'2025-07-02T05:58:51.3814206' AS DateTime2), 0, 1, N'toto3', N'TOTO3', N'toto3@t.com', N'TOTO3@T.COM', 0, N'AQAAAAIAAYagAAAAEG2ooDZVDobpq8E8bgKTIlOTQTGjJuySau7nXZV3eFs0GfdKLBCsZ5FON477Rdgzbg==', N'J2PUHERNNGEUXRPK5UP2MO763ASHUHPL', N'6d3ae49a-38d9-4fe4-9495-1db9e37c82cf', NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Address], [IsActive], [LastLogin], [CreatedDate], [IsDeleted], [IsSuspended], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1019c21b-c040-4656-aa42-ee67eff165b2', N'toto5', N'2345235t', 0, CAST(N'2025-07-06T14:14:34.8056035' AS DateTime2), CAST(N'2025-07-02T06:11:46.6199136' AS DateTime2), 0, 1, N'toto5', N'TOTO5', N'toto5@t.com', N'TOTO5@T.COM', 0, N'AQAAAAIAAYagAAAAEA1+la/m+OYhk9d6yHpflSXddNSrHyarJ/7+IVqNOVRbVY/pL/6xxI+TTZBpUTUhNw==', N'LR2SJRESJFWKIWBPFLOAEBD4WZCFRHZE', N'e353b155-fcf2-4f4b-8f63-6da81e683c6e', NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Address], [IsActive], [LastLogin], [CreatedDate], [IsDeleted], [IsSuspended], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'18809662-0e6c-4f13-904d-2af9d42024f0', N'toto1', N'1234assdd', 0, CAST(N'2025-07-06T14:23:26.0361151' AS DateTime2), CAST(N'2025-06-29T16:53:25.2840605' AS DateTime2), 0, 0, N'toto1', N'TOTO1', N'toto1@t.com', N'TOTO1@T.COM', 0, N'AQAAAAIAAYagAAAAEB4tuH0C6Um/FIScTp0NWuAyOKpigL6zgQtkRbooRT1qRHyaGXJTj7j6gcb23LvEJA==', N'EY5HO7KL5U4MWQYPAEGYI53MNPXTQI3L', N'511477f9-3da7-4889-bb96-3cc0e4d43c1d', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Address], [IsActive], [LastLogin], [CreatedDate], [IsDeleted], [IsSuspended], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'419457de-c74a-4ceb-989f-4a500fa07eca', N'toto4', N'1212312312', 0, CAST(N'2025-07-06T14:19:49.9899411' AS DateTime2), CAST(N'2025-07-02T06:03:23.1670265' AS DateTime2), 0, 0, N'toto4', N'TOTO4', N'toto4@t.com', N'TOTO4@T.COM', 0, N'AQAAAAIAAYagAAAAEHlTjuROgkipLbC5AYSgjfmmWJsfHBBObHZhHFdaShNFuMhZZ2Qdsb2WTOYLTrlYyA==', N'JAW7LZL6KSO7E7YHRW25PFQ4ZVKEVSDV', N'82819e61-0e37-4891-b4cd-a1d4618eb6f5', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Address], [IsActive], [LastLogin], [CreatedDate], [IsDeleted], [IsSuspended], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'b44ffbaf-0c6d-4937-8652-71a2a8d97605', N'toto7', N'Mansoura', 0, CAST(N'2025-07-03T09:24:06.1336117' AS DateTime2), CAST(N'2025-07-03T09:24:03.9057946' AS DateTime2), 0, 1, N'toto7', N'TOTO7', N'toto7@t.com', N'TOTO7@T.COM', 0, N'AQAAAAIAAYagAAAAEHvtbW6fdU9N8gMLHrXSHBMuziWmvc2GPylX0cfks0w43UglI9CwDYS6ECHFbdlURQ==', N'PJGKFWH6IHUNSFWONW3M65Y7RZWBR5YZ', N'8618a6fd-96de-4ba4-8f2b-6d136f732b28', N'01000000001', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Address], [IsActive], [LastLogin], [CreatedDate], [IsDeleted], [IsSuspended], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c4a9fb17-ec17-44a9-b4ad-113cd4d0f8b3', N'toto10', N'Cairo', 0, CAST(N'2025-07-04T12:32:17.0432629' AS DateTime2), CAST(N'2025-07-04T12:32:16.7088050' AS DateTime2), 0, 1, N'toto10', N'TOTO10', N'toto10@t.com', N'TOTO10@T.COM', 0, N'AQAAAAIAAYagAAAAEHmPOgNndeYXrpEZZbPi+LoNhvbPxzcCWjyosVyspC4R3tG6Jo9cHnkFdoJr5brE/A==', N'4TJ6RXIRAS5RQBMPGMVEHZYEIMS2ZQEL', N'eb8a32c2-624b-4a76-910d-54ef3f7309ec', N'01000000001', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Address], [IsActive], [LastLogin], [CreatedDate], [IsDeleted], [IsSuspended], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e9da3a4d-a7e3-4cb1-b714-4a7b8c31aa36', N'toto6', N'1231231', 0, CAST(N'2025-07-02T12:43:57.7909330' AS DateTime2), CAST(N'2025-07-02T12:43:57.2936943' AS DateTime2), 0, 1, N'toto6', N'TOTO6', N'toto6@t.com', N'TOTO6@T.COM', 0, N'AQAAAAIAAYagAAAAEPbqUgMRp3FlBlQ/oN+RpavyMrf4ub5ADEbhfLtgCgYJmJrNG875FrfVuxJwMDW1NA==', N'WMIYODODTYK7KHH6WJQ3G52EPIIBEZHV', N'0f94a2c5-e780-4497-9ae9-bebe410611d5', NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Address], [IsActive], [LastLogin], [CreatedDate], [IsDeleted], [IsSuspended], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ebf470ec-bce2-4cd1-8aad-49fafc735a15', N'toto2', N'eqrqr', 1, CAST(N'2025-07-01T15:59:53.4265168' AS DateTime2), CAST(N'2025-06-29T19:38:27.3719671' AS DateTime2), 0, 1, N'toto2', N'TOTO2', N'toto2@t.com', N'TOTO2@T.COM', 0, N'AQAAAAIAAYagAAAAEHgbjHikdRAU60+sqiwyop3TvM96J+hKP31QJGXLJ4QmKp9DeRro1fIqWnC+DPh8bw==', N'CZKE7LC5MEXSZFFDZADUWLQENK2WBMDK', N'5977b6cb-f7e9-4607-88ff-30f40e5ce1d7', NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [Address], [IsActive], [LastLogin], [CreatedDate], [IsDeleted], [IsSuspended], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'zeyadgebril176', N'From Extirnal login', 1, CAST(N'2025-07-06T14:24:10.7045123' AS DateTime2), CAST(N'2025-06-29T18:01:21.9694436' AS DateTime2), 0, 0, N'zeyadgebril176@gmail.com', N'ZEYADGEBRIL176@GMAIL.COM', N'zeyadgebril176@gmail.com', N'ZEYADGEBRIL176@GMAIL.COM', 0, NULL, N'QYXKAYMX2MJFQQC4VRRSAXSFBBZX5X2N', N'04944414-7405-43af-b677-e52f177612c9', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [Name], [Description], [ParentCategoryID], [isDeleted]) VALUES (1, N'Electronics', N'Devices and gadgets', NULL, 0)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description], [ParentCategoryID], [isDeleted]) VALUES (2, N'Laptops', N'Portable computers', 1, 0)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description], [ParentCategoryID], [isDeleted]) VALUES (3, N'Smartphones', N'Mobile phones', 1, 0)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description], [ParentCategoryID], [isDeleted]) VALUES (4, N'Accessories', N'Computer accessories', 1, 0)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description], [ParentCategoryID], [isDeleted]) VALUES (5, N'Furniture', N'Home and office furniture', NULL, 0)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description], [ParentCategoryID], [isDeleted]) VALUES (6, N'Chairs', N'Seating furniture', 5, 0)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description], [ParentCategoryID], [isDeleted]) VALUES (7, N'Tables', N'Table furniture', 5, 0)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description], [ParentCategoryID], [isDeleted]) VALUES (8, N'Kitchen', N'Kitchen items', NULL, 0)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description], [ParentCategoryID], [isDeleted]) VALUES (9, N'Decor', N'Decorative items', NULL, 0)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description], [ParentCategoryID], [isDeleted]) VALUES (10, N'Outdoor', N'Outdoor equipment', NULL, 0)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description], [ParentCategoryID], [isDeleted]) VALUES (11, N'Tech', N'techhh', NULL, 0)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description], [ParentCategoryID], [isDeleted]) VALUES (12, N'Electronics', N'tttt', NULL, 0)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[InventoryLocation] ON 

INSERT [dbo].[InventoryLocation] ([LocationID], [WarehouseID], [LocationCode], [Description], [IsActive], [isDeleted]) VALUES (1, 1, N'LOC1', N'Main bay', 1, 0)
INSERT [dbo].[InventoryLocation] ([LocationID], [WarehouseID], [LocationCode], [Description], [IsActive], [isDeleted]) VALUES (2, 2, N'LOC2', N'Secondary rack', 1, 0)
INSERT [dbo].[InventoryLocation] ([LocationID], [WarehouseID], [LocationCode], [Description], [IsActive], [isDeleted]) VALUES (3, 3, N'LOC3', N'Downtown zone', 1, 0)
INSERT [dbo].[InventoryLocation] ([LocationID], [WarehouseID], [LocationCode], [Description], [IsActive], [isDeleted]) VALUES (4, 4, N'LOC4', N'East section', 1, 0)
INSERT [dbo].[InventoryLocation] ([LocationID], [WarehouseID], [LocationCode], [Description], [IsActive], [isDeleted]) VALUES (5, 5, N'LOC5', N'West shelf', 1, 0)
INSERT [dbo].[InventoryLocation] ([LocationID], [WarehouseID], [LocationCode], [Description], [IsActive], [isDeleted]) VALUES (6, 6, N'LOC6', N'North area', 1, 0)
INSERT [dbo].[InventoryLocation] ([LocationID], [WarehouseID], [LocationCode], [Description], [IsActive], [isDeleted]) VALUES (7, 7, N'LOC7', N'South corner', 1, 0)
INSERT [dbo].[InventoryLocation] ([LocationID], [WarehouseID], [LocationCode], [Description], [IsActive], [isDeleted]) VALUES (8, 8, N'LOC8', N'Central aisle', 1, 0)
INSERT [dbo].[InventoryLocation] ([LocationID], [WarehouseID], [LocationCode], [Description], [IsActive], [isDeleted]) VALUES (9, 9, N'LOC9', N'Express rack', 1, 0)
INSERT [dbo].[InventoryLocation] ([LocationID], [WarehouseID], [LocationCode], [Description], [IsActive], [isDeleted]) VALUES (10, 10, N'LOC10', N'Overflow bay', 1, 0)
SET IDENTITY_INSERT [dbo].[InventoryLocation] OFF
GO
INSERT [dbo].[InventoryRecord] ([ProductId], [LocationId], [QuantityOnHand], [LastUpdated], [isDeleted]) VALUES (1, 1, 29, CAST(N'2025-07-06T17:20:25.413' AS DateTime), 0)
INSERT [dbo].[InventoryRecord] ([ProductId], [LocationId], [QuantityOnHand], [LastUpdated], [isDeleted]) VALUES (2, 2, 25, CAST(N'2025-06-30T21:47:23.960' AS DateTime), 0)
INSERT [dbo].[InventoryRecord] ([ProductId], [LocationId], [QuantityOnHand], [LastUpdated], [isDeleted]) VALUES (3, 3, 60, CAST(N'2025-06-30T21:47:23.960' AS DateTime), 0)
INSERT [dbo].[InventoryRecord] ([ProductId], [LocationId], [QuantityOnHand], [LastUpdated], [isDeleted]) VALUES (4, 4, 75, CAST(N'2025-06-30T21:47:23.960' AS DateTime), 0)
INSERT [dbo].[InventoryRecord] ([ProductId], [LocationId], [QuantityOnHand], [LastUpdated], [isDeleted]) VALUES (5, 5, 100, CAST(N'2025-06-30T21:47:23.960' AS DateTime), 0)
INSERT [dbo].[InventoryRecord] ([ProductId], [LocationId], [QuantityOnHand], [LastUpdated], [isDeleted]) VALUES (6, 6, 30, CAST(N'2025-06-30T21:47:23.960' AS DateTime), 0)
INSERT [dbo].[InventoryRecord] ([ProductId], [LocationId], [QuantityOnHand], [LastUpdated], [isDeleted]) VALUES (7, 7, 15, CAST(N'2025-06-30T21:47:23.960' AS DateTime), 0)
INSERT [dbo].[InventoryRecord] ([ProductId], [LocationId], [QuantityOnHand], [LastUpdated], [isDeleted]) VALUES (8, 8, 50, CAST(N'2025-06-30T21:47:23.960' AS DateTime), 0)
INSERT [dbo].[InventoryRecord] ([ProductId], [LocationId], [QuantityOnHand], [LastUpdated], [isDeleted]) VALUES (9, 9, 65, CAST(N'2025-06-30T21:47:23.960' AS DateTime), 0)
INSERT [dbo].[InventoryRecord] ([ProductId], [LocationId], [QuantityOnHand], [LastUpdated], [isDeleted]) VALUES (10, 10, 20, CAST(N'2025-06-30T21:47:23.960' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[InventoryTransaction] ON 

INSERT [dbo].[InventoryTransaction] ([TransactionID], [ProductID], [Quantity], [TransactionType], [FromLocationID], [ToLocationID], [TimeStamp], [UserID], [Notes], [isDeleted]) VALUES (5, 1, 12, N'IN', 1, NULL, CAST(N'2025-07-06T12:51:26.583' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[InventoryTransaction] ([TransactionID], [ProductID], [Quantity], [TransactionType], [FromLocationID], [ToLocationID], [TimeStamp], [UserID], [Notes], [isDeleted]) VALUES (6, 1, 10, N'IN', 1, NULL, CAST(N'2025-07-06T16:37:51.983' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[InventoryTransaction] ([TransactionID], [ProductID], [Quantity], [TransactionType], [FromLocationID], [ToLocationID], [TimeStamp], [UserID], [Notes], [isDeleted]) VALUES (7, 1, 10, N'IN', 1, NULL, CAST(N'2025-07-06T16:38:00.760' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[InventoryTransaction] ([TransactionID], [ProductID], [Quantity], [TransactionType], [FromLocationID], [ToLocationID], [TimeStamp], [UserID], [Notes], [isDeleted]) VALUES (8, 1, 60, N'OUT', 1, NULL, CAST(N'2025-07-06T16:38:08.580' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[InventoryTransaction] ([TransactionID], [ProductID], [Quantity], [TransactionType], [FromLocationID], [ToLocationID], [TimeStamp], [UserID], [Notes], [isDeleted]) VALUES (9, 1, 60, N'IN', 1, NULL, CAST(N'2025-07-06T16:42:09.633' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[InventoryTransaction] ([TransactionID], [ProductID], [Quantity], [TransactionType], [FromLocationID], [ToLocationID], [TimeStamp], [UserID], [Notes], [isDeleted]) VALUES (10, 1, 70, N'OUT', 1, NULL, CAST(N'2025-07-06T16:42:20.477' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[InventoryTransaction] ([TransactionID], [ProductID], [Quantity], [TransactionType], [FromLocationID], [ToLocationID], [TimeStamp], [UserID], [Notes], [isDeleted]) VALUES (11, 1, 2, N'OUT', 1, NULL, CAST(N'2025-07-06T16:42:26.310' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[InventoryTransaction] ([TransactionID], [ProductID], [Quantity], [TransactionType], [FromLocationID], [ToLocationID], [TimeStamp], [UserID], [Notes], [isDeleted]) VALUES (12, 1, 50, N'IN', 1, NULL, CAST(N'2025-07-06T16:42:45.437' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[InventoryTransaction] ([TransactionID], [ProductID], [Quantity], [TransactionType], [FromLocationID], [ToLocationID], [TimeStamp], [UserID], [Notes], [isDeleted]) VALUES (13, 1, 12, N'IN', 1, NULL, CAST(N'2025-07-06T17:20:20.517' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[InventoryTransaction] ([TransactionID], [ProductID], [Quantity], [TransactionType], [FromLocationID], [ToLocationID], [TimeStamp], [UserID], [Notes], [isDeleted]) VALUES (14, 1, 33, N'OUT', 1, NULL, CAST(N'2025-07-06T17:20:25.413' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[InventoryTransaction] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [Name], [Description], [AvailableStock], [Barcode], [CategoryId], [CurrentQuantity], [MinAvailableStock], [UnitPrice], [CostPrice], [Weight], [ImageURL], [IsActive], [CreatedDate], [LastUpdated], [IsDeleted]) VALUES (1, N'Laptop Z', N'High-end laptop', 50, N'BARCODE001', 2, 2, 5, CAST(1200.00 AS Decimal(10, 2)), CAST(900.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(10, 2)), N'/Image/14f1814c-ea78-4944-ab99-53bb14d5dd68_icon.ico', 1, CAST(N'2025-06-30T21:47:23.000' AS DateTime), CAST(N'2025-07-06T17:22:00.090' AS DateTime), 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [AvailableStock], [Barcode], [CategoryId], [CurrentQuantity], [MinAvailableStock], [UnitPrice], [CostPrice], [Weight], [ImageURL], [IsActive], [CreatedDate], [LastUpdated], [IsDeleted]) VALUES (2, N'Laptop B', N'Budget laptop', 30, N'BARCODE002', 2, 30, 5, CAST(700.00 AS Decimal(10, 2)), CAST(500.00 AS Decimal(10, 2)), CAST(2.20 AS Decimal(10, 2)), N'image2.jpg', 1, CAST(N'2025-06-30T21:47:23.710' AS DateTime), CAST(N'2025-06-30T21:47:23.710' AS DateTime), 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [AvailableStock], [Barcode], [CategoryId], [CurrentQuantity], [MinAvailableStock], [UnitPrice], [CostPrice], [Weight], [ImageURL], [IsActive], [CreatedDate], [LastUpdated], [IsDeleted]) VALUES (3, N'Smartphone X', N'Flagship phone', 80, N'BARCODE003', 3, 80, 10, CAST(999.99 AS Decimal(10, 2)), CAST(750.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), N'image3.jpg', 1, CAST(N'2025-06-30T21:47:23.710' AS DateTime), CAST(N'2025-06-30T21:47:23.710' AS DateTime), 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [AvailableStock], [Barcode], [CategoryId], [CurrentQuantity], [MinAvailableStock], [UnitPrice], [CostPrice], [Weight], [ImageURL], [IsActive], [CreatedDate], [LastUpdated], [IsDeleted]) VALUES (4, N'Smartphone Y', N'Mid-range phone', 100, N'BARCODE004', 3, 100, 10, CAST(599.99 AS Decimal(10, 2)), CAST(400.00 AS Decimal(10, 2)), CAST(0.28 AS Decimal(10, 2)), N'image4.jpg', 1, CAST(N'2025-06-30T21:47:23.710' AS DateTime), CAST(N'2025-06-30T21:47:23.710' AS DateTime), 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [AvailableStock], [Barcode], [CategoryId], [CurrentQuantity], [MinAvailableStock], [UnitPrice], [CostPrice], [Weight], [ImageURL], [IsActive], [CreatedDate], [LastUpdated], [IsDeleted]) VALUES (5, N'Mouse', N'Wireless mouse', 150, N'BARCODE005', 4, 150, 20, CAST(19.99 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), N'image5.jpg', 1, CAST(N'2025-06-30T21:47:23.710' AS DateTime), CAST(N'2025-06-30T21:47:23.710' AS DateTime), 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [AvailableStock], [Barcode], [CategoryId], [CurrentQuantity], [MinAvailableStock], [UnitPrice], [CostPrice], [Weight], [ImageURL], [IsActive], [CreatedDate], [LastUpdated], [IsDeleted]) VALUES (6, N'Office Chair', N'Ergonomic chair', 40, N'BARCODE006', 6, 40, 5, CAST(150.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), N'image6.jpg', 1, CAST(N'2025-06-30T21:47:23.710' AS DateTime), CAST(N'2025-06-30T21:47:23.710' AS DateTime), 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [AvailableStock], [Barcode], [CategoryId], [CurrentQuantity], [MinAvailableStock], [UnitPrice], [CostPrice], [Weight], [ImageURL], [IsActive], [CreatedDate], [LastUpdated], [IsDeleted]) VALUES (7, N'Dining Table', N'Wooden table', 20, N'BARCODE007', 7, 20, 2, CAST(300.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), CAST(30.00 AS Decimal(10, 2)), N'image7.jpg', 1, CAST(N'2025-06-30T21:47:23.710' AS DateTime), CAST(N'2025-06-30T21:47:23.710' AS DateTime), 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [AvailableStock], [Barcode], [CategoryId], [CurrentQuantity], [MinAvailableStock], [UnitPrice], [CostPrice], [Weight], [ImageURL], [IsActive], [CreatedDate], [LastUpdated], [IsDeleted]) VALUES (8, N'Blender', N'Kitchen blender', 60, N'BARCODE008', 8, 60, 10, CAST(49.99 AS Decimal(10, 2)), CAST(30.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), N'image8.jpg', 1, CAST(N'2025-06-30T21:47:23.710' AS DateTime), CAST(N'2025-06-30T21:47:23.710' AS DateTime), 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [AvailableStock], [Barcode], [CategoryId], [CurrentQuantity], [MinAvailableStock], [UnitPrice], [CostPrice], [Weight], [ImageURL], [IsActive], [CreatedDate], [LastUpdated], [IsDeleted]) VALUES (9, N'Vase', N'Ceramic vase', 80, N'BARCODE009', 9, 80, 10, CAST(24.99 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(10, 2)), N'image9.jpg', 1, CAST(N'2025-06-30T21:47:23.710' AS DateTime), CAST(N'2025-06-30T21:47:23.710' AS DateTime), 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [AvailableStock], [Barcode], [CategoryId], [CurrentQuantity], [MinAvailableStock], [UnitPrice], [CostPrice], [Weight], [ImageURL], [IsActive], [CreatedDate], [LastUpdated], [IsDeleted]) VALUES (10, N'Tent', N'Camping tent', 25, N'BARCODE010', 10, 25, 5, CAST(120.00 AS Decimal(10, 2)), CAST(80.00 AS Decimal(10, 2)), CAST(8.00 AS Decimal(10, 2)), N'image10.jpg', 1, CAST(N'2025-06-30T21:47:23.710' AS DateTime), CAST(N'2025-06-30T21:47:23.710' AS DateTime), 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [AvailableStock], [Barcode], [CategoryId], [CurrentQuantity], [MinAvailableStock], [UnitPrice], [CostPrice], [Weight], [ImageURL], [IsActive], [CreatedDate], [LastUpdated], [IsDeleted]) VALUES (11, N'Database', N'feasdf', 20, NULL, 6, 43, 10, CAST(40.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), N'/Image/4901709b-5c90-48f5-bb56-a63cb7cc63ff_wallpaper.jpg', 1, CAST(N'2025-07-06T16:45:17.393' AS DateTime), CAST(N'2025-07-06T16:45:17.393' AS DateTime), 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [AvailableStock], [Barcode], [CategoryId], [CurrentQuantity], [MinAvailableStock], [UnitPrice], [CostPrice], [Weight], [ImageURL], [IsActive], [CreatedDate], [LastUpdated], [IsDeleted]) VALUES (12, N'Database', N'feasdf', 20, NULL, 6, 43, 10, CAST(40.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), N'/Image/9ab3ae06-3638-436e-bacf-aedda82f887c_wallpaper.jpg', 1, CAST(N'2025-07-06T16:45:17.397' AS DateTime), CAST(N'2025-07-06T16:45:17.397' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([SupplierID], [Name], [Company], [Email], [Phone], [Address], [PaymentTerm], [IsActive], [Notes], [isDeleted]) VALUES (1, N'Supplier One', N'Company A', N'sup1@example.com', N'111-1111', N'Address A', N'Net 30', 1, N'Top rated', 1)
INSERT [dbo].[Supplier] ([SupplierID], [Name], [Company], [Email], [Phone], [Address], [PaymentTerm], [IsActive], [Notes], [isDeleted]) VALUES (2, N'Supplier Two', N'Company B', N'sup2@example.com', N'222-2222', N'Address B', N'Net 15', 1, N'Fast delivery', 0)
INSERT [dbo].[Supplier] ([SupplierID], [Name], [Company], [Email], [Phone], [Address], [PaymentTerm], [IsActive], [Notes], [isDeleted]) VALUES (3, N'Supplier Three', N'Company C', N'sup3@example.com', N'333-3333', N'Address C', N'COD', 1, N'', 0)
INSERT [dbo].[Supplier] ([SupplierID], [Name], [Company], [Email], [Phone], [Address], [PaymentTerm], [IsActive], [Notes], [isDeleted]) VALUES (4, N'Supplier Four', N'Company D', N'sup4@example.com', N'444-4444', N'Address D', N'Net 45', 1, N'Reliable', 0)
INSERT [dbo].[Supplier] ([SupplierID], [Name], [Company], [Email], [Phone], [Address], [PaymentTerm], [IsActive], [Notes], [isDeleted]) VALUES (5, N'Supplier Five', N'Company E', N'sup5@example.com', N'555-5555', N'Address E', N'Prepaid', 1, N'', 0)
INSERT [dbo].[Supplier] ([SupplierID], [Name], [Company], [Email], [Phone], [Address], [PaymentTerm], [IsActive], [Notes], [isDeleted]) VALUES (6, N'Supplier Six', N'Company F', N'sup6@example.com', N'666-6666', N'Address F', N'Net 30', 1, N'', 0)
INSERT [dbo].[Supplier] ([SupplierID], [Name], [Company], [Email], [Phone], [Address], [PaymentTerm], [IsActive], [Notes], [isDeleted]) VALUES (7, N'Supplier Seven', N'Company G', N'sup7@example.com', N'777-7777', N'Address G', N'Net 60', 1, N'', 0)
INSERT [dbo].[Supplier] ([SupplierID], [Name], [Company], [Email], [Phone], [Address], [PaymentTerm], [IsActive], [Notes], [isDeleted]) VALUES (8, N'Supplier Eight', N'Company H', N'sup8@example.com', N'888-8888', N'Address H', N'COD', 1, N'', 0)
INSERT [dbo].[Supplier] ([SupplierID], [Name], [Company], [Email], [Phone], [Address], [PaymentTerm], [IsActive], [Notes], [isDeleted]) VALUES (9, N'Supplier Nine', N'Company I', N'sup9@example.com', N'999-9999', N'Address I', N'Net 15', 1, N'', 0)
INSERT [dbo].[Supplier] ([SupplierID], [Name], [Company], [Email], [Phone], [Address], [PaymentTerm], [IsActive], [Notes], [isDeleted]) VALUES (10, N'Supplier Ten', N'Company J', N'sup10@example.com', N'000-0000', N'Address J', N'Net 30', 1, N'', 0)
INSERT [dbo].[Supplier] ([SupplierID], [Name], [Company], [Email], [Phone], [Address], [PaymentTerm], [IsActive], [Notes], [isDeleted]) VALUES (11, N'MVC', N'toto', N'toto2@t.com', N'0100111', N'123,asdf', NULL, NULL, NULL, NULL)
INSERT [dbo].[Supplier] ([SupplierID], [Name], [Company], [Email], [Phone], [Address], [PaymentTerm], [IsActive], [Notes], [isDeleted]) VALUES (12, N'f', N'eww', N'toto3@t.com', N'0100111', N'ew', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
INSERT [dbo].[Supplier_Product] ([ProductId], [SupplierID], [SupplierSKU], [LeadTimeDays], [UnitCost], [isDeleted]) VALUES (1, 1, N'SKU001', 5, CAST(880.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Supplier_Product] ([ProductId], [SupplierID], [SupplierSKU], [LeadTimeDays], [UnitCost], [isDeleted]) VALUES (2, 2, N'SKU002', 7, CAST(480.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Supplier_Product] ([ProductId], [SupplierID], [SupplierSKU], [LeadTimeDays], [UnitCost], [isDeleted]) VALUES (3, 3, N'SKU003', 4, CAST(720.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Supplier_Product] ([ProductId], [SupplierID], [SupplierSKU], [LeadTimeDays], [UnitCost], [isDeleted]) VALUES (4, 4, N'SKU004', 6, CAST(380.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Supplier_Product] ([ProductId], [SupplierID], [SupplierSKU], [LeadTimeDays], [UnitCost], [isDeleted]) VALUES (5, 5, N'SKU005', 3, CAST(9.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Supplier_Product] ([ProductId], [SupplierID], [SupplierSKU], [LeadTimeDays], [UnitCost], [isDeleted]) VALUES (6, 6, N'SKU006', 10, CAST(95.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Supplier_Product] ([ProductId], [SupplierID], [SupplierSKU], [LeadTimeDays], [UnitCost], [isDeleted]) VALUES (7, 7, N'SKU007', 12, CAST(190.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Supplier_Product] ([ProductId], [SupplierID], [SupplierSKU], [LeadTimeDays], [UnitCost], [isDeleted]) VALUES (8, 8, N'SKU008', 5, CAST(28.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Supplier_Product] ([ProductId], [SupplierID], [SupplierSKU], [LeadTimeDays], [UnitCost], [isDeleted]) VALUES (9, 9, N'SKU009', 2, CAST(13.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Supplier_Product] ([ProductId], [SupplierID], [SupplierSKU], [LeadTimeDays], [UnitCost], [isDeleted]) VALUES (10, 10, N'SKU010', 8, CAST(75.00 AS Decimal(10, 2)), 0)
GO
SET IDENTITY_INSERT [dbo].[UserLog] ON 

INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (12, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Register', CAST(N'2025-06-29T16:53:30.637' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (13, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-29T19:18:33.480' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (14, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Gooogle Account', CAST(N'2025-06-29T19:20:47.043' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (15, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Gooogle Account', CAST(N'2025-06-29T19:24:05.067' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (16, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Gooogle Account', CAST(N'2025-06-29T19:26:37.530' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (17, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Gooogle Account', CAST(N'2025-06-29T19:27:59.167' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (18, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Gooogle Account', CAST(N'2025-06-29T19:28:26.020' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (19, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Gooogle Account', CAST(N'2025-06-29T19:28:48.143' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (20, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Gooogle Account', CAST(N'2025-06-29T19:29:35.507' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (21, N'fcfb2327-826b-45f9-ba5a-94e4da7fa708', N'Register', CAST(N'2025-06-29T19:33:15.217' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (22, N'ebf470ec-bce2-4cd1-8aad-49fafc735a15', N'Register', CAST(N'2025-06-29T19:38:28.077' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (23, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-29T19:51:28.283' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (24, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-29T19:56:01.130' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (25, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Gooogle Account', CAST(N'2025-06-29T19:59:04.447' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (26, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Gooogle Account', CAST(N'2025-06-29T20:02:21.040' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (27, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Gooogle Account', CAST(N'2025-06-29T20:03:17.167' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (28, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Gooogle Account', CAST(N'2025-06-29T20:04:59.110' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (29, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Gooogle Account', CAST(N'2025-06-29T20:06:56.307' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (30, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Gooogle Account', CAST(N'2025-06-29T20:08:18.217' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (31, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Gooogle Account', CAST(N'2025-06-29T20:09:00.747' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (32, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Gooogle Account', CAST(N'2025-06-29T20:15:44.593' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (33, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-29T20:16:56.060' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (34, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Gooogle Account', CAST(N'2025-06-29T20:17:06.023' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (35, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Google Account', CAST(N'2025-06-30T13:02:52.560' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (36, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Google Account', CAST(N'2025-06-30T13:04:34.753' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (37, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T13:07:35.877' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (38, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Google Account', CAST(N'2025-06-30T13:11:23.127' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (39, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Google Account', CAST(N'2025-06-30T13:18:11.397' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (40, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Google Account', CAST(N'2025-06-30T13:31:15.680' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (41, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T13:54:29.583' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (42, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T14:24:58.287' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (43, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T14:26:35.300' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (44, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T14:28:02.977' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (45, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T14:28:16.473' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (46, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T14:29:03.303' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (47, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T14:31:22.810' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (48, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T14:32:41.250' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (49, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T14:34:12.750' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (50, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T14:35:05.930' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (51, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T14:35:28.240' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (52, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T14:37:26.623' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (53, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T14:38:19.327' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (54, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T14:41:35.910' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (55, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T14:42:07.647' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (56, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T14:43:33.650' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (57, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T14:44:41.290' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (58, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T14:46:14.977' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (59, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T14:50:07.897' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (60, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T14:52:17.890' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (61, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T14:53:41.373' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (62, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T14:55:50.633' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (63, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T14:57:01.450' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (64, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T14:59:38.380' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (65, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T15:06:23.457' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (66, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T15:07:10.517' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (67, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T15:07:40.653' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (68, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T15:12:21.990' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (69, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T15:12:41.113' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (70, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T15:14:32.710' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (71, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T15:15:55.980' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (72, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T15:16:50.897' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (73, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T15:17:04.307' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (74, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T15:19:05.707' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (75, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T15:23:15.070' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (76, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T15:25:15.597' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (77, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T15:33:11.483' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (78, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T15:34:14.957' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (79, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T15:36:23.803' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (80, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T15:41:18.830' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (81, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T18:27:22.927' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (83, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T18:28:07.093' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (85, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T18:29:26.193' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (86, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-06-30T18:30:03.300' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (87, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-07-01T15:43:37.350' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (88, N'ebf470ec-bce2-4cd1-8aad-49fafc735a15', N'Login', CAST(N'2025-07-01T15:58:28.843' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (89, N'ebf470ec-bce2-4cd1-8aad-49fafc735a15', N'Login', CAST(N'2025-07-01T15:59:53.427' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (90, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-07-01T20:56:39.920' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (91, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-07-01T20:56:39.920' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1090, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-07-02T05:53:34.653' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1091, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-07-02T05:58:09.450' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1092, N'099428d6-3841-49f7-85c1-e6325076c6a4', N'Register', CAST(N'2025-07-02T05:58:51.673' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1093, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-07-02T05:59:09.700' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1094, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-07-02T06:02:49.150' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1095, N'419457de-c74a-4ceb-989f-4a500fa07eca', N'Register', CAST(N'2025-07-02T06:03:23.300' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1096, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-07-02T06:03:39.910' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1097, N'1019c21b-c040-4656-aa42-ee67eff165b2', N'Register', CAST(N'2025-07-02T06:11:46.943' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1098, N'1019c21b-c040-4656-aa42-ee67eff165b2', N'Login', CAST(N'2025-07-02T06:22:46.690' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1099, N'e9da3a4d-a7e3-4cb1-b714-4a7b8c31aa36', N'Register', CAST(N'2025-07-02T12:43:57.790' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1100, N'1019c21b-c040-4656-aa42-ee67eff165b2', N'Login', CAST(N'2025-07-02T15:26:06.470' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1101, N'1019c21b-c040-4656-aa42-ee67eff165b2', N'Login', CAST(N'2025-07-02T17:05:40.917' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1102, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-07-02T21:39:50.443' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1103, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-07-02T23:11:02.340' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1104, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-07-02T23:11:02.910' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1105, N'b44ffbaf-0c6d-4937-8652-71a2a8d97605', N'Register', CAST(N'2025-07-03T09:24:06.133' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1106, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Google Account', CAST(N'2025-07-03T15:09:44.747' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1107, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Google Account', CAST(N'2025-07-03T15:11:00.453' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1108, N'099428d6-3841-49f7-85c1-e6325076c6a4', N'Login', CAST(N'2025-07-03T15:21:12.540' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1109, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Google Account', CAST(N'2025-07-03T15:21:45.870' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1110, N'099428d6-3841-49f7-85c1-e6325076c6a4', N'Login', CAST(N'2025-07-03T15:26:12.443' AS DateTime), N'NO')
GO
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1111, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Google Account', CAST(N'2025-07-03T15:26:27.977' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1112, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-07-03T16:01:19.053' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1113, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Google Account', CAST(N'2025-07-03T20:09:44.147' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1114, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Google Account', CAST(N'2025-07-03T20:10:28.160' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1115, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Google Account', CAST(N'2025-07-04T12:26:46.400' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1116, N'c4a9fb17-ec17-44a9-b4ad-113cd4d0f8b3', N'Register', CAST(N'2025-07-04T12:32:17.043' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1117, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Google Account', CAST(N'2025-07-04T12:32:41.653' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1118, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Google Account', CAST(N'2025-07-04T12:56:36.053' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1119, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-07-05T16:21:54.567' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1120, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-07-05T16:31:07.247' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1121, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-07-05T17:03:22.863' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1122, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-07-05T17:03:35.490' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1123, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Google Account', CAST(N'2025-07-05T17:04:18.517' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1124, N'419457de-c74a-4ceb-989f-4a500fa07eca', N'Login', CAST(N'2025-07-05T18:06:14.753' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1125, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Google Account', CAST(N'2025-07-05T18:41:41.797' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1126, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Google Account', CAST(N'2025-07-06T06:02:25.080' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1127, N'419457de-c74a-4ceb-989f-4a500fa07eca', N'Login', CAST(N'2025-07-06T06:02:40.330' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1128, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Google Account', CAST(N'2025-07-06T06:12:39.387' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1129, N'419457de-c74a-4ceb-989f-4a500fa07eca', N'Login', CAST(N'2025-07-06T06:23:20.997' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1130, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Google Account', CAST(N'2025-07-06T06:42:50.147' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1131, N'1019c21b-c040-4656-aa42-ee67eff165b2', N'Login', CAST(N'2025-07-06T06:44:03.320' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1132, N'1019c21b-c040-4656-aa42-ee67eff165b2', N'Login', CAST(N'2025-07-06T12:31:07.643' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1133, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Google Account', CAST(N'2025-07-06T13:09:59.603' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1134, N'1019c21b-c040-4656-aa42-ee67eff165b2', N'Login', CAST(N'2025-07-06T13:12:04.803' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1135, N'1019c21b-c040-4656-aa42-ee67eff165b2', N'Login', CAST(N'2025-07-06T13:30:38.850' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1136, N'1019c21b-c040-4656-aa42-ee67eff165b2', N'Login', CAST(N'2025-07-06T14:05:08.410' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1137, N'1019c21b-c040-4656-aa42-ee67eff165b2', N'Login', CAST(N'2025-07-06T14:14:34.807' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1138, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Google Account', CAST(N'2025-07-06T14:15:15.517' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1139, N'00aa711a-c80a-418d-a03f-5a102f03a288', N'Register', CAST(N'2025-07-06T14:17:18.350' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1140, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-07-06T14:18:56.023' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1141, N'419457de-c74a-4ceb-989f-4a500fa07eca', N'Login', CAST(N'2025-07-06T14:19:14.127' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1142, N'419457de-c74a-4ceb-989f-4a500fa07eca', N'Login', CAST(N'2025-07-06T14:19:49.990' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1143, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-07-06T14:23:13.517' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1144, N'18809662-0e6c-4f13-904d-2af9d42024f0', N'Login', CAST(N'2025-07-06T14:23:26.037' AS DateTime), N'NO')
INSERT [dbo].[UserLog] ([LogID], [UserID], [ActionType], [TimeStamp], [AdditionalInfo]) VALUES (1145, N'f3caed2a-b224-464a-a0e9-19b046ec8e96', N'Google Account', CAST(N'2025-07-06T14:24:10.703' AS DateTime), N'NO')
SET IDENTITY_INSERT [dbo].[UserLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Warehouse] ON 

INSERT [dbo].[Warehouse] ([WarehouseID], [Name], [Location], [ContactPhone], [Capacity], [IsActive], [isDeleted]) VALUES (1, N'Main Warehouse', N'123 Main St', N'111-2222', 10000, 1, 1)
INSERT [dbo].[Warehouse] ([WarehouseID], [Name], [Location], [ContactPhone], [Capacity], [IsActive], [isDeleted]) VALUES (2, N'Secondary Warehouse', N'456 Elm St', N'222-3333', 8000, 1, 0)
INSERT [dbo].[Warehouse] ([WarehouseID], [Name], [Location], [ContactPhone], [Capacity], [IsActive], [isDeleted]) VALUES (3, N'Downtown Storage', N'789 Oak St', N'333-4444', 5000, 1, 0)
INSERT [dbo].[Warehouse] ([WarehouseID], [Name], [Location], [ContactPhone], [Capacity], [IsActive], [isDeleted]) VALUES (4, N'East Side Depot', N'101 Pine St', N'444-5555', 7000, 1, 0)
INSERT [dbo].[Warehouse] ([WarehouseID], [Name], [Location], [ContactPhone], [Capacity], [IsActive], [isDeleted]) VALUES (5, N'West Side Hub', N'202 Maple St', N'555-6666', 6000, 1, 0)
INSERT [dbo].[Warehouse] ([WarehouseID], [Name], [Location], [ContactPhone], [Capacity], [IsActive], [isDeleted]) VALUES (6, N'North Warehouse', N'303 Birch St', N'666-7777', 4000, 1, 0)
INSERT [dbo].[Warehouse] ([WarehouseID], [Name], [Location], [ContactPhone], [Capacity], [IsActive], [isDeleted]) VALUES (7, N'South Warehouse', N'404 Cedar St', N'777-8888', 4500, 1, 0)
INSERT [dbo].[Warehouse] ([WarehouseID], [Name], [Location], [ContactPhone], [Capacity], [IsActive], [isDeleted]) VALUES (8, N'Central Storage', N'505 Walnut St', N'888-9999', 5500, 1, 0)
INSERT [dbo].[Warehouse] ([WarehouseID], [Name], [Location], [ContactPhone], [Capacity], [IsActive], [isDeleted]) VALUES (9, N'Express Depotyyyyyyyyy', N'606 Ash Stbjgvjcfgh', N'99657567567', NULL, NULL, NULL)
INSERT [dbo].[Warehouse] ([WarehouseID], [Name], [Location], [ContactPhone], [Capacity], [IsActive], [isDeleted]) VALUES (10, N'Overflow Hub', N'707 Cherry St', N'000-1111', 2000, 1, 0)
INSERT [dbo].[Warehouse] ([WarehouseID], [Name], [Location], [ContactPhone], [Capacity], [IsActive], [isDeleted]) VALUES (11, N'MVC', N'Cairo', N'0100111', NULL, NULL, NULL)
INSERT [dbo].[Warehouse] ([WarehouseID], [Name], [Location], [ContactPhone], [Capacity], [IsActive], [isDeleted]) VALUES (12, N'Zeyad', N'Mansoura', N'0100111', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Warehouse] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 7/6/2025 6:24:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 7/6/2025 6:24:53 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 7/6/2025 6:24:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 7/6/2025 6:24:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 7/6/2025 6:24:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 7/6/2025 6:24:53 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 7/6/2025 6:24:53 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Category_ParentCategoryID]    Script Date: 7/6/2025 6:24:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_Category_ParentCategoryID] ON [dbo].[Category]
(
	[ParentCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryLocation_WarehouseID]    Script Date: 7/6/2025 6:24:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryLocation_WarehouseID] ON [dbo].[InventoryLocation]
(
	[WarehouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryRecord_LocationId]    Script Date: 7/6/2025 6:24:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryRecord_LocationId] ON [dbo].[InventoryRecord]
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryTransaction_FromLocationID]    Script Date: 7/6/2025 6:24:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryTransaction_FromLocationID] ON [dbo].[InventoryTransaction]
(
	[FromLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryTransaction_ProductID]    Script Date: 7/6/2025 6:24:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryTransaction_ProductID] ON [dbo].[InventoryTransaction]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_InventoryTransaction_ToLocationID]    Script Date: 7/6/2025 6:24:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryTransaction_ToLocationID] ON [dbo].[InventoryTransaction]
(
	[ToLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_InventoryTransaction_UserID]    Script Date: 7/6/2025 6:24:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryTransaction_UserID] ON [dbo].[InventoryTransaction]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_CategoryId]    Script Date: 7/6/2025 6:24:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_Product_CategoryId] ON [dbo].[Product]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductHistory_ProductID]    Script Date: 7/6/2025 6:24:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductHistory_ProductID] ON [dbo].[ProductHistory]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ProductHistory_UserID]    Script Date: 7/6/2025 6:24:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductHistory_UserID] ON [dbo].[ProductHistory]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Return_OriginalTransactionID]    Script Date: 7/6/2025 6:24:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_Return_OriginalTransactionID] ON [dbo].[Return]
(
	[OriginalTransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Return_ProductID]    Script Date: 7/6/2025 6:24:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_Return_ProductID] ON [dbo].[Return]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Supplier_Product_SupplierID]    Script Date: 7/6/2025 6:24:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_Supplier_Product_SupplierID] ON [dbo].[Supplier_Product]
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT (CONVERT([bit],(0))) FOR [isDeleted]
GO
ALTER TABLE [dbo].[InventoryRecord] ADD  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[InventoryTransaction] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProductHistory] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[Return] ADD  DEFAULT (getdate()) FOR [ReturnDate]
GO
ALTER TABLE [dbo].[Supplier_Product] ADD  DEFAULT ((0)) FOR [LeadTimeDays]
GO
ALTER TABLE [dbo].[UserLog] ADD  DEFAULT (getdate()) FOR [TimeStamp]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_ParentCategory] FOREIGN KEY([ParentCategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_ParentCategory]
GO
ALTER TABLE [dbo].[InventoryLocation]  WITH CHECK ADD  CONSTRAINT [FK_InventoryLocation_Warehouse] FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[Warehouse] ([WarehouseID])
GO
ALTER TABLE [dbo].[InventoryLocation] CHECK CONSTRAINT [FK_InventoryLocation_Warehouse]
GO
ALTER TABLE [dbo].[InventoryRecord]  WITH CHECK ADD  CONSTRAINT [FK_InventoryRecord_Location] FOREIGN KEY([LocationId])
REFERENCES [dbo].[InventoryLocation] ([LocationID])
GO
ALTER TABLE [dbo].[InventoryRecord] CHECK CONSTRAINT [FK_InventoryRecord_Location]
GO
ALTER TABLE [dbo].[InventoryRecord]  WITH CHECK ADD  CONSTRAINT [FK_InventoryRecord_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[InventoryRecord] CHECK CONSTRAINT [FK_InventoryRecord_Product]
GO
ALTER TABLE [dbo].[InventoryTransaction]  WITH CHECK ADD  CONSTRAINT [FK_InventoryTransaction_AspNetUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[InventoryTransaction] CHECK CONSTRAINT [FK_InventoryTransaction_AspNetUsers_UserID]
GO
ALTER TABLE [dbo].[InventoryTransaction]  WITH CHECK ADD  CONSTRAINT [FK_InventoryTransaction_FromLocation] FOREIGN KEY([FromLocationID])
REFERENCES [dbo].[InventoryLocation] ([LocationID])
GO
ALTER TABLE [dbo].[InventoryTransaction] CHECK CONSTRAINT [FK_InventoryTransaction_FromLocation]
GO
ALTER TABLE [dbo].[InventoryTransaction]  WITH CHECK ADD  CONSTRAINT [FK_InventoryTransaction_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[InventoryTransaction] CHECK CONSTRAINT [FK_InventoryTransaction_Product]
GO
ALTER TABLE [dbo].[InventoryTransaction]  WITH CHECK ADD  CONSTRAINT [FK_InventoryTransaction_ToLocation] FOREIGN KEY([ToLocationID])
REFERENCES [dbo].[InventoryLocation] ([LocationID])
GO
ALTER TABLE [dbo].[InventoryTransaction] CHECK CONSTRAINT [FK_InventoryTransaction_ToLocation]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[ProductHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductHistory_AspNetUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ProductHistory] CHECK CONSTRAINT [FK_ProductHistory_AspNetUsers_UserID]
GO
ALTER TABLE [dbo].[ProductHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductHistory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductHistory] CHECK CONSTRAINT [FK_ProductHistory_Product]
GO
ALTER TABLE [dbo].[Return]  WITH CHECK ADD  CONSTRAINT [FK_Return_InventoryTransaction] FOREIGN KEY([OriginalTransactionID])
REFERENCES [dbo].[InventoryTransaction] ([TransactionID])
GO
ALTER TABLE [dbo].[Return] CHECK CONSTRAINT [FK_Return_InventoryTransaction]
GO
ALTER TABLE [dbo].[Return]  WITH CHECK ADD  CONSTRAINT [FK_Return_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Return] CHECK CONSTRAINT [FK_Return_Product]
GO
ALTER TABLE [dbo].[Supplier_Product]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Product_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Supplier_Product] CHECK CONSTRAINT [FK_Supplier_Product_Product]
GO
ALTER TABLE [dbo].[Supplier_Product]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Product_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[Supplier_Product] CHECK CONSTRAINT [FK_Supplier_Product_Supplier]
GO
USE [master]
GO
ALTER DATABASE [MVCTesting] SET  READ_WRITE 
GO
