use [customer_interactions]
go

if not exists (select * from sys.tables where name = 'fact_customer_interactions' and schema_id = schema_id('dbo'))
begin
    create table [dbo].[fact_customer_interactions](
	[fact_customer_interactions_id] [int] identity(1,1) not null,
	[user_id] [int] not null,
	[product_id] [int] not null,
	[interaction_date] [date] not null,
	[interaction_count] [int] not null,
	[inserted_timestamp] [datetime] not null,
	[updated_timestamp] [datetime] not null,
	primary key clustered 
	(
		[fact_customer_interactions_id] asc
	)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key = off) on [primary]
	) on [primary]

	alter table [dbo].[fact_customer_interactions] add  default (getdate()) for [inserted_timestamp]
	
	alter table [dbo].[fact_customer_interactions] add  default (getdate()) for [updated_timestamp]
end
else
print('table already exists!')



