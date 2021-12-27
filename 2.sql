-- ATIVIDADE 02
-- function para validas se um parametro é divisivel por 5
-- retorna 1 para true e 0 para false
create or replace function ehDivisivelPor5(p_numero in number) return number
is
begin 
    if mod(p_numero, 5) = 0 then
        return 1;
    end if;
    return 0;
end;
variable v_numero number;
execute :v_numero := ehDivisivelPor5(15);
print v_numero;
