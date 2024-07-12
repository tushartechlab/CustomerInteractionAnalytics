use [customer_interactions]
go

if not exists (select * from sys.tables where name = 'tbl_customer_interactions' and schema_id = schema_id('dbo'))
begin
    create table dbo.tbl_customer_interactions (
        [interaction_id] int identity(1,1) primary key,
        [user_id] int not null,
        [product_id] int not null,
        [action] nvarchar(50) not null,
        [timestamp] datetime not null default getdate()
    );
end
else
print('table already exists!')

