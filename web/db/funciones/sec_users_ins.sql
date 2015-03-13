-- Function: sec_users_ins(character, character, boolean, character)

-- DROP FUNCTION sec_users_ins(character, character, boolean, character);

CREATE OR REPLACE FUNCTION sec_users_ins(username character, password character, enabled boolean, email character)
  RETURNS bigint AS
$BODY$DECLARE passed bigint;
        BEGIN
		INSERT INTO users(id, username, password, enabled, email, fecha_crea)
		VALUES (DEFAULT,username,password,enabled,email,now()) RETURNING id into passed;
		RETURN passed;
	EXCEPTION 
		WHEN unique_violation THEN
		passed := -1;
		RETURN passed;
		
		WHEN OTHERS  THEN
		passed := 0;
		RETURN passed;		
		

        END;$BODY$
  LANGUAGE plpgsql VOLATILE SECURITY DEFINER
  COST 100;
ALTER FUNCTION sec_users_ins(character, character, boolean, character)
  OWNER TO secuser;

