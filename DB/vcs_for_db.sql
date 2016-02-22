create or replace view view_master_order as
select t.order_id,
       to_char(t.create_date, 'YYYY-MM-DD HH24:mi') as create_date,
       t.order_type,
       t.update_id,
       t.update_date,
       t.invoice_title,
       t.send_time,
       t.remark,
       t.add_fee_amount,
       t.add_fee_rate,
       t.pay_type,
       t.order_status,
       t.card_id,
       t.ext_amount,
       t.addr,
       t.courier_id,
       t.courier_amount,
       t.courier_type,
       t.discount_amount,
       t.real_amount,
       t.cost_amount,
       t.currency,
       t.store_id,
       t.cust_id,
       t.pay_id,
       b.user_name,
       b.phone as cust_phone
  from hs_tr_master_order t left join HS_TR_CUST_INFO b on t.cust_id = b.cust_id and b.status = 1;

create table HS_TR_DELIVER_COUNT
(
  ID               VARCHAR2(32) not null,
  USER_ID          VARCHAR2(32) not null,
  HANDOVER_TIME    DATE default null,
  TOTAL_AMOUNT     NUMBER(12,2) default 0 not null,
  TOTAL_COUNT      NUMBER(10)  default 0 not null
);

create sequence seq_deliver_count increment by 1 start with 1 nomaxvalue nocycle cache 10;