-- select following_id, count(follower_id) as followers
-- from followers
-- GROUP by following_id
-- order by followers desc
-- limit 3;
-- 
-- select users.user_id, users.user_handle, users.first_name, following_id, COUNT(follower_id) as followers
-- from followers
-- join users on users.user_id = followers.following_id
-- GROUP by following_id
-- order by followers DESC
-- limit 2;

CREATE TABLE tweets