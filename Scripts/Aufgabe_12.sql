create or replace
algorithm = UNDEFINED view `vbzdat`.`aufgabe_12` as
select
    `a`.`fahrt_id` as `fahrt_id`,
    date_format(`a`.`datumzeit_soll_ab`, '%H:%i:%s') as `datum`,
    `l`.`linie` as `linie`
from
    (`vbzdat`.`ankunftszeiten` `a`
join `vbzdat`.`linie` `l` on
    ((`a`.`fahrweg_id` = `l`.`fahrweg_id`)))
order by
    `a`.`delay`