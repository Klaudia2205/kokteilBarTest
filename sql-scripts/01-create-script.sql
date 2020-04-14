CREATE DATABASE db_koktails
    WITH 
    OWNER = postgres
    TEMPLATE = template0
    ENCODING = 'UTF8'
    LC_COLLATE = 'Slovak_Slovakia.1250'
    LC_CTYPE = 'Slovak_Slovakia.1250'
    CONNECTION LIMIT = -1;
    
    CREATE SCHEMA co
    AUTHORIZATION postgres;
    
    CREATE TABLE co.t_ingrediencie
(
    ingrediencie_id bigserial NOT NULL,
    name character varying(50) NOT NULL,
    PRIMARY KEY (ingrediencie_id)
);

ALTER TABLE co.t_ingrediencie
    OWNER to postgres;
    
    CREATE TABLE co.t_kokteils
(
    kokteil_id bigserial NOT NULL,
    name character varying(50) NOT NULL,
    url character varying(1000) NOT NULL,
    PRIMARY KEY (kokteil_id)
);

ALTER TABLE co.t_kokteils
    OWNER to postgres;
    
    CREATE TABLE co.t_kokteils_x_ingrediencie
(
    ingrediencie_id bigserial NOT NULL,
    kokteil_id bigserial NOT NULL,
    FOREIGN KEY (ingrediencie_id)
        REFERENCES co.t_ingrediencie (ingrediencie_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    FOREIGN KEY (kokteil_id)
        REFERENCES co.t_kokteils (kokteil_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE co.t_kokteils_x_ingrediencie
    OWNER to postgres;
    
    