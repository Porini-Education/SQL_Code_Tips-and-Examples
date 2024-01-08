# Change SSAS Engine from Tabular to Multidimensional

1. Stop SSAS service
2. Edit the msmdsrv.ini file which by default is located in C:\Program Files\Microsoft SQL Server\MSAS13.MSSQLSERVER\OLAP\Config, changing DeploymentMode from 2 to 0.

*(To edit the file you need to run Notepad as administrator)*

3. Delete all files from the DataDir folder
4. Restart SSASservice
