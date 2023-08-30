USE [Diabetex]
GO
/****** Object:  Table [dbo].[AccesoProducto]    Script Date: 30/8/2023 17:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccesoProducto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[FechaAcceso] [datetime] NULL,
	[Favorito] [bit] NULL,
	[CodigoBarra] [varchar](50) NULL,
	[Foto] [varchar](max) NULL,
	[CantMeGusta] [int] NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_AccesoProducto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carpeta]    Script Date: 30/8/2023 17:21:12 ******/
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
/****** Object:  Table [dbo].[CarpetaXUsuario]    Script Date: 30/8/2023 17:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarpetaXUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NULL,
	[IdCarpeta] [int] NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_CarpetaXProducto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etiquetas]    Script Date: 30/8/2023 17:21:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etiquetas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IAceitePalma] [varchar](50) NULL,
	[IVegano] [varchar](50) NULL,
	[IVegetariano] [varchar](50) NULL,
	[NGrasa] [varchar](50) NULL,
	[NGrasasSaturadas] [varchar](50) NULL,
	[NAzucares] [varchar](50) NULL,
	[NSal] [varchar](50) NULL,
	[CodigoBarra] [varchar](50) NULL,
 CONSTRAINT [PK_Etiquetas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EtiquetaXProducto]    Script Date: 30/8/2023 17:21:12 ******/
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
/****** Object:  Table [dbo].[MeGustaXUsuario]    Script Date: 30/8/2023 17:21:12 ******/
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
/****** Object:  Table [dbo].[Plan]    Script Date: 30/8/2023 17:21:12 ******/
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
/****** Object:  Table [dbo].[PreferenciaXUsuario]    Script Date: 30/8/2023 17:21:12 ******/
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
/****** Object:  Table [dbo].[Producto]    Script Date: 30/8/2023 17:21:12 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 30/8/2023 17:21:12 ******/
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
	[Token] [varchar](50) NULL,
	[TokenExpirationDate] [varchar](50) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AccesoProducto] ON 

INSERT [dbo].[AccesoProducto] ([Id], [IdUsuario], [FechaAcceso], [Favorito], [CodigoBarra], [Foto], [CantMeGusta], [Nombre]) VALUES (30, 2, CAST(N'2023-08-11T12:30:20.857' AS DateTime), 0, N'80135463', N'https://images.openfoodfacts.org/images/products/80135463/front_es.212.400.jpg', NULL, N'Nutella')
INSERT [dbo].[AccesoProducto] ([Id], [IdUsuario], [FechaAcceso], [Favorito], [CodigoBarra], [Foto], [CantMeGusta], [Nombre]) VALUES (31, 2, CAST(N'2023-08-30T19:51:34.563' AS DateTime), 0, N'7798147780055', N'https://images.openfoodfacts.org/images/products/779/814/778/0055/front_es.24.400.jpg', 1000, N'bombones - FraNui')
INSERT [dbo].[AccesoProducto] ([Id], [IdUsuario], [FechaAcceso], [Favorito], [CodigoBarra], [Foto], [CantMeGusta], [Nombre]) VALUES (32, 2, CAST(N'2023-08-30T19:53:43.980' AS DateTime), 0, N'7795735000328', N'https://images.openfoodfacts.org/images/products/779/573/500/0328/front_es.17.400.jpg', NULL, N'Bizcocho Salado Don Satur')
INSERT [dbo].[AccesoProducto] ([Id], [IdUsuario], [FechaAcceso], [Favorito], [CodigoBarra], [Foto], [CantMeGusta], [Nombre]) VALUES (33, 2, CAST(N'2023-08-30T19:55:30.280' AS DateTime), 0, N'7790040116610', N'https://images.openfoodfacts.org/images/products/779/004/011/6610/front_es.17.400.jpg', NULL, N'Alfajor Tofi Negro')
INSERT [dbo].[AccesoProducto] ([Id], [IdUsuario], [FechaAcceso], [Favorito], [CodigoBarra], [Foto], [CantMeGusta], [Nombre]) VALUES (34, 3, CAST(N'2023-08-30T19:57:06.763' AS DateTime), 0, N'7613031154111', N'https://images.openfoodfacts.org/images/products/761/303/115/4111/front_es.13.400.jpg', NULL, N'Nescafé Gold')
SET IDENTITY_INSERT [dbo].[AccesoProducto] OFF
GO
SET IDENTITY_INSERT [dbo].[Carpeta] ON 

