-- a)
drop table if exists person;
drop table if exists car;
drop table if exists toll_booth;
drop table if exists passes;

-- Tabell med personopplysninger:
--    Valgte aa lage egen tabell til dette i steden for aa ha det i car tabellen
create table person (
    id integer primary key,
    first_name varchar not null,
    last_name varchar not null,
    adress varchar unique,
    email varchar unique,
    phone_number integer unique
);

-- Tabell med bilopplysninger:
--     Refererer til person tabellen
create table car (
    id integer primary key,
    license varchar,
    owner_id integer not null,
    constraint ownerFK foreign key (owner_id) references person (id)
);

-- Tabell med bomopplysninger:
--     Valgte aa opprette en egen tabell til dette i steden for aa ha den i passes tabellen
create table toll_booth (
    id integer primary key,
    loc varchar not null
);

-- Tabell med alle passeringer: 
--     Refererer til car tabellen
--     Refererer til toll_booth tabellen
create table passes (
    id integer primary key,
    time_stamp timestamp not null,
    toll_booth_id integer not null,
    car_id integer not null,
    constraint toll_boothFK foreign key (toll_booth_id) references toll_booth (id),
    constraint carFK foreign key (car_id) references car (id)
);