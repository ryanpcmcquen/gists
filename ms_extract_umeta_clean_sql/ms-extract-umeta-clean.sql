-- delete any usermeta specific to the other subsites
delete from wp_usermeta where meta_key regexp '^wp_([0-9]+)_';

-- duplicate the wp_usermeta structure in a working data table,
-- but add a unique index for filtering out duplicates
create table _fix_usermeta like wp_usermeta;
alter table _fix_usermeta add unique(user_id, meta_key);

-- copy the site-specific usermeta, keeping only the last of each duplicate
insert into _fix_usermeta
    select * from wp_usermeta
    where meta_key like 'wp\_%'
    order by user_id, meta_key, umeta_id
    on duplicate key update umeta_id=values(umeta_id), meta_value=values(meta_value);

-- remove the first of each duplicate
delete from wp_usermeta
where meta_key like 'wp\_%'
and not exists (select * from _fix_usermeta where umeta_id = wp_usermeta.umeta_id);

-- remove that working data table
drop table _fix_usermeta;