INSERT [dbo].[Carpeta] ([Id], [Nombre]) VALUES (1, N'Lunes')
INSERT [dbo].[Carpeta] ([Id], [Nombre]) VALUES (2, N'Gym')
INSERT [dbo].[Carpeta] ([Id], [Nombre]) VALUES (3, N'Para Ian')
INSERT [dbo].[Carpeta] ([Id], [Nombre]) VALUES (5, NULL)
INSERT [dbo].[Carpeta] ([Id], [Nombre]) VALUES (6, N'Gimnasio nuevo')
INSERT [dbo].[Carpeta] ([Id], [Nombre]) VALUES (7, N'gym nuevo')
INSERT [dbo].[Carpeta] ([Id], [Nombre]) VALUES (8, N'gym new')
INSERT [dbo].[Carpeta] ([Id], [Nombre]) VALUES (9, N'hola new')
INSERT [dbo].[Carpeta] ([Id], [Nombre]) VALUES (10, N'hola chau')
SET IDENTITY_INSERT [dbo].[Carpeta] OFF
GO
SET IDENTITY_INSERT [dbo].[CarpetaXUsuario] ON 

INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (6, 15, 2, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (7, 32, 2, 1)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (9, 24, 2, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (10, 30, 2, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (11, NULL, NULL, 1)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (12, NULL, NULL, 1)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (13, NULL, NULL, 1)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (14, NULL, NULL, 1)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (15, NULL, NULL, 1)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (16, NULL, NULL, 1)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (17, NULL, NULL, 1)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (18, NULL, NULL, 1)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (19, NULL, NULL, 1)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (20, NULL, NULL, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (21, NULL, NULL, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (22, NULL, NULL, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (23, NULL, NULL, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (24, NULL, NULL, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (25, NULL, NULL, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (26, NULL, NULL, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (27, NULL, NULL, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (28, NULL, NULL, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (29, NULL, NULL, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (30, NULL, NULL, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (31, NULL, NULL, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (32, NULL, NULL, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (33, NULL, NULL, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (34, NULL, NULL, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (35, NULL, NULL, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (36, NULL, NULL, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (37, NULL, NULL, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (38, NULL, NULL, 2)
INSERT [dbo].[CarpetaXUsuario] ([Id], [IdProducto], [IdCarpeta], [IdUsuario]) VALUES (45, NULL, 10, 2)
SET IDENTITY_INSERT [dbo].[CarpetaXUsuario] OFF
GO
SET IDENTITY_INSERT [dbo].[MeGustaXUsuario] ON 

INSERT [dbo].[MeGustaXUsuario] ([Id], [IdUsuario], [IdProducto], [NombreUsuario], [CodigoBarra]) VALUES (1, 2, 31, NULL, NULL)
INSERT [dbo].[MeGustaXUsuario] ([Id], [IdUsuario], [IdProducto], [NombreUsuario], [CodigoBarra]) VALUES (2, 5, 31, NULL, NULL)
INSERT [dbo].[MeGustaXUsuario] ([Id], [IdUsuario], [IdProducto], [NombreUsuario], [CodigoBarra]) VALUES (4, 2, NULL, NULL, N'80135463')
INSERT [dbo].[MeGustaXUsuario] ([Id], [IdUsuario], [IdProducto], [NombreUsuario], [CodigoBarra]) VALUES (5, 2, NULL, NULL, N'7613034626844')
INSERT [dbo].[MeGustaXUsuario] ([Id], [IdUsuario], [IdProducto], [NombreUsuario], [CodigoBarra]) VALUES (6, 2, NULL, NULL, N'7613034626844')
INSERT [dbo].[MeGustaXUsuario] ([Id], [IdUsuario], [IdProducto], [NombreUsuario], [CodigoBarra]) VALUES (7, 2, NULL, NULL, N'7613034626844')
INSERT [dbo].[MeGustaXUsuario] ([Id], [IdUsuario], [IdProducto], [NombreUsuario], [CodigoBarra]) VALUES (8, 2, NULL, NULL, N'7613034626844')
INSERT [dbo].[MeGustaXUsuario] ([Id], [IdUsuario], [IdProducto], [NombreUsuario], [CodigoBarra]) VALUES (9, 2, NULL, NULL, N'7613034626844')
INSERT [dbo].[MeGustaXUsuario] ([Id], [IdUsuario], [IdProducto], [NombreUsuario], [CodigoBarra]) VALUES (10, 2, NULL, NULL, N'7613034626844')
INSERT [dbo].[MeGustaXUsuario] ([Id], [IdUsuario], [IdProducto], [NombreUsuario], [CodigoBarra]) VALUES (11, 2, NULL, NULL, N'7613034626844')
INSERT [dbo].[MeGustaXUsuario] ([Id], [IdUsuario], [IdProducto], [NombreUsuario], [CodigoBarra]) VALUES (12, 16, NULL, NULL, N'8412600012185')
SET IDENTITY_INSERT [dbo].[MeGustaXUsuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal], [NAlcohol100g], [NCarbohidratos100g], [NEnergia100g], [NGrasa100g], [NFibra100g], [NProteinas100g], [NSal100g], [NGrasasSaturadas100g], [NSodio100g], [NAzucar100g], [Foto], [CodigoBarra]) VALUES (2, N'Nutella', N'Azúcar, manteca de palma, AVELLANAS 13%, LECHE desnatada en polvo 8.7%, cacao desgrasado 7.4%, emulgentes (lecitinas (SOJA)), vainillina.', N'200 g', 12, N'Ferrero', 1, N'', 2.7444684, 4.5534882, 0.17097517, 0.18005618, 0.017321188, 0, 7.666309138, NULL, 57.5, 539, 30.9, NULL, 6.3, 0.107, 10.6, 0.0428, 56.3, N'https://images.openfoodfacts.org/images/products/80135463/front_es.212.400.jpg', N'80135463')
INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal], [NAlcohol100g], [NCarbohidratos100g], [NEnergia100g], [NGrasa100g], [NFibra100g], [NProteinas100g], [NSal100g], [NGrasasSaturadas100g], [NSodio100g], [NAzucar100g], [Foto], [CodigoBarra]) VALUES (8, N'Pan de molde grande', N'Harina de trigo, agua, levadura, aceite vegetal (girasol), sal, conservadores (E 282, E200), emulgentes (E471, E472e), vinagre de vino, harina de haba, almidón de trigo y maíz, agentes de tratamiento de la harina (E300, E341).', N'375 g', 19, N'Bimbo', 1, N'', 1.0452153, 0.31401024, 0.28166528, 0.11801454, 0.0048545734, 0, 1.7637599334, NULL, 45, 252, 2.7, 4.7, 9.8, 1.1, 0.5, 0.44, 3.8, N'https://images.openfoodfacts.org/images/products/841/260/001/2185/front_es.4.400.jpg', N'8412600012185')
INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal], [NAlcohol100g], [NCarbohidratos100g], [NEnergia100g], [NGrasa100g], [NFibra100g], [NProteinas100g], [NSal100g], [NGrasasSaturadas100g], [NSodio100g], [NAzucar100g], [Foto], [CodigoBarra]) VALUES (9, N'Frutigran Avena y Pasas', N'Harina de trigo enriquecida (hierro 0.0030%, niacina 0.0013%, vitamina B1 0.00063%, ácido fólico 0.00022%, vitamina B2 0.00013%), azúcar, aceite de girasol de alto oleico, avena arrollada, pasas de uva, almidón de maíz, jarabe de maíz, sal, emulsionante (monoglicéridos de ácidos grasos), regulador de la acidez (bicarbonato de sodio), leudante químico (bicarbonato de amonio), aromatizante natural de vainilla, aromatizante idéntico al natural de manteca, antioxidante (tocoferoles).', N'250 g', 100, N'Granix,Frutigran', 1, N'Buenos Aires,Argentina', 2.3889426, 0.22878446, 0.11014808, 0.13545355, 0.019530673, 0, 2.882859363, NULL, 68, 429, 14, 3.9, 7.7, 0.7, 1.8, 0.28, NULL, N'https://images.openfoodfacts.org/images/products/779/004/500/1188/front_es.55.400.jpg', N'7790045001188')
INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal], [NAlcohol100g], [NCarbohidratos100g], [NEnergia100g], [NGrasa100g], [NFibra100g], [NProteinas100g], [NSal100g], [NGrasasSaturadas100g], [NSodio100g], [NAzucar100g], [Foto], [CodigoBarra]) VALUES (10, N'Alfajor Terrabusi Clásico', N'dulce de leche [leche, azúcar, jarabe de glucosa, humectante (sorbitol), espesante (alginato de sodio), conservante (sorbato de potasio), aromatizante (vainilla)], harina de trigo enriquecida según ley 25630 (harina de trigo, ácido fólico, vitamina B1, Vitamina B2, niacina), azúcar, jarabe de maíz de alta fructosa, huevo, sal, leudantes químicos (bicarbonato de amonio, bicarbonato de sodio, polirricinoleato de poliglicerol), conservante (sorbato de potasio), aromatizante natural limón, aromatizante idéntico al natural (vainillina), aromatizante artificial vainilla', N'50 g', 50, N'Terrabusi', 1, N'Tigre,Buenos Aires,Argentina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 59, 409, 15, 1.9, 7, 0.435, 8.4, 0.174, 40, N'https://images.openfoodfacts.org/images/products/77939234/front_es.28.400.jpg', N'77939234')
INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal], [NAlcohol100g], [NCarbohidratos100g], [NEnergia100g], [NGrasa100g], [NFibra100g], [NProteinas100g], [NSal100g], [NGrasasSaturadas100g], [NSodio100g], [NAzucar100g], [Foto], [CodigoBarra]) VALUES (14, N'Rocklets', N'CHOCOLATE CON LECHE 68% (AZÚCAR; MASA DE CACAO; LECHE ENTERA EN POLVO; MANTECA DE CACAO; GRASA VEGETAL EQUIVALENTE A LA MANTECA DE CACAO; LECHE DESCREMADA EN POLVO; EMULSIONANTES: LECITINA DE SOJA, POLIGLICEROL POLIRRICINOLEATO; AROMATIZANTE: VAINILLINA); AZÚCAR; ESTABILIZANTE: GOMA ARÁBIGA; GLASEANTE: CERA CARNAUBA; COLORANTES: DIÓXIDO DE TITANIO (E171), TARTRAZINA (E102), ROJO ALLURA (E129), AMARILLO OCASO (E110), AZUL BRILLANTE (E133), INDIGOTINA (E132). CONTIENE TARTRAZINA, LECHE Y DERIVADOS DE SOJA.', N'40 g', 1000, N'Arcor', 1, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 14, 477, 3.9, 0, 1, 0.04, 2.3, 0.016, 14, N'https://images.openfoodfacts.org/images/products/779/058/032/7415/front_es.10.400.jpg', N'7790580327415')
INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal], [NAlcohol100g], [NCarbohidratos100g], [NEnergia100g], [NGrasa100g], [NFibra100g], [NProteinas100g], [NSal100g], [NGrasasSaturadas100g], [NSodio100g], [NAzucar100g], [Foto], [CodigoBarra]) VALUES (16, N'bombones', N'Frambuesas congeladas, chocolate con leche (Azúcar, manteca y masa de cacao, leche en polvo, arom, vainillina, emul, E322), chocolate blanco (azúcar, manteca de cacao, leche en polvo, arom, vainillina, emul, E322), CONTIENE LECHE, DERIVADO DE SOJA, PUEDE CONTENER TRAZAS DE MANI, PISTACHOS, AVELLANAS Y NUECES, FRAMBUESAS CONGELADAS, BANADAS EN CHOCOLATE BLANCO Y CHOCOLATE CON LECHE LIBRE DE GLUTEN Sin TAC Sin TACC 150gs', N'150g', 1001, N'FraNui,RapaNui', 1, N'Bariloche,Rio Negro,Argentina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40.8, 372, 21.7, 2.52, 4.48, 0, 4.48, 0, NULL, N'https://images.openfoodfacts.org/images/products/779/814/778/0055/front_es.24.400.jpg', N'7798147780055')
INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal], [NAlcohol100g], [NCarbohidratos100g], [NEnergia100g], [NGrasa100g], [NFibra100g], [NProteinas100g], [NSal100g], [NGrasasSaturadas100g], [NSodio100g], [NAzucar100g], [Foto], [CodigoBarra]) VALUES (18, N'Bizcocho Salado Don Satur', N'Harina de trigo enriquecida, grasa bovina refinada, agua, sal, azúcar.', N'200 g', NULL, N'Don Satur', 1, N'Ramos Mejia', 3.0064344, 0.23441268, 0.28818476, 0.13687933, 0.019530673, 0, 3.685441843, 0, 16, 155, 8.9, 0, 2.7, 0.4318, 4.1, 0.17272, 0, N'https://images.openfoodfacts.org/images/products/779/573/500/0328/front_es.17.400.jpg', N'7795735000328')
INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal], [NAlcohol100g], [NCarbohidratos100g], [NEnergia100g], [NGrasa100g], [NFibra100g], [NProteinas100g], [NSal100g], [NGrasasSaturadas100g], [NSodio100g], [NAzucar100g], [Foto], [CodigoBarra]) VALUES (19, N'Alfajor Tofi Negro', N'DULCE DE LECHE 47% (LECHE ENTERA; AZUCAR; JARABE DE GLUCOSA; HUMECTANTE: SORBITOL; ESTABILIZANTES: ALGINATO DE SODIO, CARRAGENINA, AGAR; CONSERVADOR: SORBATO DE POTASIÓ; AROMATIZANTE): HARINA DE TRIGO ENRIQUECIDA (HIERRO: 30 mg/kg: ACIDO FOLICO: 2,2 mg/kg; TIAMINA: 6.3 mg/kg; RIBOFLAVINA: 1,3 mg/kg; NIACINA: 13 mg/kg); BAÑO DE REPOSTERIA (EMULSIONANTES: LECITINA DE SOJA/SOYA, POLIGLICEROL POLIRRICINOLEATO); AZÚCAR; ACEITE DE GIRASOL ALTO OLEICO; JARABE DE GLUCOSA; ALMIDÓN; CACAO EN POLVO; YEMA DE HUEVO; SAL; LEUDANTES QUIMICOS: BICARBONATO DE AMONIO, BICARBONATO DE SODIO; EMULSIONANTES: MONO Y DIGLICERIDOS DE ACIDOS GRASOS, LECITINA DE SOJA/SOYA; MEJORADOR DE LA HARINA: METABISULFITO DE SODIO; CONSERVADOR: PROPIONATO DE CALCIO; AROMATIZANTES ART?FICIALES: VAINILLINA, AROMAS CHOCOLATE, LECHE CONDENSADA Y NARANJA. CONTIENE LECHE, DERIVADOS DE TRIGO, HUEVO Y SOJA/SOYA.', N'46 g', NULL, N'tofi', 1, N'Argentina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 61, 392, 14, 1.6, 6.1, 0.275, 6.4, 0.11, 41, N'https://images.openfoodfacts.org/images/products/779/004/011/6610/front_es.17.400.jpg', N'7790040116610')
INSERT [dbo].[Producto] ([Id], [Nombre], [Ingredientes], [Cantidad], [CantMeGusta], [Marca], [EspeciesAmenazadas], [LugarFabricacion], [HCAgricultura], [HCProcesado], [HCEmbalaje], [HCTransporte], [HCDistribución], [HCConsumo], [HCTotal], [NAlcohol100g], [NCarbohidratos100g], [NEnergia100g], [NGrasa100g], [NFibra100g], [NProteinas100g], [NSal100g], [NGrasasSaturadas100g], [NSodio100g], [NAzucar100g], [Foto], [CodigoBarra]) VALUES (20, N'Nescafé Gold', N'Café soluble, café molido 3%.', N'100 g', NULL, N'Nescafé,Nestlé', 1, N'Staffordshire,Reino Unido', 19.495674, 6.9985445, 0.10010411, 0.45621559, 0.015708527, 0, 27.066246727, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'https://images.openfoodfacts.org/images/products/761/303/115/4111/front_es.13.400.jpg', N'7613031154111')
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Gmail], [Contrasena], [Fecha], [Token], [TokenExpirationDate]) VALUES (1, N'Juan', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Gmail], [Contrasena], [Fecha], [Token], [TokenExpirationDate]) VALUES (2, N'Julia', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Gmail], [Contrasena], [Fecha], [Token], [TokenExpirationDate]) VALUES (3, N'Marcos', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Gmail], [Contrasena], [Fecha], [Token], [TokenExpirationDate]) VALUES (4, N'Lucas', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
