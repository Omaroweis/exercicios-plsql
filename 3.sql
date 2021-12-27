 create or replace function validaPrimeiroDigito(p_cpf in varchar, p_verificador varchar) return number
 is
    v_cpf_numeral number;
    v_aux number;
    v_resposta number;
    v_somatoria number;
 begin
    v_somatoria := 0;
    v_aux := 10;
    
    
    for i in 1..9 loop
        v_cpf_numeral := to_number(substr(p_cpf, i,1));
        v_resposta := v_cpf_numeral*v_aux;
        v_aux := v_aux -1;
        v_somatoria := v_somatoria + v_resposta;
     end loop;
     v_somatoria := v_somatoria *10;
     v_somatoria := mod(v_somatoria, 11);
     if (v_somatoria = p_verificador ) or (v_somatoria = 10)then
        return 1;
    end if;
    return 0;
        
 end;
 
 
 create or replace function validaSegundodigito(p_cpf in varchar, p_verificador in varchar) return number
 is
    v_cpf_numeral number;
    v_aux number;
    v_resposta number;
    v_somatoria number;
 begin
    v_somatoria := 0;
    v_aux := 11;
    
    
    for i in 1..10 loop
        v_cpf_numeral := to_number(substr(p_cpf, i,1));
        v_resposta := v_cpf_numeral*v_aux;
        v_aux := v_aux -1;
        v_somatoria := v_somatoria + v_resposta;
     end loop;
     v_somatoria := v_somatoria *10;
     v_somatoria := mod(v_somatoria, 11);
     if (v_somatoria = p_verificador ) or (v_somatoria = 10)then
        return 1;
    end if;
    return 0;
        
 end;
 
 create or replace function validaCPF(p_cpf in varchar) return number
 is
 
 v_aux varchar(12);
 v_flag number;
 begin
  v_aux := substr(p_cpf, 1, 9);
  
    V_FLAG := validaPrimeiroDigito(v_aux, substr(p_cpf, 10,1));

  -- se a primeira validação falhar nem adianta continuar
  if v_flag = 0 then
    return 0;
end if;
 -- a primeira validacao deu certo
 v_aux := substr(p_cpf, 1, 10);
 V_flag := validaSegundoDigito(v_aux, substr(p_cpf, 11,1));
 
 return v_flag;
 end;
 
 
 
 variable teste number;
execute :teste := validaCpf('insere CPF');

print teste;
