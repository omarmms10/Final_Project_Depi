USE [master]
GO
/****** Object:  Database [KidProgrammingDB]    Script Date: 10/13/2024 5:07:31 PM ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/13/2024 5:07:32 PM ******/
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
/****** Object:  Table [dbo].[Achievements]    Script Date: 10/13/2024 5:07:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Achievements](
	[AchievementID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Achievements] PRIMARY KEY CLUSTERED 
(
	[AchievementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 10/13/2024 5:07:32 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/13/2024 5:07:33 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/13/2024 5:07:33 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/13/2024 5:07:33 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/13/2024 5:07:33 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/13/2024 5:07:33 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 10/13/2024 5:07:33 PM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 10/13/2024 5:07:34 PM ******/
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
/****** Object:  Table [dbo].[Progress]    Script Date: 10/13/2024 5:07:34 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 10/13/2024 5:07:34 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 10/13/2024 5:07:35 PM ******/
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
/****** Object:  Table [dbo].[TutorialContent]    Script Date: 10/13/2024 5:07:35 PM ******/
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
/****** Object:  Table [dbo].[Tutorials]    Script Date: 10/13/2024 5:07:35 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[TutorialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 10/13/2024 5:07:35 PM ******/
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
/****** Object:  Table [dbo].[UserAchievements]    Script Date: 10/13/2024 5:07:36 PM ******/
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
/****** Object:  Table [dbo].[UserRole]    Script Date: 10/13/2024 5:07:36 PM ******/
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
/****** Object:  Table [dbo].[UserRoles]    Script Date: 10/13/2024 5:07:36 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 10/13/2024 5:07:36 PM ******/
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

