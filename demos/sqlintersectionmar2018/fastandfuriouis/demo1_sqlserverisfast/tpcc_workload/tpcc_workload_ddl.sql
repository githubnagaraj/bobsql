USE [master]
GO
DROP DATABASE [tpcc_workload]
go
/****** Object:  Database [tpcc_workload]    Script Date: 9/3/2017 1:06:01 PM ******/
CREATE DATABASE [tpcc_workload]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tpcc_workload', FILENAME = N'D:\data\tpcc_workload.mdf' , SIZE = 15Gb , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tpcc_workload_log', FILENAME = N'D:\data\tpcc_workload_log.ldf' , SIZE = 5Gb , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [tpcc_workload] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tpcc_workload].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tpcc_workload] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tpcc_workload] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tpcc_workload] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tpcc_workload] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tpcc_workload] SET ARITHABORT OFF 
GO
ALTER DATABASE [tpcc_workload] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tpcc_workload] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tpcc_workload] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tpcc_workload] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tpcc_workload] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tpcc_workload] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tpcc_workload] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tpcc_workload] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tpcc_workload] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tpcc_workload] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tpcc_workload] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tpcc_workload] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tpcc_workload] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tpcc_workload] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tpcc_workload] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tpcc_workload] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tpcc_workload] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tpcc_workload] SET RECOVERY FULL 
GO
ALTER DATABASE [tpcc_workload] SET  MULTI_USER 
GO
ALTER DATABASE [tpcc_workload] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tpcc_workload] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tpcc_workload] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tpcc_workload] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tpcc_workload] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'tpcc_workload', N'ON'
GO
ALTER DATABASE [tpcc_workload] SET QUERY_STORE = OFF
GO
USE [tpcc_workload]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [tpcc_workload]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 9/3/2017 1:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[c_id] [int] NOT NULL,
	[c_d_id] [tinyint] NOT NULL,
	[c_w_id] [int] NOT NULL,
	[c_discount] [smallmoney] NULL,
	[c_credit_lim] [money] NULL,
	[c_last] [char](16) NULL,
	[c_first] [char](16) NULL,
	[c_credit] [char](2) NULL,
	[c_balance] [money] NULL,
	[c_ytd_payment] [money] NULL,
	[c_payment_cnt] [smallint] NULL,
	[c_delivery_cnt] [smallint] NULL,
	[c_street_1] [char](20) NULL,
	[c_street_2] [char](20) NULL,
	[c_city] [char](20) NULL,
	[c_state] [char](2) NULL,
	[c_zip] [char](9) NULL,
	[c_phone] [char](16) NULL,
	[c_since] [datetime] NULL,
	[c_middle] [char](2) NULL,
	[c_data] [char](500) NULL
) ON [PRIMARY]
GO
--ALTER TABLE [dbo].[customer] SET (LOCK_ESCALATION = DISABLE)
--GO
/****** Object:  Table [dbo].[district]    Script Date: 9/3/2017 1:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[district](
	[d_id] [tinyint] NOT NULL,
	[d_w_id] [int] NOT NULL,
	[d_ytd] [money] NOT NULL,
	[d_next_o_id] [int] NULL,
	[d_tax] [smallmoney] NULL,
	[d_name] [char](10) NULL,
	[d_street_1] [char](20) NULL,
	[d_street_2] [char](20) NULL,
	[d_city] [char](20) NULL,
	[d_state] [char](2) NULL,
	[d_zip] [char](9) NULL,
	[padding] [char](6000) NOT NULL) ON [PRIMARY]
GO
--ALTER TABLE [dbo].[district] SET (LOCK_ESCALATION = DISABLE)
--GO
/****** Object:  Table [dbo].[history]    Script Date: 9/3/2017 1:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[history](
	[h_c_id] [int] NULL,
	[h_c_d_id] [tinyint] NULL,
	[h_c_w_id] [int] NULL,
	[h_d_id] [tinyint] NULL,
	[h_w_id] [int] NULL,
	[h_date] [datetime] NULL,
	[h_amount] [smallmoney] NULL,
	[h_data] [char](24) NULL
) ON [PRIMARY]
GO
--ALTER TABLE [dbo].[history] SET (LOCK_ESCALATION = DISABLE)
--GO
/****** Object:  Table [dbo].[item]    Script Date: 9/3/2017 1:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item](
	[i_id] [int] NOT NULL,
	[i_name] [char](24) NULL,
	[i_price] [smallmoney] NULL,
	[i_data] [char](50) NULL,
	[i_im_id] [int] NULL) ON [PRIMARY]
GO
--ALTER TABLE [dbo].[item] SET (LOCK_ESCALATION = DISABLE)
--GO
/****** Object:  Table [dbo].[new_order]    Script Date: 9/3/2017 1:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[new_order](
	[no_o_id] [int] NOT NULL,
	[no_d_id] [tinyint] NOT NULL,
	[no_w_id] [int] NOT NULL
) ON [PRIMARY]
GO
--ALTER TABLE [dbo].[new_order] SET (LOCK_ESCALATION = DISABLE)
--GO
/****** Object:  Table [dbo].[order_line]    Script Date: 9/3/2017 1:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_line](
	[ol_o_id] [int] NOT NULL,
	[ol_d_id] [tinyint] NOT NULL,
	[ol_w_id] [int] NOT NULL,
	[ol_number] [tinyint] NOT NULL,
	[ol_i_id] [int] NULL,
	[ol_delivery_d] [datetime] NULL,
	[ol_amount] [smallmoney] NULL,
	[ol_supply_w_id] [int] NULL,
	[ol_quantity] [smallint] NULL,
	[ol_dist_info] [char](24) NULL
) ON [PRIMARY]
GO
--ALTER TABLE [dbo].[order_line] SET (LOCK_ESCALATION = DISABLE)
--GO
/****** Object:  Table [dbo].[orders]    Script Date: 9/3/2017 1:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[o_id] [int] NOT NULL,
	[o_d_id] [tinyint] NOT NULL,
	[o_w_id] [int] NOT NULL,
	[o_c_id] [int] NOT NULL,
	[o_carrier_id] [tinyint] NULL,
	[o_ol_cnt] [tinyint] NULL,
	[o_all_local] [tinyint] NULL,
	[o_entry_d] [datetime] NULL
) ON [PRIMARY]
GO
--ALTER TABLE [dbo].[orders] SET (LOCK_ESCALATION = DISABLE)
--GO
/****** Object:  Table [dbo].[stock]    Script Date: 9/3/2017 1:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock](
	[s_i_id] [int] NOT NULL,
	[s_w_id] [int] NOT NULL,
	[s_quantity] [smallint] NOT NULL,
	[s_ytd] [int] NOT NULL,
	[s_order_cnt] [smallint] NULL,
	[s_remote_cnt] [smallint] NULL,
	[s_data] [char](50) NULL,
	[s_dist_01] [char](24) NULL,
	[s_dist_02] [char](24) NULL,
	[s_dist_03] [char](24) NULL,
	[s_dist_04] [char](24) NULL,
	[s_dist_05] [char](24) NULL,
	[s_dist_06] [char](24) NULL,
	[s_dist_07] [char](24) NULL,
	[s_dist_08] [char](24) NULL,
	[s_dist_09] [char](24) NULL,
	[s_dist_10] [char](24) NULL) ON [PRIMARY]
GO
--ALTER TABLE [dbo].[stock] SET (LOCK_ESCALATION = DISABLE)
--GO
/****** Object:  Table [dbo].[warehouse]    Script Date: 9/3/2017 1:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[warehouse](
	[w_id] [int] NOT NULL,
	[w_ytd] [money] NOT NULL,
	[w_tax] [smallmoney] NOT NULL,
	[w_name] [char](10) NULL,
	[w_street_1] [char](20) NULL,
	[w_street_2] [char](20) NULL,
	[w_city] [char](20) NULL,
	[w_state] [char](2) NULL,
	[w_zip] [char](9) NULL,
	[padding] [char](4000) NOT NULL) ON [PRIMARY]
GO
--ALTER TABLE [dbo].[warehouse] SET (LOCK_ESCALATION = DISABLE)
--GO
SET ANSI_PADDING ON
GO
/****** Object:  StoredProcedure [dbo].[delivery]    Script Date: 9/3/2017 1:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[delivery]  
@d_w_id int,
@d_o_carrier_id int,
@timestamp datetime2(0)
AS 
BEGIN
SET ANSI_WARNINGS OFF
DECLARE
@d_no_o_id int, 
@d_d_id int, 
@d_c_id int, 
@d_ol_total int
BEGIN TRANSACTION
BEGIN TRY
DECLARE
@loop_counter int
SET @loop_counter = 1
WHILE @loop_counter <= 10
BEGIN
SET @d_d_id = @loop_counter


DECLARE @d_out TABLE (d_no_o_id INT)

DELETE TOP (1) 
FROM dbo.new_order 
OUTPUT deleted.no_o_id INTO @d_out -- @d_no_o_id
WHERE new_order.no_w_id = @d_w_id 
AND new_order.no_d_id = @d_d_id 

SELECT @d_no_o_id = d_no_o_id FROM @d_out
 

UPDATE dbo.orders 
SET o_carrier_id = @d_o_carrier_id 
, @d_c_id = orders.o_c_id 
WHERE orders.o_id = @d_no_o_id 
AND orders.o_d_id = @d_d_id 
AND orders.o_w_id = @d_w_id


 SET @d_ol_total = 0

UPDATE dbo.order_line 
SET ol_delivery_d = @timestamp
	, @d_ol_total = @d_ol_total + ol_amount
WHERE order_line.ol_o_id = @d_no_o_id 
AND order_line.ol_d_id = @d_d_id 
AND order_line.ol_w_id = @d_w_id


UPDATE dbo.customer SET c_balance = customer.c_balance + @d_ol_total 
WHERE customer.c_id = @d_c_id 
AND customer.c_d_id = @d_d_id 
AND customer.c_w_id = @d_w_id


PRINT 
'D: '
+ 
ISNULL(CAST(@d_d_id AS nvarchar(4000)), '')
+ 
'O: '
+ 
ISNULL(CAST(@d_no_o_id AS nvarchar(4000)), '')
+ 
'time '
+ 
ISNULL(CAST(@timestamp AS nvarchar(4000)), '')
SET @loop_counter = @loop_counter + 1
END
SELECT	@d_w_id as N'@d_w_id', @d_o_carrier_id as N'@d_o_carrier_id', @timestamp as N'@TIMESTAMP'
END TRY
BEGIN CATCH
SELECT 
ERROR_NUMBER() AS ErrorNumber
,ERROR_SEVERITY() AS ErrorSeverity
,ERROR_STATE() AS ErrorState
,ERROR_PROCEDURE() AS ErrorProcedure
,ERROR_LINE() AS ErrorLine
,ERROR_MESSAGE() AS ErrorMessage;
IF @@TRANCOUNT > 0
ROLLBACK TRANSACTION;
END CATCH;
IF @@TRANCOUNT > 0
COMMIT TRANSACTION;
END
GO
/****** Object:  StoredProcedure [dbo].[neword]    Script Date: 9/3/2017 1:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[neword]  
@no_w_id int,
@no_max_w_id int,
@no_d_id int,
@no_c_id int,
@no_o_ol_cnt int,
@TIMESTAMP datetime2(0)
AS 
BEGIN
SET ANSI_WARNINGS OFF
DECLARE
@no_c_discount smallmoney,
@no_c_last char(16),
@no_c_credit char(2),
@no_d_tax smallmoney,
@no_w_tax smallmoney,
@no_d_next_o_id int,
@no_ol_supply_w_id int, 
@no_ol_i_id int, 
@no_ol_quantity int, 
@no_o_all_local int, 
@o_id int, 
@no_i_name char(24), 
@no_i_price smallmoney, 
@no_i_data char(50), 
@no_s_quantity int, 
@no_ol_amount int, 
@no_s_dist_01 char(24), 
@no_s_dist_02 char(24), 
@no_s_dist_03 char(24), 
@no_s_dist_04 char(24), 
@no_s_dist_05 char(24), 
@no_s_dist_06 char(24), 
@no_s_dist_07 char(24), 
@no_s_dist_08 char(24), 
@no_s_dist_09 char(24), 
@no_s_dist_10 char(24), 
@no_ol_dist_info char(24), 
@no_s_data char(50), 
@x int, 
@rbk int
BEGIN TRANSACTION
BEGIN TRY

SET @no_o_all_local = 0
SELECT @no_c_discount = customer.c_discount
, @no_c_last = customer.c_last
, @no_c_credit = customer.c_credit
, @no_w_tax = warehouse.w_tax 
FROM dbo.customer, dbo.warehouse WITH (INDEX = w_details)
WHERE warehouse.w_id = @no_w_id 
AND customer.c_w_id = @no_w_id 
AND customer.c_d_id = @no_d_id 
AND customer.c_id = @no_c_id

UPDATE dbo.district 
SET @no_d_tax = d_tax
, @o_id = d_next_o_id
,  d_next_o_id = district.d_next_o_id + 1 
WHERE district.d_id = @no_d_id 
AND district.d_w_id = @no_w_id
SET @no_d_next_o_id = @o_id+1

INSERT dbo.orders( o_id, o_d_id, o_w_id, o_c_id, o_entry_d, o_ol_cnt, o_all_local) 
VALUES ( @o_id, @no_d_id, @no_w_id, @no_c_id, @TIMESTAMP, @no_o_ol_cnt, @no_o_all_local)

INSERT dbo.new_order(no_o_id, no_d_id, no_w_id) 
VALUES (@o_id, @no_d_id, @no_w_id)

SET @rbk = CAST(100 * RAND() + 1 AS INT)
DECLARE
@loop_counter int
SET @loop_counter = 1
DECLARE
@loop$bound int
SET @loop$bound = @no_o_ol_cnt
WHILE @loop_counter <= @loop$bound
BEGIN
IF ((@loop_counter = @no_o_ol_cnt) AND (@rbk = 1))
SET @no_ol_i_id = 100001
ELSE 
SET @no_ol_i_id =  CAST(1000000 * RAND() + 1 AS INT)
SET @x = CAST(100 * RAND() + 1 AS INT)
IF (@x > 1)
SET @no_ol_supply_w_id = @no_w_id
ELSE 
BEGIN
SET @no_ol_supply_w_id = @no_w_id
SET @no_o_all_local = 0
WHILE ((@no_ol_supply_w_id = @no_w_id) AND (@no_max_w_id != 1))
BEGIN
SET @no_ol_supply_w_id = CAST(@no_max_w_id * RAND() + 1 AS INT)
DECLARE
@db_null_statement$2 int
END
END
SET @no_ol_quantity = CAST(10 * RAND() + 1 AS INT)

SELECT @no_i_price = item.i_price
, @no_i_name = item.i_name
, @no_i_data = item.i_data 
FROM dbo.item 
WHERE item.i_id = @no_ol_i_id

SELECT @no_s_quantity = stock.s_quantity
, @no_s_data = stock.s_data
, @no_s_dist_01 = stock.s_dist_01
, @no_s_dist_02 = stock.s_dist_02
, @no_s_dist_03 = stock.s_dist_03
, @no_s_dist_04 = stock.s_dist_04
, @no_s_dist_05 = stock.s_dist_05
, @no_s_dist_06 = stock.s_dist_06
, @no_s_dist_07 = stock.s_dist_07
, @no_s_dist_08 = stock.s_dist_08
, @no_s_dist_09 = stock.s_dist_09
, @no_s_dist_10 = stock.s_dist_10 
FROM dbo.stock
WHERE stock.s_i_id = @no_ol_i_id 
AND stock.s_w_id = @no_ol_supply_w_id


IF (@no_s_quantity > @no_ol_quantity)
SET @no_s_quantity = (@no_s_quantity - @no_ol_quantity)
ELSE 
SET @no_s_quantity = (@no_s_quantity - @no_ol_quantity + 91)

UPDATE dbo.stock
SET s_quantity = @no_s_quantity 
WHERE stock.s_i_id = @no_ol_i_id 
AND stock.s_w_id = @no_ol_supply_w_id

SET @no_ol_amount = (@no_ol_quantity * @no_i_price * (1 + @no_w_tax + @no_d_tax) * (1 - @no_c_discount))
IF @no_d_id = 1
SET @no_ol_dist_info = @no_s_dist_01
ELSE 
IF @no_d_id = 2
SET @no_ol_dist_info = @no_s_dist_02
ELSE 
IF @no_d_id = 3
SET @no_ol_dist_info = @no_s_dist_03
ELSE 
IF @no_d_id = 4
SET @no_ol_dist_info = @no_s_dist_04
ELSE 
IF @no_d_id = 5
SET @no_ol_dist_info = @no_s_dist_05
ELSE 
IF @no_d_id = 6
SET @no_ol_dist_info = @no_s_dist_06
ELSE 
IF @no_d_id = 7
SET @no_ol_dist_info = @no_s_dist_07
ELSE 
IF @no_d_id = 8
SET @no_ol_dist_info = @no_s_dist_08
ELSE 
IF @no_d_id = 9
SET @no_ol_dist_info = @no_s_dist_09
ELSE 
BEGIN
IF @no_d_id = 10
SET @no_ol_dist_info = @no_s_dist_10
END
INSERT dbo.order_line( ol_o_id, ol_d_id, ol_w_id, ol_number, ol_i_id, ol_supply_w_id, ol_quantity, ol_amount, ol_dist_info)
VALUES ( @o_id, @no_d_id, @no_w_id, @loop_counter, @no_ol_i_id, @no_ol_supply_w_id, @no_ol_quantity, @no_ol_amount, @no_ol_dist_info)
SET @loop_counter = @loop_counter + 1
END
SELECT convert(char(8), @no_c_discount) as N'@no_c_discount', @no_c_last as N'@no_c_last', @no_c_credit as N'@no_c_credit', convert(char(8),@no_d_tax) as N'@no_d_tax', convert(char(8),@no_w_tax) as N'@no_w_tax', @no_d_next_o_id as N'@no_d_next_o_id'

END TRY
BEGIN CATCH
SELECT 
ERROR_NUMBER() AS ErrorNumber
,ERROR_SEVERITY() AS ErrorSeverity
,ERROR_STATE() AS ErrorState
,ERROR_PROCEDURE() AS ErrorProcedure
,ERROR_LINE() AS ErrorLine
,ERROR_MESSAGE() AS ErrorMessage;
IF @@TRANCOUNT > 0
ROLLBACK TRANSACTION;
END CATCH;
IF @@TRANCOUNT > 0
COMMIT TRANSACTION;

END
GO
/****** Object:  StoredProcedure [dbo].[ostat]    Script Date: 9/3/2017 1:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ostat] 
@os_w_id int,
@os_d_id int,
@os_c_id int,
@byname int,
@os_c_last char(20)
AS 
BEGIN
SET ANSI_WARNINGS OFF
DECLARE
@os_c_first char(16),
@os_c_middle char(2),
@os_c_balance money,
@os_o_id int,
@os_entdate datetime2(0),
@os_o_carrier_id int,
@os_ol_i_id 	INT,
@os_ol_supply_w_id INT,
@os_ol_quantity INT,
@os_ol_amount 	INT,
@os_ol_delivery_d DATE,
@namecnt int, 
@i int,
@os_ol_i_id_array VARCHAR(200),
@os_ol_supply_w_id_array VARCHAR(200),
@os_ol_quantity_array VARCHAR(200),
@os_ol_amount_array VARCHAR(200),
@os_ol_delivery_d_array VARCHAR(210)
BEGIN TRANSACTION
BEGIN TRY
SET @os_ol_i_id_array = 'CSV,'
SET @os_ol_supply_w_id_array = 'CSV,'
SET @os_ol_quantity_array = 'CSV,'
SET @os_ol_amount_array = 'CSV,'
SET @os_ol_delivery_d_array = 'CSV,'
IF (@byname = 1)
BEGIN

SELECT @namecnt = count_big(customer.c_id) 
FROM dbo.customer 
WHERE customer.c_last = @os_c_last AND customer.c_d_id = @os_d_id AND customer.c_w_id = @os_w_id

IF ((@namecnt % 2) = 1)
SET @namecnt = (@namecnt + 1)
DECLARE
c_name CURSOR LOCAL FOR 
SELECT customer.c_balance
, customer.c_first
, customer.c_middle
, customer.c_id 
FROM dbo.customer 
WHERE customer.c_last = @os_c_last 
AND customer.c_d_id = @os_d_id 
AND customer.c_w_id = @os_w_id 
ORDER BY customer.c_first

OPEN c_name
BEGIN
DECLARE
@loop_counter int
SET @loop_counter = 0
DECLARE
@loop$bound int
SET @loop$bound = (@namecnt / 2)
WHILE @loop_counter <= @loop$bound
BEGIN
FETCH c_name
INTO @os_c_balance, @os_c_first, @os_c_middle, @os_c_id
SET @loop_counter = @loop_counter + 1
END
END
CLOSE c_name
DEALLOCATE c_name
END
ELSE 
BEGIN
SELECT @os_c_balance = customer.c_balance, @os_c_first = customer.c_first
, @os_c_middle = customer.c_middle, @os_c_last = customer.c_last 
FROM dbo.customer WITH (repeatableread) 
WHERE customer.c_id = @os_c_id AND customer.c_d_id = @os_d_id AND customer.c_w_id = @os_w_id
END
BEGIN
SELECT TOP (1) @os_o_id = fci.o_id, @os_o_carrier_id = fci.o_carrier_id, @os_entdate = fci.o_entry_d
FROM 
(SELECT TOP 9223372036854775807 orders.o_id, orders.o_carrier_id, orders.o_entry_d 
FROM dbo.orders WITH (serializable) 
WHERE orders.o_d_id = @os_d_id 
AND orders.o_w_id = @os_w_id 
AND orders.o_c_id = @os_c_id 
ORDER BY orders.o_id DESC)  AS fci
IF @@ROWCOUNT = 0
PRINT 'No orders for customer';
END
SET @i = 0
DECLARE
c_line CURSOR LOCAL FORWARD_ONLY FOR 
SELECT order_line.ol_i_id
, order_line.ol_supply_w_id
, order_line.ol_quantity
, order_line.ol_amount
, order_line.ol_delivery_d 
FROM dbo.order_line WITH (repeatableread) 
WHERE order_line.ol_o_id = @os_o_id 
AND order_line.ol_d_id = @os_d_id 
AND order_line.ol_w_id = @os_w_id
OPEN c_line
WHILE 1 = 1
BEGIN
FETCH c_line
INTO 
@os_ol_i_id,
@os_ol_supply_w_id,
@os_ol_quantity,
@os_ol_amount,
@os_ol_delivery_d
IF @@FETCH_STATUS = -1
BREAK
set @os_ol_i_id_array += CAST(@i AS CHAR) + ',' + CAST(@os_ol_i_id AS CHAR)
set @os_ol_supply_w_id_array += CAST(@i AS CHAR) + ',' + CAST(@os_ol_supply_w_id AS CHAR)
set @os_ol_quantity_array += CAST(@i AS CHAR) + ',' + CAST(@os_ol_quantity AS CHAR)
set @os_ol_amount_array += CAST(@i AS CHAR) + ',' + CAST(@os_ol_amount AS CHAR);
set @os_ol_delivery_d_array += CAST(@i AS CHAR) + ',' + CAST(@os_ol_delivery_d AS CHAR)
SET @i = @i + 1
END
CLOSE c_line
DEALLOCATE c_line
SELECT	@os_c_id as N'@os_c_id', @os_c_last as N'@os_c_last', @os_c_first as N'@os_c_first', @os_c_middle as N'@os_c_middle', @os_c_balance as N'@os_c_balance', @os_o_id as N'@os_o_id', @os_entdate as N'@os_entdate', @os_o_carrier_id as N'@os_o_carrier_id'
END TRY
BEGIN CATCH
SELECT 
ERROR_NUMBER() AS ErrorNumber
,ERROR_SEVERITY() AS ErrorSeverity
,ERROR_STATE() AS ErrorState
,ERROR_PROCEDURE() AS ErrorProcedure
,ERROR_LINE() AS ErrorLine
,ERROR_MESSAGE() AS ErrorMessage;
IF @@TRANCOUNT > 0
ROLLBACK TRANSACTION;
END CATCH;
IF @@TRANCOUNT > 0
COMMIT TRANSACTION;
END
GO
/****** Object:  StoredProcedure [dbo].[payment]    Script Date: 9/3/2017 1:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[payment]  
@p_w_id int,
@p_d_id int,
@p_c_w_id int,
@p_c_d_id int,
@p_c_id int,
@byname int,
@p_h_amount numeric(6,2),
@p_c_last char(16),
@TIMESTAMP datetime2(0)
AS 
BEGIN
SET ANSI_WARNINGS OFF
DECLARE
@p_w_street_1 char(20),
@p_w_street_2 char(20),
@p_w_city char(20),
@p_w_state char(2),
@p_w_zip char(10),
@p_d_street_1 char(20),
@p_d_street_2 char(20),
@p_d_city char(20),
@p_d_state char(20),
@p_d_zip char(10),
@p_c_first char(16),
@p_c_middle char(2),
@p_c_street_1 char(20),
@p_c_street_2 char(20),
@p_c_city char(20),
@p_c_state char(20),
@p_c_zip char(9),
@p_c_phone char(16),
@p_c_since datetime2(0),
@p_c_credit char(32),
@p_c_credit_lim  numeric(12,2), 
@p_c_discount  numeric(4,4),
@p_c_balance numeric(12,2),
@p_c_data varchar(500),
@namecnt int, 
@p_d_name char(11), 
@p_w_name char(11), 
@p_c_new_data varchar(500), 
@h_data varchar(30)
BEGIN TRANSACTION
BEGIN TRY

SELECT @p_w_street_1 = warehouse.w_street_1
, @p_w_street_2 = warehouse.w_street_2
, @p_w_city = warehouse.w_city
, @p_w_state = warehouse.w_state
, @p_w_zip = warehouse.w_zip
, @p_w_name = warehouse.w_name 
FROM dbo.warehouse WITH (INDEX = [w_details])
WHERE warehouse.w_id = @p_w_id

UPDATE dbo.district 
SET d_ytd = district.d_ytd + @p_h_amount 
WHERE district.d_w_id = @p_w_id 
AND district.d_id = @p_d_id

SELECT @p_d_street_1 = district.d_street_1
, @p_d_street_2 = district.d_street_2
, @p_d_city = district.d_city
, @p_d_state = district.d_state
, @p_d_zip = district.d_zip
, @p_d_name = district.d_name 
FROM dbo.district WITH (INDEX = d_details)
WHERE district.d_w_id = @p_w_id 
AND district.d_id = @p_d_id
IF (@byname = 1)
BEGIN
SELECT @namecnt = count(customer.c_id) 
FROM dbo.customer WITH (repeatableread) 
WHERE customer.c_last = @p_c_last 
AND customer.c_d_id = @p_c_d_id 
AND customer.c_w_id = @p_c_w_id

DECLARE
c_byname CURSOR STATIC LOCAL FOR 
SELECT customer.c_first
, customer.c_middle
, customer.c_id
, customer.c_street_1
, customer.c_street_2
, customer.c_city
, customer.c_state
, customer.c_zip
, customer.c_phone
, customer.c_credit
, customer.c_credit_lim
, customer.c_discount
, C_BAL.c_balance
, customer.c_since 
FROM dbo.customer  AS customer WITH (INDEX = [customer_i2], repeatableread)
INNER LOOP JOIN dbo.customer AS C_BAL WITH (INDEX = [customer_i1], repeatableread) 
ON C_BAL.c_w_id = customer.c_w_id
  AND C_BAL.c_d_id = customer.c_d_id
  AND C_BAL.c_id = customer.c_id
WHERE customer.c_w_id = @p_c_w_id 
  AND customer.c_d_id = @p_c_d_id 
  AND customer.c_last = @p_c_last 
ORDER BY customer.c_first
OPTION ( MAXDOP 1)
OPEN c_byname
IF ((@namecnt % 2) = 1)
SET @namecnt = (@namecnt + 1)
BEGIN
DECLARE
@loop_counter int
SET @loop_counter = 0
DECLARE
@loop$bound int
SET @loop$bound = (@namecnt / 2)
WHILE @loop_counter <= @loop$bound
BEGIN
FETCH c_byname
INTO 
@p_c_first, 
@p_c_middle, 
@p_c_id, 
@p_c_street_1, 
@p_c_street_2, 
@p_c_city, 
@p_c_state, 
@p_c_zip, 
@p_c_phone, 
@p_c_credit, 
@p_c_credit_lim, 
@p_c_discount, 
@p_c_balance, 
@p_c_since
SET @loop_counter = @loop_counter + 1
END
END
CLOSE c_byname
DEALLOCATE c_byname
END
ELSE 
BEGIN
SELECT @p_c_first = customer.c_first, @p_c_middle = customer.c_middle, @p_c_last = customer.c_last
, @p_c_street_1 = customer.c_street_1, @p_c_street_2 = customer.c_street_2
, @p_c_city = customer.c_city, @p_c_state = customer.c_state
, @p_c_zip = customer.c_zip, @p_c_phone = customer.c_phone
, @p_c_credit = customer.c_credit, @p_c_credit_lim = customer.c_credit_lim
, @p_c_discount = customer.c_discount, @p_c_balance = customer.c_balance
, @p_c_since = customer.c_since 
FROM dbo.customer 
WHERE customer.c_w_id = @p_c_w_id 
AND customer.c_d_id = @p_c_d_id 
AND customer.c_id = @p_c_id 

END
SET @p_c_balance = (@p_c_balance + @p_h_amount)
IF @p_c_credit = 'BC'
BEGIN
SELECT @p_c_data = customer.c_data FROM dbo.customer WHERE customer.c_w_id = @p_c_w_id 
AND customer.c_d_id = @p_c_d_id AND customer.c_id = @p_c_id
SET @h_data = (ISNULL(@p_w_name, '') + ' ' + ISNULL(@p_d_name, ''))
SET @p_c_new_data = (
ISNULL(CAST(@p_c_id AS char), '')
 + 
' '
 + 
ISNULL(CAST(@p_c_d_id AS char), '')
 + 
' '
 + 
ISNULL(CAST(@p_c_w_id AS char), '')
 + 
' '
 + 
ISNULL(CAST(@p_d_id AS char), '')
 + 
' '
 + 
ISNULL(CAST(@p_w_id AS char), '')
 + 
' '
 + 
ISNULL(CAST(@p_h_amount AS CHAR(8)), '')
 + 
ISNULL(CAST(@TIMESTAMP AS char), '')
 + 
ISNULL(@h_data, ''))
SET @p_c_new_data = substring((@p_c_new_data + @p_c_data), 1, 500 - LEN(@p_c_new_data))
UPDATE dbo.customer SET c_balance = @p_c_balance, c_data = @p_c_new_data 
WHERE customer.c_w_id = @p_c_w_id 
AND customer.c_d_id = @p_c_d_id AND customer.c_id = @p_c_id
END
ELSE 
UPDATE dbo.customer SET c_balance = @p_c_balance 
WHERE customer.c_w_id = @p_c_w_id 
AND customer.c_d_id = @p_c_d_id 
AND customer.c_id = @p_c_id

SET @h_data = (ISNULL(@p_w_name, '') + ' ' + ISNULL(@p_d_name, ''))

INSERT dbo.history( h_c_d_id, h_c_w_id, h_c_id, h_d_id, h_w_id, h_date, h_amount, h_data) 
VALUES ( @p_c_d_id, @p_c_w_id, @p_c_id, @p_d_id, @p_w_id, @TIMESTAMP, @p_h_amount, @h_data)
SELECT	@p_c_id as N'@p_c_id', @p_c_last as N'@p_c_last', @p_w_street_1 as N'@p_w_street_1'
, @p_w_street_2 as N'@p_w_street_2', @p_w_city as N'@p_w_city'
, @p_w_state as N'@p_w_state', @p_w_zip as N'@p_w_zip'
, @p_d_street_1 as N'@p_d_street_1', @p_d_street_2 as N'@p_d_street_2'
, @p_d_city as N'@p_d_city', @p_d_state as N'@p_d_state'
, @p_d_zip as N'@p_d_zip', @p_c_first as N'@p_c_first'
, @p_c_middle as N'@p_c_middle', @p_c_street_1 as N'@p_c_street_1'
, @p_c_street_2 as N'@p_c_street_2'
, @p_c_city as N'@p_c_city', @p_c_state as N'@p_c_state', @p_c_zip as N'@p_c_zip'
, @p_c_phone as N'@p_c_phone', @p_c_since as N'@p_c_since', @p_c_credit as N'@p_c_credit'
, @p_c_credit_lim as N'@p_c_credit_lim', @p_c_discount as N'@p_c_discount', @p_c_balance as N'@p_c_balance'
, @p_c_data as N'@p_c_data'


UPDATE dbo.warehouse WITH (XLOCK)
SET w_ytd = warehouse.w_ytd + @p_h_amount 
WHERE warehouse.w_id = @p_w_id

END TRY
BEGIN CATCH
SELECT 
ERROR_NUMBER() AS ErrorNumber
,ERROR_SEVERITY() AS ErrorSeverity
,ERROR_STATE() AS ErrorState
,ERROR_PROCEDURE() AS ErrorProcedure
,ERROR_LINE() AS ErrorLine
,ERROR_MESSAGE() AS ErrorMessage;
IF @@TRANCOUNT > 0
ROLLBACK TRANSACTION;
END CATCH;
IF @@TRANCOUNT > 0
COMMIT TRANSACTION;
END
GO
/****** Object:  StoredProcedure [dbo].[slev]    Script Date: 9/3/2017 1:06:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[slev]  
@st_w_id int,
@st_d_id int,
@threshold int
AS 
BEGIN
DECLARE
@st_o_id int, 
@stock_count int 
BEGIN TRANSACTION
BEGIN TRY

SELECT @st_o_id = district.d_next_o_id 
FROM dbo.district 
WHERE district.d_w_id = @st_w_id AND district.d_id = @st_d_id

SELECT @stock_count = count_big(DISTINCT stock.s_i_id) 
FROM dbo.order_line
, dbo.stock
WHERE order_line.ol_w_id = @st_w_id 
AND order_line.ol_d_id = @st_d_id 
AND (order_line.ol_o_id < @st_o_id) 
AND order_line.ol_o_id >= (@st_o_id - 20) 
AND stock.s_w_id = @st_w_id 
AND stock.s_i_id = order_line.ol_i_id 
AND stock.s_quantity < @threshold
OPTION (LOOP JOIN, MAXDOP 1)

SELECT	@st_o_id as N'@st_o_id', @stock_count as N'@stock_count'
END TRY
BEGIN CATCH
SELECT 
ERROR_NUMBER() AS ErrorNumber
,ERROR_SEVERITY() AS ErrorSeverity
,ERROR_STATE() AS ErrorState
,ERROR_PROCEDURE() AS ErrorProcedure
,ERROR_LINE() AS ErrorLine
,ERROR_MESSAGE() AS ErrorMessage;
IF @@TRANCOUNT > 0
ROLLBACK TRANSACTION;
END CATCH;
IF @@TRANCOUNT > 0
COMMIT TRANSACTION;
END
GO
USE [master]
GO
ALTER DATABASE [tpcc_workload] SET  READ_WRITE 
GO
