-- How many users scanned in each month?

USE fetch_rewards;

SELECT EXTRACT(MONTH FROM DATE_FORMAT(receipts.PURCHASE_DATE,'%Y-%m-%dT%H:%i:%s.%fZ')) AS month,
COUNT(DISTINCT receipts.USER_ID) AS user_count
FROM receipts
WHERE EXTRACT(MONTH FROM DATE_FORMAT(receipts.PURCHASE_DATE,'%Y-%m-%dT%H:%i:%s.%fZ')) IS NOT NULL
GROUP BY month
ORDER BY month;
;