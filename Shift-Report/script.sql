USE [master]
GO
/****** Object:  Database [Shift_Reports]    Script Date: 1/20/2021 12:41:36 PM ******/
CREATE DATABASE [Shift_Reports]
 CONTAINMENT = NONE 
GO
ALTER DATABASE [Shift_Reports] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shift_Reports].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shift_Reports] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shift_Reports] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shift_Reports] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shift_Reports] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shift_Reports] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shift_Reports] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Shift_Reports] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shift_Reports] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shift_Reports] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shift_Reports] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shift_Reports] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shift_Reports] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shift_Reports] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shift_Reports] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shift_Reports] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Shift_Reports] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shift_Reports] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shift_Reports] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shift_Reports] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shift_Reports] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shift_Reports] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Shift_Reports] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shift_Reports] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Shift_Reports] SET  MULTI_USER 
GO
ALTER DATABASE [Shift_Reports] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shift_Reports] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shift_Reports] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shift_Reports] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Shift_Reports] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Shift_Reports] SET QUERY_STORE = OFF
GO
USE [Shift_Reports]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Shift_Reports]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1/20/2021 12:41:36 PM ******/
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
/****** Object:  Table [dbo].[AccessCode]    Script Date: 1/20/2021 12:41:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccessCode](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccessType] [nvarchar](max) NULL,
	[CallerName] [nvarchar](max) NULL,
	[CallerBadge] [nvarchar](max) NULL,
	[CallReceiver] [nvarchar](max) NULL,
	[TelephoneNo] [nvarchar](max) NULL,
	[AgentTelephone] [nvarchar](max) NULL,
	[ReportId] [int] NOT NULL,
 CONSTRAINT [PK_AccessCode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 1/20/2021 12:41:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BadgeNo] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IdentityUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Announcement]    Script Date: 1/20/2021 12:41:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Announcement](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](max) NULL,
	[DateTime] [datetime2](7) NOT NULL,
	[DoneBy] [nvarchar](max) NULL,
	[ReportId] [int] NOT NULL,
 CONSTRAINT [PK_Announcement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 1/20/2021 12:41:36 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 1/20/2021 12:41:36 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 1/20/2021 12:41:36 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 1/20/2021 12:41:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 1/20/2021 12:41:36 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 1/20/2021 12:41:36 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 1/20/2021 12:41:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Break]    Script Date: 1/20/2021 12:41:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Break](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AgentName] [nvarchar](max) NULL,
	[Remark] [nvarchar](max) NULL,
	[Out] [nvarchar](max) NULL,
	[In] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NULL,
	[ReportId] [int] NOT NULL,
 CONSTRAINT [PK_Break] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Caller]    Script Date: 1/20/2021 12:41:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Caller](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[PhoneNo] [nvarchar](max) NULL,
	[Inquiry] [nvarchar](max) NULL,
	[MRN] [nvarchar](max) NULL,
	[AgentId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CallDateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Caller] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheckList]    Script Date: 1/20/2021 12:41:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Workplace] [bit] NOT NULL,
	[Directories] [bit] NOT NULL,
	[Boards] [bit] NOT NULL,
	[Fax1] [bit] NOT NULL,
	[Fax2] [bit] NOT NULL,
	[Overhead] [bit] NOT NULL,
	[EmergencyLine] [bit] NOT NULL,
	[Hotline] [bit] NOT NULL,
	[BackupHotline] [bit] NOT NULL,
	[CodeYellow] [bit] NOT NULL,
	[PagingTelephone] [bit] NOT NULL,
	[NoOfBattery] [int] NOT NULL,
	[NoOfPager] [int] NOT NULL,
	[NoOfChair] [int] NOT NULL,
	[NoOfUndeliveredFax] [int] NOT NULL,
	[NoOfDictaphone] [int] NOT NULL,
	[NoOfHeadphone] [int] NOT NULL,
	[NoOfRadiophones] [int] NOT NULL,
	[NoOfRadiophonesCharger] [int] NOT NULL,
	[NoOfRemoteControl] [int] NOT NULL,
	[ReportId] [int] NOT NULL,
 CONSTRAINT [PK_CheckList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 1/20/2021 12:41:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmergencyCode]    Script Date: 1/20/2021 12:41:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmergencyCode](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
	[CallerBadge] [nvarchar](max) NULL,
	[CallerExt] [nvarchar](max) NULL,
	[ReceivedBy] [nvarchar](max) NULL,
	[TimeReceived] [datetime2](7) NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[ReportId] [int] NOT NULL,
 CONSTRAINT [PK_EmergencyCode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EODPager]    Script Date: 1/20/2021 12:41:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EODPager](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PagerReceivedFrom] [nvarchar](max) NULL,
	[PagerReceivedAt] [datetime2](7) NOT NULL,
	[PagerReceivedBy] [nvarchar](max) NULL,
	[PagerIssuedTo] [nvarchar](max) NULL,
	[PagerIssuedAt] [datetime2](7) NOT NULL,
	[PagerIssuedBy] [nvarchar](max) NULL,
	[ReportId] [int] NOT NULL,
 CONSTRAINT [PK_EODPager] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 1/20/2021 12:41:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Shift] [nvarchar](max) NULL,
	[DateTime] [datetime2](7) NOT NULL,
	[Details] [nvarchar](max) NULL,
	[DoneBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_AccessCode_ReportId]    Script Date: 1/20/2021 12:41:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_AccessCode_ReportId] ON [dbo].[AccessCode]
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Agent_IdentityUserId]    Script Date: 1/20/2021 12:41:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Agent_IdentityUserId] ON [dbo].[Agent]
(
	[IdentityUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Announcement_ReportId]    Script Date: 1/20/2021 12:41:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Announcement_ReportId] ON [dbo].[Announcement]
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 1/20/2021 12:41:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 1/20/2021 12:41:36 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 1/20/2021 12:41:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 1/20/2021 12:41:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 1/20/2021 12:41:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 1/20/2021 12:41:36 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 1/20/2021 12:41:36 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Break_ReportId]    Script Date: 1/20/2021 12:41:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Break_ReportId] ON [dbo].[Break]
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Caller_AgentId]    Script Date: 1/20/2021 12:41:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Caller_AgentId] ON [dbo].[Caller]
(
	[AgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Caller_DepartmentId]    Script Date: 1/20/2021 12:41:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Caller_DepartmentId] ON [dbo].[Caller]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CheckList_ReportId]    Script Date: 1/20/2021 12:41:36 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_CheckList_ReportId] ON [dbo].[CheckList]
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmergencyCode_ReportId]    Script Date: 1/20/2021 12:41:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_EmergencyCode_ReportId] ON [dbo].[EmergencyCode]
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EODPager_ReportId]    Script Date: 1/20/2021 12:41:36 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EODPager_ReportId] ON [dbo].[EODPager]
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccessCode]  WITH CHECK ADD  CONSTRAINT [FK_AccessCode_Report_ReportId] FOREIGN KEY([ReportId])
REFERENCES [dbo].[Report] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AccessCode] CHECK CONSTRAINT [FK_AccessCode_Report_ReportId]
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AspNetUsers_IdentityUserId] FOREIGN KEY([IdentityUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AspNetUsers_IdentityUserId]
GO
ALTER TABLE [dbo].[Announcement]  WITH CHECK ADD  CONSTRAINT [FK_Announcement_Report_ReportId] FOREIGN KEY([ReportId])
REFERENCES [dbo].[Report] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Announcement] CHECK CONSTRAINT [FK_Announcement_Report_ReportId]
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
ALTER TABLE [dbo].[Break]  WITH CHECK ADD  CONSTRAINT [FK_Break_Report_ReportId] FOREIGN KEY([ReportId])
REFERENCES [dbo].[Report] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Break] CHECK CONSTRAINT [FK_Break_Report_ReportId]
GO
ALTER TABLE [dbo].[Caller]  WITH CHECK ADD  CONSTRAINT [FK_Caller_Agent_AgentId] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agent] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Caller] CHECK CONSTRAINT [FK_Caller_Agent_AgentId]
GO
ALTER TABLE [dbo].[Caller]  WITH CHECK ADD  CONSTRAINT [FK_Caller_Department_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Caller] CHECK CONSTRAINT [FK_Caller_Department_DepartmentId]
GO
ALTER TABLE [dbo].[CheckList]  WITH CHECK ADD  CONSTRAINT [FK_CheckList_Report_ReportId] FOREIGN KEY([ReportId])
REFERENCES [dbo].[Report] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CheckList] CHECK CONSTRAINT [FK_CheckList_Report_ReportId]
GO
ALTER TABLE [dbo].[EmergencyCode]  WITH CHECK ADD  CONSTRAINT [FK_EmergencyCode_Report_ReportId] FOREIGN KEY([ReportId])
REFERENCES [dbo].[Report] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmergencyCode] CHECK CONSTRAINT [FK_EmergencyCode_Report_ReportId]
GO
ALTER TABLE [dbo].[EODPager]  WITH CHECK ADD  CONSTRAINT [FK_EODPager_Report_ReportId] FOREIGN KEY([ReportId])
REFERENCES [dbo].[Report] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EODPager] CHECK CONSTRAINT [FK_EODPager_Report_ReportId]
GO
USE [master]
GO
ALTER DATABASE [Shift_Reports] SET  READ_WRITE 
GO
