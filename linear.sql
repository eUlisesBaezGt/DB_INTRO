create schema lista_reproduccion;

create table lista_reproduccion.usuario (
   nombre_usuario varchar(250) primary key
 , nombre varchar(250)
 , correo varchar(250)
);

create table lista_reproduccion.lista(
   id_lista int primary key
 , nombre varchar(250)
 , reproduciones int
);

create table lista_reproduccion.lista_usuario(
    nombre_usuario varchar(250) not null references lista_reproduccion.usuario(nombre_usuario)
  ,id_lista int not null references lista_reproduccion.lista(id_lista)
  , duenio_invitado varchar(250)
  , primary key(nombre_usuario, id_lista)
);


CREATE TABLE lista_reproduccion.cancion (
   track_name CHARACTER VARYING(256)
  , artist_name CHARACTER VARYING(256)
  , genre CHARACTER VARYING(16)
  , beats_by_min BIGINT
  , energy BIGINT
  , danceability BIGINT
  , loudness_db BIGINT
  , liveness BIGINT
  , valence BIGINT
  , length BIGINT
  , acousticness BIGINT
  , speechiness BIGINT
  , popularity BIGINT
  , cancion_id INTEGER NOT NULL
  , PRIMARY KEY (cancion_id)
);

CREATE TABLE lista_reproduccion.lista_cancion(
    id_lista int not null references lista_reproduccion.lista(id_lista)
  , id_cancion int not null references lista_reproduccion.cancion(cancion_id)
  , primary key (id_lista, id_cancion)
 );

CREATE TABLE lista_reproduccion.recomendacion_usuario(
    nombre_usuario varchar(250) not null references lista_reproduccion.usuario(nombre_usuario)
  , id_cancion int not null references lista_reproduccion.cancion(cancion_id)
  , tipo_usuario varchar(250)
  , fecha_recomendacion timestamp
  , primary key (nombre_usuario, id_cancion)
 );

create table lista_reproduccion.recomendacion_v2(
    recomendada_por  varchar(250) references lista_reproduccion.usuario(nombre_usuario)
   , recomendada_para  varchar(250) references lista_reproduccion.usuario(nombre_usuario)
   , cancion_id int  references lista_reproduccion.cancion(cancion_id)
   , fecha_recomedacion timestamp
   , primary key(recomendada_por,recomendada_para,cancion_id)
);

INSERT INTO lista_reproduccion.usuario (nombre_usuario, nombre, correo) VALUES ('EmrArd', 'Emiliano', 'emiliano@up.edu.mx');
INSERT INTO lista_reproduccion.usuario (nombre_usuario, nombre, correo) VALUES ('Santiago2049', 'Santiago', 'santiago@up.edu.mx');
INSERT INTO lista_reproduccion.usuario (nombre_usuario, nombre, correo) VALUES ('IsaacV123', 'Isaac', 'isaac@up.edu.mx');
INSERT INTO lista_reproduccion.usuario (nombre_usuario, nombre, correo) VALUES ('daniel07', 'Daniel', 'daniel@up.edu.mx');
INSERT INTO lista_reproduccion.usuario (nombre_usuario, nombre, correo) VALUES ('Gulugoba', 'Gustavo', 'gustavo@up.edu.mx');
INSERT INTO lista_reproduccion.usuario (nombre_usuario, nombre, correo) VALUES ('Ivan_Cruzl', 'Ivan Cruz', 'ivan_cruz@up.edu.mx');
INSERT INTO lista_reproduccion.usuario (nombre_usuario, nombre, correo) VALUES ('KenjiMine', 'Kenji', 'kenji@up.edu.mx');

INSERT INTO lista_reproduccion.lista (id_lista, nombre, reproduciones) VALUES (1, 'mi_lista', 1);
INSERT INTO lista_reproduccion.lista (id_lista, nombre, reproduciones) VALUES (2, 'para_estudiar_db', 1);
INSERT INTO lista_reproduccion.lista (id_lista, nombre, reproduciones) VALUES (3, 'primavera_2022', 1);
INSERT INTO lista_reproduccion.lista (id_lista, nombre, reproduciones) VALUES (4, 'base_de_datos_2022', 1);

INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Se�orita', 'Shawn Mendes', 'canadian pop', 117, 55, 76, -6, 8, 75, 191, 4, 3, 79, 1);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('China', 'Anuel AA', 'reggaeton flow', 105, 81, 79, -4, 8, 61, 302, 8, 9, 92, 2);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('boyfriend (with Social House)', 'Ariana Grande', 'dance pop', 190, 80, 40, -4, 16, 70, 186, 12, 46, 85, 3);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Beautiful People (feat. Khalid)', 'Ed Sheeran', 'pop', 93, 65, 64, -8, 8, 55, 198, 12, 19, 86, 4);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Goodbyes (Feat. Young Thug)', 'Post Malone', 'dfw rap', 150, 65, 58, -4, 11, 18, 175, 45, 7, 94, 5);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('I Don''t Care (with Justin Bieber)', 'Ed Sheeran', 'pop', 102, 68, 80, -5, 9, 84, 220, 9, 4, 84, 6);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Ransom', 'Lil Tecca', 'trap music', 180, 64, 75, -6, 7, 23, 131, 2, 29, 92, 7);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('How Do You Sleep?', 'Sam Smith', 'pop', 111, 68, 48, -5, 8, 35, 202, 15, 9, 90, 8);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Old Town Road - Remix', 'Lil Nas X', 'country rap', 136, 62, 88, -6, 11, 64, 157, 5, 10, 87, 9);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('bad guy', 'Billie Eilish', 'electropop', 135, 43, 70, -11, 10, 56, 194, 33, 38, 95, 10);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Callaita', 'Bad Bunny', 'reggaeton', 176, 62, 61, -5, 24, 24, 251, 60, 31, 93, 11);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Loco Contigo (feat. J. Balvin & Tyga)', 'DJ Snake', 'dance pop', 96, 71, 82, -4, 15, 38, 185, 28, 7, 86, 12);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Someone You Loved', 'Lewis Capaldi', 'pop', 110, 41, 50, -6, 11, 45, 182, 75, 3, 88, 13);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Otro Trago - Remix', 'Sech', 'panamanian pop', 176, 79, 73, -2, 6, 76, 288, 7, 20, 87, 14);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Money In The Grave (Drake ft. Rick Ross)', 'Drake', 'canadian hip hop', 101, 50, 83, -4, 12, 10, 205, 10, 5, 92, 15);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('No Guidance (feat. Drake)', 'Chris Brown', 'dance pop', 93, 45, 70, -7, 16, 14, 261, 12, 15, 82, 16);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('LA CANCI�N', 'J Balvin', 'latin', 176, 65, 75, -6, 11, 43, 243, 15, 32, 90, 17);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Sunflower - Spider-Man: Into the Spider-Verse', 'Post Malone', 'dfw rap', 90, 48, 76, -6, 7, 91, 158, 56, 5, 91, 18);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Lalala', 'Y2K', 'canadian hip hop', 130, 39, 84, -8, 14, 50, 161, 18, 8, 88, 19);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Truth Hurts', 'Lizzo', 'escape room', 158, 62, 72, -3, 12, 41, 173, 11, 11, 91, 20);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Piece Of Your Heart', 'MEDUZA', 'pop house', 124, 74, 68, -7, 7, 63, 153, 4, 3, 91, 21);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Panini', 'Lil Nas X', 'country rap', 154, 59, 70, -6, 12, 48, 115, 34, 8, 91, 22);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('No Me Conoce - Remix', 'Jhay Cortez', 'reggaeton flow', 92, 79, 81, -4, 9, 58, 309, 14, 7, 83, 23);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Soltera - Remix', 'Lunay', 'latin', 92, 78, 80, -4, 44, 80, 266, 36, 4, 91, 24);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('bad guy (with Justin Bieber)', 'Billie Eilish', 'electropop', 135, 45, 67, -11, 12, 68, 195, 25, 30, 89, 25);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('If I Can''t Have You', 'Shawn Mendes', 'canadian pop', 124, 82, 69, -4, 13, 87, 191, 49, 6, 70, 26);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Dance Monkey', 'Tones and I', 'australian pop', 98, 59, 82, -6, 18, 54, 210, 69, 10, 83, 27);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('It''s You', 'Ali Gatie', 'canadian hip hop', 96, 46, 73, -7, 19, 40, 213, 37, 3, 89, 28);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Con Calma', 'Daddy Yankee', 'latin', 94, 86, 74, -3, 6, 66, 193, 11, 6, 91, 29);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('QUE PRETENDES', 'J Balvin', 'latin', 93, 79, 64, -4, 36, 94, 222, 3, 25, 89, 30);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Takeaway', 'The Chainsmokers', 'edm', 85, 51, 29, -8, 10, 36, 210, 12, 4, 84, 31);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('7 rings', 'Ariana Grande', 'dance pop', 140, 32, 78, -11, 9, 33, 179, 59, 33, 89, 32);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('0.958333333333333', 'Maluma', 'reggaeton', 96, 71, 78, -5, 9, 68, 176, 22, 28, 89, 33);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('The London (feat. J. Cole & Travis Scott)', 'Young Thug', 'atl hip hop', 98, 59, 80, -7, 13, 18, 200, 2, 15, 89, 34);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Never Really Over', 'Katy Perry', 'dance pop', 100, 88, 77, -5, 32, 39, 224, 19, 6, 89, 35);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Summer Days (feat. Macklemore & Patrick Stump of Fall Out Boy)', 'Martin Garrix', 'big room', 114, 72, 66, -7, 14, 32, 164, 18, 6, 89, 36);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Otro Trago', 'Sech', 'panamanian pop', 176, 70, 75, -5, 11, 62, 226, 14, 34, 91, 37);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Antisocial (with Travis Scott)', 'Ed Sheeran', 'pop', 152, 82, 72, -5, 36, 91, 162, 13, 5, 87, 38);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Sucker', 'Jonas Brothers', 'boy band', 138, 73, 84, -5, 11, 95, 181, 4, 6, 80, 39);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('fuck, i''m lonely (with Anne-Marie) - from �13 Reasons Why: Season 3�', 'Lauv', 'dance pop', 95, 56, 81, -6, 6, 68, 199, 48, 7, 78, 40);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Higher Love', 'Kygo', 'edm', 104, 68, 69, -7, 10, 40, 228, 2, 3, 88, 41);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('You Need To Calm Down', 'Taylor Swift', 'dance pop', 85, 68, 77, -6, 7, 73, 171, 1, 5, 90, 42);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Shallow', 'Lady Gaga', 'dance pop', 96, 39, 57, -6, 23, 32, 216, 37, 3, 87, 43);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Talk', 'Khalid', 'pop', 136, 40, 90, -9, 6, 35, 198, 5, 13, 84, 44);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Con Altura', 'ROSAL�A', 'r&b en espanol', 98, 69, 88, -4, 5, 75, 162, 39, 12, 88, 45);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('One Thing Right', 'Marshmello', 'brostep', 88, 62, 66, -2, 58, 44, 182, 7, 5, 88, 46);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Te Robar�', 'Nicky Jam', 'latin', 176, 75, 67, -4, 8, 80, 202, 24, 6, 88, 47);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Happier', 'Marshmello', 'brostep', 100, 79, 69, -3, 17, 67, 214, 19, 5, 88, 48);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Call You Mine', 'The Chainsmokers', 'edm', 104, 70, 59, -6, 41, 50, 218, 23, 3, 88, 49);
INSERT INTO lista_reproduccion.cancion (track_name, artist_name, genre, beats_by_min, energy, danceability, loudness_db, liveness, valence, length, acousticness, speechiness, popularity, cancion_id) VALUES ('Cross Me (feat. Chance the Rapper & PnB Rock)', 'Ed Sheeran', 'pop', 95, 79, 75, -6, 7, 61, 206, 21, 12, 82, 50);


