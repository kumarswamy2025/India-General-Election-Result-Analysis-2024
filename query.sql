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
problem statement-4: What is the total number of seats available for elections in each state by descending order 

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



/*
problem statement-5: Total Seats Won by NDA Allianz

 */
-- query: 
SELECT 
    SUM(CASE 
            WHEN party IN (
                'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
            ) THEN [Won]
            ELSE 0 
        END) AS NDA_Total_Seats_Won
FROM 
    partywise_results;
