# sql-data-warehouse-project
Building a modern data warehouse with SQL Server, including ETL processes, data modeling and analytics.

# Project Requirements

Building the Data Warehouse (Data Engineering)

---

Objective

Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

---

Specifications

- Data Sources: Import data from source systems (ERP and CRM) provided as CSV files.
- Data Quality: Cleanse and resolve data quality issues prior to analysis.
- Integration: Combine both sources into a single, user-friendly data model designed for analytical queries.
- Scope: Focus on the latest dataset only; historization of data is not required.
- Documentation: Provide clear documentation of the data model to support both business stakeholders and analytics team

---

**BI: Analytics & Reporting (Data Analysis)**

**Objective**

Develop SQL-based analytics to deliver detailed insights into:

- **Customer Behavior**
- **Product Performance**
- **Sales Trends**

These insights empower stakeholders with key business metrics, enabling strategic decision-making.

For more details, refer to [docs/requirements.md](https://github.com/DataWithBaraa/sql-data-warehouse-project/blob/main/docs/requirements.md).

---

**📂 Repository Structure**

`data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── etl.drawio                      # Draw.io file shows all different techniquies and methods of ETL
│   ├── data_architecture.drawio        # Draw.io file shows the project's architecture
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── data_flow.drawio                # Draw.io file for the data flow diagram
│   ├── data_models.drawio              # Draw.io file for data models (star schema)
│   ├── naming-conventions.md           # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   ├── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository
├── .gitignore                          # Files and directories to be ignored by Git
└── requirements.txt                    # Dependencies and requirements for the project`

---

General Principes


- Naming Conventions: Use snake_case, with lowercase letters and underscores to separate words
- Language: Use English for all names
- Avoid Reserved Words: Do not use SQL reserved words as object names

**Table Naming Conventions**

[**Bronze Rules**](https://drive.google.com/file/d/1urYQWUwwWtxDd4UQN2JZ5MIWCaYb0Ocr/view?usp=sharing)

- All names must start with the source system name, and table names must match their original names without renaming
- <sourcesystem>_<entity>
    - <sourcesystem>: Name of the source system (e.g. crm, erp)
    - <entity>: Exact table name from the source system
    - Example: crm_customer_info → Customer information from the CRM  system

[Silver Rules](https://drive.google.com/file/d/1urYQWUwwWtxDd4UQN2JZ5MIWCaYb0Ocr/view)

- All names must use meaningful, business-aligned names for tables, starting with the category prefix
- <category>_<entity>
    - <category>: Describes the role of the table, such as dim (dimension) or fact (fact table)
    - <entity>: Descriptive name of the table aligned with the business domain (e.g. customers, products, sales)
    - Examples:
        - dim_customers → Dimension table for customer data
        - fact_sales → Fact table containing sales transactions
