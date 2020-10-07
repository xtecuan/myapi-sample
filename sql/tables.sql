-- Drop table

-- DROP TABLE public.personas;

CREATE TABLE public.personas (
	id bigserial NOT NULL,
	nombres varchar(25) NULL,
	apellidos varchar(25) NULL,
	email varchar(50) NOT NULL,
	usuario varchar(15) NOT NULL
);

