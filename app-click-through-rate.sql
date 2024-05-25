/*
https://datalemur.com/questions/click-through-rate
Solve for CTR of our app and round to 2 decimal places
Analytics app events table reading
Timestamp column agnostic
*/

WITH TEMP AS (
  SELECT app_id, 
    sum(case 
            when event_type LIKE 'click' then 1.0
            else 0.0
          end) as metric_one,
    sum(case 
            when event_type LIKE 'impression' then 1.0
            else 0.0
          end)
          as metric_two
    -- event_type
  FROM events
  -- YYYY,MM,DD format for date times
  WHERE timestamp BETWEEN '2022-01-01' AND '2023-01-01'
  GROUP BY app_id
  ORDER BY app_id ASC
)

SELECT app_id, ROUND((metric_one/metric_two * 100.0),2) AS ctr FROM TEMP
