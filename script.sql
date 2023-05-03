USE [Diabetex]
GO
/****** Object:  Table [dbo].[AccesoProducto]    Script Date: 2/5/2023 21:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccesoProducto](
	[Id_AccesoProducto] [int] IDENTITY(1,1) NOT NULL,
	[Id_Usuario] [int] NOT NULL,
	[Id_código] [int] NOT NULL,
	[FechaAcceso] [date] NULL,
	[Favorito] [bit] NULL,
 CONSTRAINT [PK_AccesoProducto] PRIMARY KEY CLUSTERED 
(
	[Id_AccesoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carpetas]    Script Date: 2/5/2023 21:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carpetas](
	[Id_Carpetas] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Carpetas] PRIMARY KEY CLUSTERED 
(
	[Id_Carpetas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarpetaXProducto]    Script Date: 2/5/2023 21:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarpetaXProducto](
	[Id_CarpetaXProducto] [int] NOT NULL,
	[Id_CodigoBarra] [int] NOT NULL,
	[Id_Carpetas] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_CarpetaXProducto] PRIMARY KEY CLUSTERED 
(
	[Id_CarpetaXProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 2/5/2023 21:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id_código] [int] NOT NULL,
	[Product_name] [varchar](50) NULL,
	[Ingredientes] [varchar](max) NULL,
	[Porción_tamaño] [numeric](18, 0) NULL,
	[InfoNutricional] [text] NULL,
	[EfectoNutricional] [text] NULL,
	[CantMeGusta] [int] NULL,
	[Created_datetime] [date] NULL,
	[Marcas_etiquetas] [varchar](50) NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id_código] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 2/5/2023 21:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Gmail] [varchar](max) NULL,
	[Contraseña] [varbinary](max) NOT NULL,
	[Fecha] [datetime] NULL,
	[TipoDiabetes] [int] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccesoProducto]  WITH CHECK ADD  CONSTRAINT [FK_AccesoProducto_Productos] FOREIGN KEY([Id_código])
REFERENCES [dbo].[Productos] ([Id_código])
GO
ALTER TABLE [dbo].[AccesoProducto] CHECK CONSTRAINT [FK_AccesoProducto_Productos]
GO
ALTER TABLE [dbo].[AccesoProducto]  WITH CHECK ADD  CONSTRAINT [FK_AccesoProducto_Usuario] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Usuario] ([Id_Usuario])
GO
ALTER TABLE [dbo].[AccesoProducto] CHECK CONSTRAINT [FK_AccesoProducto_Usuario]
GO
ALTER TABLE [dbo].[CarpetaXProducto]  WITH CHECK ADD  CONSTRAINT [FK_CarpetaXProducto_Carpetas] FOREIGN KEY([Id_Carpetas])
REFERENCES [dbo].[Carpetas] ([Id_Carpetas])
GO
ALTER TABLE [dbo].[CarpetaXProducto] CHECK CONSTRAINT [FK_CarpetaXProducto_Carpetas]
GO
ALTER TABLE [dbo].[CarpetaXProducto]  WITH CHECK ADD  CONSTRAINT [FK_CarpetaXProducto_Productos] FOREIGN KEY([Id_CodigoBarra])
REFERENCES [dbo].[Productos] ([Id_código])
GO
ALTER TABLE [dbo].[CarpetaXProducto] CHECK CONSTRAINT [FK_CarpetaXProducto_Productos]
GO
