-- exercicio 9
-- procedure que devolva uma ou mais itens pela venda


create or replace procedure obterItensPelaVenda(p_codvenda in tbl_vendas.codvenda%type,  cur out sys_refcursor)
is
begin
 open cur for 
 select * from tbl_itens_vendas iv
 where iv.codvenda = p_codvenda;
end;

-- testando

declare
cur sys_refcursor;

coditemvenda tbl_itens_vendas.coditemvenda%type;
codvenda tbl_itens_vendas.codvenda%type;
codprod tbl_itens_vendas.codprod%type;
quantidade tbl_itens_vendas.quantidade%type;
valorUnitario tbl_itens_vendas.valorunitario%type;
begin
    obterItensPelaVenda(10, cur);
    loop
        
        fetch cur into coditemvenda, codvenda, codprod, quantidade, valorunitario;
        EXIT WHEN cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(coditemvenda|| '     ' || codvenda || '          ' || quantidade || '          ' || valorunitario);
        end loop;
        close cur;
end;
