USE [Diebetex]
GO
/****** Object:  Table [dbo].[AccesoProducto]    Script Date: 12/5/2023 09:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccesoProducto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[FechaAcceso] [date] NULL,
	[Favorito] [bit] NULL,
 CONSTRAINT [PK_AccesoProducto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carpeta]    Script Date: 12/5/2023 09:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carpeta](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Carpetas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarpetaXProducto]    Script Date: 12/5/2023 09:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarpetaXProducto](
	[Id] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[IdCarpetas] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_CarpetaXProducto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plan]    Script Date: 12/5/2023 09:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plan](
	[Id] [int] NOT NULL,
	[Free] [bit] NULL,
	[Premium] [bit] NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Plan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreferenciaXUsuario]    Script Date: 12/5/2023 09:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreferenciaXUsuario](
	[Id] [int] NOT NULL,
	[Notificacion] [int] NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_PreferenciaXUsuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 12/5/2023 09:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Ingredientes] [varchar](max) NULL,
	[TamanoPorcion] [numeric](18, 0) NULL,
	[InfoNutricional] [text] NULL,
	[EfectoNutricional] [text] NULL,
	[CantMeGusta] [int] NULL,
	[FechaCreacion] [date] NULL,
	[Marca] [varchar](50) NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 12/5/2023 09:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Gmail] [varchar](max) NULL,
	[Contrasena] [varbinary](max) NOT NULL,
	[Fecha] [datetime] NULL,
	[TipoDiabetes] [int] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccesoProducto]  WITH CHECK ADD  CONSTRAINT [FK_AccesoProducto_Productos] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[AccesoProducto] CHECK CONSTRAINT [FK_AccesoProducto_Productos]
GO
ALTER TABLE [dbo].[AccesoProducto]  WITH CHECK ADD  CONSTRAINT [FK_AccesoProducto_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[AccesoProducto] CHECK CONSTRAINT [FK_AccesoProducto_Usuario]
GO
ALTER TABLE [dbo].[CarpetaXProducto]  WITH CHECK ADD  CONSTRAINT [FK_CarpetaXProducto_Carpetas] FOREIGN KEY([IdCarpetas])
REFERENCES [dbo].[Carpeta] ([Id])
GO
ALTER TABLE [dbo].[CarpetaXProducto] CHECK CONSTRAINT [FK_CarpetaXProducto_Carpetas]
GO
ALTER TABLE [dbo].[CarpetaXProducto]  WITH CHECK ADD  CONSTRAINT [FK_CarpetaXProducto_Productos] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[CarpetaXProducto] CHECK CONSTRAINT [FK_CarpetaXProducto_Productos]
GO
ALTER TABLE [dbo].[Plan]  WITH CHECK ADD  CONSTRAINT [FK_Plan_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Plan] CHECK CONSTRAINT [FK_Plan_Usuario]
GO
ALTER TABLE [dbo].[PreferenciaXUsuario]  WITH CHECK ADD  CONSTRAINT [FK_PreferenciaXUsuario_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[PreferenciaXUsuario] CHECK CONSTRAINT [FK_PreferenciaXUsuario_Usuario]
GO
