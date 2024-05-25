-- no duplicates in the candidates table
-- triple-skilled candidates : 3 tools -> PY, Tableau, and PostgreSQL
-- sort candidates ASC order
-- GROUP BY needs all fields, but no aggregate functions values
-- ohhh . do not select for skill here ( but use as a filter condition )
-- 15 mins to solutioning
-- we need count(*) or other agg functionality to execute GROUP BY clauses

SELECT cal.candidate_id as candidate_id FROM (
  SELECT candidate_id, count(*) as cnt FROM candidates
  WHERE (skill LIKE 'Python' OR skill LIKE 'Tableau' OR skill LIKE 'PostgreSQL')
  GROUP BY candidate_id
  ORDER BY candidate_id ASC
) AS cal
WHERE cal.cnt=3
