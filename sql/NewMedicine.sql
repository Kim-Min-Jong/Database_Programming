create or replace procedure NewMedicine(ph_id in varchar, m_name in varchar, m_effect in varchar, result out varchar)
is
    not_found_pharmacy exception;
begin
    result :='';
    if ph_id ='ph-1110' or ph_id='ph-1111' or ph_id='ph-1112' or ph_id='ph-1113' or ph_id='ph-2110' or ph_id='ph-2111' then
        insert into p_stock values(ph_id,m_name,m_effect);
        result := '새로운 약 등록되었습니다.';
        dbms_output.put_line(result);
    else
        raise not_found_pharmacy;
    end if;
    
    exception
        when not_found_pharmacy then
            RAISE_APPLICATION_ERROR(-20996,'등록하려는 약국이 존재하지 않습니다.');
        when others then 
            dbms_output.put_line(SQLERRM);
end;