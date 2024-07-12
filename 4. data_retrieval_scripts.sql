/**Queries to Task 3 for ICustomer, Performed by Tushar Sharma*/
--Step 2
--setting the context to the customer_interactions database
use customer_interactions
go
--Task 1 => Total Number of interactions per day

select interaction_date, sum(interaction_count) as interaction_counts_per_day
from fact_customer_interactions with(nolock)
group by interaction_date

--Task 2 => Top 5 users by the number of interactions ( in case 2 users have the same interactions, the older customer will be given 
--preference due considering customer royalty and retention since he is an older customer.
;with user_interactions as (
select [user_id],sum(interaction_count) interaction_counts_per_user 
from fact_customer_interactions with(nolock)
group by [user_id] 
),
rank_user_interations
as (
select  dense_rank() over (order by interaction_counts_per_user desc, user_id asc) as rank_top_users_by_interactions, 
user_id,interaction_counts_per_user from user_interactions
)
select user_id,interaction_counts_per_user from rank_user_interations where rank_top_users_by_interactions < 6
--select * from fact_customer_interactions with(nolock)

--Task 3 => Most interacted products based on number of interactions (top 3) (in case 2 products are having same interactions the new product
--will be given preference considering it's high performance in shorter amount of time and gaining traction.
;with product_interactions as (
select [product_id],sum(interaction_count) interaction_counts_per_product
from fact_customer_interactions with(nolock)
group by [product_id] 
),
rank_product_interations
as (
select  dense_rank() over (order by interaction_counts_per_product desc, product_id desc) as rank_top_products_by_interactions, 
product_id,interaction_counts_per_product from product_interactions
)
select product_id,interaction_counts_per_product,rank_top_products_by_interactions 
from rank_product_interations where rank_top_products_by_interactions < 4