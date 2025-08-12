SELECT
    *
from
    country
where
    code = 'AFG';

DELETE FROM
    country
WHERE
    code = 'AFG';

select
    *
from
    city
where
    countrycode = 'AFG';

drop table city;

drop table country;

drop table countrylanguage;

SELECT
    DISTINCT continent
from
    country;

insert INTO
    continent (name)
SELECT
    DISTINCT continent
from
    country
order by
    continent ASC;

select
    *
from
    continent;

TRUNCATE table continent;

SELECT
    column_default
FROM
    information_schema.columns
WHERE
    table_name = 'continent'
    AND column_name = 'code';

ALTER SEQUENCE continent_code_seq RESTART WITH 1;

-- Table Definition
CREATE TABLE "public"."country_bk" (
    "code" bpchar (3) NOT NULL,
    "name" text NOT NULL,
    "continent" text NOT NULL,
    "region" text NOT NULL,
    "surfacearea" float4 NOT NULL,
    "indepyear" int2,
    "population" int4 NOT NULL,
    "lifeexpectancy" float4,
    "gnp" numeric(10, 2),
    "gnpold" numeric(10, 2),
    "localname" text NOT NULL,
    "governmentform" text NOT NULL,
    "headofstate" text,
    "capital" int4,
    "code2" bpchar (2) NOT NULL,
    PRIMARY KEY ("code")
);

insert into
    "public".country_bk
SELECT
    *
FROM
    "public".country;

SELECT
    *
FROM
    "public".country_bk;

ALTER TABLE
    country DROP CONSTRAINT country_continent_check;

SELECT
    c.name,
    c.continent,
    (
        SELECT
            ct."code"
        from
            continent ct
        where
            ct."name" = c.continent
    )
FROM
    public.country c;

UPDATE
    country c
SET
    continent = (
        SELECT
            ct."code"
        from
            continent ct
        where
            ct."name" = c.continent
    );

select
    *
from
    country;

ALTER TABLE
    country
ALTER COLUMN
    continent TYPE int4 USING continent :: integer;