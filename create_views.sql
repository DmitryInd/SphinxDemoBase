CREATE VIEW management_electric_trains.full_ticket as (
    SELECT y.ticket_id, y.buyer_first_nm, y.buyer_second_nm, y.purchase_dttm,
           x.trip_price_amt, x.departure_type_cd, x.sale_flg as sale_yet_flg,
           z1.station_nm as station_from_nm, z2.station_nm as station_to_nm
    FROM (
         SELECT t1.trip_id, t1.trip_price_amt, t1.departure_type_cd, t1.sale_flg,
                t2.station_id as station_from_id, t3.station_id as station_to_id
         FROM management_electric_trains.TRIP t1
         INNER JOIN management_electric_trains.TRIP_X_STATION t2
         ON t1.trip_id = t2.trip_id and t2.departure_flg = true
         INNER JOIN management_electric_trains.TRIP_X_STATION t3
         ON t3.trip_id = t1.trip_id and t3.departure_flg = false
    ) as x
    INNER JOIN management_electric_trains.TICKET y
    ON x.trip_id = y.trip_id
    INNER JOIN management_electric_trains.STATION z1
    ON x.station_from_id = z1.station_id
    INNER JOIN management_electric_trains.STATION z2
    ON x.station_to_id = z2.station_id
);