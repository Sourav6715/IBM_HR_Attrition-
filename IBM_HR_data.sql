use mini_project;
select * from online_food;
-- Q1	Online food order decision based on customer Age
alter table online_food
add column age_group varchar(50);
update online_food set age_group=
case
when Age < 20 then 'child'
when Age > 20 and age < 25  then 'younger'
when  Age >=25 and age < 30 then  'Adult' 
else 'senior_citizen'
end ;
   
   
   select distinct(familysize) from online_food;
   
 -- Q2	Online food order decision based on size of the family
 alter table online_food
add column family_type varchar(50);
update online_food set family_type=

case
	when familysize =1 then 'single'
    when familysize =2 then 'couple'
    when familysize >2 and familysize <= 4 then 'nuclear_family'
    else  'join_family'
    end;
   
    
    -- Q3	Who orders more Male or Female??
    select gender,count(gender) as total_orders from online_food
    group by 1
    order by 2 desc;
    
    -- Who orders more Married or unmarried??
      select marital_status,count(marital_status) as total_orders from online_food
    group by 1
    order by 2 desc;
    
    
    -- Q5	Analyze food ordering behaviour across income level
    select Monthly_Income, (count(Monthly_Income)/sum(count(monthly_income)))*100 as order_bev from online_food group by Monthly_Income order by 1;
    
    -- Q6	Food ordering pattern based on qualification
       select education,count(education) as total_orders from online_food
    group by 1
    order by 2 desc;
    
    -- Q7	Food ordering pattern based on occupation
    select Occupation,count(Occupation) as total_orders from online_food
    group by 1
    order by 2 desc;
    
     select feedback,count(feedback) as response from online_food
    group by 1
    order by 2 desc;
    