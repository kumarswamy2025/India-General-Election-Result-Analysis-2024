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
    /*
    problem statement-3: What is the total number of seats available for elections in each state by assending order
    
     */
    -- query: 
SELECT
    s.State AS STATE_NAME,
    COUNT(sr.Parliament_Constituency) AS TOTAL_SEATS_BY_EACH_STATE
FROM
    statewise_results sr
    INNER JOIN states s ON s.State_ID = sr.State_ID
GROUP BY
    s.State
ORDER BY
    TOTAL_SEATS_BY_EACH_STATE asc;

/*
problem statement-3: What is the total number of seats available for elections in each state by descending order 

 */
-- query: 
SELECT
    s.State AS STATE_NAME,
    COUNT(sr.Parliament_Constituency) AS TOTAL_SEATS_BY_EACH_STATE
FROM
    statewise_results sr
    INNER JOIN states s ON s.State_ID = sr.State_ID
GROUP BY
    s.State
ORDER BY
    TOTAL_SEATS_BY_EACH_STATE DESC;

