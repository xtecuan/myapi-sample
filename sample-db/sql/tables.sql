-- Drop table

-- DROP TABLE public.personas;

CREATE TABLE public.personas (
	id bigserial NOT NULL,
	nombres varchar(25) NULL,
	apellidos varchar(25) NULL,
	email varchar(50) NOT NULL,
	usuario varchar(15) NOT NULL,
	nota float8 NULL
);

-- Permissions
ALTER TABLE public.personas ADD CONSTRAINT personas_pk PRIMARY KEY (id);
ALTER TABLE public.personas OWNER TO sample;
GRANT ALL ON TABLE public.personas TO sample;
GRANT ALL ON TABLE personas TO sample;
GRANT ALL ON SEQUENCE public.personas_id_seq TO sample;
