-- Function: sec_users_upd_password(bigint, character, character)

-- DROP FUNCTION sec_users_upd_password(bigint, character, character);

CREATE OR REPLACE FUNCTION sec_users_upd_password(par_id bigint, par_username character, pass character)
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
		ELSIF  ((char_length(par_username) > 0) AND (passed = false)) THEN				
			UPDATE users
			SET password=pass, fecha_mod = now()
			WHERE users.username = par_username;
			passed := FOUND;		
		END IF;
		RETURN passed;

        END;$BODY$
  LANGUAGE plpgsql VOLATILE SECURITY DEFINER
  COST 100;
ALTER FUNCTION sec_users_upd_password(bigint, character, character)
  OWNER TO secuser;

