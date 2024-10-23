 -- 인원 검증 
 create or replace trigger EnterPesonVerification
 before
 insert on person
 for each row
 declare
    not_possible_age exception;
    invalid_id_form exception;
    id_length number;
    id_front number;
    id_back number;
 begin
  id_length := length(:new.p_id);
  id_front :=  to_number(substr(:new.p_id,1,6));
  id_back := to_number(substr(:new.p_id,8));
  if id_length <> 14 and id_front<>null and id_back<>null  then
     raise invalid_id_form;
  elsif(:new.p_age < 1) then
    raise not_possible_age;
  end if;
  
  exception
    when VALUE_ERROR then
        RAISE_APPLICATION_ERROR(-20003,'잘못된 주민번호 형식입니다.');
    when invalid_id_form then
        RAISE_APPLICATION_ERROR(-20001,'잘못된 주민번호 형식입니다.');
    when not_possible_age then
        RAISE_APPLICATION_ERROR(-20002,'나이는 O살 또는 음수입력 또는 문자 입력이 불가능합니다.');    
end;