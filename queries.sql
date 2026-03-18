-- Dataset overview
SELECT 
  COUNT(*) AS total_games,
  MIN(season) AS first_season,
  MAX(season) AS last_season
FROM nba.games;

-- Average performance
SELECT 
  AVG(pts_home) AS avg_home_points,
  AVG(pts_away) AS avg_away_points,
  AVG(home_team_win) AS home_win_rate
FROM nba.games;

-- Trends by season
SELECT 
  season,
  AVG(pts_home) AS avg_home_points,
  AVG(pts_away) AS avg_away_points,
  AVG(home_team_win) AS home_win_rate
FROM nba.games
GROUP BY season
ORDER BY season;

-- 3-point impact (example)
SELECT COUNT(*) 
FROM (
  SELECT team_home, season
  FROM nba.games
  WHERE season >= '2018'
  GROUP BY team_home, season
  HAVING AVG(pct_3p_home) >= 0.37
) t;
