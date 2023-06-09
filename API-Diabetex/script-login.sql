USE [master]
GO

IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE [name] = N'Diabetex')
BEGIN
	PRINT 'Creando Login'
	CREATE LOGIN [Diabetex] WITH 
		PASSWORD=N'Diabetex', 
		DEFAULT_DATABASE=[Diabetex], 
		CHECK_EXPIRATION=OFF, 
		CHECK_POLICY=OFF
END
GO

USE [Diabetex]
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE [name] = N'Diabetex')
BEGIN
	PRINT 'Creando User'
	CREATE USER [Diabetex] FOR LOGIN [Diabetex]
	ALTER ROLE [db_owner] ADD MEMBER [Diabetex]
END 
GO
