/*
Read and Excel file from SQL Server


** DOCUMENTATION **
https://www.sqlshack.com/query-excel-data-using-sql-server-linked-servers/



We have to install the provider AccessDatabaseEngine_X64.exe
Available here https://www.microsoft.com/en-us/download/details.aspx?id=13255

https://blogs.msdn.microsoft.com/dataaccesstechnologies/2010/08/19/permissions-needed-to-set-up-linked-server-with-out-of-process-provider/
*/

-- Create the linked server
EXEC sp_addlinkedserver
    @server = 'Poldo',
    @srvproduct = 'Excel',
    @provider = 'Microsoft.ACE.OLEDB.12.0',
    @datasrc = 'C:\Temp\Id.xlsx',
    @provstr = 'Excel 12.0;IMEX=1;HDR=YES;'

-- Query the data
SELECT * FROM Poldo...[Sheet1$]