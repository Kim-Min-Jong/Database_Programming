-- 회사 재고 변화 
create or replace trigger before_supply_company_stock
before
insert on supply
for each row
declare
    stock_lack exception;
    now_c_medi_stock c_stock.c_medi_stock%type;
begin
    select c_medi_stock into now_c_medi_stock from c_stock where c_id = :new.c_id and c_medicine = :new.s_name;
    
    if now_c_medi_stock = 0 then
        raise stock_lack;
    end if;
    
    update c_stock set c_medi_stock = now_c_medi_stock - :new.s_cnt where c_id = :new.c_id and c_medicine = :new.s_name;
    
    if now_c_medi_stock - :new.s_cnt <= 500 then
        dbms_output.put_line('경고 재고가 500개 이하입니다.');
    end if;
    exception
        when stock_lack then
            RAISE_APPLICATION_ERROR(-20988, '회사에 재고가 없습니다..');
        when others then
             dbms_output.put_line(SQLERRM);
end;