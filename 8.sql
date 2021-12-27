-- exercicio 8
 -- procedure que cancele uma venda
 
 ----------- modificando a fk de tbl_itens_vendas --------------------
--alter table tbl_itens_vendas
--drop constraint fk_itens_vendas_vendas;
--alter table tbl_itens_vendas
--add constraint fk_itens_vendas_vendas foreign key (codvenda) references TBL_VENDAS(codvenda) on delete cascade;

create or replace procedure cancelar_venda
(p_codvenda in tbl_vendas.codvenda%type)
is
begin
    delete from tbl_vendas v where v.codvenda = p_codvenda; 
end;
-- testando:


--insert into tbl_vendas(codvenda, datavenda, codcliente, valortotal) values(10, to_date('22/10/2021', 'DD/MM/YYYY'), 12, 180);
--
--insert into tbl_produtos(codprod, descricao, unidade) values (30, 'computador', 2);
--
--insert into tbl_itens_vendas(coditemvenda, codvenda, codprod, quantidade, valorunitario) values (20, 10, 30, 2, 3);
--
--select * from tbl_itens_vendas;
--
--execute cancelar_venda(10);
--
--select * from tbl_itens_vendas;
