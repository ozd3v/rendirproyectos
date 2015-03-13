-- Function: sec_users_upd_enabled(bigint, character, boolean)

-- DROP FUNCTION sec_users_upd_enabled(bigint, character, boolean);

CREATE OR REPLACE FUNCTION sec_users_upd_enabled(par_id bigint, par_username character, par_enabled boolean)
  RETURNS boolean AS
$BODY$
DECLARE passed boolean;
        BEGIN
		passed := false;
		--RAISE NOTICE 'notice %', passed; 
		--RAISE NOTICE 'par_username %', par_username; 
		IF par_id > 0 THEN
			UPDATE users
			SET enabled=par_enabled, fecha_mod = now()
			WHERE users.id = par_id;
			passed := FOUND;			
		ELSIF  ((char_length(par_username) > 0) AND (passed = false)) THEN				
			UPDATE users
			SET enabled=par_enabled, fecha_mod = now()
			WHERE users.username = par_username;
			passed := FOUND;		
		END IF;
		RETURN passed;

        END;$BODY$
  LANGUAGE plpgsql VOLATILE SECURITY DEFINER
  COST 100;
ALTER FUNCTION sec_users_upd_enabled(bigint, character, boolean)
  OWNER TO secuser;

