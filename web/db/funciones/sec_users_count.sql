-- Function: sec_users_count()

-- DROP FUNCTION sec_users_count();

CREATE OR REPLACE FUNCTION sec_users_count()
  RETURNS integer AS
$BODY$DECLARE passed integer;
        BEGIN

		select count(id) into passed from users;
		RETURN passed;

        END;$BODY$
  LANGUAGE plpgsql VOLATILE SECURITY DEFINER
  COST 100;
ALTER FUNCTION sec_users_count()
  OWNER TO secuser;

