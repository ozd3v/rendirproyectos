-- Function: sec_users_get_all(integer, integer)

-- DROP FUNCTION sec_users_get_all(integer, integer);

CREATE OR REPLACE FUNCTION sec_users_get_all(IN par_limit integer, IN par_offset integer)
  RETURNS TABLE(id bigint, username character varying, enabled boolean, email character varying, fecha_crea text, fecha_mod text) AS
$BODY$
        BEGIN
		RETURN QUERY 
		select users.id, users.username, users.enabled, users.email, 
			to_char(users.fecha_crea,'dd-mm-yyyy hh24:mi:ss') as fecha,
			to_char(users.fecha_mod,'dd-mm-yyyy hh24:mi:ss') as fechamod from users
			order by users.id
			limit par_limit offset par_offset;
			RETURN;		

        END;$BODY$
  LANGUAGE plpgsql VOLATILE SECURITY DEFINER
  COST 100
  ROWS 1000;
ALTER FUNCTION sec_users_get_all(integer, integer)
  OWNER TO secuser;

