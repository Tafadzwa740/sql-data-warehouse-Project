
create or alter procedure bronze.load_bronze as

begin
print '===========================================  ';
print 'loading bronze layer ';
print '===========================================  ';


print '--------------------------------------------';
print 'Loading CRM Table';
print '--------------------------------------------';
    truncate table bronze.crm_cust_info;

    bulk insert bronze.crm_cust_info
    from 'C:\Users\tbgwa\Desktop\Data Warehouse Source\source_crm\cust_info.csv'
    with (
    firstrow = 2,
    fieldterminator = ',',
     rowterminator = '\n',
    tablock
    );



    truncate table bronze.crm_prd_info;

    bulk insert bronze.crm_prd_info
    from 'C:\Users\tbgwa\Desktop\Data Warehouse Source\source_crm\prd_info.csv'
    with (
    firstrow = 2,
    fieldterminator  =',',
     rowterminator = '\n',
    tablock
    );



    truncate table bronze.crm_sales_details;

    bulk insert bronze.crm_sales_details
    from 'C:\Users\tbgwa\Desktop\Data Warehouse Source\source_crm\sales_details.csv'
    with (
    firstrow = 2,
    fieldterminator  =',',
     rowterminator = '\n',
    tablock
    );

print '--------------------------------------------';
print 'Loading ERP Table';
print '--------------------------------------------';

    truncate table bronze.erp_cust_az12;

    BULK INSERT bronze.erp_cust_az12
    FROM 'C:\Users\tbgwa\Desktop\Data Warehouse Source\source_erp\cust_az12.csv.'
    WITH (
        FIRSTROW = 2,              -- use 2 if you have a header row, otherwise set to 1
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',    -- Windows CRLF line endings
        TABLOCK
    );
   
    truncate table bronze.erp_loc_a101;

    bulk insert bronze.erp_loc_a101
    from 'C:\Users\tbgwa\Desktop\Data Warehouse Source\source_erp\loc_a101.csv'
    with (
    firstrow = 2,
    fieldterminator  =',',
     rowterminator = '\n',
    tablock
    );

    truncate table bronze.erp_px_cat_g1v2;

    bulk insert bronze.erp_px_cat_g1v2
    from 'C:\Users\tbgwa\Desktop\Data Warehouse Source\source_erp\px_cat_g1v2.csv'
    with (
        fieldterminator = ',',
        rowterminator = '\n',
        tablock

    );
  end  
