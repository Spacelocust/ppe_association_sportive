USE [master]
GO
/****** Object:  Database [ppe_bdd_aso]    Script Date: 20/11/2020 15:34:28 ******/
CREATE DATABASE [ppe_bdd_aso]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PPE_AS', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ppe_bdd_aso.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PPE_AS_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ppe_bdd_aso_0.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ppe_bdd_aso] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ppe_bdd_aso].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ppe_bdd_aso] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ppe_bdd_aso] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ppe_bdd_aso] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ppe_bdd_aso] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ppe_bdd_aso] SET ARITHABORT OFF 
GO
ALTER DATABASE [ppe_bdd_aso] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ppe_bdd_aso] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ppe_bdd_aso] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ppe_bdd_aso] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ppe_bdd_aso] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ppe_bdd_aso] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ppe_bdd_aso] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ppe_bdd_aso] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ppe_bdd_aso] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ppe_bdd_aso] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ppe_bdd_aso] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ppe_bdd_aso] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ppe_bdd_aso] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ppe_bdd_aso] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ppe_bdd_aso] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ppe_bdd_aso] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ppe_bdd_aso] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ppe_bdd_aso] SET RECOVERY FULL 
GO
ALTER DATABASE [ppe_bdd_aso] SET  MULTI_USER 
GO
ALTER DATABASE [ppe_bdd_aso] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ppe_bdd_aso] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ppe_bdd_aso] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ppe_bdd_aso] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ppe_bdd_aso] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ppe_bdd_aso] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ppe_bdd_aso', N'ON'
GO
ALTER DATABASE [ppe_bdd_aso] SET QUERY_STORE = OFF
GO
USE [ppe_bdd_aso]
GO
/****** Object:  Table [dbo].[ADMINISTRATEUR]    Script Date: 20/11/2020 15:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMINISTRATEUR](
	[id_utilisateur] [int] IDENTITY(1,1) NOT NULL,
	[login_utilisateur] [varchar](250) NOT NULL,
	[mot_de_passe_utilisateur] [varchar](250) NOT NULL,
	[nom_utilisateur] [varchar](250) NOT NULL,
	[prenom_utilisateur] [varchar](250) NOT NULL,
	[date_naissance_utilisateur] [date] NOT NULL,
	[sexe_utilisateur] [varchar](250) NOT NULL,
	[num_utilisateur] [varchar](250) NOT NULL,
	[mail_utilisateur] [varchar](250) NOT NULL,
	[archive_utilisateur] [bit] NOT NULL,
	[jeton_reinitialiser_utilisateur] [varchar](250) NOT NULL,
	[cree_a] [date] NOT NULL,
	[mise_a_jour_a] [date] NOT NULL,
	[role_utilisateur] [nchar](1) NOT NULL,
 CONSTRAINT [ADMINISTRATEUR_PK] PRIMARY KEY CLUSTERED 
(
	[id_utilisateur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BUDGET]    Script Date: 20/11/2020 15:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BUDGET](
	[id_budget] [int] IDENTITY(1,1) NOT NULL,
	[montant_budget] [float] NOT NULL,
	[id_type_budget] [int] NOT NULL,
 CONSTRAINT [BUDGET_PK] PRIMARY KEY CLUSTERED 
(
	[id_budget] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLASSE]    Script Date: 20/11/2020 15:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLASSE](
	[id_classe] [int] IDENTITY(1,1) NOT NULL,
	[libelle_classe] [varchar](250) NOT NULL,
 CONSTRAINT [CLASSE_PK] PRIMARY KEY CLUSTERED 
(
	[id_classe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPTABLE]    Script Date: 20/11/2020 15:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPTABLE](
	[id_utilisateur] [int] IDENTITY(1,1) NOT NULL,
	[login_utilisateur] [varchar](250) NOT NULL,
	[mot_de_passe_utilisateur] [varchar](250) NOT NULL,
	[nom_utilisateur] [varchar](250) NOT NULL,
	[prenom_utilisateur] [varchar](250) NOT NULL,
	[date_naissance_utilisateur] [date] NOT NULL,
	[sexe_utilisateur] [varchar](250) NOT NULL,
	[num_utilisateur] [varchar](250) NOT NULL,
	[mail_utilisateur] [varchar](250) NOT NULL,
	[archive_utilisateur] [bit] NOT NULL,
	[jeton_reinitialiser_utilisateur] [varchar](250) NOT NULL,
	[cree_a] [date] NOT NULL,
	[mise_a_jour_a] [date] NOT NULL,
	[role_utilisateur] [nchar](1) NOT NULL,
 CONSTRAINT [COMPTABLE_PK] PRIMARY KEY CLUSTERED 
(
	[id_utilisateur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ELEVE]    Script Date: 20/11/2020 15:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ELEVE](
	[id_utilisateur] [int] IDENTITY(1,1) NOT NULL,
	[num_parent_eleve] [varchar](250) NOT NULL,
	[autorisation_prelevement] [bit] NOT NULL,
	[sweat_eleve] [bit] NOT NULL,
	[login_utilisateur] [varchar](250) NOT NULL,
	[mot_de_passe_utilisateur] [varchar](250) NOT NULL,
	[nom_utilisateur] [varchar](250) NOT NULL,
	[prenom_utilisateur] [varchar](250) NOT NULL,
	[date_naissance_utilisateur] [date] NOT NULL,
	[sexe_utilisateur] [varchar](250) NOT NULL,
	[num_utilisateur] [varchar](250) NOT NULL,
	[mail_utilisateur] [varchar](250) NOT NULL,
	[archive_utilisateur] [bit] NOT NULL,
	[jeton_reinitialiser_utilisateur] [varchar](250) NOT NULL,
	[cree_a] [date] NOT NULL,
	[mise_a_jour_a] [date] NOT NULL,
	[id_classe] [int] NOT NULL,
 CONSTRAINT [ELEVE_PK] PRIMARY KEY CLUSTERED 
(
	[id_utilisateur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EVENEMENT]    Script Date: 20/11/2020 15:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EVENEMENT](
	[id_evenement] [int] IDENTITY(1,1) NOT NULL,
	[libelle_evenement] [varchar](250) NOT NULL,
	[date_evenement] [date] NOT NULL,
	[lieu] [varchar](50) NOT NULL,
	[couts_evenement] [float] NOT NULL,
 CONSTRAINT [EVENEMENT_PK] PRIMARY KEY CLUSTERED 
(
	[id_evenement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FLUX]    Script Date: 20/11/2020 15:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FLUX](
	[id_flux] [int] IDENTITY(1,1) NOT NULL,
	[libelle_flux] [varchar](50) NOT NULL,
	[date_flux] [date] NOT NULL,
	[montant_flux] [real] NOT NULL,
	[type_flux] [varchar](50) NOT NULL,
	[id_budget] [int] NOT NULL,
	[id_utilisateur] [int] NULL,
	[id_evenement] [int] NULL,
 CONSTRAINT [FLUX_PK] PRIMARY KEY CLUSTERED 
(
	[id_flux] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TYPE_DE_BUDGET]    Script Date: 20/11/2020 15:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TYPE_DE_BUDGET](
	[id_type_budget] [int] IDENTITY(1,1) NOT NULL,
	[libelle_type_budget] [varchar](250) NOT NULL,
 CONSTRAINT [TYPE_DE_BUDGET_PK] PRIMARY KEY CLUSTERED 
(
	[id_type_budget] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ADMINISTRATEUR] ON 

INSERT [dbo].[ADMINISTRATEUR] ([id_utilisateur], [login_utilisateur], [mot_de_passe_utilisateur], [nom_utilisateur], [prenom_utilisateur], [date_naissance_utilisateur], [sexe_utilisateur], [num_utilisateur], [mail_utilisateur], [archive_utilisateur], [jeton_reinitialiser_utilisateur], [cree_a], [mise_a_jour_a], [role_utilisateur]) VALUES (2, N'root', N'root', N'boganin', N'lucas', CAST(N'2000-01-03' AS Date), N'homme', N'15151511515115', N'root@root.fr', 0, N'azdedzdq', CAST(N'2020-11-15' AS Date), CAST(N'2020-11-15' AS Date), N'A')
INSERT [dbo].[ADMINISTRATEUR] ([id_utilisateur], [login_utilisateur], [mot_de_passe_utilisateur], [nom_utilisateur], [prenom_utilisateur], [date_naissance_utilisateur], [sexe_utilisateur], [num_utilisateur], [mail_utilisateur], [archive_utilisateur], [jeton_reinitialiser_utilisateur], [cree_a], [mise_a_jour_a], [role_utilisateur]) VALUES (3, N'Leaurat', N'aaaa', N'gonçalves', N'laura', CAST(N'1999-04-17' AS Date), N'femme', N'0606060606', N'laura@test.fr', 0, N'azerty', CAST(N'2020-11-19' AS Date), CAST(N'2020-11-19' AS Date), N'A')
INSERT [dbo].[ADMINISTRATEUR] ([id_utilisateur], [login_utilisateur], [mot_de_passe_utilisateur], [nom_utilisateur], [prenom_utilisateur], [date_naissance_utilisateur], [sexe_utilisateur], [num_utilisateur], [mail_utilisateur], [archive_utilisateur], [jeton_reinitialiser_utilisateur], [cree_a], [mise_a_jour_a], [role_utilisateur]) VALUES (4, N'lucice', N'zzzz', N'boganin', N'lucas', CAST(N'2000-01-03' AS Date), N'homme', N'0606060605', N'lucas@test.fr', 1, N'azerty', CAST(N'2020-11-19' AS Date), CAST(N'2020-11-19' AS Date), N'A')
INSERT [dbo].[ADMINISTRATEUR] ([id_utilisateur], [login_utilisateur], [mot_de_passe_utilisateur], [nom_utilisateur], [prenom_utilisateur], [date_naissance_utilisateur], [sexe_utilisateur], [num_utilisateur], [mail_utilisateur], [archive_utilisateur], [jeton_reinitialiser_utilisateur], [cree_a], [mise_a_jour_a], [role_utilisateur]) VALUES (5, N'divino', N'eeee', N'monteiro', N'hugo', CAST(N'2001-04-30' AS Date), N'homme', N'0606060604', N'hugo@test.fr', 1, N'azerty', CAST(N'2020-11-19' AS Date), CAST(N'2020-11-19' AS Date), N'A')
INSERT [dbo].[ADMINISTRATEUR] ([id_utilisateur], [login_utilisateur], [mot_de_passe_utilisateur], [nom_utilisateur], [prenom_utilisateur], [date_naissance_utilisateur], [sexe_utilisateur], [num_utilisateur], [mail_utilisateur], [archive_utilisateur], [jeton_reinitialiser_utilisateur], [cree_a], [mise_a_jour_a], [role_utilisateur]) VALUES (7, N'ProfC#', N'qqqq', N'idasiak', N'mickael', CAST(N'1984-06-22' AS Date), N'homme', N'0606060602', N'idasiak@test.fr', 1, N'azerty', CAST(N'2020-11-19' AS Date), CAST(N'2020-11-19' AS Date), N'A')
SET IDENTITY_INSERT [dbo].[ADMINISTRATEUR] OFF
GO
SET IDENTITY_INSERT [dbo].[BUDGET] ON 

INSERT [dbo].[BUDGET] ([id_budget], [montant_budget], [id_type_budget]) VALUES (1, 25000, 1)
INSERT [dbo].[BUDGET] ([id_budget], [montant_budget], [id_type_budget]) VALUES (2, 20000, 2)
SET IDENTITY_INSERT [dbo].[BUDGET] OFF
GO
SET IDENTITY_INSERT [dbo].[CLASSE] ON 

INSERT [dbo].[CLASSE] ([id_classe], [libelle_classe]) VALUES (1, N'bts-2')
INSERT [dbo].[CLASSE] ([id_classe], [libelle_classe]) VALUES (2, N'licence')
SET IDENTITY_INSERT [dbo].[CLASSE] OFF
GO
SET IDENTITY_INSERT [dbo].[COMPTABLE] ON 

INSERT [dbo].[COMPTABLE] ([id_utilisateur], [login_utilisateur], [mot_de_passe_utilisateur], [nom_utilisateur], [prenom_utilisateur], [date_naissance_utilisateur], [sexe_utilisateur], [num_utilisateur], [mail_utilisateur], [archive_utilisateur], [jeton_reinitialiser_utilisateur], [cree_a], [mise_a_jour_a], [role_utilisateur]) VALUES (1, N'test', N'test', N'test', N'test', CAST(N'2000-01-03' AS Date), N'femme', N'45454545', N'test@test.fr', 0, N'azezdad', CAST(N'2020-11-15' AS Date), CAST(N'2020-11-15' AS Date), N'C')
INSERT [dbo].[COMPTABLE] ([id_utilisateur], [login_utilisateur], [mot_de_passe_utilisateur], [nom_utilisateur], [prenom_utilisateur], [date_naissance_utilisateur], [sexe_utilisateur], [num_utilisateur], [mail_utilisateur], [archive_utilisateur], [jeton_reinitialiser_utilisateur], [cree_a], [mise_a_jour_a], [role_utilisateur]) VALUES (2, N'BOB bricoleur', N'jjjj', N'gonçalves', N'joy', CAST(N'2014-05-15' AS Date), N'femme', N'0606060609', N'bob@test.fr', 1, N'azerty', CAST(N'2020-11-19' AS Date), CAST(N'2020-11-19' AS Date), N'C')
INSERT [dbo].[COMPTABLE] ([id_utilisateur], [login_utilisateur], [mot_de_passe_utilisateur], [nom_utilisateur], [prenom_utilisateur], [date_naissance_utilisateur], [sexe_utilisateur], [num_utilisateur], [mail_utilisateur], [archive_utilisateur], [jeton_reinitialiser_utilisateur], [cree_a], [mise_a_jour_a], [role_utilisateur]) VALUES (3, N'Slayer', N'dddd', N'doom', N'guy', CAST(N'1965-09-11' AS Date), N'homme', N'0606060607', N'slayer@test.fr', 1, N'azerty', CAST(N'2020-11-19' AS Date), CAST(N'2020-11-19' AS Date), N'C')
INSERT [dbo].[COMPTABLE] ([id_utilisateur], [login_utilisateur], [mot_de_passe_utilisateur], [nom_utilisateur], [prenom_utilisateur], [date_naissance_utilisateur], [sexe_utilisateur], [num_utilisateur], [mail_utilisateur], [archive_utilisateur], [jeton_reinitialiser_utilisateur], [cree_a], [mise_a_jour_a], [role_utilisateur]) VALUES (4, N'Maxou', N'pppp', N'rouget', N'maxime', CAST(N'1999-03-17' AS Date), N'homme', N'0606060617', N'maxou@test.fr', 1, N'azerty', CAST(N'2020-11-19' AS Date), CAST(N'2020-11-19' AS Date), N'C')
INSERT [dbo].[COMPTABLE] ([id_utilisateur], [login_utilisateur], [mot_de_passe_utilisateur], [nom_utilisateur], [prenom_utilisateur], [date_naissance_utilisateur], [sexe_utilisateur], [num_utilisateur], [mail_utilisateur], [archive_utilisateur], [jeton_reinitialiser_utilisateur], [cree_a], [mise_a_jour_a], [role_utilisateur]) VALUES (5, N'Neo', N'mmmm', N'reeves', N'keanu', CAST(N'1964-09-02' AS Date), N'homme', N'0606060617', N'neo@test.fr', 0, N'azerty', CAST(N'2020-11-19' AS Date), CAST(N'2020-11-19' AS Date), N'C')
SET IDENTITY_INSERT [dbo].[COMPTABLE] OFF
GO
SET IDENTITY_INSERT [dbo].[ELEVE] ON 

INSERT [dbo].[ELEVE] ([id_utilisateur], [num_parent_eleve], [autorisation_prelevement], [sweat_eleve], [login_utilisateur], [mot_de_passe_utilisateur], [nom_utilisateur], [prenom_utilisateur], [date_naissance_utilisateur], [sexe_utilisateur], [num_utilisateur], [mail_utilisateur], [archive_utilisateur], [jeton_reinitialiser_utilisateur], [cree_a], [mise_a_jour_a], [id_classe]) VALUES (3, N'59949494949', 0, 1, N'quentin', N'vvvv', N'pham', N'quentin', CAST(N'2000-08-03' AS Date), N'homme', N'0606060617', N'quentin@test.fr', 1, N'azerty', CAST(N'2020-11-19' AS Date), CAST(N'2020-11-19' AS Date), 1)
INSERT [dbo].[ELEVE] ([id_utilisateur], [num_parent_eleve], [autorisation_prelevement], [sweat_eleve], [login_utilisateur], [mot_de_passe_utilisateur], [nom_utilisateur], [prenom_utilisateur], [date_naissance_utilisateur], [sexe_utilisateur], [num_utilisateur], [mail_utilisateur], [archive_utilisateur], [jeton_reinitialiser_utilisateur], [cree_a], [mise_a_jour_a], [id_classe]) VALUES (4, N'59949494449', 1, 1, N'lisa', N'iiii', N'boganin', N'lisa', CAST(N'2001-11-27' AS Date), N'femme', N'0676060617', N'lisa@test.fr', 1, N'azerty', CAST(N'2020-11-19' AS Date), CAST(N'2020-11-19' AS Date), 1)
INSERT [dbo].[ELEVE] ([id_utilisateur], [num_parent_eleve], [autorisation_prelevement], [sweat_eleve], [login_utilisateur], [mot_de_passe_utilisateur], [nom_utilisateur], [prenom_utilisateur], [date_naissance_utilisateur], [sexe_utilisateur], [num_utilisateur], [mail_utilisateur], [archive_utilisateur], [jeton_reinitialiser_utilisateur], [cree_a], [mise_a_jour_a], [id_classe]) VALUES (5, N'59949494449', 1, 1, N'sarah', N'llll', N'boganim', N'sarah', CAST(N'2004-08-12' AS Date), N'femme', N'0676060417', N'sarah@test.fr', 1, N'azerty', CAST(N'2020-11-19' AS Date), CAST(N'2020-11-19' AS Date), 1)
SET IDENTITY_INSERT [dbo].[ELEVE] OFF
GO
SET IDENTITY_INSERT [dbo].[EVENEMENT] ON 

INSERT [dbo].[EVENEMENT] ([id_evenement], [libelle_evenement], [date_evenement], [lieu], [couts_evenement]) VALUES (1, N'course téléthon', CAST(N'2019-09-25' AS Date), N'senlis', 1500)
INSERT [dbo].[EVENEMENT] ([id_evenement], [libelle_evenement], [date_evenement], [lieu], [couts_evenement]) VALUES (2, N'course relais', CAST(N'2019-09-05' AS Date), N'beauvais', 5500)
SET IDENTITY_INSERT [dbo].[EVENEMENT] OFF
GO
SET IDENTITY_INSERT [dbo].[FLUX] ON 

INSERT [dbo].[FLUX] ([id_flux], [libelle_flux], [date_flux], [montant_flux], [type_flux], [id_budget], [id_utilisateur], [id_evenement]) VALUES (1, N'inscription', CAST(N'2019-09-25' AS Date), 5, N'credit', 1, 3, 1)
INSERT [dbo].[FLUX] ([id_flux], [libelle_flux], [date_flux], [montant_flux], [type_flux], [id_budget], [id_utilisateur], [id_evenement]) VALUES (2, N'achat de ballon', CAST(N'2019-12-03' AS Date), 250, N'debit', 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[FLUX] OFF
GO
SET IDENTITY_INSERT [dbo].[TYPE_DE_BUDGET] ON 

INSERT [dbo].[TYPE_DE_BUDGET] ([id_type_budget], [libelle_type_budget]) VALUES (1, N'AS')
INSERT [dbo].[TYPE_DE_BUDGET] ([id_type_budget], [libelle_type_budget]) VALUES (2, N'EPS')
SET IDENTITY_INSERT [dbo].[TYPE_DE_BUDGET] OFF
GO
ALTER TABLE [dbo].[BUDGET]  WITH CHECK ADD  CONSTRAINT [BUDGET_TYPE_DE_BUDGET_FK] FOREIGN KEY([id_type_budget])
REFERENCES [dbo].[TYPE_DE_BUDGET] ([id_type_budget])
GO
ALTER TABLE [dbo].[BUDGET] CHECK CONSTRAINT [BUDGET_TYPE_DE_BUDGET_FK]
GO
ALTER TABLE [dbo].[ELEVE]  WITH CHECK ADD  CONSTRAINT [ELEVE_CLASSE0_FK] FOREIGN KEY([id_classe])
REFERENCES [dbo].[CLASSE] ([id_classe])
GO
ALTER TABLE [dbo].[ELEVE] CHECK CONSTRAINT [ELEVE_CLASSE0_FK]
GO
ALTER TABLE [dbo].[FLUX]  WITH CHECK ADD  CONSTRAINT [FLUX_BUDGET_FK] FOREIGN KEY([id_budget])
REFERENCES [dbo].[BUDGET] ([id_budget])
GO
ALTER TABLE [dbo].[FLUX] CHECK CONSTRAINT [FLUX_BUDGET_FK]
GO
ALTER TABLE [dbo].[FLUX]  WITH CHECK ADD  CONSTRAINT [FLUX_ELEVE_FK] FOREIGN KEY([id_utilisateur])
REFERENCES [dbo].[ELEVE] ([id_utilisateur])
GO
ALTER TABLE [dbo].[FLUX] CHECK CONSTRAINT [FLUX_ELEVE_FK]
GO
ALTER TABLE [dbo].[FLUX]  WITH CHECK ADD  CONSTRAINT [FLUX_EVENEMENT_FK] FOREIGN KEY([id_evenement])
REFERENCES [dbo].[EVENEMENT] ([id_evenement])
GO
ALTER TABLE [dbo].[FLUX] CHECK CONSTRAINT [FLUX_EVENEMENT_FK]
GO
USE [master]
GO
ALTER DATABASE [ppe_bdd_aso] SET  READ_WRITE 
GO
