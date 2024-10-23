 -- 접종인원 등록 
 create or replace procedure EnterPerson(p_id in varchar,p_name in varchar,p_age in number,result out varchar)
 is
 begin
    result := '';
    insert into person values(p_id,p_name,p_age);
    result := '정상 등록되었습니다.';
    dbms_output.put_line(result);
end;
