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
(9, 'Explorando nuevos lugares para viajar ✈️🌎 #Aventura'),
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

SELECT user_id, COUNT(*) AS tweet_count
FROM tweets
GROUP BY user_id
ORDER BY tweet_count DESC;

