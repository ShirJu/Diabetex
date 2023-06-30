USE [Diabetex]
GO
/****** Object:  Table [dbo].[AccesoProducto]    Script Date: 30/6/2023 11:55:39 ******/
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
/****** Object:  Table [dbo].[Carpeta]    Script Date: 30/6/2023 11:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carpeta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Carpetas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarpetaXUsuario]    Script Date: 30/6/2023 11:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarpetaXUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[IdCarpeta] [int] NOT NULL,
	[IdUsuario] [int] NULL,
 CONSTRAINT [PK_CarpetaXProducto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etiquetas]    Script Date: 30/6/2023 11:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etiquetas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EtiquetasIngredientes] [varchar](max) NULL,
	[EtiquetasNivelesNutrientes] [varchar](max) NULL,
 CONSTRAINT [PK_Etiquetas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EtiquetaXProducto]    Script Date: 30/6/2023 11:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EtiquetaXProducto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEtiqueta] [int] NULL,
	[IdProducto] [int] NULL,
 CONSTRAINT [PK_EtiquetaXProducto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeGustaXUsuario]    Script Date: 30/6/2023 11:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeGustaXUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdProducto] [int] NULL,
	[NombreUsuario] [varchar](50) NULL,
	[CodigoBarra] [varchar](50) NULL,
 CONSTRAINT [PK_MeGustaXUsuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plan]    Script Date: 30/6/2023 11:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Free] [bit] NULL,
	[Premium] [bit] NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Plan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreferenciaXUsuario]    Script Date: 30/6/2023 11:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreferenciaXUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Notificacion] [int] NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_PreferenciaXUsuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 30/6/2023 11:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
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
	[NAlcohol100g] [float] NULL,
	[NCarbohidratos100g] [float] NULL,
	[NEnergia100g] [float] NULL,
	[NGrasa100g] [float] NULL,
	[NFibra100g] [float] NULL,
	[NProteinas100g] [float] NULL,
	[NSal100g] [float] NULL,
	[NGrasasSaturadas100g] [float] NULL,
	[NSodio100g] [float] NULL,
	[NAzucar100g] [float] NULL,
	[Foto] [varchar](max) NULL,
	[CodigoBarra] [varchar](50) NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 30/6/2023 11:55:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Gmail] [varchar](320) NULL,
	[Contrasena] [varchar](20) NULL,
	[Fecha] [datetime] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Carpeta] ON 

INSERT [dbo].[Carpeta] ([Id], [Nombre]) VALUES (1, N'Lunes')
INSERT [dbo].[Carpeta] ([Id], [Nombre]) VALUES (2, N'Gym')
INSERT [dbo].[Carpeta] ([Id], [Nombre]) VALUES (3, N'Para Ian')
SET IDENTITY_INSERT [dbo].[Carpeta] OFF
GO
SET IDENTITY_INSERT [dbo].[CarpetaXUsuario] ON 

INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (6, 15, 2, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (7, 32, 2, 1)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (9, 24, 2, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (10, 30, 2, 2)
SET IDENTITY_INSERT [dbo].[CarpetaXUsuario] OFF
GO
SET IDENTITY_INSERT [dbo].[MeGustaXUsuario] ON 

INSERT [dbo].[MeGustaXUsuario] ([Id], [IdUsuario], [IdProducto], [NombreUsuario], [CodigoBarra]) VALUES (6, 2, 31, NULL, NULL)
INSERT [dbo].[MeGustaXUsuario] ([Id], [IdUsuario], [IdProducto], [NombreUsuario], [CodigoBarra]) VALUES (8, 3, 21, NULL, NULL)
SET IDENTITY_INSERT [dbo].[MeGustaXUsuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal], [NAlcohol100g], [NCarbohidratos100g], [NEnergia100g], [NGrasa100g], [NFibra100g], [NProteinas100g], [NSal100g], [NGrasasSaturadas100g], [NSodio100g], [NAzucar100g], [Foto], [CodigoBarra]) VALUES (1, N'bolonesa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal], [NAlcohol100g], [NCarbohidratos100g], [NEnergia100g], [NGrasa100g], [NFibra100g], [NProteinas100g], [NSal100g], [NGrasasSaturadas100g], [NSodio100g], [NAzucar100g], [Foto], [CodigoBarra]) VALUES (2, N'gg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal], [NAlcohol100g], [NCarbohidratos100g], [NEnergia100g], [NGrasa100g], [NFibra100g], [NProteinas100g], [NSal100g], [NGrasasSaturadas100g], [NSodio100g], [NAzucar100g], [Foto], [CodigoBarra]) VALUES (15, N'bolonesa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal], [NAlcohol100g], [NCarbohidratos100g], [NEnergia100g], [NGrasa100g], [NFibra100g], [NProteinas100g], [NSal100g], [NGrasasSaturadas100g], [NSodio100g], [NAzucar100g], [Foto], [CodigoBarra]) VALUES (19, N'bolonesa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal], [NAlcohol100g], [NCarbohidratos100g], [NEnergia100g], [NGrasa100g], [NFibra100g], [NProteinas100g], [NSal100g], [NGrasasSaturadas100g], [NSodio100g], [NAzucar100g], [Foto], [CodigoBarra]) VALUES (21, N'bolonesa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal], [NAlcohol100g], [NCarbohidratos100g], [NEnergia100g], [NGrasa100g], [NFibra100g], [NProteinas100g], [NSal100g], [NGrasasSaturadas100g], [NSodio100g], [NAzucar100g], [Foto], [CodigoBarra]) VALUES (22, N'bolonesa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal], [NAlcohol100g], [NCarbohidratos100g], [NEnergia100g], [NGrasa100g], [NFibra100g], [NProteinas100g], [NSal100g], [NGrasasSaturadas100g], [NSodio100g], [NAzucar100g], [Foto], [CodigoBarra]) VALUES (23, N'bolonesa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal], [NAlcohol100g], [NCarbohidratos100g], [NEnergia100g], [NGrasa100g], [NFibra100g], [NProteinas100g], [NSal100g], [NGrasasSaturadas100g], [NSodio100g], [NAzucar100g], [Foto], [CodigoBarra]) VALUES (24, N'bolonesa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal], [NAlcohol100g], [NCarbohidratos100g], [NEnergia100g], [NGrasa100g], [NFibra100g], [NProteinas100g], [NSal100g], [NGrasasSaturadas100g], [NSodio100g], [NAzucar100g], [Foto], [CodigoBarra]) VALUES (30, N'bolonesa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal], [NAlcohol100g], [NCarbohidratos100g], [NEnergia100g], [NGrasa100g], [NFibra100g], [NProteinas100g], [NSal100g], [NGrasasSaturadas100g], [NSodio100g], [NAzucar100g], [Foto], [CodigoBarra]) VALUES (31, N'bolonesa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal], [NAlcohol100g], [NCarbohidratos100g], [NEnergia100g], [NGrasa100g], [NFibra100g], [NProteinas100g], [NSal100g], [NGrasasSaturadas100g], [NSodio100g], [NAzucar100g], [Foto], [CodigoBarra]) VALUES (32, NULL, N'Farine de blé, sucre de canne roux, huile de colza, sésame toasté 10,6%, germe de blé 5,4%, farine complète de blé 5,4%, arôme naturel, magnésium, émulsifiant : lécithines de colza, poudres à lever (tartrates de potassium, carbonates de sodium, carbonates d''ammonium), sel de mer, amidon de blé, vitamines (E, PP, B6, B1, B9).', N'230g', NULL, N'Gerblé', 1, N'France', 2.3889426, 0.22878446, 0.11014808, 0.13545355, 0.019530673, 0, 2.882859363, NULL, 64, 467, 18, 4.6, 10, 0.38, 2, 0.152, 17, NULL, N'3175680011480')
INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal], [NAlcohol100g], [NCarbohidratos100g], [NEnergia100g], [NGrasa100g], [NFibra100g], [NProteinas100g], [NSal100g], [NGrasasSaturadas100g], [NSodio100g], [NAzucar100g], [Foto], [CodigoBarra]) VALUES (33, N'Nutella', N'Azúcar, Aceite vegetal de palma, Avellanas, Cacao desgrasado, Leche desnatada en polvo, Suero lácteo en polvo, Almendra, Emulsionante (lecitina de soja), Aromatizante (vainillina)', N'825 g', NULL, N'Ferrero,Nutella', 1, N'', 2.7444684, 4.5534882, 0.17097517, 0.18005618, 0.017321188, 0, 7.666309138, NULL, 57.5, 539, 30.9, NULL, 6.3, 0.107, 10.6, 0.0428, 56.3, N'https://images.openfoodfacts.org/images/products/301/762/042/9484/front_es.323.400.jpg', N'3017620429484')
INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal], [NAlcohol100g], [NCarbohidratos100g], [NEnergia100g], [NGrasa100g], [NFibra100g], [NProteinas100g], [NSal100g], [NGrasasSaturadas100g], [NSodio100g], [NAzucar100g], [Foto], [CodigoBarra]) VALUES (34, N'Nutella', N'Azúcar, Aceite vegetal de palma, Avellanas, Cacao desgrasado, Leche desnatada en polvo, Suero lácteo en polvo, Almendra, Emulsionante (lecitina de soja), Aromatizante (vainillina)', N'825 g', NULL, N'Ferrero,Nutella', 1, N'', 2.7444684, 4.5534882, 0.17097517, 0.18005618, 0.017321188, 0, 7.666309138, NULL, 57.5, 539, 30.9, NULL, 6.3, 0.107, 10.6, 0.0428, 56.3, N'https://images.openfoodfacts.org/images/products/301/762/042/9484/front_es.323.400.jpg', N'3017620429484')
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Gmail], [Contrasena], [Fecha]) VALUES (1, N'Shirly', N'J', N'Shirly@gmail.com', N's', NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Gmail], [Contrasena], [Fecha]) VALUES (2, N'Pablo', N'U', N'pol@gmail.com', N'p', NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Gmail], [Contrasena], [Fecha]) VALUES (3, N'Maia', N'R', N'm@gmail.com', N'm', NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
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
ALTER TABLE [dbo].[CarpetaXUsuario]  WITH CHECK ADD  CONSTRAINT [FK_CarpetaXProducto_Carpetas] FOREIGN KEY([IdCarpeta])
REFERENCES [dbo].[Carpeta] ([Id])
GO
ALTER TABLE [dbo].[CarpetaXUsuario] CHECK CONSTRAINT [FK_CarpetaXProducto_Carpetas]
GO
ALTER TABLE [dbo].[CarpetaXUsuario]  WITH CHECK ADD  CONSTRAINT [FK_CarpetaXProducto_Productos] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[CarpetaXUsuario] CHECK CONSTRAINT [FK_CarpetaXProducto_Productos]
GO
ALTER TABLE [dbo].[EtiquetaXProducto]  WITH CHECK ADD  CONSTRAINT [FK_EtiquetaXProducto_Producto] FOREIGN KEY([IdEtiqueta])
REFERENCES [dbo].[Etiquetas] ([Id])
GO
ALTER TABLE [dbo].[EtiquetaXProducto] CHECK CONSTRAINT [FK_EtiquetaXProducto_Producto]
GO
ALTER TABLE [dbo].[EtiquetaXProducto]  WITH CHECK ADD  CONSTRAINT [FK_EtiquetaXProducto_Producto1] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[EtiquetaXProducto] CHECK CONSTRAINT [FK_EtiquetaXProducto_Producto1]
GO
ALTER TABLE [dbo].[MeGustaXUsuario]  WITH CHECK ADD  CONSTRAINT [FK_MeGustaXUsuario_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[MeGustaXUsuario] CHECK CONSTRAINT [FK_MeGustaXUsuario_Producto]
GO
ALTER TABLE [dbo].[MeGustaXUsuario]  WITH CHECK ADD  CONSTRAINT [FK_MeGustaXUsuario_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[MeGustaXUsuario] CHECK CONSTRAINT [FK_MeGustaXUsuario_Usuario]
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
