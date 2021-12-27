 -- ATIVIDADE 01
 -- criar uma function para validas se um parametro enviado é par ou impar
-- retorna 0 para false e 1 para true
create or replace function ehPar(P_numero in number) return number
is
begin
    if mod(p_numero, 2) = 0 then
    return 1;
    end if;
    return 0;
end;
-- testando
variable v_numero number;
execute :v_numero := ehpar(5);

print v_numero;
