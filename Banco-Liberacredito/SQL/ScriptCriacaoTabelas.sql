USE [Banco]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 08/03/2023 16:46:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](255) NOT NULL,
	[Cpf] [varchar](11) NOT NULL,
	[Uf] [varchar](2) NOT NULL,
	[Celular] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Financiamento]    Script Date: 08/03/2023 16:46:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Financiamento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cliente_id] [int] NOT NULL,
	[Cpf] [varchar](11) NOT NULL,
	[Tipo_Financiamento] [int] NOT NULL,
	[Valor_Total] [decimal](18, 0) NOT NULL,
	[Data_Vencimento] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parcela]    Script Date: 08/03/2023 16:46:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parcela](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Financiamento] [int] NOT NULL,
	[Numero_Parcela] [int] NOT NULL,
	[Valor_Parcela] [decimal](18, 0) NOT NULL,
	[Data_Vencimento] [datetime] NOT NULL,
	[Data_Pagamento] [datetime] NULL,
	[Id_Cliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDoFinanciamento]    Script Date: 08/03/2023 16:46:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDoFinanciamento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](255) NOT NULL,
	[Juros] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Financiamento]  WITH CHECK ADD  CONSTRAINT [fk_Cliente_id] FOREIGN KEY([Cliente_id])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Financiamento] CHECK CONSTRAINT [fk_Cliente_id]
GO
ALTER TABLE [dbo].[Financiamento]  WITH CHECK ADD  CONSTRAINT [fk_Tipo_Financiamento] FOREIGN KEY([Tipo_Financiamento])
REFERENCES [dbo].[TipoDoFinanciamento] ([Id])
GO
ALTER TABLE [dbo].[Financiamento] CHECK CONSTRAINT [fk_Tipo_Financiamento]
GO
ALTER TABLE [dbo].[Parcela]  WITH CHECK ADD  CONSTRAINT [fk_Id_Financiamento] FOREIGN KEY([Id_Financiamento])
REFERENCES [dbo].[Financiamento] ([Id])
GO
ALTER TABLE [dbo].[Parcela] CHECK CONSTRAINT [fk_Id_Financiamento]
GO
