-- What user bought the most expensive item?
-- What is the name of the most expensive item purchased?
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
USE fetch_rewards;

SELECT
users.ID,
receipt_items.TOTAL_FINAL_PRICE / receipt_items.QUANTITY_PURCHASED AS most_exp_item,
brands.NAME AS item_name
FROM users
JOIN receipts ON users.ID = receipts.USER_ID
JOIN receipt_items ON receipt_items.REWARDS_RECEIPT_ID = receipts.ID
JOIN brands ON brands.BRAND_CODE = receipt_items.BRAND_CODE
ORDER BY most_exp_item DESC
LIMIT 1;

