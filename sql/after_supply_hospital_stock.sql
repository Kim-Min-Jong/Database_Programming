create or replace trigger after_supply_hospital_stock
after
insert on supply
for each row
declare
    stock_lack exception;
    now_h_medi_stock number;   
begin
    select h_medi_stock into now_h_medi_stock from h_stock where h_id = :new.h_id and h_medicine = :new.s_name;
    
    update h_stock set h_medi_stock = now_h_medi_stock + :new.s_cnt where h_id = :new.h_id and h_medicine = :new.s_name;
end;