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

/*
problem statement-6: Seats Won by NDA Allianz Parties

 */
-- query: 

SELECT 
    party as Party_Name,
    won as Seats_Won
FROM 
    partywise_results
WHERE 
    party IN (
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
    )
ORDER BY Seats_Won DESC;


/*
problem statement-7: Total Seats Won by I.N.D.I.A. Allianz

 */
-- query: 
SELECT 
    SUM(CASE 
            WHEN party IN (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
            ) THEN [Won]
            ELSE 0 
        END) AS INDIA_Total_Seats_Won
FROM 
    partywise_results

