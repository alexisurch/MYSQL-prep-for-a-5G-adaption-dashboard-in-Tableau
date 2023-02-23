-- Call up the database--

use projects;

-- call up the needed data from the multiple tables for the analysis--

select aau.Dates, upper(aau.sub_month) as Months, aau.Gen,

-- change the month and city to upper case -- 

upper(aau.City)as City,

-- remove the $ sign from the affected column --

 trim(replace(aau.atliqo_revenue_crores, '$', '')) as Revenue_crores, 
 trim(replace(aau.ARPU, '$', '')) as ARPU, 
 aau.Active_users,
aau.Unsubscribed_users as Inactive_users, aau.Time_period, 

-- add total users column --
aau.Active_users + aau.Unsubscribed_users as total_users,

-- also called up needed colums from other tables and remove the $ sign --

trim(replace(ba5.Tmv_city_crores, '$', '')) as Tmv_city_crores,
trim(replace(ba5.Ms_pct, '$', '')) as Ms_pct,
trim(replace(Plan_revenue_crores, '$', ''))as Plan_revenue_crores, 
plan 
from active_and_unactive_users aau

-- join the before and after 5G deployment table --

 right join 
before_and_after_5G ba5 
on
 aau.sub_month = ba5.sub_month 
 
 -- used alias aau and ba5 to give command to SQL to get the needed data in the query without any ambiguous error--
 -- join the data plan table --
 
 right join 
data_plan
on
aau.sub_month = data_plan.sub_month;

