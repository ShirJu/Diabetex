USE [Diabetex]
GO
/****** Object:  Table [dbo].[AccesoProducto]    Script Date: 16/6/2023 08:32:37 ******/
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
/****** Object:  Table [dbo].[Carpeta]    Script Date: 16/6/2023 08:32:37 ******/
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
/****** Object:  Table [dbo].[CarpetaXProducto]    Script Date: 16/6/2023 08:32:37 ******/
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
/****** Object:  Table [dbo].[Nutrientes]    Script Date: 16/6/2023 08:32:37 ******/
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
/****** Object:  Table [dbo].[NutrientesXProducto]    Script Date: 16/6/2023 08:32:37 ******/
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
/****** Object:  Table [dbo].[Plan]    Script Date: 16/6/2023 08:32:37 ******/
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
/****** Object:  Table [dbo].[PreferenciaXUsuario]    Script Date: 16/6/2023 08:32:37 ******/
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
/****** Object:  Table [dbo].[Producto]    Script Date: 16/6/2023 08:32:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Ingredientes] [varchar](max) NULL,
	[Cantidad] [varchar](50) NULL,
	[CantMeGusta] [int] NULL,
	[Marca] [varchar](50) NULL,
	[EspeciesAmenazadas] [bit] NULL,
	[LugarFabricacion] [varchar](max) NULL,
	[HCAgricultura] [float] NULL,
	[HCProcesado] [float] NULL,
	[HCEmbalaje] [float] NULL,
	[HCTransporte] [float] NULL,
	[HCDistribución] [float] NULL,
	[HCConsumo] [float] NULL,
	[HCTotal] [float] NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 16/6/2023 08:32:37 ******/
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
INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal]) VALUES (1, N'Nutella', N'Azucar', N'15g', 10, N'Ferrero ', 1, N'Italia', 35.8, 59.4, 2.2, 2.3, 0.2, 0, 767)
INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal]) VALUES (2, N'Príncipe', N'Harina', N'300g', 23, N'Mondelez', 1, N'Bélgica', 52.9, 42, 1.9, 2.9, 0.3, 0, 592)
INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal]) VALUES (3, N'Chocapic', N'Sal, Harina, Azucar', N'430 g', 100, N'Nestlé', 1, N'Francia', 65.9, 22.7, 3.2, 7.6, 0.6, 0, 340)
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
