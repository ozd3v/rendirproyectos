

CREATE OR REPLACE FUNCTION sec_persona_ins(user_id bigint, rut bigint, digito_verificador integer, 
			   pais bigint, nombre1 character, nombre2 character, apellido1 character,
			   apellido2 character, direccion text)
  RETURNS bigint AS
$BODY$DECLARE passed bigint;
        BEGIN
		INSERT INTO persona(
			id, user_id, rut, digito_verificador, pais, nombre1, nombre2, 
			apellido1, apellido2, direccion)
		VALUES (DEFAULT,user_id,rut,digito_verificador,pais,nombre1,nombre2,apellido1,apellido2,direccion) RETURNING id into passed;
		RETURN passed;
	EXCEPTION 
		WHEN unique_violation THEN
		passed := -1;
		RETURN passed;
		
		WHEN OTHERS  THEN
		passed := 0;
		RETURN passed;		
		

        END;$BODY$
  LANGUAGE plpgsql VOLATILE SECURITY DEFINER;
ALTER FUNCTION sec_persona_ins(bigint,bigint,integer,bigint,character,character,character,character,text)
  OWNER TO secuser;

