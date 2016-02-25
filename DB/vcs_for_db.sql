create or replace view view_master_order as
select t.order_id,
       to_char(t.create_date, 'YYYY-MM-DD HH24:mi') as create_date,
       t.create_date as create_date_comp,
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
       t.courier_amount/100 as courier_amount,
       t.courier_type,
       t.discount_amount/100 as discount_amount,
       t.real_amount/100 as real_amount,
       t.cost_amount/100 as cost_amount,
       t.currency,
       t.store_id,
       t.cust_id,
       t.pay_id,
       b.user_name,
       b.phone as cust_phone,
       c.address as cust_addr
  from hs_tr_master_order t
  left join HS_TR_CUST_INFO b on t.cust_id = b.cust_id and b.status = 1
  left join hs_tr_delivery_addr c on t.cust_id = c.cust_id;

create table HS_TR_DELIVER_COUNT
(
  ID               VARCHAR2(32) not null,
  USER_ID          VARCHAR2(32) not null,
  HANDOVER_TIME    DATE default null,
  TOTAL_AMOUNT     NUMBER(12,2) default 0 not null,
  TOTAL_COUNT      NUMBER(10)  default 0 not null
);

create sequence seq_deliver_count increment by 1 start with 1 nomaxvalue nocycle cache 10;

alter table HS_TR_DELIVER_COUNT
  add constraint PK_HS_TR_DELIVER_COUNT primary key (ID);

create table HS_TP_VERSION_CONTROL(
id     varchar2(34),
version      varchar2(5),
update_path  varchar2(50),
update_info  varchar2(150),
update_time  date default sysdate
);

create sequence seq_version_control increment by 1 start with 1 nomaxvalue nocycle cache 10;

alter table HS_TP_VERSION_CONTROL
  add constraint PK_HS_TP_VERSION_CONTROL primary key (ID);

select t.*, t.rowid from hs_tr_master_order t where order_id in (1,2,3,4,9)

update hs_tr_master_order t set t.order_status = '21' where order_id in ('1','2','3','4','9')
update hs_tr_master_order t set t.order_status = '11' where t.order_id in ('5','8', '6' ,'7' )
