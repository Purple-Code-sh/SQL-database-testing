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

DROP TABLE IF EXISTS tweet_likes;
DROP TABLE IF EXISTS tweets;

CREATE TABLE tweets(
    tweet_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    tweet_text VARCHAR(180) NOT NULL,
    num_likes INT DEFAULT 0,
    num_retweets INT DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT (NOW()),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    PRIMARY KEY (tweet_id)
);

INSERT INTO tweets(user_id, tweet_text)
VALUES
(7, 'Hola, este es mi primer tweet, mucho gusto 🐧'),
(3, 'Disfrutando de un día soleado ☀️ #Feliz'),
(7, 'Compartiendo mi receta favorita de pastel de chocolate 🍰❤️'),
(6, 'Aprendiendo algo nuevo cada día 💡 #NuncaDejesDeAprender'),
(2, 'Viendo una película genial con amigos 🎬🍿 #NocheDePelícula'),
(5, 'Explorando nuevos lugares para viajar ✈️🌎 #Aventura'),
(6, 'Disfrutando de un café con una buena lectura 📚☕️ #MomentosRelajantes'),
(8, 'Practicando deportes al aire libre 🏃‍♂️🌳 #VidaActiva'),
(6, 'Celebrando un logro importante en el trabajo 🎉💼 #ÉxitoProfesional'),
(2, 'Empezando el día con energía y positivismo ✨☀️ #BuenosDías'),
(7, 'Cocinando una nueva receta para la cena 🍲🍽️ #ChefEnCasa'),
(4, 'Disfrutando de la naturaleza en un día soleado 🌿🌞 #PazInterior'),
(8, 'Practicando yoga para relajarme y despejar la mente 🧘‍♀️☮️ #Bienestar'),
(3, 'Agradecido por las pequeñas cosas de la vida 💖🙏 #Gratitud'),
(6, 'Explorando nuevos géneros musicales 🎵🎶 #AmanteDeLaMúsica'),
(5, 'Ayudando a organizar un evento benéfico local 🤝🌟 #Solidaridad'),
(9, 'Tomando un descanso para cuidar mi salud mental 💆‍♂️✨ #Autocuidado'),
(1, 'Compartiendo momentos especiales con la familia 👨‍👩‍👧‍👦❤️ #AmorFamiliar'),
(10, 'Planificando mi próxima aventura de viaje ✈️🗺️ #Explorador');

-- select user_id, COUNT(*) as tweet_count
-- from tweets
-- group by user_id
-- order by tweet_count DESC;
-- 
-- select tweet_id, tweet_text, user_id
-- from tweets
-- where user_id in(
--     select following_id
--     from followers
--     group by following_id
--     HAVING COUNT(*)>=2
-- );

-- DELETE FROM tweets WHERE tweet_id = 1;
-- DELETE FROM tweets WHERE user_id = 3;
-- DELETE FROM tweets WHERE tweet_text LIKE '%disfrutando%';

UPDATE tweets SET num_likes = num_likes + 1 WHERE tweet_id = 8;
UPDATE tweets SET tweet_text = REPLACE(tweet_text,' a ',' XXXX ')
WHERE tweet_text LIKE '%a%';

CREATE TABLE tweet_likes(
    user_id INT NOT NULL,
    tweet_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(tweet_id) REFERENCES tweets(tweet_id),
    PRIMARY KEY(tweet_id, user_id)
);

INSERT INTO tweet_likes (user_id, tweet_id)
VALUES
(1,3),(2,6),(9,17),(4,15),(1,12),(5,16),(3,6),(2,19),(3,13),(8,18),(10,17),(5,17),(4,6),(5,6),(7,13),(7,6);

-- select tweet_id, COUNT(*) as like_count
-- from tweet_likes
-- group by tweet_id
-- order by like_count DESC;

/* Add column to a table, using ALTER TABLE*/
-- ALTER TABLE users
-- ADD follower_count int not null DEFAULT 0;

DROP TRIGGER IF EXISTS increase_follower_count;

DELIMITER &$
CREATE TRIGGER increase_follower_count
    AFTER INSERT ON followers
    FOR EACH ROW
    BEGIN
        UPDATE users SET follower_count = follower_count + 1
        WHERE user_id = NEW.following_id;
    END &$
    
 CREATE TRIGGER decrease_follower_count
    AFTER INSERT ON followers
    FOR EACH ROW
    BEGIN
        UPDATE users SET follower_count = follower_count - 1
        WHERE user_id = NEW.following_id;
    END &$
DELIMITER ;

/* new inserted values to actualize followers of 4 and 7 user_id*/
-- insert into followers(follower_id, following_id)
-- VALUES
-- (3,4),
-- (5,4),
-- (6,4),
-- (1,4),
-- (3,7),
-- (4,7),
-- (8,7);

SELECT following_id, COUNT(*) AS user_id_most_followed
FROM followers
GROUP BY following_id
ORDER BY user_id_most_followed DESC;

