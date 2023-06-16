USE [Diabetex]
GO
/****** Object:  Table [dbo].[AccesoProducto]    Script Date: 15/6/2023 22:49:58 ******/
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
/****** Object:  Table [dbo].[Carpeta]    Script Date: 15/6/2023 22:49:58 ******/
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
/****** Object:  Table [dbo].[CarpetaXProducto]    Script Date: 15/6/2023 22:49:58 ******/
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
/****** Object:  Table [dbo].[Etiqueta]    Script Date: 15/6/2023 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etiqueta](
	[Id] [int] NOT NULL,
	[Contenido] [nvarchar](max) NULL,
 CONSTRAINT [PK_Etiqueta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EtiquetaXProducto]    Script Date: 15/6/2023 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EtiquetaXProducto](
	[Id] [int] NOT NULL,
	[IdProducto] [int] NULL,
	[IdEtiqueta] [int] NULL,
 CONSTRAINT [PK_EtiquetaXProducto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HuellaCarbono]    Script Date: 15/6/2023 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HuellaCarbono](
	[Id] [int] NOT NULL,
	[Escenario] [nvarchar](50) NULL,
	[Valor] [float] NULL,
 CONSTRAINT [PK_HuellaCarbono] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HuellaCarbonoXProducto]    Script Date: 15/6/2023 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HuellaCarbonoXProducto](
	[Id] [int] NOT NULL,
	[IdHuellaCarbono] [int] NULL,
	[IdProducto] [int] NULL,
 CONSTRAINT [PK_HuellaCarbonoXProducto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nutrientes]    Script Date: 15/6/2023 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nutrientes](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Valor] [nchar](10) NULL,
 CONSTRAINT [PK_Ingredientes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NutrientesXProducto]    Script Date: 15/6/2023 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NutrientesXProducto](
	[Id] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[IdIngredientes] [int] NOT NULL,
 CONSTRAINT [PK_IngredienteXProducto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plan]    Script Date: 15/6/2023 22:49:58 ******/
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
/****** Object:  Table [dbo].[PreferenciaXUsuario]    Script Date: 15/6/2023 22:49:58 ******/
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
/****** Object:  Table [dbo].[Producto]    Script Date: 15/6/2023 22:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Ingredientes] [varchar](max) NULL,
	[Cantidad] [numeric](18, 0) NULL,
	[InfoNutricional] [text] NULL,
	[EfectoNutricional] [text] NULL,
	[CantMeGusta] [int] NULL,
	[Marca] [varchar](50) NULL,
	[Etiquetas] [nvarchar](50) NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 15/6/2023 22:49:58 ******/
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
ALTER TABLE [dbo].[NutrientesXProducto]  WITH CHECK ADD  CONSTRAINT [FK_IngredienteXProducto_Ingredientes] FOREIGN KEY([IdIngredientes])
REFERENCES [dbo].[Nutrientes] ([Id])
GO
ALTER TABLE [dbo].[NutrientesXProducto] CHECK CONSTRAINT [FK_IngredienteXProducto_Ingredientes]
GO
ALTER TABLE [dbo].[NutrientesXProducto]  WITH CHECK ADD  CONSTRAINT [FK_IngredienteXProducto_Producto] FOREIGN KEY([IdIngredientes])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[NutrientesXProducto] CHECK CONSTRAINT [FK_IngredienteXProducto_Producto]
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
