-- Table: users

-- DROP TABLE users;

CREATE TABLE users
(
  id bigserial NOT NULL,
  username character varying(50) NOT NULL,
  password character varying(50) NOT NULL,
  enabled boolean NOT NULL,
  email character varying(50), -- email de usuario
  fecha_crea timestamp with time zone NOT NULL DEFAULT now(),
  fecha_mod timestamp with time zone,
  CONSTRAINT users_pkey PRIMARY KEY (username),
  CONSTRAINT unique_email UNIQUE (email)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE users
  OWNER TO secuser;
COMMENT ON COLUMN users.email IS 'email de usuario';

