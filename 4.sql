create or replace function validacao(p_cnpj varchar2, p_verificador varchar2, p_referencia number) return number
is
cnpj_numeral number;
soma number;
contador number;
i number;
begin
    i := p_referencia;
    soma := 0;
    contador := 1;
    if p_referencia = 5 then
        for j in 1..4 loop
            cnpj_numeral := to_number(substr(p_cnpj, contador,1));
            contador := contador +1;
            soma := soma + (cnpj_numeral * i);
            i := i-1;
        end loop;
    else
         for j in 1..5 loop
            cnpj_numeral := to_number(substr(p_cnpj, contador,1));
            contador := contador +1;
            soma := soma + (cnpj_numeral * i);
            i := i-1;
         end loop;
    i := 9;
    for j in 2 .. 9 loop
        cnpj_numeral := to_number(substr(p_cnpj, contador,1));
        contador := contador +1;
        soma := soma + (cnpj_numeral * i);
        i := i-1;
    end loop;
    soma := mod(soma, 11);
    if soma < 2 then
        soma := 0;
    else
        soma := 11 - soma;
    end if;
    if soma = p_verificador then 
        return soma;
    end if;
    return soma;   
    
end;

create or replace function validacnpj(p_cnpj in varchar2) return number
is
primeiro number;
segundo number;
begin
    primeiro := validacao(p_cnpj, substr(p_cnpj, 13,1), 5);
    segundo := validacao(p_cnpj, substr(p_cnpj, 14,1), 6);
    
    if primeiro =1 and segundo =1 then
        return 1;
    end if;
    return 0;
end;

variable resposta number;

execute :resposta := validacao('53113791000122', '2', 5);

print resposta;
