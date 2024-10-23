 drop table person cascade constraints;
 drop table hospital cascade constraints; 
 drop table pharmacy cascade constraints;
 drop table c_stock cascade constraints;
 drop table h_stock cascade constraints;
 drop table p_stock cascade constraints;
 drop table company cascade constraints;
 drop table medicine cascade constraints;
 
 -- 접종 테이블
 drop table inoculation cascade constraints;
 -- 공급 테이블
 drop table supply cascade constraints;
 
 create table person(
    p_id varchar2(20) not null,
    p_name varchar2(10) not null,
    p_age number not null,
    constraint person_pk primary key(p_id),
    constraint p_age_chk check(p_age >= 1)
 );
 
 create table hospital(
    h_id varchar2(20) not null,
    h_name varchar2(15) not null,
    h_telNum varchar(15) not null,
    ph_id varchar(20) not null,
    constraint h_pk primary key(h_id)
    
);
alter table hospital add constraint h_ph_fk foreign key (ph_id) references pharmacy(ph_id);
create table pharmacy(
    ph_id varchar(20) not null,
    h_hospital varchar2(20) not null,
    constraint ph_pk primary key(ph_id)
);
alter table pharmacy add constraint ph_h_id_fk foreign key(h_hospital) references hospital(h_id);

create table company(
    c_id varchar2(20) not null,
    c_name varchar(15) not null,
    constraint com_pk primary key(c_id) 
);


create table medicine(
    m_lotNo varchar2(20) not null,
    m_name varchar2(20) not null,
    m_target varchar(20) not null,
    m_max_inculate number not null,
    m_c_id varchar2(20) not null,
    constraint m_pk primary key(m_lotNo),
    constraint m_c_id_fk foreign key (m_c_id) references company(c_id)
);

create table c_stock(
    c_id varchar2(20) not null,
    c_medicine varchar(30),
    c_medi_stock number,
    c_annual_production number,
    constraint co_c_id_fk foreign key(c_id) references company(c_id),
    constraint c_medi_stock_chk check(c_medi_stock >= 0),
    constraint c_annual_production check(c_annual_production >= 0)
);

create table h_stock(
    h_id varchar2(20) not null,
    h_medicine varchar(30),
    h_medi_stock number,
    constraint h_h_id_fk foreign key(h_id) references hospital(h_id),
    constraint h_medi_stock_chk check(h_medi_stock >= 0)
);

create table p_stock(
    ph_id varchar(20) not null,
    ph_medicine varchar2(20),
    ph_target varchar(20),
    constraint ph_ph_id_fk foreign key(ph_id) references pharmacy(ph_id)
);

create table supply(
    h_id varchar(20) not null,
    c_id varchar(20) not null,
    s_date date not null,
    s_name varchar(20) not null,
    s_cnt number,
    constraint supply_pk primary key(h_id, c_id),
    constraint s_h_id_fk foreign key(h_id) references hospital(h_id),
    constraint s_c_id_fk foreign key(c_id) references company(c_id),
    constraint s_cnt_chk check(s_cnt >=0)
);

create table inoculation(
    p_id varchar2(20) not null,
    h_id varchar(20) not null,
    i_cnt number,
    i_date date not null,
    i_medicine varchar2(30) not null,
    constraint i_pk primary key(p_id, h_id),
    constraint i_h_id_fk foreign key(h_id) references hospital(h_id),
    constraint i_p_id_fk foreign key(p_id) references person(p_id),
    constraint i_cnt_chk check(i_cnt >=0)
);

insert into hospital values('h-1000','정내과','02-1111-1111','ph-1110');
insert into hospital values('h-1001','강내과','02-1112-1234','ph-1111');
insert into hospital values('h-1002','성종합병원','031-1112-2311','ph-1112');
insert into hospital values('h-1003','길의원','031-1123-4443','ph-1113');
insert into hospital values('h-1004','나눔의원','032-1345-2512','ph-1114');
insert into hospital values('h-2000','명품의원','02-5124-2341','ph-2110');
insert into hospital values('h-2001','안종합병원','02-5958-2930','ph-2111');

insert into pharmacy values('ph-1110','h-1000');
insert into pharmacy values('ph-1111','h-1001');
insert into pharmacy values('ph-1112','h-1002');
insert into pharmacy values('ph-1113','h-1003');
insert into pharmacy values('ph-1114','h-1004');
insert into pharmacy values('ph-2110','h-2000');
insert into pharmacy values('ph-2111','h-2001');