INSERT INTO lista_reproduccion.lista_usuario (nombre_usuario, id_lista, duenio_invitado) VALUES ('EmrArd', 1, 'dueño');
INSERT INTO lista_reproduccion.lista_usuario (nombre_usuario, id_lista, duenio_invitado) VALUES ('Santiago2049', 1, 'invitado');
INSERT INTO lista_reproduccion.lista_usuario (nombre_usuario, id_lista, duenio_invitado) VALUES ('Gulugoba', 1, 'invitado');

INSERT INTO lista_reproduccion.lista_usuario (nombre_usuario, id_lista, duenio_invitado) VALUES ('IsaacV123', 2,'dueño');
INSERT INTO lista_reproduccion.lista_usuario (nombre_usuario, id_lista, duenio_invitado) VALUES ('daniel07', 2, 'invitado');

INSERT INTO lista_reproduccion.lista_usuario (nombre_usuario, id_lista, duenio_invitado) VALUES ('Ivan_Cruzl', 3, 'dueño');
INSERT INTO lista_reproduccion.lista_usuario (nombre_usuario, id_lista, duenio_invitado) VALUES ('KenjiMine', 3, 'invitado');
INSERT INTO lista_reproduccion.lista_usuario (nombre_usuario, id_lista, duenio_invitado) VALUES ('daniel07', 3, 'invitado');

INSERT INTO lista_reproduccion.lista_cancion (id_lista, id_cancion) VALUES (1, 2);
INSERT INTO lista_reproduccion.lista_cancion (id_lista, id_cancion) VALUES (1, 34);
INSERT INTO lista_reproduccion.lista_cancion (id_lista, id_cancion) VALUES (1, 15);
INSERT INTO lista_reproduccion.lista_cancion (id_lista, id_cancion) VALUES (1, 17);
INSERT INTO lista_reproduccion.lista_cancion (id_lista, id_cancion) VALUES (1, 20);

