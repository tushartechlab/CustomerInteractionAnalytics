if not exists (select top 1 * from sys.databases where name = 'customer_interactions')
	CREATE DATABASE [customer_interactions]
else
	print('Database already exists!')
 