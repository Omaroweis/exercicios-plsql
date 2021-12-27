-- exercicio 7 -> recebe 'd' para dominuir e 'a' para aumentar.
-- procedure que altere um saldo de credito da tabela de clientes, somando ou subtraindo
--alter table tbl_clientes add credito float;
create or replace procedure altera_credito
(p_codigo in tbl_clientes.codcliente%type, p_valor float, p_operacao varchar, eh_possivel out number)
is 
valor float;

begin
    select credito into valor from tbl_clientes where codcliente = p_codigo;
    if upper(p_operacao) = 'D' then
        if((valor - p_valor) > 0) then
            update tbl_clientes set credito = valor - p_valor;
            eh_possivel := 1;
            else
                eh_possivel := 0;
        end if;
    elsif upper(p_operacao) = 'A' then
        select credito into valor from tbl_clientes where codcliente = p_codigo;
        update tbl_clientes set credito = valor + p_valor;
        eh_possivel := 1;
        else
            eh_possivel := 0;
    end if; 
end;

declare
    eh_possivel number;
begin
    altera_credito(12, 16, 'a', eh_possivel);
end;

select credito from tbl_clientes;

select * from tbl_vendas;
