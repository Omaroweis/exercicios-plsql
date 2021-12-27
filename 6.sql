--exercicio 6
-- procedure que altere dados da tabela cliente

create or replace procedure atualiza_cliente
(p_codigo in tbl_clientes.codcliente%type)
is
begin
update tbl_clientes set nome = 'Omar Lopes' where codcliente = p_codigo;
end;

execute atualiza_cliente(12);

select * from tbl_clientes;
