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






set feedback off
set define off
prompt Disabling triggers for HS_TH_QRCODE...
alter table HS_TH_QRCODE disable all triggers;
prompt Disabling triggers for HS_TL_LOG...
alter table HS_TL_LOG disable all triggers;
prompt Disabling triggers for HS_TP_BASE_PARAM...
alter table HS_TP_BASE_PARAM disable all triggers;
prompt Disabling triggers for HS_TP_DICT...
alter table HS_TP_DICT disable all triggers;
prompt Disabling triggers for HS_TP_INDUSTRY_LARGE...
alter table HS_TP_INDUSTRY_LARGE disable all triggers;
prompt Disabling triggers for HS_TP_INDUSTRY_SMALL...
alter table HS_TP_INDUSTRY_SMALL disable all triggers;
prompt Disabling triggers for HS_TP_VERSION_CONTROL...
alter table HS_TP_VERSION_CONTROL disable all triggers;
prompt Disabling triggers for HS_TR_ADVERT_INFO...
alter table HS_TR_ADVERT_INFO disable all triggers;
prompt Disabling triggers for HS_TR_AUDIT...
alter table HS_TR_AUDIT disable all triggers;
prompt Disabling triggers for HS_TR_AUDIT_FLOW_INST...
alter table HS_TR_AUDIT_FLOW_INST disable all triggers;
prompt Disabling triggers for HS_TR_AUDIT_RESULT...
alter table HS_TR_AUDIT_RESULT disable all triggers;
prompt Disabling triggers for HS_TR_BANK_USER...
alter table HS_TR_BANK_USER disable all triggers;
prompt Disabling triggers for HS_TR_BASE_IMG...
alter table HS_TR_BASE_IMG disable all triggers;
prompt Disabling triggers for HS_TR_COMMUNITY...
alter table HS_TR_COMMUNITY disable all triggers;
prompt Disabling triggers for HS_TR_CUST_CARD...
alter table HS_TR_CUST_CARD disable all triggers;
prompt Disabling triggers for HS_TR_CUST_COLLECT...
alter table HS_TR_CUST_COLLECT disable all triggers;
prompt Disabling triggers for HS_TR_CUST_INFO...
alter table HS_TR_CUST_INFO disable all triggers;
prompt Disabling triggers for HS_TR_DELIVERY...
alter table HS_TR_DELIVERY disable all triggers;
prompt Disabling triggers for HS_TR_DELIVERY_ADDR...
alter table HS_TR_DELIVERY_ADDR disable all triggers;
prompt Disabling triggers for HS_TR_DELIVER_COUNT...
alter table HS_TR_DELIVER_COUNT disable all triggers;
prompt Disabling triggers for HS_TR_DELIVER_RECORD...
alter table HS_TR_DELIVER_RECORD disable all triggers;
prompt Disabling triggers for HS_TR_DISCOUNT...
alter table HS_TR_DISCOUNT disable all triggers;
prompt Disabling triggers for HS_TR_DISCOUNT_CARD_REL...
alter table HS_TR_DISCOUNT_CARD_REL disable all triggers;
prompt Disabling triggers for HS_TR_DISCOUNT_GOODS_REL...
alter table HS_TR_DISCOUNT_GOODS_REL disable all triggers;
prompt Disabling triggers for HS_TR_DISCOUNT_GROUP_REL...
alter table HS_TR_DISCOUNT_GROUP_REL disable all triggers;
prompt Disabling triggers for HS_TR_DISCOUNT_STORE_REL...
alter table HS_TR_DISCOUNT_STORE_REL disable all triggers;
prompt Disabling triggers for HS_TR_GOODS...
alter table HS_TR_GOODS disable all triggers;
prompt Disabling triggers for HS_TR_GOODS_ATTACH_REL...
alter table HS_TR_GOODS_ATTACH_REL disable all triggers;
prompt Disabling triggers for HS_TR_GOODS_CLASSIFICATION...
alter table HS_TR_GOODS_CLASSIFICATION disable all triggers;
prompt Disabling triggers for HS_TR_GOODS_GROUP_REL...
alter table HS_TR_GOODS_GROUP_REL disable all triggers;
prompt Disabling triggers for HS_TR_HEADSTORE_DETAIL...
alter table HS_TR_HEADSTORE_DETAIL disable all triggers;
prompt Disabling triggers for HS_TR_IDENTITY_CODE...
alter table HS_TR_IDENTITY_CODE disable all triggers;
prompt Disabling triggers for HS_TR_MASTER_ORDER...
alter table HS_TR_MASTER_ORDER disable all triggers;
prompt Disabling triggers for HS_TR_MASTER_ORDER_BCK...
alter table HS_TR_MASTER_ORDER_BCK disable all triggers;
prompt Disabling triggers for HS_TR_MENU...
alter table HS_TR_MENU disable all triggers;
prompt Disabling triggers for HS_TR_MENU_ROLE...
alter table HS_TR_MENU_ROLE disable all triggers;
prompt Disabling triggers for HS_TR_MESSAGE...
alter table HS_TR_MESSAGE disable all triggers;
prompt Disabling triggers for HS_TR_ORDER_DIS_REL...
alter table HS_TR_ORDER_DIS_REL disable all triggers;
prompt Disabling triggers for HS_TR_ORDER_FLOW...
alter table HS_TR_ORDER_FLOW disable all triggers;
prompt Disabling triggers for HS_TR_PAY_INFO...
alter table HS_TR_PAY_INFO disable all triggers;
prompt Disabling triggers for HS_TR_PAY_RESULT...
alter table HS_TR_PAY_RESULT disable all triggers;
prompt Disabling triggers for HS_TR_QRCODE...
alter table HS_TR_QRCODE disable all triggers;
prompt Disabling triggers for HS_TR_ROLE...
alter table HS_TR_ROLE disable all triggers;
prompt Disabling triggers for HS_TR_ROLE_USER...
alter table HS_TR_ROLE_USER disable all triggers;
prompt Disabling triggers for HS_TR_SHOPPING_CART...
alter table HS_TR_SHOPPING_CART disable all triggers;
prompt Disabling triggers for HS_TR_STORE_DETAIL...
alter table HS_TR_STORE_DETAIL disable all triggers;
prompt Disabling triggers for HS_TR_STORE_RECOMMEND...
alter table HS_TR_STORE_RECOMMEND disable all triggers;
prompt Disabling triggers for HS_TR_STORE_TOKEN_INFO...
alter table HS_TR_STORE_TOKEN_INFO disable all triggers;
prompt Disabling triggers for HS_TR_STORE_USER...
alter table HS_TR_STORE_USER disable all triggers;
prompt Disabling triggers for HS_TR_SUB_ORDER...
alter table HS_TR_SUB_ORDER disable all triggers;
prompt Loading HS_TH_QRCODE...
prompt Table is empty
prompt Loading HS_TL_LOG...
prompt Table is empty
prompt Loading HS_TP_BASE_PARAM...
prompt Table is empty
prompt Loading HS_TP_DICT...
prompt Table is empty
prompt Loading HS_TP_INDUSTRY_LARGE...
prompt Table is empty
prompt Loading HS_TP_INDUSTRY_SMALL...
prompt Table is empty
prompt Loading HS_TP_VERSION_CONTROL...
insert into HS_TP_VERSION_CONTROL (ID, VERSION, UPDATE_PATH, UPDATE_INFO, UPDATE_TIME)
values ('2', 1.2, 'http://192.168.43.187:8080/icbc/mo/emerchant/', '此版本為體驗版本<br/>1）新增【當日訂單】功能。<br/>2）提升掃碼速度。<br/>3）掃碼后無需等待支付完成。<br/>4）錯誤修復。', to_date('23-02-2016 10:50:51', 'dd-mm-yyyy hh24:mi:ss'));
insert into HS_TP_VERSION_CONTROL (ID, VERSION, UPDATE_PATH, UPDATE_INFO, UPDATE_TIME)
values ('3', 1.15, null, null, to_date('23-02-2016 14:06:43', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 2 records loaded
prompt Loading HS_TR_ADVERT_INFO...
prompt Table is empty
prompt Loading HS_TR_AUDIT...
prompt Table is empty
prompt Loading HS_TR_AUDIT_FLOW_INST...
prompt Table is empty
prompt Loading HS_TR_AUDIT_RESULT...
prompt Table is empty
prompt Loading HS_TR_BANK_USER...
prompt Table is empty
prompt Loading HS_TR_BASE_IMG...
prompt Table is empty
prompt Loading HS_TR_COMMUNITY...
prompt Table is empty
prompt Loading HS_TR_CUST_CARD...
prompt Table is empty
prompt Loading HS_TR_CUST_COLLECT...
prompt Table is empty
prompt Loading HS_TR_CUST_INFO...
insert into HS_TR_CUST_INFO (CUST_ID, USER_NAME, PASSWORD, PHONE, AVATAR, BANK_USER, STATUS, CREATE_DATE, CUST_GROUP)
values ('100', '卢健', '100', '13631330664', null, null, '1', to_date('18-02-2016', 'dd-mm-yyyy'), '100');
insert into HS_TR_CUST_INFO (CUST_ID, USER_NAME, PASSWORD, PHONE, AVATAR, BANK_USER, STATUS, CREATE_DATE, CUST_GROUP)
values ('300', '聂波', '300', '63774355', null, null, '1', to_date('18-02-2016', 'dd-mm-yyyy'), '300');
insert into HS_TR_CUST_INFO (CUST_ID, USER_NAME, PASSWORD, PHONE, AVATAR, BANK_USER, STATUS, CREATE_DATE, CUST_GROUP)
values ('200', '林超', '200', '13860449280', null, null, '1', to_date('18-02-2016', 'dd-mm-yyyy'), '200');
commit;
prompt 3 records loaded
prompt Loading HS_TR_DELIVERY...
insert into HS_TR_DELIVERY (ID, STORE_ID, PHONE, DELI_NAME, CREATE_ID, CREATE_DATE, REMARKS)
values ('10461318', '200', '8888', null, 'Tato', to_date('25-02-2016', 'dd-mm-yyyy'), null);
insert into HS_TR_DELIVERY (ID, STORE_ID, PHONE, DELI_NAME, CREATE_ID, CREATE_DATE, REMARKS)
values ('61069212', '200', '7777', null, 'Tato', to_date('25-02-2016', 'dd-mm-yyyy'), null);
insert into HS_TR_DELIVERY (ID, STORE_ID, PHONE, DELI_NAME, CREATE_ID, CREATE_DATE, REMARKS)
values ('37250052', '200', '88888', null, 'Tato', to_date('25-02-2016', 'dd-mm-yyyy'), null);
insert into HS_TR_DELIVERY (ID, STORE_ID, PHONE, DELI_NAME, CREATE_ID, CREATE_DATE, REMARKS)
values ('93139378', '200', '63557777', null, 'Tato', to_date('01-03-2016', 'dd-mm-yyyy'), null);
insert into HS_TR_DELIVERY (ID, STORE_ID, PHONE, DELI_NAME, CREATE_ID, CREATE_DATE, REMARKS)
values ('74986861', '200', '66666', null, 'Tato', to_date('25-02-2016', 'dd-mm-yyyy'), null);
insert into HS_TR_DELIVERY (ID, STORE_ID, PHONE, DELI_NAME, CREATE_ID, CREATE_DATE, REMARKS)
values ('22071243', '200', '2314123', null, 'Tato', to_date('25-02-2016', 'dd-mm-yyyy'), null);
insert into HS_TR_DELIVERY (ID, STORE_ID, PHONE, DELI_NAME, CREATE_ID, CREATE_DATE, REMARKS)
values ('27521106', '200', '234235', null, 'Tato', to_date('25-02-2016', 'dd-mm-yyyy'), null);
insert into HS_TR_DELIVERY (ID, STORE_ID, PHONE, DELI_NAME, CREATE_ID, CREATE_DATE, REMARKS)
values ('48722708', '200', '9999', null, 'Tato', to_date('25-02-2016', 'dd-mm-yyyy'), null);
insert into HS_TR_DELIVERY (ID, STORE_ID, PHONE, DELI_NAME, CREATE_ID, CREATE_DATE, REMARKS)
values ('57459298', '200', '13860449280', null, 'Tony', to_date('26-02-2016', 'dd-mm-yyyy'), null);
commit;
prompt 9 records loaded
prompt Loading HS_TR_DELIVERY_ADDR...
insert into HS_TR_DELIVERY_ADDR (ID, CUST_ID, LINK_MAN, LINK_PHONE, SEX, ADDRESS, DETAIL_ADDR, LONGS, LATI, QUERY_LEY, IS_DEFAULT, CREATE_DATE)
values ('2', '200', null, null, null, '雄飞家雄飞家雄飞家雄飞家', null, null, null, null, null, null);
insert into HS_TR_DELIVERY_ADDR (ID, CUST_ID, LINK_MAN, LINK_PHONE, SEX, ADDRESS, DETAIL_ADDR, LONGS, LATI, QUERY_LEY, IS_DEFAULT, CREATE_DATE)
values ('1', '100', null, null, null, '聂波家聂波家聂波家聂波家聂波家聂波家聂波家', null, null, null, null, null, null);
insert into HS_TR_DELIVERY_ADDR (ID, CUST_ID, LINK_MAN, LINK_PHONE, SEX, ADDRESS, DETAIL_ADDR, LONGS, LATI, QUERY_LEY, IS_DEFAULT, CREATE_DATE)
values ('3', '300', null, null, null, '卢健家卢健家卢健家卢健家', null, null, null, null, null, null);
commit;
prompt 3 records loaded
prompt Loading HS_TR_DELIVER_COUNT...
insert into HS_TR_DELIVER_COUNT (ID, USER_ID, HANDOVER_TIME, TOTAL_AMOUNT, TOTAL_COUNT)
values ('50', 'Tato', to_date('22-02-2016', 'dd-mm-yyyy'), 1, 1);
insert into HS_TR_DELIVER_COUNT (ID, USER_ID, HANDOVER_TIME, TOTAL_AMOUNT, TOTAL_COUNT)
values ('51', 'Tato', to_date('22-02-2016', 'dd-mm-yyyy'), 2, 1);
insert into HS_TR_DELIVER_COUNT (ID, USER_ID, HANDOVER_TIME, TOTAL_AMOUNT, TOTAL_COUNT)
values ('350', 'Tato1', to_date('22-02-2016 16:39:01', 'dd-mm-yyyy hh24:mi:ss'), 320, 4);
insert into HS_TR_DELIVER_COUNT (ID, USER_ID, HANDOVER_TIME, TOTAL_AMOUNT, TOTAL_COUNT)
values ('100', 'Tato', to_date('22-02-2016 12:11:15', 'dd-mm-yyyy hh24:mi:ss'), 15, 4);
insert into HS_TR_DELIVER_COUNT (ID, USER_ID, HANDOVER_TIME, TOTAL_AMOUNT, TOTAL_COUNT)
values ('300', 'Tato', null, 3501.03, 4);
insert into HS_TR_DELIVER_COUNT (ID, USER_ID, HANDOVER_TIME, TOTAL_AMOUNT, TOTAL_COUNT)
values ('400', 'Tato1', to_date('22-02-2016 16:42:51', 'dd-mm-yyyy hh24:mi:ss'), 160, 2);
insert into HS_TR_DELIVER_COUNT (ID, USER_ID, HANDOVER_TIME, TOTAL_AMOUNT, TOTAL_COUNT)
values ('401', 'Tato1', to_date('22-02-2016 16:54:38', 'dd-mm-yyyy hh24:mi:ss'), 18320, 5);
insert into HS_TR_DELIVER_COUNT (ID, USER_ID, HANDOVER_TIME, TOTAL_AMOUNT, TOTAL_COUNT)
values ('450', 'Tato1', to_date('24-02-2016 20:55:07', 'dd-mm-yyyy hh24:mi:ss'), 18000, 1);
insert into HS_TR_DELIVER_COUNT (ID, USER_ID, HANDOVER_TIME, TOTAL_AMOUNT, TOTAL_COUNT)
values ('500', 'Tony', to_date('23-02-2016 22:54:21', 'dd-mm-yyyy hh24:mi:ss'), 18000, 1);
insert into HS_TR_DELIVER_COUNT (ID, USER_ID, HANDOVER_TIME, TOTAL_AMOUNT, TOTAL_COUNT)
values ('1000', 'Tato1', to_date('26-02-2016 11:31:48', 'dd-mm-yyyy hh24:mi:ss'), 3263.57, 3);
insert into HS_TR_DELIVER_COUNT (ID, USER_ID, HANDOVER_TIME, TOTAL_AMOUNT, TOTAL_COUNT)
values ('402', 'Tato1', to_date('22-02-2016 16:58:20', 'dd-mm-yyyy hh24:mi:ss'), 18234, 2);
insert into HS_TR_DELIVER_COUNT (ID, USER_ID, HANDOVER_TIME, TOTAL_AMOUNT, TOTAL_COUNT)
values ('403', 'Tato1', to_date('22-02-2016 16:58:46', 'dd-mm-yyyy hh24:mi:ss'), 326123, 1);
insert into HS_TR_DELIVER_COUNT (ID, USER_ID, HANDOVER_TIME, TOTAL_AMOUNT, TOTAL_COUNT)
values ('1051', 'Bobby', null, 10.02, 1);
insert into HS_TR_DELIVER_COUNT (ID, USER_ID, HANDOVER_TIME, TOTAL_AMOUNT, TOTAL_COUNT)
values ('150', 'Tato', to_date('22-02-2016 13:22:43', 'dd-mm-yyyy hh24:mi:ss'), 17, 3);
insert into HS_TR_DELIVER_COUNT (ID, USER_ID, HANDOVER_TIME, TOTAL_AMOUNT, TOTAL_COUNT)
values ('151', 'Tato', to_date('22-02-2016 14:00:21', 'dd-mm-yyyy hh24:mi:ss'), 6, 1);
insert into HS_TR_DELIVER_COUNT (ID, USER_ID, HANDOVER_TIME, TOTAL_AMOUNT, TOTAL_COUNT)
values ('1050', 'Tato1', null, 3261.23, 2);
insert into HS_TR_DELIVER_COUNT (ID, USER_ID, HANDOVER_TIME, TOTAL_AMOUNT, TOTAL_COUNT)
values ('1100', 'Tony', to_date('26-02-2016 16:53:03', 'dd-mm-yyyy hh24:mi:ss'), 0, 1);
commit;
prompt 17 records loaded
prompt Loading HS_TR_DELIVER_RECORD...
prompt Table is empty
prompt Loading HS_TR_DISCOUNT...
prompt Table is empty
prompt Loading HS_TR_DISCOUNT_CARD_REL...
prompt Table is empty
prompt Loading HS_TR_DISCOUNT_GOODS_REL...
prompt Table is empty
prompt Loading HS_TR_DISCOUNT_GROUP_REL...
prompt Table is empty
prompt Loading HS_TR_DISCOUNT_STORE_REL...
prompt Table is empty
prompt Loading HS_TR_GOODS...
prompt Table is empty
prompt Loading HS_TR_GOODS_ATTACH_REL...
prompt Table is empty
prompt Loading HS_TR_GOODS_CLASSIFICATION...
prompt Table is empty
prompt Loading HS_TR_GOODS_GROUP_REL...
prompt Table is empty
prompt Loading HS_TR_HEADSTORE_DETAIL...
prompt Table is empty
prompt Loading HS_TR_IDENTITY_CODE...
prompt Table is empty
prompt Loading HS_TR_MASTER_ORDER...
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('915', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 300, 300, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225093147951', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 666, 666, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225093255350', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '“13860449280”', '200', 'MOP', 666, 666, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225093257933', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '“13860449280”', '200', 'MOP', 666, 666, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225093257487', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '“13860449280”', '200', 'MOP', 666, 666, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225093258889', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '“13860449280”', '200', 'MOP', 666, 666, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225093320664', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '"13860449280"', '200', 'MOP', 666, 666, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022509374677', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 666, 666, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225094610461', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 20011, 20011, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225100755536', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 220011, 220011, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225100909288', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 1144, 1144, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225102236737', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 201603, 201603, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022510351130', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 95, 95, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225104022559', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 123, 123, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225104601894', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 101, 101, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022510491322', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 300000, 300000, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225105343857', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 9911, 9911, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225110423395', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 99991, 99991, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022511065070', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 99992, 99992, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225110953991', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 99994, 99994, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225111929973', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 99995, 99995, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225112750505', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 99996, 99996, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225115753866', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 99998, 99998, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225181954969', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 888123, 888123, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225182040212', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 12345678, 12345678, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225195608501', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225195646168', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 69987, 69987, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225195800409', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225201750385', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 3808, 3808, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226105404416', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 998, 998, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226110323176', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 99800, 99800, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160229180047858', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 2233, 2233, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160229180048963', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 2233, 2233, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160229180249612', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 22331, 22331, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160229180250328', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 2233, 2233, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160229180258649', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 22331, 22331, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022918030772', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 22331, 22331, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022918052449', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 22332, 22332, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160229182829240', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 123, 123, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301092800240', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 6994, 6994, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301093014569', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 6932, 6932, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301093217704', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 12312, 12312, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301095514750', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 9823, 9823, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301095736794', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 6945, 6945, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16030111225785', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 22331, 22331, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16030111253456', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 22332, 22332, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301112706369', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 22333, 22333, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301112804634', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 22334, 22334, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301115714949', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 112, 112, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301173658474', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 667, 667, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301180339600', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 963, 963, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16030118084141', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 337, 337, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16030118112677', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 1242, 1242, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301181307577', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 327, 327, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('505', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('242', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('755', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('901', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224201805216', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 260, 260, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224202019620', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 366, 366, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224202039617', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 230, 230, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224202256610', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 912, 912, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224204924739', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 620, 620, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224205127998', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 231, 231, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224205752378', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 512, 512, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224210213598', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 232, 232, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224210446689', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 111, 111, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224212554542', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 1, 1, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224212833179', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 20, 20, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224213800513', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 120, 120, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224214629442', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 360, 360, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225101124268', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 2016, 2016, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225101332580', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 0, 0, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225101451663', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 201601, 201601, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225131602751', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 10005, 10005, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022513190814', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 500012, 500012, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225133317488', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 1000000, 1000000, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225133638945', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 1000001, 1000001, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225134416928', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 3000000, 3000000, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225145548591', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225180242789', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 5999, 5999, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226095821460', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 6669, 6669, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226100313874', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 300001, 300001, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022610043396', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 699997, 699997, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226104733781', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 3213, 3213, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226104906835', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226160837633', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 9321, 9321, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226165543855', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 214, 214, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160229165620879', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 123321, 123321, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160229170540406', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 56698, 56698, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301053923135', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 225, 225, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301053923868', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 226, 226, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301060956544', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 2241, 2241, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301061940447', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 22411, 22411, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16030106194689', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 22412, 22412, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301062154227', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 22413, 22413, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301090630539', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 3665, 3665, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301090815302', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 36985, 36985, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16030109102485', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 123421, 123421, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301091146326', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 1239, 1239, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
commit;
prompt 100 records committed...
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301091358610', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 3694, 3694, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301092327696', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 2365, 2365, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301094521442', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 50014, 50014, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16030109461478', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 12317, 12317, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301095054535', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 12319, 12319, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301095101579', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 12320, 12320, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16030112064464', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 1122, 1122, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301150856967', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 127, 127, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301151441802', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 3367, 3367, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301151538168', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 6693, 6693, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301151904302', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 5213, 5213, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301152035446', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 5214, 5214, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301152204979', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 5215, 5215, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301152723525', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 5216, 5216, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301152753186', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 5217, 5217, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301153056113', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 5218, 5218, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301153103910', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 5219, 5219, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301153135338', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 5220, 5220, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301160011374', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 632, 632, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301160113599', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 633, 633, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301162731177', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 927, 927, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301162742572', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 928, 928, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301171506798', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 364, 364, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301171647792', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 366, 366, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301171752562', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 367, 367, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('6', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '300', '200', 'HKD', 100, 80, 20, '1', 10, 'Tato', 'Vincent家', 10, '11', '2', '44444444444444444444', 10, 10, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('5', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '200', '200', 'HKD', 100, 80, 20, '1', 10, '57459298', 'Vincent家', 10, '21', '2', '44444444444444444444', 10, 10, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('4', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '100', '200', 'HKD', 1022, 1002, 20, '1', 10, 'Tato', 'Vincent家', 10, '31', '2', '44444444444444444444', 10, 10, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('155', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('337', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 200, 200, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('952', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('906', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225154404121', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 5101010, 5101010, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022515525240', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 1212121212, 1212121212, 0, null, null, null, null, null, '11', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225160130510', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 200009, 200009, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225160906783', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 200068, 200068, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225162720795', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 6666666, 6666666, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225175646745', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 2998, 2998, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225175843454', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 599, 599, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226161413261', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 66986, 66986, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022917104985', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 666123, 666123, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160229180748625', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 22, 22, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160229180852334', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 2233123, 2233123, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160229180920394', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 2233124, 2233124, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022918145268', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 22332, 22332, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301104801754', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 12320, 12320, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301170258652', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 555, 555, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301172510561', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 369, 369, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301174504926', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 664, 664, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301174908406', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 3361, 3361, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('45', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224170925685', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 100, 100, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224172024103', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 125, 125, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224173025883', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 700, 700, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224173455791', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 350, 350, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224174131616', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 600, 600, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224174540337', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 800, 800, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224174634289', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 360, 360, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224174944490', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 690, 690, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224180633826', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 210, 210, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022418165267', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 999, 999, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224230820827', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 2001, 2001, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224231613380', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 5555, 5555, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224232140397', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 33331, 33331, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225131007718', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 4445, 4445, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225162940332', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 66666, 66666, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225163211900', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 4444444, 4444444, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225164534625', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 5555556, 5555556, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225164905742', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 111111111, 111111111, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225172657550', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 600009, 600009, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225172831519', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 6888988, 6888988, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226103230512', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 69931, 69931, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226103543666', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 66923, 66923, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226103726237', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022616063511', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 555, 555, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301052820973', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 220, 220, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301052847938', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 221, 221, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301053747561', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 223, 223, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301053752627', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 223, 223, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301053805319', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 224, 224, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301062713371', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 22415, 22415, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301062832341', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 22416, 22416, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16030106322567', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 22417, 22417, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301063244731', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 22418, 22418, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301063530149', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 22419, 22419, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301070157152', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 998756, 998756, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301070728121', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 22221, 22221, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301070828674', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 22223, 22223, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301071111286', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 22224, 22224, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301071120109', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 224, 224, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301071146446', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 224, 224, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301071206194', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 114, 114, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301071245384', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 114, 114, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301071302152', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 1141, 1141, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301071626130', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 1145, 1145, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301071714481', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 1146, 1146, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301071944214', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 1147, 1147, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, to_date('01-02-2016', 'dd-mm-yyyy'), null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301072010272', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 1148, 1148, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, to_date('01-03-2016', 'dd-mm-yyyy'), null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16030107235929', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 1149, 1149, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, to_date('01-02-2016', 'dd-mm-yyyy'), null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301072404458', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 1150, 1150, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, to_date('01-03-2016', 'dd-mm-yyyy'), null, null);
commit;
prompt 200 records committed...
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301073948596', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 1151, 1151, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301074547277', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 1152, 1152, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301074927406', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 1153, 1153, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301074959606', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 1154, 1154, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301075428862', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 1155, 1155, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301075515772', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 1156, 1156, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301103703634', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 66988, 66988, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301111320275', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 69871, 69871, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301115121938', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 300, 300, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301142708739', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 692, 692, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301143035790', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 250, 250, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16030114313050', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 693, 693, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301143204830', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 115, 115, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16030114342932', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 9961, 9961, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301143926467', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 6637, 6637, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301143936803', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 6638, 6638, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301144023946', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 6639, 6639, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301144123394', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 6640, 6640, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301164533320', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 1272, 1272, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('1', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '100', '200', 'HKD', 326143, 326123, 20, '1', 10, 'Tato', 'Vincent家', 10, '31', '2', '44444444444444444444', 10, 10, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('2', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '200', '200', 'HKD', 254, 234, 20, '1', 10, 'Tato', 'Vincent家', 10, '31', '1', '44444444444444444444', 10, 10, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('3', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '300', '200', 'HKD', 563, 543, 20, '1', 10, 'Tato', 'Vincent家', 10, '21', '1', '44444444444444444444', 10, 10, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('9', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '300', '200', 'HKD', 18020, 18000, 20, '1', 10, '48722708', 'Bobby家', 10, '21', '1', '44444444444444444444', 10, 10, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('8', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '200', '200', 'HKD', 100, 80, 20, '1', 10, '93139378', 'Vincent家', 10, '21', '2', '44444444444444444444', 10, 10, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('7', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '300', '200', 'HKD', 100, 80, 20, '1', 10, '57459298', 'Vincent家', 10, '21', '2', '44444444444444444444', 10, 10, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('358', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('144', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('572', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224175823627', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 460, 460, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022421583193', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 1111, 1111, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224220627996', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 998, 998, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224222435430', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 301, 301, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224222957533', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 3333, 3333, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224223426448', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 2222, 2222, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224223845520', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 1000, 1000, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224224326954', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 5000, 5000, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224230127153', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 1122, 1122, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225092656642', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 501, 501, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225092741616', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 666, 666, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225093147439', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 666, 666, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226102215494', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 1234567, 1234567, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226161744235', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 66998, 66998, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226162407528', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 699987, 699987, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226165058805', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 555, 555, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226165505371', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 123456, 123456, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022616553521', to_date('29-02-2016 11:06:22', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 666985, 666985, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160229154750118', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 33442211, 33442211, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160229171515427', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 33698, 33698, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022917191134', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 300, 300, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160229173720794', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 3698, 3698, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022917433930', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 995544, 995544, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160229175628939', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 33882, 33882, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160229181819560', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 311, 311, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160229181942177', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 312, 312, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160229183203548', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 1232, 1232, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160229183218896', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 1232, 1232, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160229183259550', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 123455, 123455, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160229184107984', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 12312, 12312, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160229184334947', to_date('29-02-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 223314, 223314, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301115257195', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 998, 998, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301115839636', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 8000, 8000, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301145247379', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 119, 119, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301145349801', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 124, 124, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16030115062730', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 126, 126, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301165114850', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 1273, 1273, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16030116531067', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 1274, 1274, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301165528574', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 9853, 9853, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160301165627708', to_date('01-03-2016', 'dd-mm-yyyy'), '1', '200', '200', 'MOP', 1379, 1379, 0, null, null, null, null, null, '19', '3', null, null, null, null, null, null, null, null, null);
commit;
prompt 268 records loaded
prompt Loading HS_TR_MASTER_ORDER_BCK...
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('915', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 300, 300, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225093147951', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 666, 666, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225093255350', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '“13860449280”', '200', 'MOP', 666, 666, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225093257933', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '“13860449280”', '200', 'MOP', 666, 666, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225093257487', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '“13860449280”', '200', 'MOP', 666, 666, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225093258889', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '“13860449280”', '200', 'MOP', 666, 666, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225093320664', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '"13860449280"', '200', 'MOP', 666, 666, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022509374677', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 666, 666, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225094610461', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 20011, 20011, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225100755536', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 220011, 220011, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225100909288', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 1144, 1144, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225102236737', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 201603, 201603, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022510351130', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 95, 95, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225104022559', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 123, 123, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225104601894', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 101, 101, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022510491322', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 300000, 300000, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225105343857', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 9911, 9911, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225110423395', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 99991, 99991, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022511065070', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 99992, 99992, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225110953991', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 99994, 99994, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225111929973', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 99995, 99995, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225112750505', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 99996, 99996, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225115753866', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 99998, 99998, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225181954969', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 888123, 888123, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225182040212', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 12345678, 12345678, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225195608501', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225195646168', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 69987, 69987, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225195800409', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225201750385', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 3808, 3808, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226105404416', to_date('26-02-2016', 'dd-mm-yyyy'), '1', '13860449280', '200', 'MOP', 998, 998, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226110323176', to_date('26-02-2016', 'dd-mm-yyyy'), '1', '13860449280', '200', 'MOP', 99800, 99800, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('505', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('242', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('755', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('901', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224201805216', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 260, 260, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224202019620', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 366, 366, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224202039617', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 230, 230, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224202256610', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 912, 912, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224204924739', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 620, 620, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224205127998', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 231, 231, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224205752378', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 512, 512, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224210213598', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 232, 232, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224210446689', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 111, 111, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224212554542', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 1, 1, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224212833179', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 20, 20, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224213800513', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 120, 120, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224214629442', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 360, 360, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225101124268', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 2016, 2016, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225101332580', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 0, 0, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225101451663', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 201601, 201601, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225131602751', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 10005, 10005, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022513190814', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 500012, 500012, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225133317488', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 1000000, 1000000, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225133638945', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 1000001, 1000001, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225134416928', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 3000000, 3000000, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225145548591', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225180242789', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 5999, 5999, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226095821460', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 6669, 6669, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226100313874', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 300001, 300001, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022610043396', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 699997, 699997, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226104733781', to_date('26-02-2016', 'dd-mm-yyyy'), '1', '13860449280', '200', 'MOP', 3213, 3213, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226104906835', to_date('26-02-2016', 'dd-mm-yyyy'), '1', '13860449280', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226160837633', to_date('26-02-2016', 'dd-mm-yyyy'), '1', '13860449280', '200', 'MOP', 9321, 9321, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226165543855', to_date('26-02-2016', 'dd-mm-yyyy'), '1', '13860449280', '200', 'MOP', 214, 214, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('6', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '300', '200', 'HKD', 100, 80, 20, '1', 10, 'Tato', 'Vincent家', 10, '11', '2', '44444444444444444444', 10, 10, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('5', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '200', '200', 'HKD', 100, 80, 20, '1', 10, '57459298', 'Vincent家', 10, '21', '2', '44444444444444444444', 10, 10, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('4', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '100', '200', 'HKD', 1022, 1002, 20, '1', 10, 'Tato', 'Vincent家', 10, '31', '2', '44444444444444444444', 10, 10, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('155', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('337', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 200, 200, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('952', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('906', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225154404121', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 5101010, 5101010, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022515525240', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 1212121212, 1212121212, 0, null, null, null, null, null, '11', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225160130510', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 200009, 200009, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225160906783', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 200068, 200068, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225162720795', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 6666666, 6666666, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225175646745', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 2998, 2998, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225175843454', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 599, 599, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226161413261', to_date('26-02-2016', 'dd-mm-yyyy'), '1', '13860449280', '200', 'MOP', 66986, 66986, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('45', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224170925685', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 100, 100, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224172024103', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 125, 125, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224173025883', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 700, 700, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224173455791', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 350, 350, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224174131616', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 600, 600, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224174540337', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 800, 800, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224174634289', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 360, 360, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224174944490', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 690, 690, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224180633826', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 210, 210, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022418165267', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 999, 999, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224230820827', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 2001, 2001, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224231613380', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 5555, 5555, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224232140397', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 33331, 33331, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225131007718', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 4445, 4445, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225162940332', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 66666, 66666, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225163211900', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 4444444, 4444444, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225164534625', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 5555556, 5555556, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225164905742', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 111111111, 111111111, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225172657550', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 600009, 600009, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
commit;
prompt 100 records committed...
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225172831519', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 6888988, 6888988, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226103230512', to_date('26-02-2016', 'dd-mm-yyyy'), '1', '13860449280', '200', 'MOP', 69931, 69931, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226103543666', to_date('26-02-2016', 'dd-mm-yyyy'), '1', '13860449280', '200', 'MOP', 66923, 66923, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226103726237', to_date('26-02-2016', 'dd-mm-yyyy'), '1', '13860449280', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022616063511', to_date('26-02-2016', 'dd-mm-yyyy'), '1', '13860449280', '200', 'MOP', 555, 555, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('1', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '100', '200', 'HKD', 326143, 326123, 20, '1', 10, 'Tato', 'Vincent家', 10, '31', '2', '44444444444444444444', 10, 10, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('2', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '200', '200', 'HKD', 254, 234, 20, '1', 10, 'Tato', 'Vincent家', 10, '31', '1', '44444444444444444444', 10, 10, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('3', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '300', '200', 'HKD', 563, 543, 20, '1', 10, 'Tato', 'Vincent家', 10, '21', '1', '44444444444444444444', 10, 10, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('9', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '300', '200', 'HKD', 18020, 18000, 20, '1', 10, '48722708', 'Bobby家', 10, '21', '1', '44444444444444444444', 10, 10, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('8', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '200', '200', 'HKD', 100, 80, 20, '1', 10, '37250052', 'Vincent家', 10, '11', '2', '44444444444444444444', 10, 10, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('7', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '300', '200', 'HKD', 100, 80, 20, '1', 10, '57459298', 'Vincent家', 10, '21', '2', '44444444444444444444', 10, 10, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('358', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('144', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('572', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '00020160219000000111', '200', 'MOP', 500, 500, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224175823627', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 460, 460, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022421583193', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 1111, 1111, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224220627996', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 998, 998, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224222435430', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 301, 301, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224222957533', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 3333, 3333, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224223426448', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 2222, 2222, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224223845520', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 1000, 1000, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224224326954', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 5000, 5000, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160224230127153', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 1122, 1122, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225092656642', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 501, 501, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225092741616', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 666, 666, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160225093147439', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 666, 666, 0, null, null, null, null, null, '01', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226102215494', to_date('26-02-2016 10:22:47', 'dd-mm-yyyy hh24:mi:ss'), '1', '13860449280', '200', 'MOP', 1234567, 1234567, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226161744235', to_date('26-02-2016', 'dd-mm-yyyy'), '1', '13860449280', '200', 'MOP', 66998, 66998, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226162407528', to_date('26-02-2016', 'dd-mm-yyyy'), '1', '13860449280', '200', 'MOP', 699987, 699987, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226165058805', to_date('26-02-2016', 'dd-mm-yyyy'), '1', '13860449280', '200', 'MOP', 555, 555, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m160226165505371', to_date('26-02-2016', 'dd-mm-yyyy'), '1', '13860449280', '200', 'MOP', 123456, 123456, 0, null, null, null, null, null, '31', '3', null, null, null, null, null, null, null, null, null);
insert into HS_TR_MASTER_ORDER_BCK (ORDER_ID, CREATE_DATE, ORDER_TYPE, CUST_ID, STORE_ID, CURRENCY, COST_AMOUNT, REAL_AMOUNT, DISCOUNT_AMOUNT, COURIER_TYPE, COURIER_AMOUNT, COURIER_ID, ADDR, EXT_AMOUNT, ORDER_STATUS, PAY_TYPE, CARD_ID, ADD_FEE_RATE, ADD_FEE_AMOUNT, SEND_TIME, REMARK, INVOICE_TITLE, UPDATE_DATE, UPDATE_ID, PAY_ID)
values ('m16022616553521', to_date('26-02-2016', 'dd-mm-yyyy'), '1', '13860449280', '200', 'MOP', 666985, 666985, 0, null, null, null, null, null, '09', '3', null, null, null, null, null, null, null, null, null);
commit;
prompt 132 records loaded
prompt Loading HS_TR_MENU...
insert into HS_TR_MENU (ID, MENU_NAME_CN, MENU_NAME_EN, MENU_URL, MENU_TARGET, URL_PARAMS, P_ID, MENU_ORDER, SYS_TYPE, MENU_STATUS, CREATE_DATE, CREATE_ID, UPDATE_DATE, UPDATE_ID, REMARKS)
values ('s1', '��ҳ', 'homePage', null, '_self', null, '0', '1', 'S', '1', to_date('06-01-2016 17:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('06-01-2016 10:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', null);
insert into HS_TR_MENU (ID, MENU_NAME_CN, MENU_NAME_EN, MENU_URL, MENU_TARGET, URL_PARAMS, P_ID, MENU_ORDER, SYS_TYPE, MENU_STATUS, CREATE_DATE, CREATE_ID, UPDATE_DATE, UPDATE_ID, REMARKS)
values ('s2', 'ϵͳ����', 'systemManage', null, '_self', null, '0', '2', 'S', '1', to_date('06-01-2016 17:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('06-01-2016 10:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', null);
insert into HS_TR_MENU (ID, MENU_NAME_CN, MENU_NAME_EN, MENU_URL, MENU_TARGET, URL_PARAMS, P_ID, MENU_ORDER, SYS_TYPE, MENU_STATUS, CREATE_DATE, CREATE_ID, UPDATE_DATE, UPDATE_ID, REMARKS)
values ('s3', '����Ա����', 'operatorManage', '/user/userManage', '_self', null, 's2', '1', 'S', '1', to_date('06-01-2016 17:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('06-01-2016 10:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', null);
insert into HS_TR_MENU (ID, MENU_NAME_CN, MENU_NAME_EN, MENU_URL, MENU_TARGET, URL_PARAMS, P_ID, MENU_ORDER, SYS_TYPE, MENU_STATUS, CREATE_DATE, CREATE_ID, UPDATE_DATE, UPDATE_ID, REMARKS)
values ('s4', '�ҵ��˻�', 'myCount', null, '_self', null, '0', '3', 'S', '1', to_date('06-01-2016 17:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('06-01-2016 10:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', null);
insert into HS_TR_MENU (ID, MENU_NAME_CN, MENU_NAME_EN, MENU_URL, MENU_TARGET, URL_PARAMS, P_ID, MENU_ORDER, SYS_TYPE, MENU_STATUS, CREATE_DATE, CREATE_ID, UPDATE_DATE, UPDATE_ID, REMARKS)
values ('s5', '�޸�����', 'modifyPass', '/user/userPass', '_self', null, 's4', '1', 'S', '1', to_date('06-01-2016 17:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('06-01-2016 10:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', null);
insert into HS_TR_MENU (ID, MENU_NAME_CN, MENU_NAME_EN, MENU_URL, MENU_TARGET, URL_PARAMS, P_ID, MENU_ORDER, SYS_TYPE, MENU_STATUS, CREATE_DATE, CREATE_ID, UPDATE_DATE, UPDATE_ID, REMARKS)
values ('s6', '�޸ı���', 'modifyAlias', '/user/userAlias', '_self', null, 's4', '2', 'S', '1', to_date('06-01-2016 17:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('06-01-2016 10:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', null);
insert into HS_TR_MENU (ID, MENU_NAME_CN, MENU_NAME_EN, MENU_URL, MENU_TARGET, URL_PARAMS, P_ID, MENU_ORDER, SYS_TYPE, MENU_STATUS, CREATE_DATE, CREATE_ID, UPDATE_DATE, UPDATE_ID, REMARKS)
values ('s7', '�̻���Ϣ����', 'commercialManage', null, '_self', null, '0', '4', 'S', '1', to_date('06-01-2016 17:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('06-01-2016 10:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', null);
insert into HS_TR_MENU (ID, MENU_NAME_CN, MENU_NAME_EN, MENU_URL, MENU_TARGET, URL_PARAMS, P_ID, MENU_ORDER, SYS_TYPE, MENU_STATUS, CREATE_DATE, CREATE_ID, UPDATE_DATE, UPDATE_ID, REMARKS)
values ('s8', '�̻���Ϣά��', 'commercialMaintenance', '/commer/commerInfo', '_self', null, 's7', '1', 'S', '1', to_date('06-01-2016 17:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('06-01-2016 10:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', null);
insert into HS_TR_MENU (ID, MENU_NAME_CN, MENU_NAME_EN, MENU_URL, MENU_TARGET, URL_PARAMS, P_ID, MENU_ORDER, SYS_TYPE, MENU_STATUS, CREATE_DATE, CREATE_ID, UPDATE_DATE, UPDATE_ID, REMARKS)
values ('s9', '�ŵ���Ϣ����', 'storeManage', null, '_self', null, '0', '5', 'S', '1', to_date('06-01-2016 17:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('06-01-2016 10:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', null);
insert into HS_TR_MENU (ID, MENU_NAME_CN, MENU_NAME_EN, MENU_URL, MENU_TARGET, URL_PARAMS, P_ID, MENU_ORDER, SYS_TYPE, MENU_STATUS, CREATE_DATE, CREATE_ID, UPDATE_DATE, UPDATE_ID, REMARKS)
values ('s10', '�ŵ���Ϣά��', 'storeMaintenance', '/store/storeInfo', '_self', null, 's9', '1', 'S', '1', to_date('06-01-2016 17:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('06-01-2016 10:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', null);
insert into HS_TR_MENU (ID, MENU_NAME_CN, MENU_NAME_EN, MENU_URL, MENU_TARGET, URL_PARAMS, P_ID, MENU_ORDER, SYS_TYPE, MENU_STATUS, CREATE_DATE, CREATE_ID, UPDATE_DATE, UPDATE_ID, REMARKS)
values ('s11', '��Ʒ����', 'goodsManage', null, '_self', null, '0', '6', 'S', '1', to_date('06-01-2016 17:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('06-01-2016 10:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', null);
insert into HS_TR_MENU (ID, MENU_NAME_CN, MENU_NAME_EN, MENU_URL, MENU_TARGET, URL_PARAMS, P_ID, MENU_ORDER, SYS_TYPE, MENU_STATUS, CREATE_DATE, CREATE_ID, UPDATE_DATE, UPDATE_ID, REMARKS)
values ('s12', '��Ʒ�б�', 'goodsList', '/goods/goodsList', '_self', null, 's11', '1', 'S', '1', to_date('06-01-2016 17:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('06-01-2016 10:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', null);
insert into HS_TR_MENU (ID, MENU_NAME_CN, MENU_NAME_EN, MENU_URL, MENU_TARGET, URL_PARAMS, P_ID, MENU_ORDER, SYS_TYPE, MENU_STATUS, CREATE_DATE, CREATE_ID, UPDATE_DATE, UPDATE_ID, REMARKS)
values ('s13', '��Ʒ����', 'goodsClassify', '/goods/goodsClassify', '_self', null, 's11', '2', 'S', '1', to_date('06-01-2016 17:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('06-01-2016 10:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', null);
insert into HS_TR_MENU (ID, MENU_NAME_CN, MENU_NAME_EN, MENU_URL, MENU_TARGET, URL_PARAMS, P_ID, MENU_ORDER, SYS_TYPE, MENU_STATUS, CREATE_DATE, CREATE_ID, UPDATE_DATE, UPDATE_ID, REMARKS)
values ('s14', '��Ʒ����', 'goodsSort', '/goods/goodsSort', '_self', null, 's11', '3', 'S', '1', to_date('06-01-2016 17:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('06-01-2016 10:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', null);
insert into HS_TR_MENU (ID, MENU_NAME_CN, MENU_NAME_EN, MENU_URL, MENU_TARGET, URL_PARAMS, P_ID, MENU_ORDER, SYS_TYPE, MENU_STATUS, CREATE_DATE, CREATE_ID, UPDATE_DATE, UPDATE_ID, REMARKS)
values ('s15', '�Żݻ����', 'discountManage', '/discount/discountManage', '_self', null, '0', '7', 'S', '1', to_date('06-01-2016 17:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('06-01-2016 10:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', null);
insert into HS_TR_MENU (ID, MENU_NAME_CN, MENU_NAME_EN, MENU_URL, MENU_TARGET, URL_PARAMS, P_ID, MENU_ORDER, SYS_TYPE, MENU_STATUS, CREATE_DATE, CREATE_ID, UPDATE_DATE, UPDATE_ID, REMARKS)
values ('s16', '��������', 'orderManage', '/order/orderMange', '_self', null, 's15', '1', 'S', '1', to_date('06-01-2016 17:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('06-01-2016 10:24:16', 'dd-mm-yyyy hh24:mi:ss'), 'admin', null);
commit;
prompt 16 records loaded
prompt Loading HS_TR_MENU_ROLE...
prompt Table is empty
prompt Loading HS_TR_MESSAGE...
prompt Table is empty
prompt Loading HS_TR_ORDER_DIS_REL...
prompt Table is empty
prompt Loading HS_TR_ORDER_FLOW...
prompt Table is empty
prompt Loading HS_TR_PAY_INFO...
prompt Table is empty
prompt Loading HS_TR_PAY_RESULT...
prompt Table is empty
prompt Loading HS_TR_QRCODE...
insert into HS_TR_QRCODE (QR_CODE_ID, QR_FUNC, CUST_ID, STORE_ID, ORDER_ID, CREATE_TIME, READ_TIME, STATUS, CREATER_DATA, READER_DATA)
values ('00020160219000000112', 100, '200', '200', '20160219000000', to_timestamp('26-02-2016 11:06:59.995000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 2, null, null);
insert into HS_TR_QRCODE (QR_CODE_ID, QR_FUNC, CUST_ID, STORE_ID, ORDER_ID, CREATE_TIME, READ_TIME, STATUS, CREATER_DATA, READER_DATA)
values ('00020160219000000111', 100, '200', '200', '20160219000000', to_timestamp('01-03-2016 18:13:02.014000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 2, null, null);
commit;
prompt 2 records loaded
prompt Loading HS_TR_ROLE...
insert into HS_TR_ROLE (ID, ROLE_NAME_CN, ROLE_NAME_EN, ROLE_STATUS, SYS_TYPE, CREATE_DATE, CREATE_ID, UPDATE_DATE, UPDATE_ID, REMARKS)
values ('s1', '�̻�����Ա', 'COMMERCIAL MANAGER', '1', 'S', to_date('06-01-2016 17:15:36', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('06-01-2016 17:15:36', 'dd-mm-yyyy hh24:mi:ss'), 'admin', null);
insert into HS_TR_ROLE (ID, ROLE_NAME_CN, ROLE_NAME_EN, ROLE_STATUS, SYS_TYPE, CREATE_DATE, CREATE_ID, UPDATE_DATE, UPDATE_ID, REMARKS)
values ('s2', '�̻�����Ա', 'COMMERCIAL OPERATOR', '1', 'S', to_date('06-01-2016 17:15:36', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('06-01-2016 17:15:36', 'dd-mm-yyyy hh24:mi:ss'), 'admin', null);
insert into HS_TR_ROLE (ID, ROLE_NAME_CN, ROLE_NAME_EN, ROLE_STATUS, SYS_TYPE, CREATE_DATE, CREATE_ID, UPDATE_DATE, UPDATE_ID, REMARKS)
values ('s3', '�ŵ����Ա', 'STORE MANAGER', '1', 'S', to_date('06-01-2016 17:15:36', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('06-01-2016 17:15:36', 'dd-mm-yyyy hh24:mi:ss'), 'admin', null);
insert into HS_TR_ROLE (ID, ROLE_NAME_CN, ROLE_NAME_EN, ROLE_STATUS, SYS_TYPE, CREATE_DATE, CREATE_ID, UPDATE_DATE, UPDATE_ID, REMARKS)
values ('s4', '�ŵ����Ա', 'STORE OPERATOR', '1', 'S', to_date('06-01-2016 17:15:36', 'dd-mm-yyyy hh24:mi:ss'), 'admin', to_date('06-01-2016 17:15:36', 'dd-mm-yyyy hh24:mi:ss'), 'admin', null);
commit;
prompt 4 records loaded
prompt Loading HS_TR_ROLE_USER...
prompt Table is empty
prompt Loading HS_TR_SHOPPING_CART...
prompt Table is empty
prompt Loading HS_TR_STORE_DETAIL...
insert into HS_TR_STORE_DETAIL (STORE_ID, MER_ID, STORE_NAME_CN, STORE_NAME_EN, STORE_ADDR_CODE, STORE_LOGO_NAME, STORE_LOGO_URL, BROADTRADE_TYPE, TRADE_TYPE, BUSIDIVISION, STORE_ADDR_CN, STORE_ADDR_EN, LONGITUDE, LATITUDE, STORE_LINKMAN, STORE_MOBILE, SUPPORT_FLAG, STARTING_PRICE, DISTRIBUTION_FEE, AVG_PRICE, BUSITEL1, BUSITEL2, BUSIHOURS, RECOMMEND_INFO_ID, STORE_BRIEFINTRO_CN, STORE_BRIEFINTRO_EN, CLEARING_ACCOUNT1, CLEARING_CURRENCY1, CLEARING_ACCOUNT2, CLEARING_CURRENCY2, CLEARING_ACCOUNT3, CLEARING_CURRENCY3, NATIONCODE, CITYCODE, ADMINDIVISION, QUERY_KEY, VIEW_TIMES, POPULAR, GOOD_TIMES, STAR_LEVEL, MSGSENDED, OPER_FLAG, STORE_STATUS, CLOSED_STATUS, ADD_FEE_FLAG, ADD_FEE_RATE, CREATE_DATE, CREATE_ID, UPDATE_DATE, UPDATE_ID, APPRO_STATUS, EXT1, EXT2, EXT3, EXT4, EXT5, EXT6, EXT7, EXT8, EXT9, EXT10)
values ('200', '1101', '澳門氹仔店', 'mo', 'mo', 'mo', 'mo', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 1, 1, 1, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 1, 1, 1, 1, '1', '1', '1', '1', '1', 1, to_date('23-02-2016', 'dd-mm-yyyy'), '1', to_date('23-02-2016', 'dd-mm-yyyy'), '1', '1', '1', '1', '11', '1', '1', '1', '1', '1', '1', '1');
commit;
prompt 1 records loaded
prompt Loading HS_TR_STORE_RECOMMEND...
prompt Table is empty
prompt Loading HS_TR_STORE_TOKEN_INFO...
insert into HS_TR_STORE_TOKEN_INFO (TOKEN, STORE_USER, PHONE, CREATE_TIME)
values ('yQI3t+qqQ0e+Aje36qpDRw==', 'Tato1', '111', to_timestamp('01-03-2016 10:18:22.877000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into HS_TR_STORE_TOKEN_INFO (TOKEN, STORE_USER, PHONE, CREATE_TIME)
values ('vy7QsqL9QkedLtCyov1CRw==', 'Tony', '111', to_timestamp('01-03-2016 18:12:55.251000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into HS_TR_STORE_TOKEN_INFO (TOKEN, STORE_USER, PHONE, CREATE_TIME)
values ('CuBZ+03JREOO4Fn7TclEQw==', 'Tato2', '111', to_timestamp('01-03-2016 17:12:48.803000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into HS_TR_STORE_TOKEN_INFO (TOKEN, STORE_USER, PHONE, CREATE_TIME)
values ('AXJkCJBhTyGccmQIkGFPIQ==', 'Bobby', '111', to_timestamp('26-02-2016 16:50:17.719000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into HS_TR_STORE_TOKEN_INFO (TOKEN, STORE_USER, PHONE, CREATE_TIME)
values ('1ljFqq66SKu5WMWqrrpIqw==', 'Tato', '111', to_timestamp('01-03-2016 17:27:42.211000', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 5 records loaded
prompt Loading HS_TR_STORE_USER...
insert into HS_TR_STORE_USER (ID, USER_NAME, USER_NAME_ENCRYPT, USER_ALIAS, USER_ALIAS_ENCRYPT, PASS_WORD, EMAIL, PHONE, USER_TYPE, ORG_ID, USER_STATUS, SESSION_ID, FIRST_STATUE, DAY_ERR_SUM, TOTAL_ERR_SUM, ERR_DATE, CREATE_ID, CREATE_DATE, UPDATE_ID, UPDATE_DATE)
values ('Tato', 'Tato', 'Tato', 'Tato', 'Tato', '1', 'Tato', '111', '3', '200', '1', '123', '1', 123, 123, to_date('16-02-2016', 'dd-mm-yyyy'), '123', to_date('16-02-2016', 'dd-mm-yyyy'), '123', to_date('16-02-2016', 'dd-mm-yyyy'));
insert into HS_TR_STORE_USER (ID, USER_NAME, USER_NAME_ENCRYPT, USER_ALIAS, USER_ALIAS_ENCRYPT, PASS_WORD, EMAIL, PHONE, USER_TYPE, ORG_ID, USER_STATUS, SESSION_ID, FIRST_STATUE, DAY_ERR_SUM, TOTAL_ERR_SUM, ERR_DATE, CREATE_ID, CREATE_DATE, UPDATE_ID, UPDATE_DATE)
values ('Vincent', 'Vincent', 'Vincent', 'Vincent', 'Vincent', '1', 'Vincent', '111', '4', '300', '1', '123', '1', 123, 123, to_date('16-02-2016', 'dd-mm-yyyy'), '123', to_date('16-02-2016', 'dd-mm-yyyy'), '123', to_date('16-02-2016', 'dd-mm-yyyy'));
insert into HS_TR_STORE_USER (ID, USER_NAME, USER_NAME_ENCRYPT, USER_ALIAS, USER_ALIAS_ENCRYPT, PASS_WORD, EMAIL, PHONE, USER_TYPE, ORG_ID, USER_STATUS, SESSION_ID, FIRST_STATUE, DAY_ERR_SUM, TOTAL_ERR_SUM, ERR_DATE, CREATE_ID, CREATE_DATE, UPDATE_ID, UPDATE_DATE)
values ('Tony', 'Tony', 'Tony', 'Tony', 'Tony', '1', 'Tony', '111', '3', '200', '1', '123', '1', 123, 123, to_date('16-02-2016', 'dd-mm-yyyy'), '123', to_date('16-02-2016', 'dd-mm-yyyy'), '123', to_date('16-02-2016', 'dd-mm-yyyy'));
insert into HS_TR_STORE_USER (ID, USER_NAME, USER_NAME_ENCRYPT, USER_ALIAS, USER_ALIAS_ENCRYPT, PASS_WORD, EMAIL, PHONE, USER_TYPE, ORG_ID, USER_STATUS, SESSION_ID, FIRST_STATUE, DAY_ERR_SUM, TOTAL_ERR_SUM, ERR_DATE, CREATE_ID, CREATE_DATE, UPDATE_ID, UPDATE_DATE)
values ('Bobby', 'Bobby', 'Bobby', 'Bobby', 'Bobby', '1', 'Bobby', '111', '3', '200', '1', '123', '1', 123, 123, to_date('16-02-2016', 'dd-mm-yyyy'), '123', to_date('16-02-2016', 'dd-mm-yyyy'), '123', to_date('16-02-2016', 'dd-mm-yyyy'));
insert into HS_TR_STORE_USER (ID, USER_NAME, USER_NAME_ENCRYPT, USER_ALIAS, USER_ALIAS_ENCRYPT, PASS_WORD, EMAIL, PHONE, USER_TYPE, ORG_ID, USER_STATUS, SESSION_ID, FIRST_STATUE, DAY_ERR_SUM, TOTAL_ERR_SUM, ERR_DATE, CREATE_ID, CREATE_DATE, UPDATE_ID, UPDATE_DATE)
values ('Tato1', 'Tato', 'Tato', 'Tato', 'Tato', '1', 'Tato', '111', '3', '200', '1', '123', '1', 123, 123, to_date('16-02-2016', 'dd-mm-yyyy'), '123', to_date('16-02-2016', 'dd-mm-yyyy'), '123', to_date('16-02-2016', 'dd-mm-yyyy'));
insert into HS_TR_STORE_USER (ID, USER_NAME, USER_NAME_ENCRYPT, USER_ALIAS, USER_ALIAS_ENCRYPT, PASS_WORD, EMAIL, PHONE, USER_TYPE, ORG_ID, USER_STATUS, SESSION_ID, FIRST_STATUE, DAY_ERR_SUM, TOTAL_ERR_SUM, ERR_DATE, CREATE_ID, CREATE_DATE, UPDATE_ID, UPDATE_DATE)
values ('Tato2', 'Tato', 'Tato', 'Tato', 'Tato', '1', 'Tato', '111', '3', '200', '1', '123', '1', 123, 123, to_date('16-02-2016', 'dd-mm-yyyy'), '123', to_date('16-02-2016', 'dd-mm-yyyy'), '123', to_date('16-02-2016', 'dd-mm-yyyy'));
commit;
prompt 6 records loaded
prompt Loading HS_TR_SUB_ORDER...
prompt Table is empty
prompt Enabling triggers for HS_TH_QRCODE...
alter table HS_TH_QRCODE enable all triggers;
prompt Enabling triggers for HS_TL_LOG...
alter table HS_TL_LOG enable all triggers;
prompt Enabling triggers for HS_TP_BASE_PARAM...
alter table HS_TP_BASE_PARAM enable all triggers;
prompt Enabling triggers for HS_TP_DICT...
alter table HS_TP_DICT enable all triggers;
prompt Enabling triggers for HS_TP_INDUSTRY_LARGE...
alter table HS_TP_INDUSTRY_LARGE enable all triggers;
prompt Enabling triggers for HS_TP_INDUSTRY_SMALL...
alter table HS_TP_INDUSTRY_SMALL enable all triggers;
prompt Enabling triggers for HS_TP_VERSION_CONTROL...
alter table HS_TP_VERSION_CONTROL enable all triggers;
prompt Enabling triggers for HS_TR_ADVERT_INFO...
alter table HS_TR_ADVERT_INFO enable all triggers;
prompt Enabling triggers for HS_TR_AUDIT...
alter table HS_TR_AUDIT enable all triggers;
prompt Enabling triggers for HS_TR_AUDIT_FLOW_INST...
alter table HS_TR_AUDIT_FLOW_INST enable all triggers;
prompt Enabling triggers for HS_TR_AUDIT_RESULT...
alter table HS_TR_AUDIT_RESULT enable all triggers;
prompt Enabling triggers for HS_TR_BANK_USER...
alter table HS_TR_BANK_USER enable all triggers;
prompt Enabling triggers for HS_TR_BASE_IMG...
alter table HS_TR_BASE_IMG enable all triggers;
prompt Enabling triggers for HS_TR_COMMUNITY...
alter table HS_TR_COMMUNITY enable all triggers;
prompt Enabling triggers for HS_TR_CUST_CARD...
alter table HS_TR_CUST_CARD enable all triggers;
prompt Enabling triggers for HS_TR_CUST_COLLECT...
alter table HS_TR_CUST_COLLECT enable all triggers;
prompt Enabling triggers for HS_TR_CUST_INFO...
alter table HS_TR_CUST_INFO enable all triggers;
prompt Enabling triggers for HS_TR_DELIVERY...
alter table HS_TR_DELIVERY enable all triggers;
prompt Enabling triggers for HS_TR_DELIVERY_ADDR...
alter table HS_TR_DELIVERY_ADDR enable all triggers;
prompt Enabling triggers for HS_TR_DELIVER_COUNT...
alter table HS_TR_DELIVER_COUNT enable all triggers;
prompt Enabling triggers for HS_TR_DELIVER_RECORD...
alter table HS_TR_DELIVER_RECORD enable all triggers;
prompt Enabling triggers for HS_TR_DISCOUNT...
alter table HS_TR_DISCOUNT enable all triggers;
prompt Enabling triggers for HS_TR_DISCOUNT_CARD_REL...
alter table HS_TR_DISCOUNT_CARD_REL enable all triggers;
prompt Enabling triggers for HS_TR_DISCOUNT_GOODS_REL...
alter table HS_TR_DISCOUNT_GOODS_REL enable all triggers;
prompt Enabling triggers for HS_TR_DISCOUNT_GROUP_REL...
alter table HS_TR_DISCOUNT_GROUP_REL enable all triggers;
prompt Enabling triggers for HS_TR_DISCOUNT_STORE_REL...
alter table HS_TR_DISCOUNT_STORE_REL enable all triggers;
prompt Enabling triggers for HS_TR_GOODS...
alter table HS_TR_GOODS enable all triggers;
prompt Enabling triggers for HS_TR_GOODS_ATTACH_REL...
alter table HS_TR_GOODS_ATTACH_REL enable all triggers;
prompt Enabling triggers for HS_TR_GOODS_CLASSIFICATION...
alter table HS_TR_GOODS_CLASSIFICATION enable all triggers;
prompt Enabling triggers for HS_TR_GOODS_GROUP_REL...
alter table HS_TR_GOODS_GROUP_REL enable all triggers;
prompt Enabling triggers for HS_TR_HEADSTORE_DETAIL...
alter table HS_TR_HEADSTORE_DETAIL enable all triggers;
prompt Enabling triggers for HS_TR_IDENTITY_CODE...
alter table HS_TR_IDENTITY_CODE enable all triggers;
prompt Enabling triggers for HS_TR_MASTER_ORDER...
alter table HS_TR_MASTER_ORDER enable all triggers;
prompt Enabling triggers for HS_TR_MASTER_ORDER_BCK...
alter table HS_TR_MASTER_ORDER_BCK enable all triggers;
prompt Enabling triggers for HS_TR_MENU...
alter table HS_TR_MENU enable all triggers;
prompt Enabling triggers for HS_TR_MENU_ROLE...
alter table HS_TR_MENU_ROLE enable all triggers;
prompt Enabling triggers for HS_TR_MESSAGE...
alter table HS_TR_MESSAGE enable all triggers;
prompt Enabling triggers for HS_TR_ORDER_DIS_REL...
alter table HS_TR_ORDER_DIS_REL enable all triggers;
prompt Enabling triggers for HS_TR_ORDER_FLOW...
alter table HS_TR_ORDER_FLOW enable all triggers;
prompt Enabling triggers for HS_TR_PAY_INFO...
alter table HS_TR_PAY_INFO enable all triggers;
prompt Enabling triggers for HS_TR_PAY_RESULT...
alter table HS_TR_PAY_RESULT enable all triggers;
prompt Enabling triggers for HS_TR_QRCODE...
alter table HS_TR_QRCODE enable all triggers;
prompt Enabling triggers for HS_TR_ROLE...
alter table HS_TR_ROLE enable all triggers;
prompt Enabling triggers for HS_TR_ROLE_USER...
alter table HS_TR_ROLE_USER enable all triggers;
prompt Enabling triggers for HS_TR_SHOPPING_CART...
alter table HS_TR_SHOPPING_CART enable all triggers;
prompt Enabling triggers for HS_TR_STORE_DETAIL...
alter table HS_TR_STORE_DETAIL enable all triggers;
prompt Enabling triggers for HS_TR_STORE_RECOMMEND...
alter table HS_TR_STORE_RECOMMEND enable all triggers;
prompt Enabling triggers for HS_TR_STORE_TOKEN_INFO...
alter table HS_TR_STORE_TOKEN_INFO enable all triggers;
prompt Enabling triggers for HS_TR_STORE_USER...
alter table HS_TR_STORE_USER enable all triggers;
prompt Enabling triggers for HS_TR_SUB_ORDER...
alter table HS_TR_SUB_ORDER enable all triggers;
set feedback on
set define on
prompt Done.
