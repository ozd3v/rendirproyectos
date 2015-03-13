
-- DROP FUNCTION sec_authorities_ins(character, character);

CREATE OR REPLACE FUNCTION sec_authorities_ins(par_username character, par_role character)
  RETURNS boolean AS
$BODY$
DECLARE passed boolean;
        BEGIN
		INSERT INTO authorities(username, authority)
		VALUES (par_username,par_role);
		passed := FOUND;
		RETURN passed;
	EXCEPTION WHEN OTHERS  THEN
		passed := FOUND;
		RETURN passed;
        END;$BODY$
  LANGUAGE plpgsql VOLATILE SECURITY DEFINER
  COST 100;
ALTER FUNCTION sec_authorities_ins(character, character)
  OWNER TO secuser;

