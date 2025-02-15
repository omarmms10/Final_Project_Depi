USE [master]
GO
/****** Object:  Database [KidProgrammingDB]    Script Date: 10/16/2024 8:06:30 PM ******/
CREATE DATABASE [KidProgrammingDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KidProgrammingDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\KidProgrammingDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KidProgrammingDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\KidProgrammingDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [KidProgrammingDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KidProgrammingDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KidProgrammingDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KidProgrammingDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KidProgrammingDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KidProgrammingDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KidProgrammingDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [KidProgrammingDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KidProgrammingDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KidProgrammingDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KidProgrammingDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KidProgrammingDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KidProgrammingDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KidProgrammingDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KidProgrammingDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KidProgrammingDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KidProgrammingDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [KidProgrammingDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KidProgrammingDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KidProgrammingDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KidProgrammingDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KidProgrammingDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KidProgrammingDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KidProgrammingDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KidProgrammingDB] SET RECOVERY FULL 
GO
ALTER DATABASE [KidProgrammingDB] SET  MULTI_USER 
GO
ALTER DATABASE [KidProgrammingDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KidProgrammingDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KidProgrammingDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KidProgrammingDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KidProgrammingDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'KidProgrammingDB', N'ON'
GO
ALTER DATABASE [KidProgrammingDB] SET QUERY_STORE = OFF
GO
USE [KidProgrammingDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [KidProgrammingDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/16/2024 8:06:30 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Achievements]    Script Date: 10/16/2024 8:06:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Achievements](
	[AchievementID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[BadgeImagePath] [nvarchar](255) NULL,
 CONSTRAINT [PK_Achievements] PRIMARY KEY CLUSTERED 
(
	[AchievementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 10/16/2024 8:06:30 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/16/2024 8:06:30 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/16/2024 8:06:31 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/16/2024 8:06:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/16/2024 8:06:31 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/16/2024 8:06:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 10/16/2024 8:06:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 10/16/2024 8:06:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](450) NOT NULL,
	[TutorialID] [int] NOT NULL,
	[FeedbackText] [nvarchar](max) NULL,
	[Rating] [int] NULL,
	[SubmittedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Progress]    Script Date: 10/16/2024 8:06:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Progress](
	[ProgressID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](450) NOT NULL,
	[TutorialID] [int] NOT NULL,
	[CurrentStep] [int] NULL,
	[Completed] [bit] NULL,
	[StartedDate] [datetime] NULL,
	[CompletedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProgressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/16/2024 8:06:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/16/2024 8:06:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TutorialContent]    Script Date: 10/16/2024 8:06:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TutorialContent](
	[ContentID] [int] IDENTITY(1,1) NOT NULL,
	[TutorialID] [int] NULL,
	[ContentText] [nvarchar](max) NULL,
	[MediaURL] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tutorials]    Script Date: 10/16/2024 8:06:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutorials](
	[TutorialID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Level] [nvarchar](50) NULL,
	[Duration] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[ImagePath] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[TutorialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 10/16/2024 8:06:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
	[Age] [int] NULL,
	[DateJoined] [datetime2](7) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserAchievements]    Script Date: 10/16/2024 8:06:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAchievements](
	[UserAchievementID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](450) NOT NULL,
	[AchievementID] [int] NOT NULL,
	[EarnedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserAchievementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 10/16/2024 8:06:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserRoleId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 10/16/2024 8:06:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[RoleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/16/2024 8:06:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[Age] [int] NULL,
	[DateJoined] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241009003718_InitialMigration', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241010193146_AddCurrentStepToProgress', N'8.0.10')
SET IDENTITY_INSERT [dbo].[Achievements] ON 

INSERT [dbo].[Achievements] ([AchievementID], [Title], [Description], [CreatedDate], [BadgeImagePath]) VALUES (1, N'Pro Kid Award', N'Awarded for completing 2 tutorials', CAST(N'2024-10-12T17:11:46.160' AS DateTime), N'ProKid.png')
INSERT [dbo].[Achievements] ([AchievementID], [Title], [Description], [CreatedDate], [BadgeImagePath]) VALUES (2, N'Hero Kid Award', N'Awarded for completing 4 tutorials', CAST(N'2024-10-12T17:11:46.167' AS DateTime), N'Hero.png')
INSERT [dbo].[Achievements] ([AchievementID], [Title], [Description], [CreatedDate], [BadgeImagePath]) VALUES (3, N'Super Grasping & Memory Power Kid Award', N'Awarded for completing 6 tutorials', CAST(N'2024-10-12T17:11:46.167' AS DateTime), N'SuperMemory.png')
INSERT [dbo].[Achievements] ([AchievementID], [Title], [Description], [CreatedDate], [BadgeImagePath]) VALUES (4, N'Incredible Memory Power Award', N'Awarded for completing 8 tutorials', CAST(N'2024-10-12T17:11:46.167' AS DateTime), N'IncredibleMemory.png')
INSERT [dbo].[Achievements] ([AchievementID], [Title], [Description], [CreatedDate], [BadgeImagePath]) VALUES (5, N'Brilliant Kid Award', N'Awarded for completing 10 tutorials', CAST(N'2024-10-12T17:11:46.167' AS DateTime), N'Brilliant.png')
INSERT [dbo].[Achievements] ([AchievementID], [Title], [Description], [CreatedDate], [BadgeImagePath]) VALUES (6, N'Youngest Master of G.K. Award', N'Awarded for completing 12 tutorials', CAST(N'2024-10-12T17:11:46.167' AS DateTime), N'Master.png')
INSERT [dbo].[Achievements] ([AchievementID], [Title], [Description], [CreatedDate], [BadgeImagePath]) VALUES (7, N'Multi-Talented Award', N'Awarded for completing 14 tutorials', CAST(N'2024-10-12T17:11:46.167' AS DateTime), N'MultiTask.png')
INSERT [dbo].[Achievements] ([AchievementID], [Title], [Description], [CreatedDate], [BadgeImagePath]) VALUES (8, N'Multi-Talented Renowned Award', N'Awarded for completing 16 tutorials', CAST(N'2024-10-12T17:11:46.167' AS DateTime), N'Top.png')
SET IDENTITY_INSERT [dbo].[Achievements] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'067dc2ee-b93a-4cb9-8dbf-a3f983889ed7', N'Admin', N'ADMIN', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'f354abc3-2f8f-4dbc-ac8d-619ca49f5d18', N'Parent', N'PARENT', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'f3812d38-3018-4ab9-8dd6-6aad9ad7b509', N'Kid', N'KID', NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f1286c34-3661-4c65-8266-733469423cd7', N'067dc2ee-b93a-4cb9-8dbf-a3f983889ed7')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1c977ee3-4f31-427e-98b0-12684bbd4a6e', N'f3812d38-3018-4ab9-8dd6-6aad9ad7b509')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3e394ec8-977c-4f18-912d-8609cd388ad1', N'f3812d38-3018-4ab9-8dd6-6aad9ad7b509')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c9076491-9d8e-4b59-8bac-165ae2724ba3', N'f3812d38-3018-4ab9-8dd6-6aad9ad7b509')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'12b27945-00f5-4e5d-bd76-ff6bb8f8e130', N'omaradrrrrlymms@gmail.com', N'OMARADRRRRLYMMS@GMAIL.COM', N'omaradrrrrlymms@gmail.com', N'OMARADRRRRLYMMS@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEBv7NE1fgmvlIq3A5Rcj1hAHSqoDZotoQUyO8EuW+l5sxBU77p+mQikvowuTjKnP3w==', N'OETZSOVGE3NLN4TDUVJYEGVMCVNBLDEM', N'f805464d-32e9-469c-a316-ffa8c8c859d7', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'149b4f52-de7d-4189-b5fb-480c313b7853', N'mostafafire2075@yahoo.com', N'MOSTAFAFIRE2075@YAHOO.COM', N'mostafafire2075@yahoo.com', N'MOSTAFAFIRE2075@YAHOO.COM', 0, N'AQAAAAIAAYagAAAAEIvjwcQEGdBjcCfn8dUZk6WNjm5PZGc7pTI9R+wTPoJb1MDuaYZrPTPrAFhLLzh3Tw==', N'IE5S2OPAMCOMPC3WRYBDE2FJS5OA45E4', N'9351bd3c-7bac-4f4c-80cb-89e55b156862', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'18b8e25a-ce4b-4ba7-8535-0269df0b8447', N'mostafax2424@yahoo.com', N'MOSTAFAX2424@YAHOO.COM', N'mostafax2424@yahoo.com', N'MOSTAFAX2424@YAHOO.COM', 0, N'AQAAAAIAAYagAAAAENSk5qH20lczuCzR9FSOOhN1TIhx1ziuBzFwp4ibCcQrvOLteYPziWYtG0VoVcCWXA==', N'6P2WYLLJ3UYR4KHIPLJOUHIRY7HPFDI3', N'93bf466e-5842-4053-860d-63e59f96d824', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1c977ee3-4f31-427e-98b0-12684bbd4a6e', N'mostafaelhadidy442@gmail.com', N'MOSTAFAELHADIDY442@GMAIL.COM', N'mostafaelhadidy442@gmail.com', N'MOSTAFAELHADIDY442@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEFy+Jcjji9lUJUsl0QxglBUpcA9cvvZNI21eCtuNBlGq4IQZGLYX7A6xvcZL/WleXA==', N'LH7JQNZ2H7VCHSZVVGGMCHOUN45CJJK5', N'7f07d17f-8a85-4692-978c-815c755235b3', N'01554893259', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'38720ddf-bdb6-47c6-be55-07e26e359253', N'mostafaaa2322@gmail.com', N'MOSTAFAAA2322@GMAIL.COM', N'mostafaaa2322@gmail.com', N'MOSTAFAAA2322@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAENEWkH1GVOCJcD/ADFCOahuWEkjVdui8funfug4MAwaa7PET5YK+v1e3jo8SirLcEA==', N'F7NK5IDJ7JD36XLNOY4S2RHSGMPA4SLD', N'9e82e0f2-0063-4999-b066-ec8836291bcf', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3e394ec8-977c-4f18-912d-8609cd388ad1', N'dremyolok2322@gmail.com', N'DREMYOLOK2322@GMAIL.COM', N'dremyolok2322@gmail.com', N'DREMYOLOK2322@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEAreo1L7Q3i15XXwvV4Oj/LxsFt1u3caBDRVZIbotJCLH7Fx9yj6p3KNp35eFHuiIw==', N'ZDJV3OPDE2UXZGP2N6LTCRRQA6SWHX3Q', N'e946dafe-8678-444d-9c60-d914b7f777c5', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'4acfe33d-c417-41cd-98a6-a23eb410f42b', N'omaradlymms@gmail.com', N'OMARADLYMMS@GMAIL.COM', N'omaradlymms@gmail.com', N'OMARADLYMMS@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAENV6SakNPwbLPPtK+khlOdlJG4ZwL+CzGQ3CJW5gk+jfJezhIvenbBROs0Q+7hDHsw==', N'AKNES5LJ37FF5U7SSUIL2NOBZ5KLX3FT', N'c9266bbb-90b3-4c6b-a613-754e3d4750ba', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'4b9d9af6-f9e9-416a-bb6d-2b8b862d7132', N'omaradlym11ms@gmail.com', N'OMARADLYM11MS@GMAIL.COM', N'omaradlym11ms@gmail.com', N'OMARADLYM11MS@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEMNaIE1JYkJ4KiX/a7MtjbH4vHbvw7eta/tvEmngx5rGBImyQ7LxkUMywnyt9Qa2Mw==', N'NHIDX4T3SXPRMXJMRIERZC6T4PJHVTO5', N'10681e1d-5144-4a9e-8bf3-40cec93ac056', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'4fb465c8-cdc1-47c6-b33e-03c9b9c1ba33', N'omaradlms@gmail.com', N'OMARADLMS@GMAIL.COM', N'omaradlms@gmail.com', N'OMARADLMS@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEHgvYyH+SeUsj/UQ8ow18ISoyhN2O6NCyh2/nP/hF5X3LoV0AFPxLmmbj0qotI+/Aw==', N'ZSJIFA5PQRETREJ3BCUW5XKCWFZSKC4C', N'8995f7d8-2ec0-4a31-93ef-52fc3a8ed376', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'51bc8e2b-4509-4985-906f-d65f021e98cf', N'mostafafire2085@gmail.com', N'MOSTAFAFIRE2085@GMAIL.COM', N'mostafafire2085@gmail.com', N'MOSTAFAFIRE2085@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEDr37eOl2HFvEKSMv6gSJUSTbrMCqAZB63xFpacwmkar808Y/ohsFznkrpafyGVJEQ==', N'E5X3IJWU45RYCYWK44TFQFOPJGMKTO6Q', N'94081291-99cd-4c79-a261-386933ff28ed', N'01554893259', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'9235199e-ede4-416f-a984-3ebffd47ae5e', N'omaradlymdrms@gmail.com', N'OMARADLYMDRMS@GMAIL.COM', N'omaradlymdrms@gmail.com', N'OMARADLYMDRMS@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEE3abDRxNN8gnCQxDmw+BMEcfwqFrrEGk/SCZTdd9pgJ7OLwqMzXEClFSVgmhw9jqw==', N'EP5KFSZIJNS4UMGJDQXY6MGH52APX6YP', N'8632c9c6-9c10-4ca9-a568-e49138fc3572', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'afdd449b-8791-4f1a-b224-028836afba45', N'lionelMessi@gmail.com', N'LIONELMESSI@GMAIL.COM', N'lionelMessi@gmail.com', N'LIONELMESSI@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAELIO0RVXMCVVvz3AVgyxRkKByFS28K6/iK4qLLQlXS6s4t+pfvxL0AS8pZqqXT0Kfw==', N'AIUESBHXOMX4UF7SOLCK37OVHI2AQMVC', N'fddf9c99-dd53-464f-a75c-719de8ffc995', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'b53abe1e-540a-4386-bae5-a92d74faac58', N'oooomaradlymms@gmail.com', N'OOOOMARADLYMMS@GMAIL.COM', N'oooomaradlymms@gmail.com', N'OOOOMARADLYMMS@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEODlu50fp0MBzjkc3G2NxeBBhLyAoh41/BKUulA8Eu5aNG9l01I6WVNnu+SMiA7WsQ==', N'MRFQPX4VLOPDDHVJEA3YSST4Z6OLU6DN', N'ff19bf76-7faf-46e7-9476-bb6fcdd55093', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'bbda0106-f48a-4a6d-a3bb-e31987256275', N'sasa23232@gmail.com', N'SASA23232@GMAIL.COM', N'sasa23232@gmail.com', N'SASA23232@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEOQYUx3i5yTV6IYz9yXHJ3R+Jo6eddzTMZwp8UxZsvU3l3AqoBwnGyJ6pip7rQRk3g==', N'IHGGBGTGOWYN4XKSSSAHRYW7QVFGGBVX', N'a9e46e7c-2f2b-42ce-8eba-b333ea1c089d', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'bd386581-f6d5-4fb9-ba52-94b60991103f', N'omaradlymms34444@gmail.com', N'OMARADLYMMS34444@GMAIL.COM', N'omaradlymms34444@gmail.com', N'OMARADLYMMS34444@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAENbPcNqizd5keY/1z53jAinBumVWhx8ZBo2AksIx6yOqQftgU33q6LOPJ44V5vdHcA==', N'IKDNVV64XR5UXHNMCWLD7OTPG2MGYXIQ', N'229c9afc-ebfb-4048-9060-79b84189ddac', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c9076491-9d8e-4b59-8bac-165ae2724ba3', N'arwasalah256@gmail.com', N'ARWASALAH256@GMAIL.COM', N'arwasalah256@gmail.com', N'ARWASALAH256@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEGkBlaLEk2gWRtXdccY9I8ZoZlbgoF7TIdmppMxs8NwmXFqe43mdwhn560xDPvp0sQ==', N'SL36I6Q2MQQL6H3MNJKUK3SBIANZXP5I', N'03091dfb-4120-4559-b877-9f12bda854be', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e4816c81-88e9-420d-9378-f22809b09ed8', N'tototata232@gmail.com', N'TOTOTATA232@GMAIL.COM', N'tototata232@gmail.com', N'TOTOTATA232@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAELhDgMMWl59X73eHu0NR82xA8Qxm1YTQFZqlsvHrZbW+ZACy2o2iLH2Us2tXnvxEDA==', N'TZMKS6WXTZ6ML3WOUUQNDQJ5SHZVA5AH', N'c88d7815-997c-4804-9cf8-cbca7150a6b2', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f1286c34-3661-4c65-8266-733469423cd7', N'admin@programmingtutor.com', N'ADMIN@PROGRAMMINGTUTOR.COM', N'admin@programmingtutor.com', N'ADMIN@PROGRAMMINGTUTOR.COM', 1, N'AQAAAAIAAYagAAAAENtprQrLjjUiEorNsU3tpTqvoeH13+cMgRFKKiKWeCTAe7sO7G0msPRYuctNsImffQ==', N'RWCXKQOCFGMXQH64WD3KJ7GA6HWO6ZOL', N'c9ef3003-af88-4176-b8dd-71343143c648', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f1c2ef54-fce8-41c3-ba43-e704efc2b1cd', N'omarmms@gmail.com', N'OMARMMS@GMAIL.COM', N'omarmms@gmail.com', N'OMARMMS@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEMX/QWErg2qFqZ5JXfyw2lpy8NgrfBIrbAX8tcwI8p5H1kfiW2jt+7Mxuz5VW8HkBw==', N'G4RDYICBQJH5TQBCCQURQZZJYZB5EY5F', N'2f7257b7-2830-40d7-9d6a-020d093871e4', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'fb5eadf5-1201-435e-acbf-e2dd2f7204cd', N'omaradlymms@gail.com', N'OMARADLYMMS@GAIL.COM', N'omaradlymms@gail.com', N'OMARADLYMMS@GAIL.COM', 0, N'AQAAAAIAAYagAAAAEJiIvp+bLF/yLkg/FR8dS+05+1gX0Iz9pHODuOh/InA0OHxzSBdODwZcXfAGkN1SUA==', N'TDCLCQAIB433GAZ5CCOUZ5XWRYXUJBMK', N'8d79c036-7166-4c36-9272-2acb584ebd1d', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'1c977ee3-4f31-427e-98b0-12684bbd4a6e', N'[AspNetUserStore]', N'AuthenticatorKey', N'QMER3F2OFU2S5FVILUB3NLIS77DREBXK')
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'e4816c81-88e9-420d-9378-f22809b09ed8', N'[AspNetUserStore]', N'AuthenticatorKey', N'7VWRJRRUKMEAPUMS5QRNMKAGNMQEHGG7')
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([FeedbackID], [UserID], [TutorialID], [FeedbackText], [Rating], [SubmittedDate]) VALUES (7, N'afdd449b-8791-4f1a-b224-028836afba45', 2, N'fffffffffffffff', 5, CAST(N'2024-10-16T19:07:42.203' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackID], [UserID], [TutorialID], [FeedbackText], [Rating], [SubmittedDate]) VALUES (8, N'afdd449b-8791-4f1a-b224-028836afba45', 2, N'nkjnjkn', 4, CAST(N'2024-10-16T19:42:00.727' AS DateTime))
SET IDENTITY_INSERT [dbo].[Feedback] OFF
SET IDENTITY_INSERT [dbo].[Progress] ON 

INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (4, N'1c977ee3-4f31-427e-98b0-12684bbd4a6e', 2, 0, 1, CAST(N'2024-10-12T15:27:15.630' AS DateTime), CAST(N'2024-10-12T15:40:15.603' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (5, N'1c977ee3-4f31-427e-98b0-12684bbd4a6e', 4, 0, 0, CAST(N'2024-10-12T15:31:43.257' AS DateTime), CAST(N'2024-10-12T17:37:06.993' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (7, N'f1286c34-3661-4c65-8266-733469423cd7', 4, 0, 0, CAST(N'2024-10-12T17:50:11.287' AS DateTime), CAST(N'2024-10-12T18:40:23.763' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (8, N'3e394ec8-977c-4f18-912d-8609cd388ad1', 4, 0, 1, CAST(N'2024-10-12T18:16:24.043' AS DateTime), CAST(N'2024-10-12T18:16:41.070' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (9, N'f1286c34-3661-4c65-8266-733469423cd7', 2, 0, 1, CAST(N'2024-10-12T18:40:40.717' AS DateTime), CAST(N'2024-10-16T19:44:43.100' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (10, N'f1286c34-3661-4c65-8266-733469423cd7', 3, 0, 1, CAST(N'2024-10-12T18:40:46.833' AS DateTime), CAST(N'2024-10-12T18:49:36.300' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (11, N'f1286c34-3661-4c65-8266-733469423cd7', 12, 0, 0, CAST(N'2024-10-12T18:49:34.633' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (12, N'f1286c34-3661-4c65-8266-733469423cd7', 11, 0, 1, CAST(N'2024-10-12T18:51:27.017' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (13, N'18b8e25a-ce4b-4ba7-8535-0269df0b8447', 12, 0, 1, CAST(N'2024-10-13T14:14:57.867' AS DateTime), CAST(N'2024-10-13T14:15:34.673' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (14, N'18b8e25a-ce4b-4ba7-8535-0269df0b8447', 2, 0, 1, CAST(N'2024-10-13T14:15:23.153' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (15, N'38720ddf-bdb6-47c6-be55-07e26e359253', 12, 0, 0, CAST(N'2024-10-13T14:17:29.060' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (16, N'38720ddf-bdb6-47c6-be55-07e26e359253', 2, 0, 1, CAST(N'2024-10-13T14:17:29.100' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (17, N'1c977ee3-4f31-427e-98b0-12684bbd4a6e', 12, 0, 0, CAST(N'2024-10-13T14:41:17.027' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (19, N'c9076491-9d8e-4b59-8bac-165ae2724ba3', 2, 0, 1, CAST(N'2024-10-13T14:43:40.003' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (21, N'4fb465c8-cdc1-47c6-b33e-03c9b9c1ba33', 18, 0, 1, CAST(N'2024-10-14T18:57:59.407' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (22, N'4fb465c8-cdc1-47c6-b33e-03c9b9c1ba33', 16, 0, 1, CAST(N'2024-10-15T00:25:12.247' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (24, N'4fb465c8-cdc1-47c6-b33e-03c9b9c1ba33', 2, 0, 1, CAST(N'2024-10-15T00:45:57.130' AS DateTime), CAST(N'2024-10-15T01:04:31.567' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (25, N'4fb465c8-cdc1-47c6-b33e-03c9b9c1ba33', 12, 0, 1, CAST(N'2024-10-15T00:53:41.310' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (26, N'4fb465c8-cdc1-47c6-b33e-03c9b9c1ba33', 13, 0, 1, CAST(N'2024-10-15T00:53:45.187' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (27, N'4fb465c8-cdc1-47c6-b33e-03c9b9c1ba33', 15, 0, 1, CAST(N'2024-10-15T00:53:54.720' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (28, N'4fb465c8-cdc1-47c6-b33e-03c9b9c1ba33', 14, 0, 1, CAST(N'2024-10-15T00:54:04.117' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (30, N'12b27945-00f5-4e5d-bd76-ff6bb8f8e130', 16, 0, 1, CAST(N'2024-10-15T04:01:26.407' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (31, N'fb5eadf5-1201-435e-acbf-e2dd2f7204cd', 20, 0, 1, CAST(N'2024-10-15T04:21:48.583' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (32, N'fb5eadf5-1201-435e-acbf-e2dd2f7204cd', 2, 0, 1, CAST(N'2024-10-15T04:21:53.393' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (33, N'fb5eadf5-1201-435e-acbf-e2dd2f7204cd', 16, 0, 1, CAST(N'2024-10-15T04:25:03.073' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (34, N'fb5eadf5-1201-435e-acbf-e2dd2f7204cd', 12, 0, 1, CAST(N'2024-10-15T04:25:07.767' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (36, N'4b9d9af6-f9e9-416a-bb6d-2b8b862d7132', 12, 0, 1, CAST(N'2024-10-15T14:24:44.573' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (37, N'4b9d9af6-f9e9-416a-bb6d-2b8b862d7132', 13, 0, 1, CAST(N'2024-10-15T14:33:29.443' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (38, N'4b9d9af6-f9e9-416a-bb6d-2b8b862d7132', 15, 0, 1, CAST(N'2024-10-15T14:33:40.830' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (40, N'afdd449b-8791-4f1a-b224-028836afba45', 2, 0, 1, CAST(N'2024-10-16T14:16:10.090' AS DateTime), CAST(N'2024-10-16T19:03:30.980' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (41, N'afdd449b-8791-4f1a-b224-028836afba45', 12, 0, 1, CAST(N'2024-10-16T14:16:13.727' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (42, N'afdd449b-8791-4f1a-b224-028836afba45', 13, 0, 1, CAST(N'2024-10-16T14:16:18.953' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (43, N'afdd449b-8791-4f1a-b224-028836afba45', 14, 0, 1, CAST(N'2024-10-16T14:16:26.147' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (44, N'afdd449b-8791-4f1a-b224-028836afba45', 15, 0, 1, CAST(N'2024-10-16T14:16:32.167' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (45, N'afdd449b-8791-4f1a-b224-028836afba45', 16, 0, 1, CAST(N'2024-10-16T14:16:39.013' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (46, N'afdd449b-8791-4f1a-b224-028836afba45', 18, 0, 1, CAST(N'2024-10-16T14:16:43.220' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (47, N'afdd449b-8791-4f1a-b224-028836afba45', 22, 0, 1, CAST(N'2024-10-16T14:17:33.810' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (48, N'afdd449b-8791-4f1a-b224-028836afba45', 21, 0, 1, CAST(N'2024-10-16T14:17:40.177' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (49, N'afdd449b-8791-4f1a-b224-028836afba45', 20, 0, 1, CAST(N'2024-10-16T14:17:49.180' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (50, N'afdd449b-8791-4f1a-b224-028836afba45', 19, 0, 1, CAST(N'2024-10-16T14:17:55.290' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Progress] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Kid')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Parent')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'Admin')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[TutorialContent] ON 

INSERT [dbo].[TutorialContent] ([ContentID], [TutorialID], [ContentText], [MediaURL]) VALUES (3, 2, N'Step 1: Learn what variables are and how to use them.', NULL)
SET IDENTITY_INSERT [dbo].[TutorialContent] OFF
SET IDENTITY_INSERT [dbo].[Tutorials] ON 

INSERT [dbo].[Tutorials] ([TutorialID], [Title], [Description], [Level], [Duration], [CreatedDate], [IsActive], [ImagePath]) VALUES (2, N'Blockly Puzzle', N'Learn basic programming logic with Blockly puzzles', N'Beginner', 25, CAST(N'2024-10-08T00:42:13.613' AS DateTime), 1, N'Puzzle.webp')
INSERT [dbo].[Tutorials] ([TutorialID], [Title], [Description], [Level], [Duration], [CreatedDate], [IsActive], [ImagePath]) VALUES (12, N'Blockly Bird', N'Guide a bird through obstacles using programming logic', N'Beginner', 15, CAST(N'2024-10-12T18:46:34.507' AS DateTime), 1, N'bird.png')
INSERT [dbo].[Tutorials] ([TutorialID], [Title], [Description], [Level], [Duration], [CreatedDate], [IsActive], [ImagePath]) VALUES (13, N'Pond Duck', N'Program a duck to outsmart other ducks in a battle pond. Use block-based coding or JavaScript to guide the duck through strategic decisions.', N'Intermediate', 20, CAST(N'2024-10-13T22:40:02.170' AS DateTime), 1, N'PondDuck.png')
INSERT [dbo].[Tutorials] ([TutorialID], [Title], [Description], [Level], [Duration], [CreatedDate], [IsActive], [ImagePath]) VALUES (14, N'Turtle', N'Use programming to guide a turtle to draw shapes.', N'Beginner', 30, CAST(N'2024-10-13T22:52:48.040' AS DateTime), 1, N'Turtle.png')
INSERT [dbo].[Tutorials] ([TutorialID], [Title], [Description], [Level], [Duration], [CreatedDate], [IsActive], [ImagePath]) VALUES (15, N'Googly eyes', N'Create an animated "googly eyes" project to explore visual effects.', N'Beginner', 20, CAST(N'2024-10-13T23:11:31.177' AS DateTime), 1, N'GoogleEyes.png')
INSERT [dbo].[Tutorials] ([TutorialID], [Title], [Description], [Level], [Duration], [CreatedDate], [IsActive], [ImagePath]) VALUES (16, N'Blockly Maze', N'Learn how to solve puzzles with a maze', N'Beginner', 20, CAST(N'2024-10-12T18:46:34.507' AS DateTime), 1, N'Maze.png')
INSERT [dbo].[Tutorials] ([TutorialID], [Title], [Description], [Level], [Duration], [CreatedDate], [IsActive], [ImagePath]) VALUES (18, N'Talking Tofu', N'Learn how to make a character change expressions while talking', N'Beginner', 20, CAST(N'2024-10-14T18:51:56.190' AS DateTime), 1, N'Tofu.png')
INSERT [dbo].[Tutorials] ([TutorialID], [Title], [Description], [Level], [Duration], [CreatedDate], [IsActive], [ImagePath]) VALUES (19, N'Jungle', N' Learn Python basics by solving coding challenges in a fun jungle environment ', N'Beginner', 20, CAST(N'2024-10-14T18:51:56.190' AS DateTime), 1, N'Jungle.png')
INSERT [dbo].[Tutorials] ([TutorialID], [Title], [Description], [Level], [Duration], [CreatedDate], [IsActive], [ImagePath]) VALUES (20, N'counter-hack', N'Learn JavaScript basics by solving puzzles and hacking challenges', N'Beginner', 20, CAST(N'2024-10-14T18:51:56.190' AS DateTime), 1, N'CounterHack.png')
INSERT [dbo].[Tutorials] ([TutorialID], [Title], [Description], [Level], [Duration], [CreatedDate], [IsActive], [ImagePath]) VALUES (21, N'Python Sequence Puzzles', N'Solve puzzles by learning sequencing and control flow in Python', N'Beginner', 25, CAST(N'2024-10-15T04:13:50.713' AS DateTime), 1, N'PythonSeque.png')
INSERT [dbo].[Tutorials] ([TutorialID], [Title], [Description], [Level], [Duration], [CreatedDate], [IsActive], [ImagePath]) VALUES (22, N'Tynker Space Adventure', N'Create a fun space-themed project to learn logic and animation skills', N'Advanced', 25, CAST(N'2024-10-15T04:13:50.713' AS DateTime), 1, N'Dragon.png')
INSERT [dbo].[Tutorials] ([TutorialID], [Title], [Description], [Level], [Duration], [CreatedDate], [IsActive], [ImagePath]) VALUES (23, N'Dot Programming', N'Learn loops with simple exercises', N'Beginner', 30, CAST(N'2024-10-08T00:42:13.613' AS DateTime), 1, N'default.jpg')
SET IDENTITY_INSERT [dbo].[Tutorials] OFF
SET IDENTITY_INSERT [dbo].[UserAchievements] ON 

INSERT [dbo].[UserAchievements] ([UserAchievementID], [UserID], [AchievementID], [EarnedDate]) VALUES (1, N'1c977ee3-4f31-427e-98b0-12684bbd4a6e', 2, CAST(N'2024-10-12T17:13:04.840' AS DateTime))
INSERT [dbo].[UserAchievements] ([UserAchievementID], [UserID], [AchievementID], [EarnedDate]) VALUES (2, N'3e394ec8-977c-4f18-912d-8609cd388ad1', 1, CAST(N'2024-10-12T18:16:41.147' AS DateTime))
INSERT [dbo].[UserAchievements] ([UserAchievementID], [UserID], [AchievementID], [EarnedDate]) VALUES (3, N'f1286c34-3661-4c65-8266-733469423cd7', 1, CAST(N'2024-10-12T18:40:23.833' AS DateTime))
INSERT [dbo].[UserAchievements] ([UserAchievementID], [UserID], [AchievementID], [EarnedDate]) VALUES (4, N'f1286c34-3661-4c65-8266-733469423cd7', 2, CAST(N'2024-10-12T18:51:27.177' AS DateTime))
INSERT [dbo].[UserAchievements] ([UserAchievementID], [UserID], [AchievementID], [EarnedDate]) VALUES (5, N'f1286c34-3661-4c65-8266-733469423cd7', 2, CAST(N'2024-10-12T18:51:27.183' AS DateTime))
INSERT [dbo].[UserAchievements] ([UserAchievementID], [UserID], [AchievementID], [EarnedDate]) VALUES (6, N'18b8e25a-ce4b-4ba7-8535-0269df0b8447', 1, CAST(N'2024-10-13T14:15:34.743' AS DateTime))
INSERT [dbo].[UserAchievements] ([UserAchievementID], [UserID], [AchievementID], [EarnedDate]) VALUES (7, N'1c977ee3-4f31-427e-98b0-12684bbd4a6e', 1, CAST(N'2024-10-13T14:41:17.577' AS DateTime))
INSERT [dbo].[UserAchievements] ([UserAchievementID], [UserID], [AchievementID], [EarnedDate]) VALUES (8, N'c9076491-9d8e-4b59-8bac-165ae2724ba3', 1, CAST(N'2024-10-13T14:43:40.050' AS DateTime))
INSERT [dbo].[UserAchievements] ([UserAchievementID], [UserID], [AchievementID], [EarnedDate]) VALUES (9, N'4fb465c8-cdc1-47c6-b33e-03c9b9c1ba33', 1, CAST(N'2024-10-15T00:25:12.800' AS DateTime))
INSERT [dbo].[UserAchievements] ([UserAchievementID], [UserID], [AchievementID], [EarnedDate]) VALUES (10, N'4fb465c8-cdc1-47c6-b33e-03c9b9c1ba33', 2, CAST(N'2024-10-15T00:45:57.220' AS DateTime))
INSERT [dbo].[UserAchievements] ([UserAchievementID], [UserID], [AchievementID], [EarnedDate]) VALUES (11, N'4fb465c8-cdc1-47c6-b33e-03c9b9c1ba33', 3, CAST(N'2024-10-15T00:53:45.197' AS DateTime))
INSERT [dbo].[UserAchievements] ([UserAchievementID], [UserID], [AchievementID], [EarnedDate]) VALUES (12, N'4fb465c8-cdc1-47c6-b33e-03c9b9c1ba33', 4, CAST(N'2024-10-15T00:54:04.120' AS DateTime))
INSERT [dbo].[UserAchievements] ([UserAchievementID], [UserID], [AchievementID], [EarnedDate]) VALUES (13, N'12b27945-00f5-4e5d-bd76-ff6bb8f8e130', 1, CAST(N'2024-10-15T04:01:26.623' AS DateTime))
INSERT [dbo].[UserAchievements] ([UserAchievementID], [UserID], [AchievementID], [EarnedDate]) VALUES (14, N'fb5eadf5-1201-435e-acbf-e2dd2f7204cd', 1, CAST(N'2024-10-15T04:21:53.400' AS DateTime))
INSERT [dbo].[UserAchievements] ([UserAchievementID], [UserID], [AchievementID], [EarnedDate]) VALUES (15, N'fb5eadf5-1201-435e-acbf-e2dd2f7204cd', 2, CAST(N'2024-10-15T04:25:07.800' AS DateTime))
INSERT [dbo].[UserAchievements] ([UserAchievementID], [UserID], [AchievementID], [EarnedDate]) VALUES (16, N'4b9d9af6-f9e9-416a-bb6d-2b8b862d7132', 1, CAST(N'2024-10-15T14:24:44.600' AS DateTime))
INSERT [dbo].[UserAchievements] ([UserAchievementID], [UserID], [AchievementID], [EarnedDate]) VALUES (17, N'4b9d9af6-f9e9-416a-bb6d-2b8b862d7132', 2, CAST(N'2024-10-15T14:33:40.860' AS DateTime))
INSERT [dbo].[UserAchievements] ([UserAchievementID], [UserID], [AchievementID], [EarnedDate]) VALUES (18, N'afdd449b-8791-4f1a-b224-028836afba45', 1, CAST(N'2024-10-16T14:16:10.117' AS DateTime))
INSERT [dbo].[UserAchievements] ([UserAchievementID], [UserID], [AchievementID], [EarnedDate]) VALUES (19, N'afdd449b-8791-4f1a-b224-028836afba45', 2, CAST(N'2024-10-16T14:16:18.957' AS DateTime))
INSERT [dbo].[UserAchievements] ([UserAchievementID], [UserID], [AchievementID], [EarnedDate]) VALUES (20, N'afdd449b-8791-4f1a-b224-028836afba45', 3, CAST(N'2024-10-16T14:16:32.170' AS DateTime))
INSERT [dbo].[UserAchievements] ([UserAchievementID], [UserID], [AchievementID], [EarnedDate]) VALUES (21, N'afdd449b-8791-4f1a-b224-028836afba45', 4, CAST(N'2024-10-16T14:16:43.220' AS DateTime))
INSERT [dbo].[UserAchievements] ([UserAchievementID], [UserID], [AchievementID], [EarnedDate]) VALUES (22, N'afdd449b-8791-4f1a-b224-028836afba45', 5, CAST(N'2024-10-16T14:17:40.183' AS DateTime))
INSERT [dbo].[UserAchievements] ([UserAchievementID], [UserID], [AchievementID], [EarnedDate]) VALUES (23, N'afdd449b-8791-4f1a-b224-028836afba45', 6, CAST(N'2024-10-16T14:17:55.303' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserAchievements] OFF
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (1, 1, 1)
INSERT [dbo].[UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (2, 2, 1)
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Email], [PasswordHash], [Age], [DateJoined], [IsActive]) VALUES (1, N'JohnDoe', N'johndoe@example.com', N'hashedpassword1', 10, CAST(N'2024-10-08T00:42:13.563' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Username], [Email], [PasswordHash], [Age], [DateJoined], [IsActive]) VALUES (2, N'JaneDoe', N'janedoe@example.com', N'hashedpassword2', 12, CAST(N'2024-10-08T00:42:13.563' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 10/16/2024 8:06:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 10/16/2024 8:06:31 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 10/16/2024 8:06:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 10/16/2024 8:06:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 10/16/2024 8:06:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [EmailIndex]    Script Date: 10/16/2024 8:06:31 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 10/16/2024 8:06:31 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TutorialContent_TutorialID]    Script Date: 10/16/2024 8:06:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_TutorialContent_TutorialID] ON [dbo].[TutorialContent]
(
	[TutorialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserRole_RoleId]    Script Date: 10/16/2024 8:06:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserRole_RoleId] ON [dbo].[UserRole]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserRole_UserId]    Script Date: 10/16/2024 8:06:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserRole_UserId] ON [dbo].[UserRole]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Users__A9D1053429DB858F]    Script Date: 10/16/2024 8:06:31 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Achievements] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Achievements] ADD  DEFAULT ('defaultBadge.jpg') FOR [BadgeImagePath]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (getdate()) FOR [SubmittedDate]
GO
ALTER TABLE [dbo].[Progress] ADD  DEFAULT ((0)) FOR [Completed]
GO
ALTER TABLE [dbo].[Progress] ADD  DEFAULT (getdate()) FOR [StartedDate]
GO
ALTER TABLE [dbo].[Tutorials] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Tutorials] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tutorials] ADD  DEFAULT ('default.jpg') FOR [ImagePath]
GO
ALTER TABLE [dbo].[UserAchievements] ADD  DEFAULT (getdate()) FOR [EarnedDate]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [DateJoined]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_TutorialID] FOREIGN KEY([TutorialID])
REFERENCES [dbo].[Tutorials] ([TutorialID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_TutorialID]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_UserID]
GO
ALTER TABLE [dbo].[Progress]  WITH CHECK ADD  CONSTRAINT [FK_Progress_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Progress] CHECK CONSTRAINT [FK_Progress_UserID]
GO
ALTER TABLE [dbo].[TutorialContent]  WITH CHECK ADD FOREIGN KEY([TutorialID])
REFERENCES [dbo].[Tutorials] ([TutorialID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserAchievements]  WITH CHECK ADD  CONSTRAINT [FK_UserAchievements_AchievementID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserAchievements] CHECK CONSTRAINT [FK_UserAchievements_AchievementID]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role_RoleId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User_UserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD CHECK  (([Rating]>=(1) AND [Rating]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [KidProgrammingDB] SET  READ_WRITE 
GO
