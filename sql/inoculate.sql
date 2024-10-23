-- 접종 프로세스 
create or replace procedure inoculate(p_id in varchar, ho_id in varchar, i_cnt in number, in_date in date, in_medicine in varchar, result out varchar)
is
    max_inoculate exception;
    stock_lack exception;
    max_cnt number;
    cnt number;
    stock number;
begin
    result := '';
    select h_medi_stock into stock from h_stock where h_id = ho_id and h_medicine = in_medicine;
    if stock = 0 then
        raise stock_lack;
    elsif stock <= 30 then
        result := '경고: 재고가 30개 이하입니다.';
        dbms_output.put_line(result);
    end if;
    select m_max_inculate into max_cnt from medicine where m_name = in_medicine;
    select i_cnt into cnt from inoculation where p_id = p_id and h_id=ho_id and i_medicine=in_medicine;

    if max_cnt > cnt then
        update inoculation set i_cnt = cnt + 1 where p_id=p_id and h_id=ho_id and i_medicine=in_medicine; 
        update inoculation set i_date = in_date where p_id=p_id and h_id=ho_id and i_medicine=in_medicine;
        update h_stock set h_medi_stock = stock - 1 where h_id = ho_id and h_medicine = in_medicine;
        result := '추가 접종 정보 기록되었습니다. 추후 '|| to_char(max_cnt - cnt - 1) ||'회 접종 가능';
        dbms_output.put_line(result);
    else
        raise max_inoculate;
    end if;
    commit;
    exception
        when NO_DATA_FOUND then
            insert into inoculation values(p_id,ho_id,i_cnt,in_date,in_medicine);
            update h_stock set h_medi_stock = stock - 1 where h_id = ho_id and h_medicine = in_medicine;
            result := '새로운 접종 정보 기록되었습니다.';
            dbms_output.put_line(result);
        when max_inoculate then
            RAISE_APPLICATION_ERROR(-20999,'이미 최대 접종횟수에 도달하였습니다.');
        when stock_lack then
            RAISE_APPLICATION_ERROR(-20998,'접종 약품 재고 부족입니다. 공급을 요청하세요');
        when others then
            dbms_output.put_line(SQLERRM);
end; 