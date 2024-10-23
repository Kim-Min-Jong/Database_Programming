-- 약 구매 프로세스 
create or replace procedure BuyingMedicine(symptom in varchar,pha_id in varchar,result1 out varchar2, result2 out varchar, result3 out varchar)
is
    bm_medicine p_stock.ph_medicine%type;
    bm_target p_stock.ph_target%type;
    hospital_id pharmacy.h_hospital%type;
    hos_name hospital.h_name%type;
    cursor search_medi is
         select ph_medicine, ph_target from p_stock where ph_id = pha_id;
begin
   result1 := '';
   result2 := '';
   result3 := '';
   open search_medi;
   loop
        fetch search_medi into bm_medicine, bm_target;
        exit when search_medi%NOTFOUND;
        if substr(symptom,1,1) = substr(bm_target,2,2) then
            result1 := result1 || (symptom ||'증상이 있으시군요 ' || bm_medicine || '을 복용하세요.');
        end if;     
    end loop;
    

    select distinct(pharmacy.h_hospital) into hospital_id from p_stock, pharmacy where p_stock.ph_id = pharmacy.ph_id and p_stock.ph_id = pha_id;
    select h_name into hos_name from hospital where h_id = hospital_id;
    result3 := result1;
    result2 := '복용 후에도 문제가 있을 시 가까운 병원인 ''' || hos_name || '''에 방문하여 주십시오';
    dbms_output.put_line(result1);
    dbms_output.put_line(result2);
   close search_medi;
    exception 
        when NO_DATA_FOUND then
            result1 := '이 약국에는 해당하는 약이 없습니다..';
            dbms_output.put_line(result1); 
end;