
create or replace
algorithm = UNDEFINED view `vbzdat`.`task_10` as
select
    `h`.`GPS_Latitude` as `lat`,
    `h`.`GPS_Longitude` as `lng`,
    `h2`.`halt_lang` as `name`,
    '#ff0000' as `color`,
    `a`.`delay` as `note`
from
    (((`vbzdat`.`haltepunkt` `h`
join `vbzdat`.`haltestelle` `h2` on
    ((`h`.`halt_id` = `h2`.`halt_id`)))
join `vbzdat`.`ankunftszeiten` `a` on
    ((`h`.`halt_punkt_id` = `a`.`haltepunkt_id`)))
join `vbzdat`.`linie` `l` on
    ((`a`.`fahrweg_id` = `l`.`fahrweg_id`)))
order by
    `a`.`delay`
limit 20