-- Function: sec_users_get_byMail(integer, integer)

-- DROP FUNCTION sec_users_get_byMail(integer, integer);

CREATE OR REPLACE FUNCTION sec_users_get_byMail(par_email character)
  RETURNS TABLE(id bigint, username character varying, enabled boolean, email character varying, fecha_crea text, fecha_mod text) AS
$BODY$
        BEGIN
		RETURN QUERY 
		select users.id, users.username, users.enabled, users.email, 
			to_char(users.fecha_crea,'dd-mm-yyyy hh24:mi:ss') as fecha,
			to_char(users.fecha_mod,'dd-mm-yyyy hh24:mi:ss') as fechamod from users
			where users.email = par_email;
			RETURN;		

        END;$BODY$
  LANGUAGE plpgsql VOLATILE SECURITY DEFINER
ALTER FUNCTION sec_users_get_byMail(character)
  OWNER TO secuser;

