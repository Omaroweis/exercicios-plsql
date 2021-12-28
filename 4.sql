--exercicio 4
-- valida cnpj
set serveroutput on;
create or replace function validador(p_cnpj varchar, p_verificador varchar, p_aux number) return number
is
    aux number;
    cnpj_numeral number;
    soma number;
begin 
    aux := p_aux;
    soma := 0;
    for i in 1 .. (aux-1) loop
        cnpj_numeral := to_number(substr(p_cnpj, i, 1));
        soma := soma + (cnpj_numeral * aux);
        --DBMS_OUTPUT.PUT_LINE(soma);
        aux:= aux -1;
    end loop;
    aux := 9;
    for i in p_aux .. p_aux+7 loop
        cnpj_numeral := to_number(substr(p_cnpj, i, 1));
        soma := soma + (cnpj_numeral * aux);
        aux := aux -1;
        --DBMS_OUTPUT.PUT_LINE(soma);
    end loop;
    
    soma := mod(soma, 11);
    if soma <2 then soma:=0;
    else soma:= 11-soma;
    end if;
    
    if soma = to_number(p_verificador) then return 1;
    else return 0;
    end if;
    
end;

create or replace function validarCNPJ(p_cnpj varchar) return number
is
    primeiro number;
    segundo number;
begin 
    primeiro := validador(p_cnpj, substr(p_cnpj, 13, 1), 5);
    segundo := validador(p_cnpj, substr(p_cnpj, 14, 1), 6);
    if primeiro = 1 and segundo = 1 then
        return 1;
    end if;
    return 0;
end;

variable teste number;

execute :teste := validarCNPJ('INSIRA CNPJ');

print teste;
