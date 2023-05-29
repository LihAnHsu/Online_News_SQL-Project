SELECT *

FROM articles AS a 

-- % of title talking about OpenAI
-- 4 %
SELECT 
	(COUNT(a.title) * 100 / (SELECT COUNT(*) FROM articles)) AS AI_percentage

FROM articles AS a

WHERE a.title LIKE '%OpenAI%';

--number of news by sources
--Business Insider made the most news about AI related ones
SELECT 
	a.'source', COUNT (DISTINCT a.title) AS num_news 

FROM articles AS a 

GROUP BY a.'source'

ORDER BY num_news DESC; 

--number of content mention about ChatGPT
--10
SELECT 
	COUNT (DISTINCT a.description) AS ChatGPT_content

FROM articles AS a

WHERE a.description LIKE '%ChatGPT%';

--number of content talking about layoff
--2
SELECT 
	COUNT (DISTINCT a.description) AS layoff_content

FROM articles AS a

WHERE a.description LIKE '%layoff%';

--Daily number of news published?
SELECT 
	DATE(a.published_at) AS published_date, COUNT (a.published_at) AS news_count

FROM articles AS a

GROUP BY DATE(a.published_at);
