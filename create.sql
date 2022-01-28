-----------------------------------
-- Create fresh tables ------------
-----------------------------------

DROP TABLE IF EXISTS person CASCADE;
DROP TABLE IF EXISTS car CASCADE;
DROP TABLE IF EXISTS toll_booth CASCADE;
DROP TABLE IF EXISTS passing CASCADE;

CREATE TABLE person (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  address VARCHAR NOT NULL,
  email VARCHAR NOT NULL,
  phone INTEGER NOT NULL
);

CREATE TABLE car (
  license_plate VARCHAR PRIMARY KEY,
  owner_id INTEGER NOT NULL,
  FOREIGN KEY (owner_id)
    REFERENCES person (id)
    ON DELETE CASCADE
);

CREATE TABLE toll_booth (
  id SERIAL PRIMARY KEY,
  location VARCHAR NOT NULL
);

CREATE TABLE passing (
  id SERIAL PRIMARY KEY,
  time TIMESTAMP NOT NULL,
  car_license_plate VARCHAR,
  toll_booth_id INTEGER NOT NULL,
  FOREIGN KEY (car_license_plate)
    REFERENCES car (license_plate)
    ON DELETE CASCADE,
  FOREIGN KEY (toll_booth_id)
    REFERENCES toll_booth (id)
    ON DELETE CASCADE
);

-----------------------------------
-- Insert test data ---------------
-----------------------------------

INSERT INTO person (name, address, email, phone)
VALUES  ('Test Testesen',  'Testegata 1',    'test.testesen@test.com',  12345678),
        ('Ola Nordmann',   'Norskegata 17',  'ola.nordmann@norge.no',   17051814),
        ('Kari Nordmann',  'Norskegata 17',  'kari.nordmann@norge.no',  87654321),
        ('Ivar Aasen',     'Ørsta',          'ivar.aasen@nynorsk.no',   99999999);

INSERT INTO car (license_plate, owner_id)
VALUES  ('UC12345', 1),
        ('TV12345', 2),
        ('VJ12345', 3),
        ('AA10000', 4);

INSERT INTO toll_booth (location)
VALUES  ('Oslo'),
        ('Trondheim'),
        ('Førde'),
        ('Sogndal');

INSERT INTO passing (time, car_license_plate, toll_booth_id)
VALUES  (NOW()::timestamp + interval '1 hours', 'UC12345', 4),
        (NOW()::timestamp + interval '2 hours', 'TV12345', 4),
        (NOW()::timestamp + interval '3 hours', 'VJ12345', 2),
        (NOW()::timestamp + interval '4 hours', 'AA10000', 1),
        (NOW()::timestamp + interval '5 hours', 'AA10000', 2),
        (NOW()::timestamp + interval '5 hours', 'TV12345', 1),
        (NOW()::timestamp + interval '6 hours', 'TV12345', 3),
        (NOW()::timestamp + interval '7 hours', 'TV12345', 2),
        (NOW()::timestamp + interval '8 hours', NULL, 2);
