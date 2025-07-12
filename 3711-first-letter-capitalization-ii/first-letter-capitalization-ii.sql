# Write your MySQL query statement below
# Write your MySQL query statement below
WITH RECURSIVE Words AS (
SELECT content_id, content_text,
REGEXP_SUBSTR(content_text, '[a-zA-Z]+|-', 1, 1) AS word, 
1 AS word_position
FROM user_content
WHERE REGEXP_SUBSTR(content_text, '[a-zA-Z]+|-', 1, 1) IS NOT NULL
UNION ALL
SELECT content_id, content_text,
REGEXP_SUBSTR(content_text, '[a-zA-Z]+|-', 1, word_position + 1), 
word_position + 1
FROM Words
WHERE REGEXP_SUBSTR(content_text, '[a-zA-Z]+|-', 1, word_position + 1) IS NOT NULL
),
ConvertedText AS (
SELECT content_id, content_text, 
GROUP_CONCAT(UPPER(LEFT(word, 1)), LOWER(SUBSTRING(word, 2)) 
ORDER BY word_position SEPARATOR ' ') AS converted_text 
FROM Words GROUP BY content_id, content_text)
SELECT content_id, content_text AS original_text, 
REPLACE(converted_text, ' - ', '-') AS converted_text
FROM ConvertedText;