insert into p_stock values('ph-1110','타이레놀','해열');
insert into p_stock values('ph-1110','타이레놀','진통');
insert into p_stock values('ph-1110','게보린','해열');
insert into p_stock values('ph-1110','게보린','진통');
insert into p_stock values('ph-1110','부루펜','소염');
insert into p_stock values('ph-1111','타이레놀','해열');
insert into p_stock values('ph-1111','타이레놀','진통');
insert into p_stock values('ph-1111','게보린','해열');
insert into p_stock values('ph-1111','서스펜','진통');
insert into p_stock values('ph-1111','부루펜','소염');
insert into p_stock values('ph-1112','타이레놀','해열');
insert into p_stock values('ph-1112','타세놀','진통');
insert into p_stock values('ph-1112','서스펜','해열');
insert into p_stock values('ph-1112','게보린','진통');
insert into p_stock values('ph-1112','부루펜','소염');
insert into p_stock values('ph-1113','타이레놀','해열');
insert into p_stock values('ph-1113','타이레놀','진통');
insert into p_stock values('ph-1113','게보린','해열');
insert into p_stock values('ph-1113','게보린','진통');
insert into p_stock values('ph-1113','부루펜','소염');
insert into p_stock values('ph-2110','서스펜','해열');
insert into p_stock values('ph-2110','타이레놀','진통');
insert into p_stock values('ph-2110','게보린','해열');
insert into p_stock values('ph-2110','게보린','진통');
insert into p_stock values('ph-2110','부루펜','소염');
insert into p_stock values('ph-2111','타이레놀','해열');
insert into p_stock values('ph-2111','서스펜','진통');
insert into p_stock values('ph-2111','게보린','해열');
insert into p_stock values('ph-2111','타세놀','진통');
insert into p_stock values('ph-2111','부루펜','소염');

insert into medicine values('lot-1111','phizer','코로나19',3,'c-1111');
insert into medicine values('lot-1112','dSteal','파상풍',1,'c-1111');
insert into medicine values('lot-1113','Hcough','독감',1,'c-1111');
insert into medicine values('lot-1114','dSteal','파상풍',1,'c-1112');
insert into medicine values('lot-1115','Hcough','독감',1,'c-1112');
insert into medicine values('lot-1116','Hcough','독감',1,'c-1113');
insert into medicine values('lot-1117','janssen','코로나19',2,'c-1113');
insert into medicine values('lot-1118','janssen','코로나19',2,'c-1114');
insert into medicine values('lot-1119','liver','b형간염',3,'c-1114');
insert into medicine values('lot-1120','liver','b형간염',3,'c-1115');
insert into medicine values('lot-1121','moski','일본뇌염',1,'c-1115');


insert into company values('c-1111','굿제약회사');
insert into company values('c-1112','최강제약');
insert into company values('c-1113','만능제약');
insert into company values('c-1114','KK제약');
insert into company values('c-1115','KG제약');

insert into c_stock values('c-1111','phizer',3000,1000);
insert into c_stock values('c-1111','dSteal',2500,5000);
insert into c_stock values('c-1111','Hcough',0,500);
insert into c_stock values('c-1112','dSteal',300,1000);
insert into c_stock values('c-1112','Hcough',1500,5000);
insert into c_stock values('c-1113','Hcough',3000,100);
insert into c_stock values('c-1113','janssen',0,500);
insert into c_stock values('c-1113','liver',900,1000);
insert into c_stock values('c-1114','janssen',1100,2500);
insert into c_stock values('c-1114','liver',2500,3000);
insert into c_stock values('c-1115','liver',4400,1000);
insert into c_stock values('c-1115','moski',500,1500);


insert into h_stock values('h-1000','phizer',100);
insert into h_stock values('h-1000''moski',500);
insert into h_stock values('h-1000','liver',300);
insert into h_stock values('h-1001','janssen',50);
insert into h_stock values('h-1001','moski',30);
insert into h_stock values('h-1001','dSteal',100);
insert into h_stock values('h-1002','Hcough',500);
insert into h_stock values('h-1002','phizer',100);
insert into h_stock values('h-1002','janssen',60);
insert into h_stock values('h-1003','Hcough',500);
insert into h_stock values('h-1003','moski',100);
insert into h_stock values('h-1003','liver',200);
insert into h_stock values('h-1004','janssen',300);
insert into h_stock values('h-1004','dSteal',150);
insert into h_stock values('h-1004','phizer',0);
insert into h_stock values('h-2000','Hcough',30);
insert into h_stock values('h-2000','janssen',250);
insert into h_stock values('h-2000','liver',200);
insert into h_stock values('h-2001','moski',100);
insert into h_stock values('h-2001','phizer',150);
insert into h_stock values('h-2001','Hcough',300);

commit;





