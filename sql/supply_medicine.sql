create or replace procedure supply_medicine(h_id in varchar, co_id in varchar, s_date in date, s_name in varchar, s_cnt in number, result out varchar)
is 
    annual_product number;
    cnt number;
begin
    result := '';
    select c_annual_production into annual_product from c_stock where c_id = co_id and c_medicine = s_name;
    if annual_product <= 1000 then
        cnt := s_cnt / 2;
    else
        cnt := s_cnt;
    end if;
    insert into supply values(h_id,co_id,s_date,s_name,cnt);
    result := '정상공급 되었습니다.';
    --commit;
    dbms_output.put_line(result);
end;