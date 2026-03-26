/* Create Database and Schemas
Script Purpose:
This script created a new database named 'Data Warehouse' after checking if it already exists. If the database excists, it ids dropped and recreated. 
The script sets up three schemas within the database: 'bronze', 'silver' and 'gold'.

WARNING:
Please note that the drop sections will delete the entire 'DataWarehouse' database if it exists. Proper backups must be prepared.

*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE-USER WITH ROLLBACH IMMEDIATE;
	DROP DATABASE DataWarehouse
END;
GO

-- Create 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
