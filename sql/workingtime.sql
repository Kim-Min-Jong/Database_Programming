create or replace trigger workingtime 
before
update or insert
on inoculation
declare
    disable_time exception;
begin
    if (to_number(to_char(SYSDATE,'HH24')) < 9 or to_number(to_char(SYSDATE,'HH24')) > 18) then
        raise disable_time;
     end if;
    exception
        when disable_time then 
            RAISE_APPLICATION_ERROR(-20501,'병원근무시간에만 접종 가능합니다.');
END;