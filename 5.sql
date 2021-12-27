-- exercicio 5
-- procedure que insere dados na tabela clientes
create or replace procedure inserir_Clientes
(p_ID in tbl_clientes.codcliente%type, p_descricao in tbl_clientes.nome%type, p_dataNAscimento in tbl_clientes.datanascimento%type)
is
begin
insert into tbl_clientes(codcliente, nome, datanascimento) values (p_id, p_descricao, p_datanascimento);
commit;
end;

execute inserir_clientes(12, 'omar', to_date('23/10/1998', 'DD/MM/YYYY'));

select * from tbl_clientes;
