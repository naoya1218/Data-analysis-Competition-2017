﻿DROP TABLE IF EXISTS receipt_henpin_syori CASCADE;

CREATE TABLE receipt_henpin_syori
-- 返品で抜き出したIDを消去する phase1
AS 
SELECT
 	receipt_id,
	store_id,
	dt,
	t,
	customer_id,
	in_tax,
	tax,
	trans_category,
	pos_staff,
	regi_staff,
	simei,
	coupon,
	counpon_num,
	cash,
	credit,
	ec_money,	
	urikake,	
	other_coupon,
	other_coupon_num,
	sum_coupon_num,
	coupon_id,
	use_point,
	use_point_class,
	point_grant,
	point_balance,
	cs_point,
	item_num
FROM
	receipt_1 AS A
	LEFT JOIN(
		SELECT 	
			*
		FROM	
			id_list_all
		) AS B
		ON A.receipt_id = B.henpin_receipt
		OR A.receipt_id = B.hanbai_receipt
	where
		B.henpin_receipt is NULL
