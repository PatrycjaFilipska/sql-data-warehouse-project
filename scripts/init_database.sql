/* Create Database and Schemas
Script Purpose:
- Initializes the DataWarehouse database.
- Creates the database and required schemas (bronze, silver, gold) if they do not exist.
*/

USE master;
GO

-- Create database if not exists
IF NOT EXISTS (
    SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse'
)
BEGIN
    CREATE DATABASE DataWarehouse;
END
GO

USE DataWarehouse;
GO

-- Create schemas if not exist
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'bronze')
    EXEC('CREATE SCHEMA bronze');

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'silver')
    EXEC('CREATE SCHEMA silver');

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'gold')
    EXEC('CREATE SCHEMA gold');
GO
