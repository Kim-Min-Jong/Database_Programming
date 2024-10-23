create or replace procedure SearchMedicine(m_name in varchar, result out varchar, result2 out varchar)
is   
    script varchar(200);
    m_effect p_stock.ph_target%type;
    cursor medi_effect is
        select distinct(ph_target) from p_stock where ph_medicine = m_name; 
begin
    result2 := '';
    result := '검색하신 ' || m_name || '의 효과에는';
    dbms_output.put_line(script);
    for effect_list in medi_effect loop
        result2 := result2 ||(effect_list.ph_target)|| ',';
    end loop;
    result2 := result2  ||'효과가 있습니다.';
end;