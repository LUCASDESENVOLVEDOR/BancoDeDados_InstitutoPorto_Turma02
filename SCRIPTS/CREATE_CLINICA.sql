USE [Clinica]
GO
/****** Object:  Table [dbo].[atendimento]    Script Date: 08/05/2023 20:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[atendimento](
	[idAtendimento] [int] IDENTITY(1,1) NOT NULL,
	[idPet] [int] NULL,
	[idVeterinario] [int] NULL,
	[descricao] [varchar](50) NOT NULL,
	[dataAtendimento] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAtendimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clinica]    Script Date: 08/05/2023 20:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clinica](
	[idClinica] [int] IDENTITY(1,1) NOT NULL,
	[id_cripClinica] [char](36) NULL,
	[razaoSocial] [varchar](50) NOT NULL,
	[cnpj] [char](14) NOT NULL,
	[endereco] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idClinica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cnpj] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[razaoSocial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dono]    Script Date: 08/05/2023 20:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dono](
	[idDono] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pets]    Script Date: 08/05/2023 20:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pets](
	[idPet] [int] IDENTITY(1,1) NOT NULL,
	[idRaca] [int] NULL,
	[idDono] [int] NULL,
	[nome] [varchar](50) NOT NULL,
	[dataNascimento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[raca]    Script Date: 08/05/2023 20:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[raca](
	[idRaca] [int] IDENTITY(1,1) NOT NULL,
	[idTipoPet] [int] NULL,
	[descricao] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idRaca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoPet]    Script Date: 08/05/2023 20:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoPet](
	[idTipoPet] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoPet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[veterinario]    Script Date: 08/05/2023 20:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[veterinario](
	[idVeterinario] [int] IDENTITY(1,1) NOT NULL,
	[idClinica] [int] NULL,
	[nome] [varchar](50) NOT NULL,
	[crmv] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idVeterinario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[crmv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[clinica] ADD  DEFAULT (newid()) FOR [id_cripClinica]
GO
ALTER TABLE [dbo].[atendimento]  WITH CHECK ADD FOREIGN KEY([idPet])
REFERENCES [dbo].[pets] ([idPet])
GO
ALTER TABLE [dbo].[atendimento]  WITH CHECK ADD FOREIGN KEY([idVeterinario])
REFERENCES [dbo].[veterinario] ([idVeterinario])
GO
ALTER TABLE [dbo].[pets]  WITH CHECK ADD FOREIGN KEY([idDono])
REFERENCES [dbo].[dono] ([idDono])
GO
ALTER TABLE [dbo].[pets]  WITH CHECK ADD FOREIGN KEY([idRaca])
REFERENCES [dbo].[raca] ([idRaca])
GO
ALTER TABLE [dbo].[raca]  WITH CHECK ADD FOREIGN KEY([idTipoPet])
REFERENCES [dbo].[tipoPet] ([idTipoPet])
GO
ALTER TABLE [dbo].[veterinario]  WITH CHECK ADD FOREIGN KEY([idClinica])
REFERENCES [dbo].[clinica] ([idClinica])
GO
ALTER TABLE [dbo].[clinica]  WITH CHECK ADD CHECK  ((len([cnpj])=(14)))
GO
