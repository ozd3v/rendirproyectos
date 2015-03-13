-- Function: sec_users_upd_password(bigint, character, character)

-- DROP FUNCTION sec_users_upd_passwordBymail(bigint, character, character);

CREATE OR REPLACE FUNCTION sec_users_upd_passwordBymail(par_id bigint, par_email character, pass character)
  RETURNS boolean AS
$BODY$
DECLARE passed boolean;
        BEGIN
		passed := false;
		--RAISE NOTICE 'notice %', passed; 
		--RAISE NOTICE 'par_username %', par_username; 
		IF par_id > 0 THEN
			UPDATE users
			SET password=pass, fecha_mod = now()
			WHERE users.id = par_id;
			passed := FOUND;			
		ELSIF  ((char_length(par_email) > 0) AND (passed = false)) THEN				
			UPDATE users
			SET password=pass, fecha_mod = now()
			WHERE users.email = par_email;
			passed := FOUND;		
		END IF;
		RETURN passed;

        END;$BODY$
  LANGUAGE plpgsql VOLATILE SECURITY DEFINER
  COST 100;
ALTER FUNCTION sec_users_upd_passwordBymail(bigint, character, character)
  OWNER TO secuser;

