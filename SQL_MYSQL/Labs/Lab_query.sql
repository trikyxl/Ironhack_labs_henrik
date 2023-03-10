use bank; 
select * from district;
select * from client;
select client_id 
from client
where district_id = 1
limit 5;
#2
select client_id
from client
where district_id = 72
order by client_id desc
limit 1;
#3
select amount
from loan
order by amount 
limit 3;
#4
select distinct status
from loan
order by status;
#5
#select payments
#from loan
#order by payments desc
#limit 1;

select loan_id 
from loan
where payments = (select max(payments) from loan);

#6
select amount,
account_id
from loan
order by account_id
limit 5;

#7
select account_id
from loan 
where duration = 60
order by amount
limit 5;

#8
select distinct k_symbol
from bank.order;

#9
select order_id
from bank.order
where account_id = 34;

#10
select account_id
from bank.order
where order_id between 29540 and 29560;

#11

select amount
from bank.order
where account_to = 30067122;

#12
select trans_id,
date,
type, 
amount
from trans 
where account_id = 793
order by date desc
limit 10; 

#13
select district_id, count(*) as count
from client
where district_id < 10
group by district_id
order by district_id asc;

#14 
select type, count(*) as count
from card
group by type
order by count desc;

#15
select account_id, sum(amount) as total_loan
from loan
group by account_id
order by total_loan desc
limit 10;


#16
select count(*) as count, date
from loan 
where date < 930907
group by date
order by date desc;

#17
select count(*) as count, date, duration
from loan 
where date between 971201 and 971231
group by date, duration
order by date asc, duration asc;

#18
select account_id, type, sum(amount) as sum_of_amount
from trans 
where account_id = 396
group by type;

#19
select account_id, type, sum(amount) as sum_of_amount,
case type
when 'PRIJEM' then 'incoming'
when 'VYDAJ' then 'outgoing'
end as type_english,
floor(sum(amount))
from trans
where account_id = 396
group by type;


update trans
set type = 'outgoing'
where type = 'VYDAJ';

#20
select account_id, 
sum(case when type='PRIJEM' then amount else 0 end) as incoming_amount, 
sum(case when type='VYDAJ' then amount else 0 end) as outgoing_amount, 
sum(case when type='PRIJEM' then amount when type='VYDAJ' then -amount end) as difference 
from bank.trans 
where account_id=396;

#21
select account_id,
floor(sum(case when type='PRIJEM' then amount when type='VYDAJ' then -amount end)) as difference
from bank.trans
group by account_id
order by difference desc
limit 10;