INSERT [dbo].[Achievements] ([AchievementID], [Title], [Description], [CreatedDate]) VALUES (1, N'Pro Kid Award', N'Awarded for completing 2 tutorials', CAST(N'2024-10-12T17:11:46.160' AS DateTime))
INSERT [dbo].[Achievements] ([AchievementID], [Title], [Description], [CreatedDate]) VALUES (2, N'Hero Kid Award', N'Awarded for completing 4 tutorials', CAST(N'2024-10-12T17:11:46.167' AS DateTime))
INSERT [dbo].[Achievements] ([AchievementID], [Title], [Description], [CreatedDate]) VALUES (3, N'Super Grasping & Memory Power Kid Award', N'Awarded for completing 6 tutorials', CAST(N'2024-10-12T17:11:46.167' AS DateTime))
INSERT [dbo].[Achievements] ([AchievementID], [Title], [Description], [CreatedDate]) VALUES (4, N'Incredible Memory Power Award', N'Awarded for completing 8 tutorials', CAST(N'2024-10-12T17:11:46.167' AS DateTime))
INSERT [dbo].[Achievements] ([AchievementID], [Title], [Description], [CreatedDate]) VALUES (5, N'Brilliant Kid Award', N'Awarded for completing 10 tutorials', CAST(N'2024-10-12T17:11:46.167' AS DateTime))
INSERT [dbo].[Achievements] ([AchievementID], [Title], [Description], [CreatedDate]) VALUES (6, N'Youngest Master of G.K. Award', N'Awarded for completing 12 tutorials', CAST(N'2024-10-12T17:11:46.167' AS DateTime))
INSERT [dbo].[Achievements] ([AchievementID], [Title], [Description], [CreatedDate]) VALUES (7, N'Multi-Talented Award', N'Awarded for completing 14 tutorials', CAST(N'2024-10-12T17:11:46.167' AS DateTime))
INSERT [dbo].[Achievements] ([AchievementID], [Title], [Description], [CreatedDate]) VALUES (8, N'Multi-Talented Renowned Award', N'Awarded for completing 16 tutorials', CAST(N'2024-10-12T17:11:46.167' AS DateTime))
SET IDENTITY_INSERT [dbo].[Achievements] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'067dc2ee-b93a-4cb9-8dbf-a3f983889ed7', N'Admin', N'ADMIN', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'f354abc3-2f8f-4dbc-ac8d-619ca49f5d18', N'Parent', N'PARENT', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'f3812d38-3018-4ab9-8dd6-6aad9ad7b509', N'Kid', N'KID', NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f1286c34-3661-4c65-8266-733469423cd7', N'067dc2ee-b93a-4cb9-8dbf-a3f983889ed7')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1c977ee3-4f31-427e-98b0-12684bbd4a6e', N'f3812d38-3018-4ab9-8dd6-6aad9ad7b509')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3e394ec8-977c-4f18-912d-8609cd388ad1', N'f3812d38-3018-4ab9-8dd6-6aad9ad7b509')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c9076491-9d8e-4b59-8bac-165ae2724ba3', N'f3812d38-3018-4ab9-8dd6-6aad9ad7b509')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'149b4f52-de7d-4189-b5fb-480c313b7853', N'mostafafire2075@yahoo.com', N'MOSTAFAFIRE2075@YAHOO.COM', N'mostafafire2075@yahoo.com', N'MOSTAFAFIRE2075@YAHOO.COM', 0, N'AQAAAAIAAYagAAAAEIvjwcQEGdBjcCfn8dUZk6WNjm5PZGc7pTI9R+wTPoJb1MDuaYZrPTPrAFhLLzh3Tw==', N'IE5S2OPAMCOMPC3WRYBDE2FJS5OA45E4', N'9351bd3c-7bac-4f4c-80cb-89e55b156862', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'18b8e25a-ce4b-4ba7-8535-0269df0b8447', N'mostafax2424@yahoo.com', N'MOSTAFAX2424@YAHOO.COM', N'mostafax2424@yahoo.com', N'MOSTAFAX2424@YAHOO.COM', 0, N'AQAAAAIAAYagAAAAENSk5qH20lczuCzR9FSOOhN1TIhx1ziuBzFwp4ibCcQrvOLteYPziWYtG0VoVcCWXA==', N'6P2WYLLJ3UYR4KHIPLJOUHIRY7HPFDI3', N'93bf466e-5842-4053-860d-63e59f96d824', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1c977ee3-4f31-427e-98b0-12684bbd4a6e', N'mostafaelhadidy442@gmail.com', N'MOSTAFAELHADIDY442@GMAIL.COM', N'mostafaelhadidy442@gmail.com', N'MOSTAFAELHADIDY442@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEFy+Jcjji9lUJUsl0QxglBUpcA9cvvZNI21eCtuNBlGq4IQZGLYX7A6xvcZL/WleXA==', N'LH7JQNZ2H7VCHSZVVGGMCHOUN45CJJK5', N'7f07d17f-8a85-4692-978c-815c755235b3', N'01554893259', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'38720ddf-bdb6-47c6-be55-07e26e359253', N'mostafaaa2322@gmail.com', N'MOSTAFAAA2322@GMAIL.COM', N'mostafaaa2322@gmail.com', N'MOSTAFAAA2322@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAENEWkH1GVOCJcD/ADFCOahuWEkjVdui8funfug4MAwaa7PET5YK+v1e3jo8SirLcEA==', N'F7NK5IDJ7JD36XLNOY4S2RHSGMPA4SLD', N'9e82e0f2-0063-4999-b066-ec8836291bcf', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3e394ec8-977c-4f18-912d-8609cd388ad1', N'dremyolok2322@gmail.com', N'DREMYOLOK2322@GMAIL.COM', N'dremyolok2322@gmail.com', N'DREMYOLOK2322@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEAreo1L7Q3i15XXwvV4Oj/LxsFt1u3caBDRVZIbotJCLH7Fx9yj6p3KNp35eFHuiIw==', N'ZDJV3OPDE2UXZGP2N6LTCRRQA6SWHX3Q', N'e946dafe-8678-444d-9c60-d914b7f777c5', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'51bc8e2b-4509-4985-906f-d65f021e98cf', N'mostafafire2085@gmail.com', N'MOSTAFAFIRE2085@GMAIL.COM', N'mostafafire2085@gmail.com', N'MOSTAFAFIRE2085@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEDr37eOl2HFvEKSMv6gSJUSTbrMCqAZB63xFpacwmkar808Y/ohsFznkrpafyGVJEQ==', N'E5X3IJWU45RYCYWK44TFQFOPJGMKTO6Q', N'94081291-99cd-4c79-a261-386933ff28ed', N'01554893259', 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'bbda0106-f48a-4a6d-a3bb-e31987256275', N'sasa23232@gmail.com', N'SASA23232@GMAIL.COM', N'sasa23232@gmail.com', N'SASA23232@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEOQYUx3i5yTV6IYz9yXHJ3R+Jo6eddzTMZwp8UxZsvU3l3AqoBwnGyJ6pip7rQRk3g==', N'IHGGBGTGOWYN4XKSSSAHRYW7QVFGGBVX', N'a9e46e7c-2f2b-42ce-8eba-b333ea1c089d', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c9076491-9d8e-4b59-8bac-165ae2724ba3', N'arwasalah256@gmail.com', N'ARWASALAH256@GMAIL.COM', N'arwasalah256@gmail.com', N'ARWASALAH256@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEGkBlaLEk2gWRtXdccY9I8ZoZlbgoF7TIdmppMxs8NwmXFqe43mdwhn560xDPvp0sQ==', N'SL36I6Q2MQQL6H3MNJKUK3SBIANZXP5I', N'03091dfb-4120-4559-b877-9f12bda854be', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e4816c81-88e9-420d-9378-f22809b09ed8', N'tototata232@gmail.com', N'TOTOTATA232@GMAIL.COM', N'tototata232@gmail.com', N'TOTOTATA232@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAELhDgMMWl59X73eHu0NR82xA8Qxm1YTQFZqlsvHrZbW+ZACy2o2iLH2Us2tXnvxEDA==', N'TZMKS6WXTZ6ML3WOUUQNDQJ5SHZVA5AH', N'c88d7815-997c-4804-9cf8-cbca7150a6b2', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f1286c34-3661-4c65-8266-733469423cd7', N'admin@programmingtutor.com', N'ADMIN@PROGRAMMINGTUTOR.COM', N'admin@programmingtutor.com', N'ADMIN@PROGRAMMINGTUTOR.COM', 1, N'AQAAAAIAAYagAAAAENtprQrLjjUiEorNsU3tpTqvoeH13+cMgRFKKiKWeCTAe7sO7G0msPRYuctNsImffQ==', N'RWCXKQOCFGMXQH64WD3KJ7GA6HWO6ZOL', N'c9ef3003-af88-4176-b8dd-71343143c648', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'1c977ee3-4f31-427e-98b0-12684bbd4a6e', N'[AspNetUserStore]', N'AuthenticatorKey', N'QMER3F2OFU2S5FVILUB3NLIS77DREBXK')
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'e4816c81-88e9-420d-9378-f22809b09ed8', N'[AspNetUserStore]', N'AuthenticatorKey', N'7VWRJRRUKMEAPUMS5QRNMKAGNMQEHGG7')
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([FeedbackID], [UserID], [TutorialID], [FeedbackText], [Rating], [SubmittedDate]) VALUES (3, N'3e394ec8-977c-4f18-912d-8609cd388ad1', 1, N'Nice game i really enjoyed it', 5, CAST(N'2024-10-12T18:17:05.517' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackID], [UserID], [TutorialID], [FeedbackText], [Rating], [SubmittedDate]) VALUES (4, N'1c977ee3-4f31-427e-98b0-12684bbd4a6e', 1, N'fasf', 3, CAST(N'2024-10-13T14:29:51.563' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackID], [UserID], [TutorialID], [FeedbackText], [Rating], [SubmittedDate]) VALUES (5, N'c9076491-9d8e-4b59-8bac-165ae2724ba3', 1, N'nice gameeee', 5, CAST(N'2024-10-13T14:43:59.557' AS DateTime))
SET IDENTITY_INSERT [dbo].[Feedback] OFF
SET IDENTITY_INSERT [dbo].[Progress] ON 

INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (1, N'1c977ee3-4f31-427e-98b0-12684bbd4a6e', 1, 0, 1, CAST(N'2024-10-10T22:18:38.467' AS DateTime), CAST(N'2024-10-13T14:42:13.243' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (2, N'f1286c34-3661-4c65-8266-733469423cd7', 1, 0, 1, CAST(N'2024-10-10T23:22:50.527' AS DateTime), CAST(N'2024-10-12T18:40:35.200' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (3, N'3e394ec8-977c-4f18-912d-8609cd388ad1', 1, 0, 1, CAST(N'2024-10-11T19:22:42.637' AS DateTime), CAST(N'2024-10-12T14:28:23.783' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (4, N'1c977ee3-4f31-427e-98b0-12684bbd4a6e', 2, 0, 1, CAST(N'2024-10-12T15:27:15.630' AS DateTime), CAST(N'2024-10-12T15:40:15.603' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (5, N'1c977ee3-4f31-427e-98b0-12684bbd4a6e', 4, 0, 0, CAST(N'2024-10-12T15:31:43.257' AS DateTime), CAST(N'2024-10-12T17:37:06.993' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (7, N'f1286c34-3661-4c65-8266-733469423cd7', 4, 0, 0, CAST(N'2024-10-12T17:50:11.287' AS DateTime), CAST(N'2024-10-12T18:40:23.763' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (8, N'3e394ec8-977c-4f18-912d-8609cd388ad1', 4, 0, 1, CAST(N'2024-10-12T18:16:24.043' AS DateTime), CAST(N'2024-10-12T18:16:41.070' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (9, N'f1286c34-3661-4c65-8266-733469423cd7', 2, 0, 1, CAST(N'2024-10-12T18:40:40.717' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (10, N'f1286c34-3661-4c65-8266-733469423cd7', 3, 0, 1, CAST(N'2024-10-12T18:40:46.833' AS DateTime), CAST(N'2024-10-12T18:49:36.300' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (11, N'f1286c34-3661-4c65-8266-733469423cd7', 12, 0, 0, CAST(N'2024-10-12T18:49:34.633' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (12, N'f1286c34-3661-4c65-8266-733469423cd7', 11, 0, 1, CAST(N'2024-10-12T18:51:27.017' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (13, N'18b8e25a-ce4b-4ba7-8535-0269df0b8447', 12, 0, 1, CAST(N'2024-10-13T14:14:57.867' AS DateTime), CAST(N'2024-10-13T14:15:34.673' AS DateTime))
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (14, N'18b8e25a-ce4b-4ba7-8535-0269df0b8447', 2, 0, 1, CAST(N'2024-10-13T14:15:23.153' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (15, N'38720ddf-bdb6-47c6-be55-07e26e359253', 12, 0, 0, CAST(N'2024-10-13T14:17:29.060' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (16, N'38720ddf-bdb6-47c6-be55-07e26e359253', 2, 0, 1, CAST(N'2024-10-13T14:17:29.100' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (17, N'1c977ee3-4f31-427e-98b0-12684bbd4a6e', 12, 0, 0, CAST(N'2024-10-13T14:41:17.027' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (18, N'c9076491-9d8e-4b59-8bac-165ae2724ba3', 1, 0, 1, CAST(N'2024-10-13T14:43:36.533' AS DateTime), NULL)
INSERT [dbo].[Progress] ([ProgressID], [UserID], [TutorialID], [CurrentStep], [Completed], [StartedDate], [CompletedDate]) VALUES (19, N'c9076491-9d8e-4b59-8bac-165ae2724ba3', 2, 0, 1, CAST(N'2024-10-13T14:43:40.003' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Progress] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Kid')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Parent')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'Admin')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[TutorialContent] ON 

INSERT [dbo].[TutorialContent] ([ContentID], [TutorialID], [ContentText], [MediaURL]) VALUES (1, 1, N'Step 1: Learn how loops work with simple examples.', NULL)
INSERT [dbo].[TutorialContent] ([ContentID], [TutorialID], [ContentText], [MediaURL]) VALUES (2, 1, N'Step 2: Implement your first loop.', N'https://example.com/loop_example.png')
INSERT [dbo].[TutorialContent] ([ContentID], [TutorialID], [ContentText], [MediaURL]) VALUES (3, 2, N'Step 1: Learn what variables are and how to use them.', NULL)
SET IDENTITY_INSERT [dbo].[TutorialContent] OFF
SET IDENTITY_INSERT [dbo].[Tutorials] ON 

INSERT [dbo].[Tutorials] ([TutorialID], [Title], [Description], [Level], [Duration], [CreatedDate], [IsActive]) VALUES (1, N'Dot Programming', N'Learn loops with simple exercises', N'Beginner', 30, CAST(N'2024-10-08T00:42:13.613' AS DateTime), 1)
INSERT [dbo].[Tutorials] ([TutorialID], [Title], [Description], [Level], [Duration], [CreatedDate], [IsActive]) VALUES (2, N'Blockly Puzzle', N'Learn basic programming logic with Blockly puzzles', N'Beginner', 25, CAST(N'2024-10-08T00:42:13.613' AS DateTime), 1)
INSERT [dbo].[Tutorials] ([TutorialID], [Title], [Description], [Level], [Duration], [CreatedDate], [IsActive]) VALUES (11, N'Blockly Maze', N'Learn how to solve puzzles with a maze', N'Beginner', 20, CAST(N'2024-10-12T18:46:34.507' AS DateTime), 1)
INSERT [dbo].[Tutorials] ([TutorialID], [Title], [Description], [Level], [Duration], [CreatedDate], [IsActive]) VALUES (12, N'Blockly Bird', N'Guide a bird through obstacles using programming logic', N'Beginner', 15, CAST(N'2024-10-12T18:46:34.507' AS DateTime), 1)
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
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 10/13/2024 5:07:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 10/13/2024 5:07:36 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 10/13/2024 5:07:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 10/13/2024 5:07:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 10/13/2024 5:07:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [EmailIndex]    Script Date: 10/13/2024 5:07:36 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 10/13/2024 5:07:36 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TutorialContent_TutorialID]    Script Date: 10/13/2024 5:07:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_TutorialContent_TutorialID] ON [dbo].[TutorialContent]
(
	[TutorialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserRole_RoleId]    Script Date: 10/13/2024 5:07:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserRole_RoleId] ON [dbo].[UserRole]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserRole_UserId]    Script Date: 10/13/2024 5:07:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserRole_UserId] ON [dbo].[UserRole]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Users__A9D10534FEDC14F6]    Script Date: 10/13/2024 5:07:36 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Achievements] ADD  DEFAULT (getdate()) FOR [CreatedDate]
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
