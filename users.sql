USE [master]
GO
EXEC xp_instance_regwrite N'HKEY_LOCAL_MACHINE',
     N'Software\Microsoft\MSSQLServer\MSSQLServer', N'LoginMode', 
     REG_DWORD, 2
GO

USE [master]

CREATE LOGIN cataloguser
WITH PASSWORD = '1',
DEFAULT_DATABASE = [Microsoft.eShopOnWeb.CatalogDb],
CHECK_EXPIRATION = OFF,
CHECK_POLICY = OFF;

use [Microsoft.eShopOnWeb.CatalogDb]
create user cataloguser from login cataloguser;
use [Microsoft.eShopOnWeb.CatalogDb]
exec sp_addrolemember 'db_owner', cataloguser;

USE [master]

CREATE LOGIN identityuser
WITH PASSWORD = '1',
DEFAULT_DATABASE = [Microsoft.eShopOnWeb.Identity],
CHECK_EXPIRATION = OFF,
CHECK_POLICY = OFF;

use [Microsoft.eShopOnWeb.Identity]
create user identityuser from login identityuser;
use [Microsoft.eShopOnWeb.Identity]
exec sp_addrolemember 'db_owner', identityuser;