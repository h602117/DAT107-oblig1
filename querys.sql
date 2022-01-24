-- b)
select 
    k.id, k.time_stamp, k.toll_booth_id, t.loc, k.car_id, c.license,
    c.owner_id, p.first_name, p.last_name, p.adress, p.email, p.phone_number 
from person p, car c, toll_booth t, passes k
where k.car_id = c.id and k.toll_booth_id = t.id and c.owner_id = p.id;