CREATE TABLE sec.pais
(
   id bigserial NOT NULL, 
   nombre_comun character varying(100) NOT NULL, 
   nombre_iso character varying(100) NOT NULL, 
   codigo_alfa2 character varying(3) NOT NULL, 
   codigo_alfa3 character varying(4) NOT NULL, 
   codigo_numerico integer NOT NULL, 
   observaciones text, 
   CONSTRAINT id PRIMARY KEY (id)
) 
WITH (
  OIDS = FALSE
)
;
ALTER TABLE sec.pais
  OWNER TO secuser;
COMMENT ON COLUMN sec.pais.nombre_comun IS ' ISO 3166-1';
