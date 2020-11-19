USE [master]
GO
/****** Object:  Database [PPE_AS]    Script Date: 17/11/2020 12:08:24 ******/
CREATE DATABASE [PPE_AS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PPE_AS', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PPE_AS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PPE_AS_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PPE_AS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PPE_AS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PPE_AS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PPE_AS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PPE_AS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PPE_AS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PPE_AS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PPE_AS] SET ARITHABORT OFF 
GO
ALTER DATABASE [PPE_AS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PPE_AS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PPE_AS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PPE_AS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PPE_AS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PPE_AS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PPE_AS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PPE_AS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PPE_AS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PPE_AS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PPE_AS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PPE_AS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PPE_AS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PPE_AS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PPE_AS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PPE_AS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PPE_AS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PPE_AS] SET RECOVERY FULL 
GO
ALTER DATABASE [PPE_AS] SET  MULTI_USER 
GO
ALTER DATABASE [PPE_AS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PPE_AS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PPE_AS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PPE_AS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PPE_AS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PPE_AS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PPE_AS', N'ON'
GO
ALTER DATABASE [PPE_AS] SET QUERY_STORE = OFF
GO
USE [PPE_AS]
GO
/****** Object:  Table [dbo].[ACCEDER]    Script Date: 17/11/2020 12:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCEDER](
	[id_budget] [int] NOT NULL,
	[id_utilisateur] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ADMINISTRATEUR]    Script Date: 17/11/2020 12:08:24 ******/
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
 CONSTRAINT [ADMINISTRATEUR_PK] PRIMARY KEY CLUSTERED 
(
	[id_utilisateur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BUDGET]    Script Date: 17/11/2020 12:08:24 ******/
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
/****** Object:  Table [dbo].[CLASSE]    Script Date: 17/11/2020 12:08:24 ******/
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
/****** Object:  Table [dbo].[COMPTABLE]    Script Date: 17/11/2020 12:08:24 ******/
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
 CONSTRAINT [COMPTABLE_PK] PRIMARY KEY CLUSTERED 
(
	[id_utilisateur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ELEVE]    Script Date: 17/11/2020 12:08:24 ******/
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
/****** Object:  Table [dbo].[EVENEMENT]    Script Date: 17/11/2020 12:08:24 ******/
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
/****** Object:  Table [dbo].[FLUX]    Script Date: 17/11/2020 12:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FLUX](
	[id_flux] [int] NOT NULL,
	[libelle_flux] [varchar](1) NOT NULL,
	[date_flux] [date] NOT NULL,
	[montant_flux] [real] NOT NULL,
	[type_flux] [varchar](1) NOT NULL,
	[id_budget] [int] NOT NULL,
	[id_utilisateur] [int] NOT NULL,
	[id_evenement] [int] NOT NULL,
 CONSTRAINT [FLUX_PK] PRIMARY KEY CLUSTERED 
(
	[id_flux] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GERER]    Script Date: 17/11/2020 12:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GERER](
	[id_budget] [int] NOT NULL,
	[id_utilisateur] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESPONSABILITER]    Script Date: 17/11/2020 12:08:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESPONSABILITER](
	[id_classe] [int] NOT NULL,
	[id_utilisateur] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TYPE_DE_BUDGET]    Script Date: 17/11/2020 12:08:24 ******/
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
ALTER TABLE [dbo].[ACCEDER]  WITH CHECK ADD  CONSTRAINT [ACCEDER_ADMINISTRATEUR_FK] FOREIGN KEY([id_utilisateur])
REFERENCES [dbo].[ADMINISTRATEUR] ([id_utilisateur])
GO
ALTER TABLE [dbo].[ACCEDER] CHECK CONSTRAINT [ACCEDER_ADMINISTRATEUR_FK]
GO
ALTER TABLE [dbo].[ACCEDER]  WITH CHECK ADD  CONSTRAINT [ACCEDER_BUDGET_FK] FOREIGN KEY([id_budget])
REFERENCES [dbo].[BUDGET] ([id_budget])
GO
ALTER TABLE [dbo].[ACCEDER] CHECK CONSTRAINT [ACCEDER_BUDGET_FK]
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
ALTER TABLE [dbo].[GERER]  WITH CHECK ADD  CONSTRAINT [GERER_BUDGET_FK] FOREIGN KEY([id_budget])
REFERENCES [dbo].[BUDGET] ([id_budget])
GO
ALTER TABLE [dbo].[GERER] CHECK CONSTRAINT [GERER_BUDGET_FK]
GO
ALTER TABLE [dbo].[GERER]  WITH CHECK ADD  CONSTRAINT [GERER_COMPTABLE_FK] FOREIGN KEY([id_utilisateur])
REFERENCES [dbo].[COMPTABLE] ([id_utilisateur])
GO
ALTER TABLE [dbo].[GERER] CHECK CONSTRAINT [GERER_COMPTABLE_FK]
GO
ALTER TABLE [dbo].[RESPONSABILITER]  WITH CHECK ADD  CONSTRAINT [RESPONSABILITE_ADMINISTRATEUR_FK] FOREIGN KEY([id_utilisateur])
REFERENCES [dbo].[ADMINISTRATEUR] ([id_utilisateur])
GO
ALTER TABLE [dbo].[RESPONSABILITER] CHECK CONSTRAINT [RESPONSABILITE_ADMINISTRATEUR_FK]
GO
ALTER TABLE [dbo].[RESPONSABILITER]  WITH CHECK ADD  CONSTRAINT [RESPONSABILITER_CLASSE_FK] FOREIGN KEY([id_classe])
REFERENCES [dbo].[CLASSE] ([id_classe])
GO
ALTER TABLE [dbo].[RESPONSABILITER] CHECK CONSTRAINT [RESPONSABILITER_CLASSE_FK]
GO
USE [master]
GO
ALTER DATABASE [PPE_AS] SET  READ_WRITE 
GO
