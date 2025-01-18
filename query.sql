/*
problem statement-1: Total Seats 

 */
-- query:
select distinct
    count(Parliament_Constituency) as total_Seats
from
    constituencywise_results;

/*
problem statement-2: What is the total number of seats available for elections in each state 

 */
-- query: 
select
s.State as STATE_NAME,
count(sr.Parliament_Constituency) as TOTAL_SEATS_BY_EACH_STATE
from
    statewise_results sr
    inner join states s on s.State_ID = sr.State_ID
group by
    s.State

