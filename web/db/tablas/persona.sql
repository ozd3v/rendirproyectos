CREATE TABLE sec.persona
(
   id bigserial NOT NULL, 
   user_id bigint NOT NULL, 
   rut bigint, 
   digito_verificador integer, 
   pais bigint, 
   nombre1 character varying(100), 
   nombre2 character varying(100), 
   apellido1 character varying(100) NOT NULL, 
   apellido2 character varying(100) NOT NULL, 
   direccion text, 
   CONSTRAINT pk_persona PRIMARY KEY (id)
) 
WITH (
  OIDS = FALSE
)
;
ALTER TABLE sec.persona
  OWNER TO secuser;

