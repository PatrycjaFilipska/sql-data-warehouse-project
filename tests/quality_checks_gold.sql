/*
===============================================================================
Quality Checks
===============================================================================
Script Purpose:
    This script performs quality checks to validate the integrity, consistency, 
    and accuracy of the Gold Layer. These checks ensure:
    - Uniqueness of surrogate keys in dimension tables.
    - Referential integrity between fact and dimension tables.
    - Validation of relationships in the data model for analytical purposes.

===============================================================================
*/

-- ----------------------------------------------------------------------------
-- QUALITY CHECK DIMENSION TABLE - CUSTOMER
-- -----------------------------------------------------------------------------

-- Data Integration - gender column

SELECT DISTINCT
	ci.cst_gndr,
	ca.gen,
	CASE WHEN ci.cst_gndr != 'n/a' THEN ci.cst_gndr -- CRM source is master for info about gender
		ELSE COALESCE(ca.gen, 'n/a') -- if not available in master-use ERP table
	END AS new_gen
FROM silver.crm_cust_info ci
LEFT JOIN silver.erp_cust_az12 ca
		ON ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_a101 la 
		ON ci.cst_key = la.cid
ORDER BY 1,2

SELECT
		ci.cst_id,
		ci.cst_key,
		ci.cst_firstname,
		ci.cst_lastname,
		ci.cst_marital_status,
		ci.cst_gndr,
		ci.cst_create_date,
		ca.bdate,
		ca.gen,
		la.cntry
	FROM silver.crm_cust_info ci
	LEFT JOIN silver.erp_cust_az12 ca
			ON ci.cst_key = ca.cid
	LEFT JOIN silver.erp_loc_a101 la 
			ON ci.cst_key = la.cid

-- Gender column check

SELECT DISTINCT gender FROM gold.dim_customers

-- ----------------------------------------------------------------------------
-- QUALITY CHECK PRODUCT TABLE
-- -----------------------------------------------------------------------------

SELECT prd_key, COUNT(*) FROM(
SELECT 
	pn.prd_id,
	pn.cat_id,
	pn.prd_key,
	pn.prd_nm,
	pn.prd_cost,
	pn.prd_line,
	pn.prd_start_dt,
	pc.cat,
	pc.subcat,
	pc.maintenance
FROM silver.crm_prd_info pn
LEFT JOIN silver.erp_px_cat_g1v2 pc
		ON pn.cat_id = pc.id
WHERE prd_end_dt IS NULL --filter out history information, only current (if end date is NULL then it's current info of the product)
)t GROUP BY prd_key
HAVING COUNT (*) >1


SELECT * FROM gold.dim_products

  -- ----------------------------------------------------------------------------
-- QUALITY CHECK SALES TABLE (check if all dimension tables can successfully join to the fact table)
-- Foreign Key Integrity (Dimensions)
-- -----------------------------------------------------------------------------

SELECT* FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
WHERE c.customer_key IS NULL


SELECT * FROM gold.dim_customers

SELECT * FROM gold.fact_sales
