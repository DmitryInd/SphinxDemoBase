create database management_electric_trains;

DROP TABLE IF EXISTS management_electric_trains.STATION;
create table management_electric_trains.STATION(
  station_id SERIAL PRIMARY KEY,
  station_nm VARCHAR(63) NOT NULL,
  way_cnt INTEGER DEFAULT 0, CHECK (way_cnt >= 0),
  traffic_flow_cnt INTEGER DEFAULT 0, CHECK (traffic_flow_cnt >= 0),
  address_txt VARCHAR(511) NOT NULL,
  repair_dt DATE NOT NULL
);

DROP TABLE IF EXISTS management_electric_trains.TRIP;
create table management_electric_trains.TRIP(
  trip_id SERIAL PRIMARY KEY,
  departure_type_cd VARCHAR(3) CHECK (departure_type_cd IN ('USU', 'EXP', 'AIR')),
  trip_price_amt REAL CHECK (trip_price_amt >= 0),
  sale_flg BOOLEAN NOT NULL
);

DROP TABLE IF EXISTS management_electric_trains.TICKET;
create table management_electric_trains.TICKET(
  ticket_id SERIAL PRIMARY KEY,
  trip_id BIGINT UNSIGNED NOT NULL REFERENCES management_electric_trains.TRIP(trip_id),
  buyer_first_nm VARCHAR(31) NOT NULL,
  buyer_second_nm VARCHAR(31) NOT NULL,
  purchase_dttm TIMESTAMP(0) DEFAULT now(), CHECK (purchase_dttm is NOT NULL)
);

DROP TABLE IF EXISTS management_electric_trains.TRIP_X_STATION;
create table management_electric_trains.TRIP_X_STATION(
  trip_id BIGINT UNSIGNED NOT NULL REFERENCES management_electric_trains.TRIP(trip_id),
  station_id BIGINT UNSIGNED NOT NULL REFERENCES management_electric_trains.STATION(station_id),
  departure_flg BOOLEAN NOT NULL,
  PRIMARY KEY(trip_id, station_id)
);