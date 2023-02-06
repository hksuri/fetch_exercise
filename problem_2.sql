-- Which user spent the most money in the month of August?

USE fetch_rewards;

SELECT users.ID AS user_id, ROUND(SUM(receipts.TOTAL_SPENT),2) AS total_spent
FROM users
JOIN receipts ON users.ID = receipts.USER_ID
WHERE (EXTRACT(MONTH FROM DATE_FORMAT(receipts.PURCHASE_DATE,'%Y-%m-%dT%H:%i:%s.%fZ'))) = 8
GROUP BY user_id
ORDER BY total_spent DESC
LIMIT 1;