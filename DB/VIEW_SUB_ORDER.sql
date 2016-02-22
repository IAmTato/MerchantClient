create or replace view view_sub_order as
select o.sub_order_id,
       o.order_id, 
       o.store_id,
       o.sub_pro_id,
       o.create_date,
       o.quantity,
       o.currency,
       o.unit_price,
       o.discount_id, 
       goods.goods_introduce_en,
       goods.goods_introduce_cn,
       goods.goods_name_en,
       goods.goods_name_cn, 
       goods.goods_id,
       img.img_url 
  from hs_tr_sub_order o
  left join hs_tr_goods goods on o.goods_id = goods.goods_id
  left join hs_tr_base_img img on goods.img_id = img.img_id 
