CREATE OR REPLACE FUNCTION sec_persona_update(par_id bigint, par_rut bigint, par_digito_verificador integer,
					      par_pais bigint, par_nombre1 character, par_nombre2 character, par_apellido1 character,
					      par_apellido2 character, direccion text)
  RETURNS boolean AS
$BODY$
DECLARE passed boolean;
        BEGIN
		passed := false;
		--RAISE NOTICE 'notice %', passed; 
		--RAISE NOTICE 'par_username %', par_username; 
		IF par_id > 0 THEN
			UPDATE persona
			SET rut=par_rut, digito_verificador=par_digito_verificador, pais=par_pais,
				nombre1=par_nombre, nombre2=par_nombre, apellido1=par_apellido1, 
				apellido2 = par_apellido2, direccion = par_direccion
			WHERE persona.id = par_id;
			passed := FOUND;	
		END IF;			
		RETURN passed;

        END;$BODY$
        
  LANGUAGE plpgsql VOLATILE SECURITY DEFINER;
ALTER FUNCTION sec_persona_update(bigint, bigint, integer,bigint, character, character, character, character, text)
  OWNER TO secuser;

