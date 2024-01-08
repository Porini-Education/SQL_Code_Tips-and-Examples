/*
	Retrieve the IP address and the Inbound Port of the server. 
	It takes advantage of the TCP/IP protocol.
*/

SELECT 
	net_transport
	,protocol_type
	,local_net_address
	,local_tcp_port
	,client_net_address
	,client_tcp_port
FROM sys.dm_exec_connections
WHERE session_id = @@SPID;

-- if you are not using TCP/IP protocol you should execute the query using a new connection in SSMS
-- using the option TCP/IP enabled.

-- Remark: the TCP/IP protocol must be configured in the SQL Net protocols.
--		   to execute the following query the 'Ad Hoc Distributed Queries' must be enabled on the server. Check online.

DECLARE @ip_address        varchar(15)
		,@tcp_port         int 
		,@connectionstring nvarchar(max) 
		,@parm_definition  nvarchar(max)
		,@command          nvarchar(max)

SET @connectionstring = N'Server=tcp:' + @@SERVERNAME + ';Trusted_Connection=yes;'
SET @parm_definition  = N'@ip_address_OUT varchar(15) OUTPUT
                        , @tcp_port_OUT   int         OUTPUT';

SET @command          = N'SELECT  @ip_address_OUT = a.local_net_address,
                                  @tcp_port_OUT   = a.local_tcp_port
                          FROM OPENROWSET(''SQLNCLI''
                                 , ''' + @connectionstring + '''
                                 , ''SELECT local_net_address
                                          , local_tcp_port
                                     FROM sys.dm_exec_connections
                                     WHERE session_id = @@spid
                                   '') as a'

--print @command


EXEC SP_executeSQL @command
                 , @parm_definition
                 , @ip_address_OUT = @ip_address OUTPUT
                 , @tcp_port_OUT   = @tcp_port OUTPUT;


SELECT @ip_address, @tcp_port
;
 GO