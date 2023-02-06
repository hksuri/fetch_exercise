-- Which brand saw the most dollars spent in the month of June?

USE fetch_rewards;

SELECT brands.NAME AS brand_name,
ROUND(SUM(receipt_items.TOTAL_FINAL_PRICE),2) AS total_spent
FROM brands
JOIN receipt_items ON brands.BRAND_CODE = receipt_items.BRAND_CODE
WHERE receipt_items.REWARDS_RECEIPT_ID IN
(
SELECT receipt_items.REWARDS_RECEIPT_ID
FROM receipt_items
JOIN receipts ON receipt_items.REWARDS_RECEIPT_ID = receipts.ID
WHERE (EXTRACT(MONTH FROM DATE_FORMAT(receipts.PURCHASE_DATE,'%Y-%m-%dT%H:%i:%s.%fZ'))) = 6
)
GROUP BY brand_name
ORDER BY total_spent DESC
LIMIT 1;