INSERT INTO lista_reproduccion.lista_cancion (id_lista, id_cancion) VALUES (2, 10);
INSERT INTO lista_reproduccion.lista_cancion (id_lista, id_cancion) VALUES (2, 14);
INSERT INTO lista_reproduccion.lista_cancion (id_lista, id_cancion) VALUES (2, 50);
INSERT INTO lista_reproduccion.lista_cancion (id_lista, id_cancion) VALUES (2, 43);
INSERT INTO lista_reproduccion.lista_cancion (id_lista, id_cancion) VALUES (2, 22);
INSERT INTO lista_reproduccion.lista_cancion (id_lista, id_cancion) VALUES (2, 40);
INSERT INTO lista_reproduccion.lista_cancion (id_lista, id_cancion) VALUES (2, 13);

INSERT INTO lista_reproduccion.lista_cancion (id_lista, id_cancion) VALUES (3, 1);
INSERT INTO lista_reproduccion.lista_cancion (id_lista, id_cancion) VALUES (3, 2);
INSERT INTO lista_reproduccion.lista_cancion (id_lista, id_cancion) VALUES (3, 11);
INSERT INTO lista_reproduccion.lista_cancion (id_lista, id_cancion) VALUES (3, 21);
INSERT INTO lista_reproduccion.lista_cancion (id_lista, id_cancion) VALUES (3, 31);
INSERT INTO lista_reproduccion.lista_cancion (id_lista, id_cancion) VALUES (3, 41);
INSERT INTO lista_reproduccion.lista_cancion (id_lista, id_cancion) VALUES (3, 49);
INSERT INTO lista_reproduccion.lista_cancion (id_lista, id_cancion) VALUES (3, 20);

INSERT INTO lista_reproduccion.recomendacion_usuario (nombre_usuario, id_cancion, tipo_usuario, fecha_recomendacion) VALUES ('IsaacV123', 30, 'recomendada_por', current_timestamp);
INSERT INTO lista_reproduccion.recomendacion_usuario (nombre_usuario, id_cancion, tipo_usuario, fecha_recomendacion) VALUES ('Gulugoba', 30, 'recomendada_para', current_timestamp);

INSERT INTO lista_reproduccion.recomendacion_usuario (nombre_usuario, id_cancion, tipo_usuario, fecha_recomendacion) VALUES ('Santiago2049', 15, 'recomendada_por', current_timestamp);
INSERT INTO lista_reproduccion.recomendacion_usuario (nombre_usuario, id_cancion, tipo_usuario, fecha_recomendacion) VALUES ('Ivan_Cruzl', 15, 'recomendada_para', current_timestamp);


INSERT INTO lista_reproduccion.recomendacion_v2 (recomendada_por, recomendada_para, cancion_id, fecha_recomedacion) VALUES ('IsaacV123', 'Gulugoba', 15, current_timestamp);
INSERT INTO lista_reproduccion.recomendacion_v2 (recomendada_por, recomendada_para, cancion_id, fecha_recomedacion) VALUES ('Santiago2049', 'Ivan_Cruzl', 15, current_timestamp);
INSERT INTO lista_reproduccion.recomendacion_v2 (recomendada_por, recomendada_para, cancion_id, fecha_recomedacion) VALUES ('daniel07', 'KenjiMine', 23, current_timestamp);
INSERT INTO lista_reproduccion.recomendacion_v2 (recomendada_por, recomendada_para, cancion_id, fecha_recomedacion) VALUES ('Santiago2049', 'KenjiMine', 49, current_timestamp);





-- QUERIES

/*Consulta 1) Obtener nombre de usuario y correo de todos los usuarios.*/
select nombre_usuario, correo from lista_reproduccion.usuario;

/*Consulta 2) Obtener las recomendaciones que se hayan registrado posterior a Enero 2022.*/
select * from lista_reproduccion.recomendacion_usuario where fecha_recomendacion > '2022-01-01';

/* Consulta 3) Obtener ‘id_cancion’ de:
De lista_cancioon con id_lista = 1
De las recomendaciones hechas  por ‘Santiago2049’ . */
select id_cancion from lista_reproduccion.lista_cancion where id_lista = 1
UNION
select cancion_id from lista_reproduccion.recomendacion_v2 where recomendada_por = 'Santiago2049';


/*Consulta 4) Obtener la ‘cancion_id’ que no esté asociada a ninguna lista de reproducción.*/
select cancion_id from lista_reproduccion.cancion where cancion_id not in (select id_cancion from lista_reproduccion.lista_cancion);

/*Consulta 5) Obtener la combinación de todos los registros de ‘lista’ vs todos los registros de ‘listas_cancion’.*/
select * from lista_reproduccion.lista
CROSS JOIN lista_reproduccion.lista_cancion;


