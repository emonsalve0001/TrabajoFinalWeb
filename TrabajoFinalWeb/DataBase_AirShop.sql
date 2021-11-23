USE [master]
GO
/****** Object:  Database [AirShop]    Script Date: 22/11/2021 21:14:19 ******/
CREATE DATABASE [AirShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AirShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AirShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AirShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AirShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AirShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AirShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AirShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AirShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AirShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AirShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AirShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [AirShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AirShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AirShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AirShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AirShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AirShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AirShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AirShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AirShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AirShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AirShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AirShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AirShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AirShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AirShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AirShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AirShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AirShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AirShop] SET  MULTI_USER 
GO
ALTER DATABASE [AirShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AirShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AirShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AirShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AirShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AirShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AirShop', N'ON'
GO
ALTER DATABASE [AirShop] SET QUERY_STORE = OFF
GO
USE [AirShop]
GO
/****** Object:  Table [dbo].[DBS]    Script Date: 22/11/2021 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdPedido] [int] NULL,
	[MontoTotal] [decimal](18, 0) NULL,
	[IdModoDePago] [int] NULL,
 CONSTRAINT [PK_DBS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleBoleta]    Script Date: 22/11/2021 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleBoleta](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdPedido] [int] NOT NULL,
	[MontoTotal] [decimal](18, 2) NOT NULL,
	[IdModoDePago] [int] NOT NULL,
 CONSTRAINT [PK_DetalleBoleta] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 22/11/2021 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[ID] [nvarchar](50) NOT NULL,
	[Contraseña] [nvarchar](50) NOT NULL,
	[IdTipoEmpleado] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Celular] [int] NOT NULL,
	[Correo] [nvarchar](100) NOT NULL,
	[Direccion] [nvarchar](50) NOT NULL,
	[Sueldo] [money] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados_Servicios]    Script Date: 22/11/2021 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados_Servicios](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [nvarchar](50) NOT NULL,
	[IdServicio] [int] NOT NULL,
	[Observacion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Empleados_Servicios] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModoDePago]    Script Date: 22/11/2021 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModoDePago](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ModoDePago] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 22/11/2021 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Atendido] [bit] NOT NULL,
	[Detalle] [nvarchar](50) NOT NULL,
	[IdEmpleado] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PPS]    Script Date: 22/11/2021 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PPS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NULL,
	[IdPedido] [int] NULL,
	[Observacion] [nvarchar](50) NULL,
 CONSTRAINT [PK_PPS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 22/11/2021 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[IdTipoProducto] [int] NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
	[imagen] [nvarchar](50) NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos_Pedidos]    Script Date: 22/11/2021 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos_Pedidos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[IdPedido] [int] NOT NULL,
	[Observacion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Productos_Pedidos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PS]    Script Date: 22/11/2021 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Atendido] [bit] NULL,
	[Detalle] [nvarchar](50) NULL,
 CONSTRAINT [PK_PS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 22/11/2021 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Servicio] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEmpleado]    Script Date: 22/11/2021 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEmpleado](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[Sueldo] [decimal](18, 2) NULL,
 CONSTRAINT [PK_TipoEmpleado] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoProducto]    Script Date: 22/11/2021 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoProducto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TipoProducto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DetalleBoleta] ON 
GO
INSERT [dbo].[DetalleBoleta] ([ID], [IdPedido], [MontoTotal], [IdModoDePago]) VALUES (1, 1, CAST(3200000.00 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[DetalleBoleta] ([ID], [IdPedido], [MontoTotal], [IdModoDePago]) VALUES (2, 2, CAST(3200000.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[DetalleBoleta] ([ID], [IdPedido], [MontoTotal], [IdModoDePago]) VALUES (3, 3, CAST(3600000.00 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[DetalleBoleta] ([ID], [IdPedido], [MontoTotal], [IdModoDePago]) VALUES (4, 4, CAST(3200000.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[DetalleBoleta] ([ID], [IdPedido], [MontoTotal], [IdModoDePago]) VALUES (5, 5, CAST(900000.00 AS Decimal(18, 2)), 3)
GO
INSERT [dbo].[DetalleBoleta] ([ID], [IdPedido], [MontoTotal], [IdModoDePago]) VALUES (6, 6, CAST(2900000.00 AS Decimal(18, 2)), 2)
GO
INSERT [dbo].[DetalleBoleta] ([ID], [IdPedido], [MontoTotal], [IdModoDePago]) VALUES (7, 7, CAST(4400000.00 AS Decimal(18, 2)), 1)
GO
INSERT [dbo].[DetalleBoleta] ([ID], [IdPedido], [MontoTotal], [IdModoDePago]) VALUES (8, 8, CAST(4400000.00 AS Decimal(18, 2)), 3)
GO
SET IDENTITY_INSERT [dbo].[DetalleBoleta] OFF
GO
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'ADMINMax', N'1234', 1, N'Diego', 321808075, N'dcarmona@poligran.edu.co', N'KR 44 A # 93 - 44', 1200000.0000)
GO
INSERT [dbo].[Empleado] ([ID], [Contraseña], [IdTipoEmpleado], [Nombre], [Celular], [Correo], [Direccion], [Sueldo]) VALUES (N'Edison', N'1234', 2, N'Edison Monsalve', 123456789, N'edison@poligran.edu.co', N'CL 45 # 95 - 45', 0.0000)
GO
SET IDENTITY_INSERT [dbo].[ModoDePago] ON 
GO
INSERT [dbo].[ModoDePago] ([ID], [Descripcion]) VALUES (1, N'Tarjeta De Crédito')
GO
INSERT [dbo].[ModoDePago] ([ID], [Descripcion]) VALUES (2, N'Tarjeta Débito')
GO
INSERT [dbo].[ModoDePago] ([ID], [Descripcion]) VALUES (3, N'Efectivo')
GO
SET IDENTITY_INSERT [dbo].[ModoDePago] OFF
GO
SET IDENTITY_INSERT [dbo].[Pedido] ON 
GO
INSERT [dbo].[Pedido] ([ID], [Atendido], [Detalle], [IdEmpleado]) VALUES (1, 1, N'Edison Monsalve', N'ADMINMax')
GO
INSERT [dbo].[Pedido] ([ID], [Atendido], [Detalle], [IdEmpleado]) VALUES (2, 1, N'Edison Monsalve', N'ADMINMax')
GO
INSERT [dbo].[Pedido] ([ID], [Atendido], [Detalle], [IdEmpleado]) VALUES (3, 0, N'Edison Monsalve', N'ADMINMax')
GO
INSERT [dbo].[Pedido] ([ID], [Atendido], [Detalle], [IdEmpleado]) VALUES (4, 0, N'Edison Monsalve', N'ADMINMax')
GO
INSERT [dbo].[Pedido] ([ID], [Atendido], [Detalle], [IdEmpleado]) VALUES (5, 0, N'Edison Monsalve', N'ADMINMax')
GO
INSERT [dbo].[Pedido] ([ID], [Atendido], [Detalle], [IdEmpleado]) VALUES (6, 0, N'Edison Monsalve', N'ADMINMax')
GO
INSERT [dbo].[Pedido] ([ID], [Atendido], [Detalle], [IdEmpleado]) VALUES (7, 0, N'Edison Monsalve', N'ADMINMax')
GO
INSERT [dbo].[Pedido] ([ID], [Atendido], [Detalle], [IdEmpleado]) VALUES (8, 1, N'ProfeLina', N'ADMINMax')
GO
SET IDENTITY_INSERT [dbo].[Pedido] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 
GO
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (1, N'Split', 1, CAST(1200000.00 AS Decimal(18, 2)), N'Aire acondicionado Split.', N'Split.jpg')
GO
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (2, N'Solar', 1, CAST(2000000.00 AS Decimal(18, 2)), N'Aire acondicionado Solar.', N'Solar.jpg')
GO
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (3, N'Portatil', 1, CAST(900000.00 AS Decimal(18, 2)), N'Aire acondicionado Portátil.', N'Portatil.jpg')
GO
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (4, N'MultiSplit', 1, CAST(1500000.00 AS Decimal(18, 2)), N'Aire acondicionado Multi Split.', N'MultiSplit.jpg')
GO
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (5, N'FanCoil', 1, CAST(1900000.00 AS Decimal(18, 2)), N'Aire acondicionado Fan Coil.', N'FanCoil.jpg')
GO
INSERT [dbo].[Producto] ([ID], [Nombre], [IdTipoProducto], [Precio], [Descripcion], [imagen]) VALUES (6, N'Conductos', 1, CAST(1700000.00 AS Decimal(18, 2)), N'Aire acondicionado por Conductos.', N'Conductos.jpg')
GO
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos_Pedidos] ON 
GO
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (1, 1, 1, NULL)
GO
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (2, 2, 1, NULL)
GO
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (3, 1, 2, NULL)
GO
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (4, 2, 2, NULL)
GO
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (5, 6, 3, NULL)
GO
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (6, 5, 3, NULL)
GO
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (7, 1, 4, NULL)
GO
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (8, 2, 4, NULL)
GO
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (9, 3, 5, NULL)
GO
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (10, 2, 6, NULL)
GO
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (11, 3, 6, NULL)
GO
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (12, 4, 7, NULL)
GO
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (13, 2, 7, NULL)
GO
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (14, 3, 7, NULL)
GO
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (15, 1, 8, NULL)
GO
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (16, 1, 8, NULL)
GO
INSERT [dbo].[Productos_Pedidos] ([ID], [IdProducto], [IdPedido], [Observacion]) VALUES (17, 2, 8, NULL)
GO
SET IDENTITY_INSERT [dbo].[Productos_Pedidos] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoEmpleado] ON 
GO
INSERT [dbo].[TipoEmpleado] ([ID], [Descripcion], [Sueldo]) VALUES (1, N'Admin', CAST(1200000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[TipoEmpleado] ([ID], [Descripcion], [Sueldo]) VALUES (2, N'Cliente', CAST(0.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[TipoEmpleado] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoProducto] ON 
GO
INSERT [dbo].[TipoProducto] ([ID], [Descripcion]) VALUES (1, N'Aires Acondicionados Hogares')
GO
SET IDENTITY_INSERT [dbo].[TipoProducto] OFF
GO
ALTER TABLE [dbo].[DBS]  WITH CHECK ADD  CONSTRAINT [FK_DBS_ModoDePago] FOREIGN KEY([IdModoDePago])
REFERENCES [dbo].[ModoDePago] ([ID])
GO
ALTER TABLE [dbo].[DBS] CHECK CONSTRAINT [FK_DBS_ModoDePago]
GO
ALTER TABLE [dbo].[DBS]  WITH CHECK ADD  CONSTRAINT [FK_DBS_PS] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[PS] ([ID])
GO
ALTER TABLE [dbo].[DBS] CHECK CONSTRAINT [FK_DBS_PS]
GO
ALTER TABLE [dbo].[DetalleBoleta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleBoleta_ModoDePago] FOREIGN KEY([IdModoDePago])
REFERENCES [dbo].[ModoDePago] ([ID])
GO
ALTER TABLE [dbo].[DetalleBoleta] CHECK CONSTRAINT [FK_DetalleBoleta_ModoDePago]
GO
ALTER TABLE [dbo].[DetalleBoleta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleBoleta_Pedido] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedido] ([ID])
GO
ALTER TABLE [dbo].[DetalleBoleta] CHECK CONSTRAINT [FK_DetalleBoleta_Pedido]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_TipoEmpleado] FOREIGN KEY([IdTipoEmpleado])
REFERENCES [dbo].[TipoEmpleado] ([ID])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_TipoEmpleado]
GO
ALTER TABLE [dbo].[Empleados_Servicios]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Servicios] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([ID])
GO
ALTER TABLE [dbo].[Empleados_Servicios] CHECK CONSTRAINT [FK_Empleados_Servicios]
GO
ALTER TABLE [dbo].[Empleados_Servicios]  WITH CHECK ADD  CONSTRAINT [FK_Servicios_Servicios] FOREIGN KEY([IdServicio])
REFERENCES [dbo].[Servicio] ([ID])
GO
ALTER TABLE [dbo].[Empleados_Servicios] CHECK CONSTRAINT [FK_Servicios_Servicios]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Pedido] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([ID])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Pedido]
GO
ALTER TABLE [dbo].[PPS]  WITH CHECK ADD  CONSTRAINT [FK_PPS_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([ID])
GO
ALTER TABLE [dbo].[PPS] CHECK CONSTRAINT [FK_PPS_Producto]
GO
ALTER TABLE [dbo].[PPS]  WITH CHECK ADD  CONSTRAINT [FK_PPS_PS] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[PS] ([ID])
GO
ALTER TABLE [dbo].[PPS] CHECK CONSTRAINT [FK_PPS_PS]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_TipoProducto] FOREIGN KEY([IdTipoProducto])
REFERENCES [dbo].[TipoProducto] ([ID])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_TipoProducto]
GO
ALTER TABLE [dbo].[Productos_Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Pedidos_Pedido] FOREIGN KEY([IdPedido])
REFERENCES [dbo].[Pedido] ([ID])
GO
ALTER TABLE [dbo].[Productos_Pedidos] CHECK CONSTRAINT [FK_Productos_Pedidos_Pedido]
GO
ALTER TABLE [dbo].[Productos_Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Pedidos_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([ID])
GO
ALTER TABLE [dbo].[Productos_Pedidos] CHECK CONSTRAINT [FK_Productos_Pedidos_Producto]
GO
/****** Object:  StoredProcedure [dbo].[eliminar]    Script Date: 22/11/2021 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eliminar]
AS
BEGIN
	delete from DBS 
	delete from PPS
    delete from PS
	DBCC CHECKIDENT (PS, RESEED,0)
	DBCC CHECKIDENT (PPS, RESEED,0)
	DBCC CHECKIDENT (DBS, RESEED,0)
END
GO
/****** Object:  StoredProcedure [dbo].[eliminarTodo]    Script Date: 22/11/2021 21:14:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[eliminarTodo] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
delete from DBS 
	delete from PPS
    delete from PS
	DBCC CHECKIDENT (PS, RESEED,0)
	DBCC CHECKIDENT (PPS, RESEED,0)
	DBCC CHECKIDENT (DBS, RESEED,0)
	END
GO
USE [master]
GO
ALTER DATABASE [AirShop] SET  READ_WRITE 
GO
