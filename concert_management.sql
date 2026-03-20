/*
Patricia Fernández Sanz
Bases de datos completa "conciertos"
*/

-- Creamos la base de datos (eliminamos si hubiese alguna existente y la utilizamos)

drop database if exists conciertos;
create database conciertos;
use conciertos;

-- Creamos las tablas de la base indicando los campos, su dominio y clave primaria
-- Añadimos los datos a las tablas a continuación de la creación de la tabla

create table hotel(
    codH int auto_increment primary key, -- a medida que añadimos hoteles, el codH incrementa solo, asignando 1 al primer hotel, 2 al segundo, etc.
    numEstrellas int check(numEstrellas >=1 and numEstrellas <=5) not null, -- un hotel tiene como mínimo 1 estrella y como máximo 5
    precioNoche decimal (6,2) not null,
    telfH varchar (20) not null, -- ponemos varios caracteres puesto que con los prefijos y la forma en la que se escriben los teléfonos se utiliza bastante espacio
    paisH varchar (40) not null,
    ciudadH varchar (80) not null,
    dirH varchar (80) not null
);

INSERT INTO hotel (numEstrellas, precioNoche, telfH, paisH, ciudadH, dirH)
VALUES (3, 45.87, '+34 915 638 763', 'España', 'Madrid', 'Calle Río Tajo, 4'), -- 1
       (5, 250.50, '+34 927 298 645', 'España', 'Madrid', 'Paseo de la Castellana 19'), -- 2
       (2, 30.70, '+34 949 273 198', 'España', 'Madrid', 'Calle de Preciados 102'), -- 3
	   (4, 170.70, '+34 966 777 888', 'España', 'Benidorm', 'Calle del Día 12'), -- 4
       (4, 307, '+34 871 966 296', 'España', 'Maspalomas', 'Avenida del Mediterraneo'), -- 5
	   (3, 50, '+49 829 299 177', 'Alemania', 'Bonn', 'Unter den Linden 8'), -- 6
       (5, 220.50, '+39 819 829 987', 'Inglaterra', 'Liverpool', 'Abbey Road 7'),
	   (4, 180.20, '+33 179 372 989', 'Francia', 'Paris', '‎28 Rue Montorgueil'),
       (5, 222, '+33 1 45 62 01 62', 'Francia', 'Paris', '10 Rue Chateaubriand'),
       (4, 140, '+31 273 923 561', 'Países Bajos', 'Amsterdam', 'Nieuwe Hoogstraat 88'), -- 10
       (4, 185.40, '+39 78 72937', 'Italia', 'Parma', 'Via Montenapoleone 3'),
       (5, 495, '+39 02 77461', 'Italia', 'Milán', 'Largo Augusto 10'),
       (5, 300, '+354 444 5000', 'Islandia', 'Reikiavik', 'Laugavegur 63'),
       (4, 226, '+1 787 993 3500', 'Puerto Rico', 'San Juan', 'Blvd. Centro de Convenciones 200'),
       (3, 60, '+46 8 20 85 65', 'Suecia', 'Stockholm', 'Holländargatan 8B'), -- 15
       (4, 102, '+46 8 411 95 45', 'Suecia', 'Kosta','Skeppsbron 22'),
       (2, 50, '+353 1 855 5660', 'Irlanda', 'Dublín', 'Mountjoy 21-28'),
       (3, 28, '+52 555 521 5725', 'México', 'Ciudad de México', 'República de Uruguay 90'), 
       (5, 270, '+57 601 3442704', 'Colombia', 'Bolívar', 'Ciénaga de Cholón'),
       (3, 37, '+1 905 356 1722', 'Canadá', 'Niagara Falls', '6519 Stanley Ave'), -- 20
       (3, 46, '+1 905 358 9353', 'Canadá', 'Niagara Falls', '6645 Fallsview Blvd'),
       (4, 119, '+36 1 424 4700', 'Hungría', 'Budapest', 'Osvát u. 2'),
       (3, 128, '+503 7737 1940', 'El Salvador', 'Punta Mango', 'Villa Mango Jucuarán'), 
       (4, 217, '+502 4066 8135', 'Guatemala', 'Santa Cruz la Laguna', '1 Tzantizotz'),
       (4, 75, '+852 2802 0111', 'Hong Kong', 'Wan Chai', '4 Harbour Rd'), -- 25
       (5, 357, '+972 8 659 8000', 'Israel', 'Mitzpe Ramon', '1 A través del Génesis'),
       (4, 123, '+56 55 235 0400', 'Chile', 'Antofagasta', 'Av. Ejército 01151'),
       (5, 528, '+81 154 67 5500', 'Japón', 'Hokkaido', '2 Chome-8-1 Akancho Akankoonsen'),
       (5, 643, '+86 28 6636 9999', 'China', 'Cheng Du', 'Distrito JinJiang'); -- 29
       
create table artista(
    dniA varchar (10) primary key,
    nomArtistico varchar (40) not null,
    nomA varchar (30) not null,
	ape1A varchar (30) not null,
	ape2A varchar (30) not null,
    fecProductora date not null,
    paisA varchar (40) not null
);

INSERT INTO artista
VALUES ('89510285E', 'Roger Cicero', 'Roger Marcel', 'Cicero', 'Ciceu', '2003-11-03',  'Alemania'),
	   ('62955711E', 'Jennie Lena', 'Jennie', 'Willemstijn', 'Bakker', '2003-04-27', 'Países Bajos'),
       ('72958826H', 'Mick Jagger', 'Michael', 'Philip', 'Jagger', '1959-08-13', 'Inglaterra'),
       ('29129956F', 'Elton John', 'Reginald', 'Kenneth', 'Dwight', '1961-09-03',  'Inglaterra'),
       ('70200137G', 'Bryan Adams', 'Bryan', 'Guy', 'Adams', '1975-10-09', 'Canadá'),
       ('39200192T', 'Rosalía', 'Rosalía', 'Vila', 'Tobella', '2013-07-18', 'España'),
       ('99286356K', 'Alejandro Sanz', 'Alejandro', 'Sánchez', 'Pizarro', '1988-02-06', 'España'),
       ('02663917F', 'Zaz', 'Isabelle', 'Geffroy', 'Lambert', '2011-06-12', 'Francia'),
       ('28738838G', 'Shakira', 'Shakira Isabel', 'Mebarak', 'Ripoll', '1990-07-28', 'Colombia'),
       ('57883512T', 'Daddy Yankee', 'Ramón Luis', 'Ayala', 'Rodríguez', '1990-06-17', 'Puerto Rico'),
       ('19382209I', 'Eros Ramazzotti', 'Eros Luciano', 'Walter', 'Ramazzotti', '1981-12-29', 'Italia'),
       ('023855992J', 'Laura Pausini', 'Laura Alice', 'Rosella', 'Pausini', '1993-05-09', 'Italia'),
       ('018398849U', 'Rod Stewart', 'Roderick', 'David', 'Stewart', '1961-09-30', 'Inglaterra'),
       ('19380082Y', 'Björk', 'Björk', 'Guðmundsdóttir', 'Dóttir', '1977-04-18', 'Islandia'),
       ('938209390J', 'John Levén', 'John', 'Gunnar', 'Levén', '1981-12-24', 'Suecia'),
       ('475829749I', 'Pablo Alborán', 'Pablo Moreno', 'de Alborán', 'Ferrándiz', '2010-01-31', 'España'),
       ('50286387H', 'Aitana', 'Aitana', 'Ocaña', 'Morales', '2017-10-14', 'España'),
       ('87297492Y', 'Lola Índigo', 'Miriam', 'Doblas', 'Muñoz', '2017-02-07', 'España'),
       ('926836877J', 'Ana Mena', 'Ana', 'Mena', 'Rojas', '2006-10-18', 'España'),
       ('40976868Z', 'Bad Gyal', 'Alba', 'Farelo', 'i Solé', '2016-07-19', 'España'),
       ('829478921S', 'Jisoo', 'Ji-soo', 'Kim', 'Bo', '2016-03-27', 'Corea del Sur'),
       ('12863238Y', 'Jungkook', 'Jung-kook', 'Jeon', 'Hyun', '2013-09-12', 'Corea del Sur'),
       ('01730290I', 'Lisa', 'Pranpriya', 'Manobal', 'Taeyang', '2016-01-02', 'Tailandia'),
       ('79217342T', 'Rosé', 'Roseanne', 'Park', 'Chae-young', '2016-08-09', 'Nueva Zelanda'),
       ('19283788H', 'Somi', 'Ennik Somi', 'Douma', 'Jeon', '2015-11-29', 'Canadá'),
       ('01829228U', 'Jackson Wang', 'Jiāěr', 'Wáng', 'Zhou', '2014-06-13', 'Hong Kong'),
       ('43028234E', 'Harlem Yu', 'Harelm Yu', 'Cheng', 'Qin', '1986-05-21', 'Taiwán');


create table cancion(
    codC int auto_increment primary key,
    nomC varchar (50) not null,
    album varchar (80) not null,
    duracion decimal (4,2) not null, -- vamos a considerar la duración como un número decimal donde, si la canción dura 3'15", en la tabla aparece como 3.15
    dniA varchar (10) not null,
    foreign key (dniA) references artista(dniA)
    on delete cascade -- si borramos el artista o lo actualizamos, también lo harán las canciones
    on update cascade
);

INSERT INTO cancion (nomC, album, duracion, dniA) 
VALUES ('In diesem Moment', 'In diesem Moment', 3.38, '89510285E'),
	   ('Zieh die Schuh aus', 'Männersachen', 3.17, '89510285E'),
       ('Ich atme ein', 'Männersachen', 2.41, '89510285E'),
       ('Wenn es morgen schon zu Ende wär', 'Was immer auch kommt', 3.38, '89510285E'),
       ("Ich hätt' so gern noch Tschüss gesagt", 'Beziehungsweise', 3.43, '89510285E'),
       ('Murphys Gesetz', 'Männersachen', 4.04,  '89510285E'),
       ("Who’s Lovin' You", 'To be Honest', 3.22, '62955711E'),
       ('Trouble', 'To be Honest', 4.05, '62955711E'),
       ('Changes', 'Analog Girl in a Digital World', '5.14', '62955711E'),
       ('We grow', 'To be Honest', 4.52, '62955711E'),
       ('Heaven wins again', 'To be Honest', 3.37, '62955711E'),
       ('Shine', 'To be Honest', 3.49, '62955711E'),
       ('Paint it Black', 'Aftermath',  3.46, '72958826H'),
       ("Can't You Hear Me Knocking", 'Sticky Fingers',  7.16, '72958826H'),
       ("I Can't Get No) Satisfaction", 'Out of Our Heads',  3.55, '72958826H'),
       ('Angry', 'Hackney Diamonds',  3.45, '72958826H'),
       ('Gimme Shelter', 'Let it Bleed',  4.31, '72958826H'),
       ('Sympathy For The Devil', 'Beggars Banquet',  8.49, '72958826H'),
       ("I'm Still Standing", "Too Low for Zero",  3.02, '29129956F'),
       ('Rocket Man', "Honky Château",  4.42, '29129956F'),
       ("Goodbye Yellow Brick Road", "Goodbye Yellow Brick Road",  3.13, '29129956F'),
       ('Nikita', "Ice on Fire",  5.34, '29129956F'),
       ("Your Song", "Elton John",  3.48, '29129956F'),
       ("Tiny Dance", "Madman Across the Water",  6.46, '29129956F'),
       ('Please Forgive Me', 'So Far so Good', 5.30, '70200137G'),
       ('Heaven', 'Reckless', 4.11, '70200137G'),
       ('Summer of ’69', 'Reckless', 3.33, '70200137G'),
       ('Run to You', 'Reckless', 3.45, '70200137G'),
       ('Straight From the Heart', 'Cuts Like a Knife', 3.47, '70200137G'),
       ("When You're Gone", 'One Day Like Today', 3.24, '70200137G'),
       ("BIZCOCHITO", "Motomami", 1.50, '39200192T'),
	   ("DESPECHÁ", "Motomami", 2.39, '39200192T'),
	   ("Con Altura", "Con Altura", 3.45, '39200192T'),
	   ("LA FAMA", "Motomami", 4.11, '39200192T'),
	   ("BESO", "RR", 3.22, '39200192T'),
       ("Malamente", "El Mal Querer", 2.48, '39200192T'),
       ("Amiga mía", "Más", 4.43, '99286356K'),
       ("Corazón partío", "Más", 5.44, '99286356K'),
       ("Mi soledad y yo", "3", 4.57, '99286356K'),
       ("No me compares", "La música no se toca", 4.46, '99286356K'),
       ("Muero", "El amor que merecemos", 4.07, '99286356K'),
       ("La fuerza del corazón", "3", 4.58, '99286356K'),
       ("Je veux",'Zaz', '3.36', '02663917F'),
       ("Qué vendrá", "Effet miroir", '3.02', '02663917F'),
       ("Si jamais j'oublie", "Sur la route", '3.26', '02663917F'),
       ("On ira", "Recto Verso", '3.02', '02663917F'),
       ("Éblouie par la nuit", "Zaz", '2.53', '02663917F'),
       ("Animaux fragiles", "Des millions d'années", '3.20', '02663917F'),
       ("Loba", "Loba", 3.50, '28738838G'),
       ("Me enamoré", "El Dorado", 3.52, '28738838G'),
       ("Perro Fiel", "El Dorado", 3.16, '28738838G'),
       ("Loca", "Sale el Sol", 2.42, '28738838G'),
       ("La Bicicleta", "El Dorado", 3.58, '28738838G'),
       ("Hips Don't Lie", "Oral Fixation vol.2", 3.39, '28738838G'),
       ("Gasolina", "Barrio fino", 3.13, '57883512T'),
       ("Despacito", " Despacito & mis grandes éxitos", 4.13, '57883512T'),
       ("Con calma", " Con calma & mis grandes éxitos", 3.31, '57883512T'),
       ("Yo Voy", "Motivando a la Yal", 3.52, '57883512T'),
       ("Dura", " Bum Bum Tam Tam Latino Party", 3.21, '57883512T'),
       ("Si supieras", "Si supieras", 4.01, '57883512T'),
       ("La cosa más bella", "Dove c'è musica", 4.24, '19382209I'),
       ("Otra Como Tu (Un'altra te)", "Tutte storie", 4.42, '19382209I'),
       ("Cosas de la Vida", "Tutte storie", 4.52, '19382209I'),
       ("Una historia importante", "Cuori agitati", 4.11, '19382209I'),
       ("Quanto amore sei", "Eros", 4.11, '19382209I'),
       ("Fuoco nel fuoco", "Estilo libre", 4.02, '19382209I'),
       ("En cambio no", "Primavera Anticipada (Spanish)", 3.58, '023855992J'),
       ("La soledad", " Laura Pausini (Deluxe)", 4.00, '023855992J'),
       ("Amores Extraños", " Laura Pausini (Deluxe)", 4.16, '023855992J'),
       ("Se fue", " Laura Pausini", 4.41, '023855992J'),
       ("Entre Tú y Mil Mares", " Entre Tú y Mil Mares", 3.49, '023855992J'),
       ("Víveme", "Escucha", 3.51, '023855992J'),
       ("I Don't Want to Talk About It", " Atlantic Crossing", 4.51, '018398849U'),
       ("Do Ya Think I'm Sexy", "Blondes Have More Fun", 5.32, '018398849U'),
       ("Sailing", " Atlantic Crossing", 4.23, '018398849U'),
       ("Have You Ever Seen the Rain", " Still the Same... Great Rock Classics of Our Time", 3.09, '018398849U'),
       ("Forever Young", " Out of Order", 4.03, '018398849U'),
       ("Hot Legs", "Foot Loose & Fancy Free", 5.16, '018398849U'),
       ("Army of Me", "Post", 3.55, '19380082Y'),
       ("It’s Oh So Quiet", "Post", 3.41, '19380082Y'),
       ("Hyperballad", "Post", 5.22, '19380082Y'),
       ("Venus as a Boy", "Debut", 4.43, '19380082Y'),
       ("Jóga", "Homogenic", 5.06, '19380082Y'),
       ("Bachelorette", "Homogenic", 5.17, '19380082Y'),
       ("The Siege", " Walk the Earth", 4.04, '938209390J'),
       ("Last Look at Eden", " Last Look at Eden", 4.10, '938209390J'),
       ("War of Kings", " War of Kings", 4.56, '938209390J'),
       ("Hole in My Pocket", " War of Kings", 3.43, '938209390J'),
       ("Girl From Lebanon", "Prisoners in Paradise", 4.21, '938209390J'),
       ("Hero", "Start from the Dark", 4.15, '938209390J'),
       ("Dónde Está el Amor", "Tanto", 3.53, '475829749I'),
       ("Saturno", "Prometo", 4.14, '475829749I'),
       ("Solamente tú", "Pablo Alborán", 4.08, '475829749I'),
       ("Amigos", "La Cuarta Hoja", 3.45, '475829749I'),
       ("Por Fin", "Terral", 3.54, '475829749I'),
       ("Recuérdame", "Terral", 4.48, '475829749I'),
       ("AQYNE", "Alpha", 3.01, '50286387H'),
       ("miamor", "Alpha", 2.40, '50286387H'),
       ("2 Extraños", "Alpha", 3.02, '50286387H'),
       ("24 Rosas", "Alpha", 2.48, '50286387H'),
       ("Con la miel en los labios", "Spoiler", 3.23, '50286387H'),
       ("Si no vas a volver", "11 razones", 2.36 , '50286387H'),
       ("Tiki Tiki", "Tiki Tiki", 2.12,'87297492Y'),
       ("Discoteka", "El dragón", 2.56,'87297492Y'),
       ("El tonto", "El dragón", 3.08,'87297492Y'),
       ("Santería", "Akelarre", 3.04,'87297492Y'),
       ("CORAZONES ROTOS", "El dragón", 3.51,'87297492Y'),
       ("Toy Story", "La niña", 2.57,'87297492Y'),
       ("A un paso de la luna", "Rivoluzione", 2.46, '926836877J'),
       ("LAS 12", "Bellodrama", 2.50, '926836877J'),
       ("Quiero Decirte", "Quiero Decirte", 23.41, '926836877J'),
       ("Madrid City", "Madrid City", 3.12, '926836877J'),
       ("Ahora lloras tú", "Index", 3.27, '926836877J'),
       ("Ya Es Hora", "Index", 3.26, '926836877J'),
       ("KÁRMIKA", "Mañana será bonito", 3.57, '40976868Z'),
       ("La Prendo", "Con Las Babys", 3.02, '40976868Z'),
       ("Fiebre", "Slow Wine Mixtape", 4.09, '40976868Z'),
       ("44", "Warm Up", 3.06, '40976868Z'),
       ("Blin Blin", "Warm Up", 2.25, '40976868Z'),
       ("Mi Lova", "Mi Lova", 3.41, '40976868Z'),
       ("FLOWER", "Novena Parchada", 3.01, '829478921S'),
	   ("Pink Venom", "Born Pink", 3.14, '829478921S'),
       ("How You Like That", "The Album", 2.58, '829478921S'),
       ("Kill This Love", "Kill This Love", 3.10, '829478921S'),
       ("Ice Cream", "The Album", 2.59, '829478921S'),
       ("Boombayah", "Blackpink", 4.01, '829478921S'),
       ("3D", " 3D : The Remixes", 4.22, '12863238Y'),
       ("Dynamite", "Be", 3.35, '12863238Y'),
       ("Butter", "Butter (Hotter, Sweeter, Cooler)", 2.57, '12863238Y'),
       ("Run BTS", "Proof", 3.26, '12863238Y'),
       ("FAKE LOVE", "Love Yourself: Tear", 4.19, '12863238Y'),
       ("IDOL", "Love Yourself: Answer", 4.14, '12863238Y'),
       ("LALISA", "LALISA", 3.27, '01730290I'),
       ("MONEY", "LALISA", 2.48, '01730290I'),
	   ("Sour Candy", "Chromatica", 2.38, '01730290I'),
       ("Stay", "Square Two", 3.51, '01730290I'),
       ("WHISTLE", "Square One", 3.32, '01730290I'),
       ("Playing with fire", "Square Two", 3.15, '01730290I'),
       ("On The Ground", "R", 2.52, '79217342T'),
       ("Gone", "R", 3.28, '79217342T'),
       ("Really", " Blackpink In Your Area", 3.18, '79217342T'),
       ("DU DDU-DU", "R", 3.30, '79217342T'),
       ("Kick It", "R", 3.10, '79217342T'),
       ("Lovesick Girls", "For You", 3.18, '79217342T'),
       ("Tally", "For You", 3.00, '79217342T'),
       ("Fast Forward", "GAME PLAN",  2.45, '19283788H'),
       ("DUMB DUMB", " XOXO",  2.31, '19283788H'),
       ("Birthday", "XOXO", 3.12, '19283788H'),
       ("XOXO", "XOXO",3.30, '19283788H'),
       ("Very Very Very", "Miss Me?", 3.24, '19283788H'),
       ("DOWNPOUR", "DOWNPOUR", 3.26, '19283788H'),
       ("LMLY", "LMLY", 3.30, '01829228U'),
       ("100 Ways", "100 Ways", 2.49, '01829228U'),
       ("Blow", "Magic Man", 2.44, '01829228U'),
       ("Slow", "Slow", 3.18, '01829228U'),
       ("Cruel", "Slow", 3.16, '01829228U'),
       ("Dawn of us", "Dawn of us", 3.00, '01829228U'),
       ("Jing Jing De", "Can't Quit", 4.09, '43028234E'),
       ("Hai Xiao", "Tidal Wave", 4.40, '43028234E'),
       ("Chun Ni", " Harlem's Heaven", 4.15, '43028234E'),
       ("Rang Wo Yi Ci Ai Ge Guo", " Harlem No.1 Greatest Hits", 4.15, '43028234E'),
       ("Ai Dao Di", "Tidal Wave", 4.13, '43028234E'),
       ("Xiang Ni Xing Zai 0:03", "Just For You", 3.53, '43028234E');
       
       
create table alojado(
    codH int,
    dniA varchar(10),
    fechaEnt date not null,
    fechaSal date not null,
    primary key (codH, dniA, fechaEnT),
    foreign key (codH) references hotel(codH) on delete cascade,
    foreign key (dniA) references artista(dniA) on delete cascade
);

INSERT INTO alojado VALUES (1, '89510285E', '2022-12-01', '2022-12-07'),
						   (4, '89510285E', '2023-06-23', '2023-06-30'),
						   (5, '89510285E', '2021-02-12', '2021-02-15'),
						   (8, '89510285E', '2023-05-01', '2023-05-02'),
                           (12, '89510285E', '2023-10-01', '2023-10-06'),
                           (2, '89510285E', '2023-10-10', '2023-10-14'),
						   (21, '62955711E', '2024-05-12', '2024-05-14'),
						   (28, '62955711E', '2023-04-02', '2023-04-10'),
						   (16, '62955711E', '2021-08-04', '2021-08-07'),
						   (18, '62955711E', '2022-11-03', '2022-11-06'),
                           (6, '62955711E', '2023-01-02', '2023-01-08'),
                           (11, '62955711E', '2023-12-07', '2023-12-10'),
						   (3, '72958826H', '2024-01-19', '2024-01-23'),
						   (15, '72958826H', '2023-02-26', '2023-02-28'),
						   (19, '72958826H', '2021-08-01', '2021-08-05'),
						   (8, '72958826H', '2022-02-18', '2022-02-21'),
						   (7, '72958826H', '2023-08-05', '2023-08-08'),
						   (26, '72958826H', '2023-11-16', '2023-11-20'),
						   (29, '29129956F', '2022-05-13', '2022-05-16'),
						   (23, '29129956F', '2023-04-03', '2023-04-07'),
						   (7, '29129956F', '2021-01-16', '2021-01-25'),
						   (9, '29129956F', '2023-03-03', '2023-03-09'),
                           (25, '29129956F', '2023-07-13', '2023-07-20'),
                           (1, '72958826H', '2024-06-19', '2024-06-23'),
						   (14, '70200137G', '2022-05-12', '2022-05-14'),
						   (12, '70200137G', '2023-01-01', '2023-01-05'),
						   (22, '70200137G', '2023-02-10', '2023-02-15'),
						   (15, '70200137G', '2023-03-20', '2023-03-25'),
                           (19, '70200137G', '2021-02-06', '2021-02-11'),
                           (20, '70200137G', '2022-06-18', '2022-06-27'),
						   (17, '39200192T', '2023-05-01', '2023-05-05'),
						   (4, '39200192T', '2023-06-12', '2023-06-15'),
						   (1, '39200192T', '2021-07-24', '2021-07-25'),
						   (1, '39200192T', '2023-09-01', '2023-09-04'),
                           (13, '70200137G', '2022-10-12', '2022-10-17'),
                           (24, '70200137G', '2022-05-16', '2022-05-24'),
						   (1, '99286356K', '2022-10-10', '2022-10-13'),
						   (2, '99286356K', '2023-11-20', '2023-11-25'),
						   (3, '99286356K', '2024-01-01', '2024-01-04'),
						   (14, '99286356K', '2023-03-18', '2023-03-22'),
                           (5, '99286356K', '2021-07-14', '2021-07-17'),
                           (6, '99286356K', '2024-12-10', '2024-12-16'), 
						   (7, '02663917F', '2023-04-22', '2023-04-28'),
						   (8, '02663917F', '2024-06-05', '2024-06-11'),
						   (19, '02663917F', '2021-07-18', '2021-07-23'),
						   (10, '02663917F', '2023-09-01', '2023-09-02'),
                           (11, '02663917F', '2023-01-14', '2023-01-15'),
                           (13, '02663917F', '2022-10-01', '2022-10-02'),
						   (16, '28738838G', '2022-10-08', '2022-10-12'),
						   (20, '28738838G', '2023-11-15', '2023-11-20'),
						   (19, '28738838G', '2023-12-25', '2023-12-30'),
						   (3, '28738838G', '2024-01-08', '2024-01-17'),
                           (4, '28738838G', '2023-09-18', '2023-09-22'),
                           (6, '28738838G', '2023-05-17', '2023-05-25'),
						   (8, '57883512T', '2024-02-10', '2024-02-15'),
						   (10, '57883512T', '2023-03-20', '2023-03-26'),
						   (17, '57883512T', '2023-05-01', '2023-05-02'),
						   (21, '57883512T', '2023-06-15', '2023-06-22'),
                           (1, '57883512T', '2022-07-19', '2022-07-21'),
                           (18, '57883512T', '2023-06-15', '2023-06-18'), 
						   (24, '19382209I', '2024-07-20', '2024-07-25'),
						   (3, '19382209I', '2023-09-01', '2023-09-04'),
						   (1, '19382209I', '2023-10-10', '2023-10-13'),
						   (22, '19382209I', '2021-11-20', '2021-11-27'),
                           (9, '19382209I', '2023-11-08', '2023-11-12'),
                           (4, '19382209I', '2022-09-06', '2022-09-09'),  
						   (1, '023855992J', '2025-01-01', '2025-01-02'),
						   (19, '023855992J', '2025-01-08', '2025-01-15'),
						   (8, '023855992J', '2023-02-05', '2023-02-10'),
						   (23, '023855992J', '2022-03-20', '2022-03-25'),
                           (5, '023855992J', '2023-06-13', '2023-06-16'),
                           (20, '023855992J', '2023-07-21', '2023-07-24'),        
						   (7, '018398849U', '2024-04-15', '2024-04-24'),
						   (1, '018398849U', '2023-06-01', '2023-06-09'),
						   (27, '018398849U', '2023-07-10', '2023-07-12'),
						   (10, '018398849U', '2023-08-25', '2023-08-26'),
                           (16, '023855992J', '2022-10-07', '2022-10-10'),
                           (6, '023855992J', '2021-11-03', '2021-11-07'),
						   (26, '19380082Y', '2025-09-20', '2025-09-25'),
						   (11, '19380082Y', '2024-11-01', '2024-11-04'),
						   (18, '19380082Y', '2023-11-25', '2023-11-30'),
						   (14, '19380082Y', '2023-01-05', '2023-01-08'),
                           (25, '023855992J', '2023-12-05', '2023-12-13'),
                           (12, '023855992J', '2022-04-01', '2022-04-02'),
						   (17, '938209390J', '2023-01-11', '2023-01-15'),
						   (19, '938209390J', '2021-12-03', '2021-12-09'),
						   (15, '938209390J', '2023-08-13', '2023-08-16'),
						   (20, '938209390J', '2023-02-07', '2023-02-09'),
                           (28, '938209390J', '2022-03-21', '2022-03-27'),
                           (21, '938209390J', '2024-09-20', '2024-09-26'),
						   (13, '19380082Y', '2021-11-01', '2021-11-05'),
						   (26, '19380082Y', '2022-11-01', '2022-11-07'),
						   (3, '19380082Y', '2024-06-09', '2024-06-15'),
						   (5, '19380082Y', '2023-05-01', '2023-05-03'),
                           (22, '19380082Y', '2023-10-11', '2023-10-17'),
                           (7, '19380082Y', '2023-08-02', '2023-08-08'),
						   (10, '475829749I', '2021-11-21', '2021-11-26'),
						   (2, '475829749I', '2022-05-08', '2022-05-11'),
						   (25, '475829749I', '2024-07-07', '2024-07-13'),
						   (2, '475829749I', '2023-02-01', '2023-02-03'),
                           (28, '19380082Y', '2023-06-14', '2023-06-20'),
                           (4, '19380082Y', '2023-09-05', '2023-09-11'),
						   (23, '50286387H', '2021-01-01', '2021-01-03'),
						   (9, '50286387H', '2022-11-11', '2022-11-17'),
						   (6, '50286387H', '2024-09-13', '2024-09-14'),
						   (1, '50286387H', '2023-11-20', '2023-11-26'),
                           (27, '50286387H', '2023-04-01', '2023-04-07'),
                           (9, '50286387H', '2023-07-17', '2023-07-20'),
						   (24, '87297492Y', '2021-04-12', '2021-04-18'),
						   (11, '87297492Y', '2022-06-05', '2022-06-11'),
						   (19, '87297492Y', '2023-09-22', '2023-09-28'),
						   (15, '87297492Y', '2023-05-07', '2023-05-13'),
                           (20, '87297492Y', '2023-03-14', '2023-03-16'),
                           (24, '87297492Y', '2024-10-01', '2024-10-04'),
						   (17, '926836877J', '2021-11-01', '2021-11-01'),
						   (12, '926836877J', '2022-08-14', '2022-08-20'),
						   (22, '926836877J', '2024-01-01', '2024-01-05'),
						   (8, '926836877J', '2023-11-19', '2023-11-25'),
                           (16, '87297492Y', '2023-11-01', '2023-11-04'),
                           (25, '87297492Y', '2023-06-17', '2023-06-23'),
						   (23, '40976868Z', '2021-07-18', '2021-07-23'),
						   (14, '40976868Z', '2022-04-06', '2022-04-08'),
						   (18, '40976868Z', '2023-01-22', '2023-01-28'),
						   (9, '40976868Z', '2021-09-09', '2021-09-15'),
                           (26, '87297492Y', '2023-03-01', '2023-03-02'),
                           (13, '87297492Y', '2024-10-10', '2024-10-15'),  
						   (21, '829478921S', '2021-10-15', '2021-10-21'),
						   (28, '829478921S', '2022-06-02', '2022-06-07'),
						   (1, '829478921S', '2023-12-04', '2023-12-09'),
						   (3, '829478921S', '2023-04-18', '2023-04-23'),
                           (27, '87297492Y', '2023-09-07', '2023-09-14'),
                           (4, '87297492Y', '2024-08-15', '2024-08-21'),      
						   (7, '12863238Y', '2021-05-07', '2021-05-12'),
						   (10, '12863238Y', '2022-08-21', '2022-08-26'),
						   (14, '12863238Y', '2023-02-01', '2023-02-02'),
						   (8, '12863238Y', '2023-03-11', '2023-03-19'),
                           (1, '87297492Y', '2023-06-01', '2023-06-07'),
                           (5, '87297492Y', '2024-09-03', '2024-09-12'),
						   (13, '01730290I', '2021-09-01', '2021-09-04'),
						   (9, '01730290I', '2022-01-05', '2022-01-09'),
						   (1, '01730290I', '2023-02-01', '2023-02-02'),
						   (2, '87297492Y', '2023-04-19', '2023-04-26'),
                           (15, '87297492Y', '2023-01-10', '2023-01-17'),
                           (19, '01730290I', '2024-09-01', '2024-09-06'),
						   (6, '79217342T', '2021-03-20', '2021-03-29'),
						   (20, '79217342T', '2022-05-05', '2022-05-10'),
						   (11, '79217342T', '2023-07-15', '2023-07-20'),
						   (16, '87297492Y', '2023-12-20', '2023-12-21'),
                           (21, '87297492Y', '2023-08-05', '2023-08-10'),
                           (12, '79217342T', '2024-10-22', '2024-10-27'),       
						   (24, '19283788H', '2021-02-01', '2021-02-06'),
						   (27, '19283788H', '2022-06-10', '2022-06-15'),
						   (1, '19283788H', '2023-12-30', '2023-12-31'),
						   (5, '87297492Y', '2023-04-18', '2023-04-23'),
                           (22, '87297492Y', '2023-10-01', '2023-10-03'),
                           (17, '19283788H', '2024-12-05', '2024-12-10'),    
						   (25, '01829228U', '2021-01-05', '2021-01-10'),
						   (3, '01829228U', '2022-07-12', '2022-07-17'),
						   (23, '01829228U', '2023-05-21', '2023-05-26'),
						   (2, '87297492Y', '2023-02-14', '2023-02-19'),
                           (26, '87297492Y', '2023-10-08', '2023-10-10'),
                           (18, '01829228U', '2024-11-15', '2024-11-24'),  
						   (8, '43028234E', '2021-05-01', '2021-05-05'),
						   (10, '43028234E', '2022-08-25', '2022-08-28'),
						   (17, '43028234E', '2023-06-16', '2023-06-18'),
						   (28, '87297492Y', '2023-03-03', '2023-03-05'),
                           (13, '87297492Y', '2023-11-25', '2023-11-27'),
                           (18, '43028234E', '2024-12-20', '2024-12-22');

create table sala(
    codS int auto_increment primary key,
    telfS varchar (18) not null,
    aforoS int not null,
    paisS varchar (40) not null,
    ciudadS varchar (40) not null,
    dirS varchar (40) not null
);

INSERT INTO sala (telfS, aforoS, paisS, ciudadS, dirS)
VALUES ('+34 910 293 298', 170, 'España', 'Madrid', 'Av. de Felipe II'), -- 1 
       ('+34 912 783 755', 250, 'España', 'Madrid', ' P.º Bajo de la Virgen del Puerto'),
       ('+44 723 473 2345', 350, 'Inglaterra', 'Liverpool', '10 Mathew St'),
       ('+1 212 465 6000', 195, 'Italia', 'Parma', '4 Pennsylvania Plaza'),
       ('+49 30 254880', 200, 'Alemania', 'Bonn', 'Herbert-von-Karajan-Straße 1'), -- 5
       ('+49 69 13400', 100, 'Alemania', 'Bonn', 'Opernpl. 1'),
       ('+33 14 805 5611', 150, 'Francia', 'París', '105 rue Amelot'),
       ('+33 14 233 2288', 165, 'Francia', 'París', '42 Rue des Lombards'),
       ('+44 800 169 9933', 225, 'Paises Bajos', 'Amsterdam', '52 Albertich St'),
       ('+44 928 235 2229', 300, 'Inglaterra', 'Liverpool', '45 Southwark St'), -- 10
       ('+1 530 754 2787', 210, 'Italia', 'Milán', '523 Mrak Hall Dr'),
       ('+1 805 962 7411', 400, 'Islandia', 'Reikiavik', '1122 N Milpas St'), 
       ('+34 610 238 797', 130, 'España', 'Benidorm', ' km 121, Av. Comunidad Europea'),
       ('+34 619 538 882', 150, 'España', 'Maspalomas', 'C. Cruz de Ayala, 8'),
       ('+1 787 620 4444', 215, 'Puerto Rico', 'San Juan', 'C. Castro Rey'), -- 15
       ('+46 8 506 677 88', 180, 'Suecia', 'Stockholm', 'Hötorget 8'),
       ('+46 2 517 829 24', 150, 'Suecia', 'Kosta', 'Schülberg 12'),
       ('+353 1 417 0077', 320, 'Irlanda', 'Dublín', 'Earlsfort Terrace, Saint Kevin'),
       ('+52 283 984 2942', 435, 'México', 'Ciudad de México', 'Pedregal de Carrasco'),
       ('+57 263 7458832', 120, 'Colombia', 'Bolívar', 'Rubio del Catastro 12'), -- 20
       ('+1 905 940 5391', 155, 'Canadá', 'Niagara Falls', '8810 Niagara Falls Blvd'),
       ('+36 1 235 5500', 230, 'Hungría', 'Budapest', 'Zrínyi u. 5'),
       ('+503 6837 6294', 350, 'El Salvador', 'Punta Mango', 'Yucatán, 42'),
       ('+502 8462 7730', 260, 'Guatemala', 'Santa Cruz la Laguna', ' 29 Tistarem'),
       ('852 2894 7224', 190, 'Hong Kong', 'Wan Chai', '7 Harbour Rd'), -- 25
       ('+972 8 427 3005', 315, 'Israel', 'Mitzpe Ramon', '5 Camino a Río Viejo'),
       ('+56 23 894 0230', 200, 'Chile', 'Antofagasta', 'Av. Lituania 01151'),
       ('+81 154 93 2770', 140, 'Japón', 'Hokkaid', '4 Chome-4 Minami 9 Jonishi'),
       ('+86 28 9466 7399', 125, 'China', 'Cheng Du', 'Dsitrito Shikawtsy'); -- 29
       

create table toca(
    dniA varchar (10),
    codS int,
    fechaCon date,
    primary key (dniA, codS, fechaCon),
    foreign key (dniA) references artista(dniA) on delete cascade,
    foreign key (codS) references sala(codS) on delete cascade
);

-- Los valores de la siguiente tabla concuerdan con los de alojado puesto que, si un artista se encuentra
-- alojado esa semana en Milán, es porque uno de esos días toca en una de las salas de allí

INSERT INTO toca VALUES    ('89510285E', 1, '2022-12-04'),
						   ('89510285E', 13, '2023-06-25'),
						   ('89510285E', 14, '2021-02-14'),
						   ('89510285E', 7, '2023-04-30'),
                           ('89510285E', 11, '2023-10-04'),
                           ('89510285E', 2, '2023-10-13'),
						   ('62955711E', 21, '2024-05-12'),
						   ('62955711E', 28, '2023-04-06'),
						   ('62955711E', 17, '2021-08-04'),
						   ('62955711E', 19, '2022-11-04'),
                           ('62955711E', 5, '2023-01-03'),
                           ('62955711E', 4, '2023-12-09'),
						   ('72958826H', 1, '2024-01-20'),
						   ('72958826H', 16, '2023-02-26'),
						   ('72958826H', 20, '2021-08-01'),
						   ('72958826H', 8, '2022-02-20'),
						   ('72958826H', 3, '2023-08-05'),
						   ('72958826H', 26, '2023-11-18'),
						   ('29129956F', 29, '2022-05-15'),
						   ('29129956F', 23, '2023-04-03'),
						   ('29129956F', 3, '2021-01-22'),
						   ('29129956F', 7, '2023-03-08'),
                           ('29129956F', 25, '2023-07-18'),
                           ('72958826H', 1, '2024-06-21'),
						   ('70200137G', 15, '2022-05-13'),
						   ('70200137G', 11, '2023-01-02'),
						   ('70200137G', 22,'2023-02-12'),
						   ('70200137G', 16, '2023-03-22'),
                           ('70200137G', 20, '2021-02-10'),
                           ('70200137G', 21, '2022-06-21'),
						   ('39200192T', 18, '2023-05-02'),
						   ('39200192T', 13, '2023-06-13'),
						   ('39200192T', 2,'2021-07-25'),
						   ('39200192T', 1, '2023-09-02'),
                           ('70200137G', 12, '2022-10-15'),
                           ('70200137G', 24, '2022-05-18'),
						   ('99286356K', 2, '2022-10-11'),
						   ('99286356K', 1, '2023-11-22'),
						   ('99286356K', 2, '2024-01-02'),
						   ('99286356K', 15, '2023-03-20'),
                           ('99286356K', 14, '2021-07-15'),
                           ('99286356K', 6, '2024-12-14'), 
						   ('02663917F', 3, '2023-04-26'),
						   ('02663917F', 7, '2024-06-09'),
						   ('02663917F', 20, '2021-07-19'),
						   ('02663917F', 9, '2023-09-01'),
                           ('02663917F', 4, '2023-01-15'),
                           ('02663917F', 12, '2022-09-30'),
						   ('28738838G', 17, '2022-10-11'),
						   ('28738838G', 21, '2023-11-16'),
						   ('28738838G', 20, '2023-12-28'),
						   ('28738838G', 2, '2024-01-11'),
                           ('28738838G', 13, '2023-09-21'),
                           ('28738838G', 6, '2023-05-21'),
						   ('57883512T', 8, '2024-02-13'),
						   ('57883512T', 9, '2023-03-21'),
						   ('57883512T', 18, '2023-05-01'),
						   ('57883512T', 21, '2023-06-15'),
                           ('57883512T', 1, '2022-07-20'),
                           ('57883512T', 19, '2023-06-16'), 
						   ('19382209I', 24, '2024-07-22'),
						   ('19382209I', 2, '2023-09-02'),
						   ('19382209I', 1, '2023-10-11'),
						   ('19382209I', 22, '2021-11-22'),
                           ('19382209I', 7, '2023-11-10'),
                           ('19382209I', 13, '2022-09-08'),  
						   ('023855992J', 2, '2025-01-01'),
						   ('023855992J', 20, '2025-01-10'),
						   ('023855992J', 8, '2023-02-08'),
						   ('023855992J', 23, '2022-03-23'),
                           ('023855992J', 14, '2023-06-15'),
                           ('023855992J', 21, '2023-07-23'),        
						   ('018398849U', 3, '2024-04-23'),
						   ('018398849U', 1, '2023-06-02'),
						   ('018398849U', 27, '2023-07-11'),
						   ('018398849U', 9, '2023-08-26'),
                           ('023855992J', 17, '2022-10-09'),
                           ('023855992J', 6, '2021-11-04'),
						   ('19380082Y', 26, '2025-09-23'),
						   ('19380082Y', 4, '2024-11-02'),
						   ('19380082Y', 19, '2023-11-27'),
						   ('19380082Y', 15, '2023-01-06'),
                           ('023855992J', 25, '2023-12-10'),
                           ('023855992J', 11, '2022-04-01'),
						   ('938209390J', 18, '2023-01-13'),
						   ('938209390J', 20, '2021-12-08'),
						   ('938209390J', 16, '2023-08-15'),
						   ('938209390J', 21, '2023-02-08'),
                           ('938209390J', 28, '2022-03-25'),
                           ('938209390J', 21, '2024-09-24'),
						   ('19380082Y', 12, '2021-11-03'),
						   ('19380082Y', 26, '2022-11-05'),
						   ('19380082Y', 2, '2024-06-11'),
						   ('19380082Y', 14, '2023-05-02'),
                           ('19380082Y', 22, '2023-10-16'),
                           ('19380082Y', 10, '2023-08-07'),
						   ('475829749I', 9, '2021-11-23'),
						   ('475829749I', 1, '2022-05-10'),
						   ('475829749I', 25, '2024-07-12'),
						   ('475829749I', 1, '2023-02-02'),
                           ('19380082Y', 28, '2023-06-19'),
                           ('19380082Y', 13, '2023-09-10'),
						   ('50286387H', 23, '2021-01-01'),
						   ('50286387H', 7, '2022-11-15'),
						   ('50286387H', 5, '2024-09-14'),
						   ('50286387H', 2, '2023-11-24'),
                           ('50286387H', 27, '2023-04-05'),
                           ('50286387H', 8, '2023-07-19'),
						   ('87297492Y', 24, '2021-04-16'),
						   ('87297492Y', 4, '2022-06-10'),
						   ('87297492Y', 20, '2023-09-26'),
						   ('87297492Y', 16, '2023-05-10'),
                           ('87297492Y', 21, '2023-03-15'),
                           ('87297492Y', 24, '2024-10-02'),
						   ('926836877J', 18, '2021-11-01'),
						   ('926836877J', 11, '2022-08-18'),
						   ('926836877J', 22, '2024-01-03'),
						   ('926836877J', 8, '2023-11-20'),
                           ('87297492Y', 17, '2023-11-02'),
                           ('87297492Y', 25, '2023-06-20'),
						   ('40976868Z', 23, '2021-07-22'),
						   ('40976868Z', 15, '2022-04-07'),
						   ('40976868Z', 19, '2023-01-27'),
						   ('40976868Z', 7, '2021-09-12'),
                           ('87297492Y', 26, '2023-03-01'),
                           ('87297492Y', 12, '2024-10-12'),  
						   ('829478921S', 21, '2021-10-19'),
						   ('829478921S', 28, '2022-06-03'),
						   ('829478921S', 1, '2023-12-06'),
						   ('829478921S', 2, '2023-04-22'),
                           ('87297492Y', 27, '2023-09-12'),
                           ('87297492Y', 13, '2024-08-20'),      
						   ('12863238Y', 10, '2021-05-10'),
						   ('12863238Y', 9, '2022-08-25'),
						   ('12863238Y', 15, '2023-02-01'),
						   ('12863238Y', 7, '2023-03-12'),
                           ('87297492Y', 2, '2023-06-03'),
                           ('87297492Y', 14, '2024-09-11'),
						   ('01730290I', 12, '2021-09-02'),
						   ('01730290I', 8, '2022-01-08'),
						   ('01730290I', 1, '2023-02-01'),
						   ('87297492Y', 1, '2023-04-24'),
                           ('87297492Y', 16, '2023-01-15'),
                           ('01730290I', 20, '2024-09-05'),
						   ('79217342T', 6, '2021-03-24'),
						   ('79217342T', 21, '2022-05-09'),
						   ('79217342T', 4, '2023-07-19'),
						   ('87297492Y', 17, '2023-12-21'),
                           ('87297492Y', 21, '2023-08-08'),
                           ('79217342T', 11, '2024-10-25'),       
						   ('19283788H', 24, '2021-02-04'),
						   ('19283788H', 27, '2022-06-13'),
						   ('19283788H', 2, '2023-12-31'),
						   ('87297492Y', 14, '2023-04-21'),
                           ('87297492Y', 22, '2023-10-02'),
                           ('19283788H', 18, '2024-12-08'),    
						   ('01829228U', 25, '2021-01-08'),
						   ('01829228U', 2, '2022-07-15'),
						   ('01829228U', 23, '2023-05-24'),
						   ('87297492Y', 1, '2023-02-15'),
                           ('87297492Y', 26, '2023-10-09'),
                           ('01829228U', 19, '2024-11-22'),  
						   ('43028234E', 7, '2021-05-03'),
						   ('43028234E', 9, '2022-08-27'),
						   ('43028234E', 18, '2023-06-17'),
						   ('87297492Y', 28, '2023-03-04'),
                           ('87297492Y', 12, '2023-11-26'),
                           ('43028234E', 19, '2024-12-21');
                           

create table zona(
    codS int,
    codZ varchar (20),
    precioZ decimal (6,2) not null,
    aforoZ int not null,
    accesoPrior decimal (5,2),
    primary key (codS, codZ),
    foreign key (codS) references sala(codS) on delete cascade -- En caso de eliminar la sala, se eliminan sus zonas
);

INSERT INTO zona
VALUES (1, 1, 25.00, 40, null),
	   (1, 2, 35.80, 20, null),
       (1, 3, 55.00, 50, 20.10),
       (1, 4, 75.00, 30, 30.25),
       (1, 5, 105.00, 30, 42.15),
       (2, 1, 35.00, 110, null),
       (2, 2, 80.30, 90, null),
       (2, 3, 112.05, 50, null),
       (3, 1, 55.00, 100, null),
       (3, 2, 70.00, 70, null),
       (3, 3, 97.60, 50, null),
       (3, 4, 112.40, 50, 75.60),
       (3, 5, 142.30, 50, 75.60),
       (3, 6, 197.05, 30, 75.60),
       (4, 1, 35.00, 195, 20.15),
       (5, 1, 25.50, 120, null),
       (5, 2, 40.30, 50, null),
       (5, 3, 62.85, 30, 15.80),
       (6, 1, 42.60, 100, 22.30),
       (7, 1, 33.20, 110, null),
       (7, 2, 41.30, 40, null),
       (8, 1, 51.20, 105, null),
       (8, 2, 68.00, 60, null),
       (9, 1, 35.00, 120, null),
       (9, 2, 39.10, 65, null), 
       (9, 3, 43.80, 40, 25.70),
       (10, 1, 28.00, 110, null),
       (10, 2, 35.00, 120, null),
       (10, 3, 52.60, 40, 15.80),
       (10, 4, 25.00, 30, 35.20),
       (11, 1, 45.00, 210, 38.90),
       (12, 1, 22.00, 220, null),
       (12, 2, 37.20, 120, null),
       (12, 3, 57.80, 60, null),
       (13, 1, 37.85, 130, null),
       (14, 1, 28.00, 100, null),
       (14, 2, 35.50, 50, 28.95),
       (15, 1, 47.00, 150, null),
       (15, 2, 62.00, 65, null),
       (16, 1, 42.00, 180, 19.95),
       (17, 1, 26.60, 150, null), 
       (18, 1, 31.20, 130, null),
       (18, 2, 39.20, 100, null),
       (18, 3, 45.60, 90, null),
       (19, 1, 46.00, 100, null),
       (19, 2, 59.00, 200, null),
       (19, 3, 75.00, 135, 39.85),
       (20, 1, 120.30, 120, null),
       (21, 1, 87.00, 155, null),
       (22, 1, 47.00, 130, null), 
       (22, 2, 59.00, 100, 29.60),
       (23, 1, 55.00, 180, null),
       (23, 2, 75.00, 90, null),
       (23, 3, 95.00, 80, 15.80),
       (24, 1, 23.20, 180, null),
       (24, 2, 41.00, 80, null),
       (25, 1, 69.00, 190, null),
       (26, 1, 43.00, 110, null),
       (26, 2, 47.00, 135, null),
       (26, 3, 96.00, 70, 52.95),
       (27, 1, 30.80, 90, null), 
       (27, 2, 56.00, 60, null),
       (27, 3, 73.05, 50, null),
       (28, 1, 73.80, 140, 27.95),  
       (29, 1, 55.35, 125, null);
       
-- COMPROBACIÓN DE AFORO ZONAS Y AFORO SALA (el total de aforo en las zonas es el aforo de la sala)
select sala.codS, sala.aforoS as aforoSala, sum(zona.aforoZ) as aforoZonas
    from sala inner join zona on sala.codS = zona.codS
    group by sala.codS, sala.aforoS;
       

create table persona(
    dniP varchar (10) primary key,
    email varchar (100) not null,
    nomP varchar (30) not null,
	ape1P varchar (30) not null,
	ape2P varchar (30) not null
);

INSERT INTO persona
VALUES ('01939028Y', 'enrique92@gmail.com', 'Enrique', 'Durán', 'López'),
	   ('65737428R', 'francisco67@gmail.com', 'Francisco Manuel', 'de las Heras', 'Gómez'),
	   ('72525506C', 'monii03@gmail.com', 'Mónica', 'Perera', 'Orduño'),
	   ('86510562H', 'polpl00@gmail.com', 'Pol', 'Plasencia', 'Díez'),
	   ('12466633N', 'alamorr123@gmail.com', 'Alain', 'Amor', 'Gutiérrez'),
	   ('70311854A', 'castrosid@gmail.com', 'Jose Joaquín', 'de Castro', 'Sidero'),
	   ('00148122W', 'dierbasbb34@gmail.com', 'Basile', 'Blanchard', 'Brunet'),
	   ('81301756E', 'lionrawrr99@gmail.com', 'Léo', 'Olivier', 'Bernard'),
	   ('93088388M', 'jolicoup88@gmail.com', 'Célestine', 'Joly', 'Dupuy'),
	   ('73135465L', 'hectordubaguette7@gmail.com', 'Hector', 'Béthuleau', 'Martin'),
	   ('03733000P', 'baptrouxxx@gmail.com', 'Baptiste', 'Roux', 'Martin'),
	   ('02330636T', 'leoo0239@gmail.com', 'Leovigildo', 'Ibañez','Iglesias'),
	   ('92446985A', 'teguipel08@gmail.com', 'Pelayo', 'Lopetegui', 'Mendieta'),
	   ('20312302J', 'botas39@gmail.com', 'Mercedes', 'Castro', 'Botín'),
	   ('28535250R', 'rosellaitor@gmail.com', 'Aitor', 'Berlanga', 'Rosell'),
	   ('37736096L', 'cayetanaporsiempre@gmail.com', 'Cayetana', 'Entrerríos', 'Castro'),
	   ('56864646K', 'espada88@gmail.com', 'María', 'Ochoa', 'Espada'),
	   ('61293051Y', 'castillotom48@gmail.com', 'Tomás', 'Castillo', 'Ibañez'),
	   ('79739899A', 'viktse10@gmail.com', 'Viktoria', 'Tsvetáyeva', 'Rajmáninov'),
	   ('61377844K', 'konstantuli@gmail.com', 'Konstantín', 'Tarkovski', 'Uliánov'),
	   ('87873435A', 'zelfi47@gmail.com', 'Zelfira', 'Tarkovski', 'Chaikovski'),
	   ('19948826Y', 'bakziai43@gmail.com', 'Serguéi', 'Zinoviévna', 'Bakunin'),
	   ('27399153N', 'stradivarius35@gmail.com', 'Serguéi', 'Trotski', 'Stravinski'),
	   ('31603553N', 'vikkibun12@gmail.com', 'Viktoria', 'Tolstói', 'Bunin'),
	   ('05857005D', 'enrique92@gmail.com', 'Filippo', 'Fallaci', 'Ariosto'),
	   ('74879728P', 'enrique92@gmail.com', 'Giacomo', 'Gentileschi', 'Monteverdi'),
	   ('97835424W', 'calvinbea29@gmail.com', 'Beatrice', 'Verdone', 'Calvino'),
	   ('96485032D', 'oricuatrostacione@gmail.com', 'Oriana', 'Basilli', 'Vivaldi'),
	   ('09308483S', 'asimovcosmos@gmail.com', 'Amos', 'Cosimo', 'Malatesta'),
	   ('78686813H', 'benitoo23@gmail.com', 'Gualterio', 'Benni', 'Basilli'),
	   ('72486812N', 'mahler09@gmail.com', 'Ludwig', 'Kant', 'Nietzsche'),
	   ('14192694S', 'wernerende01@gmail.com', 'Werner', 'Ribbentrop', 'Ende'),
	   ('90900565B', 'hilderkoll19@gmail.com', 'Hildegarda', 'Kollwitz', 'Fuchs'),
	   ('78626118C', 'loboestepario@gmail.com', 'Hermann', 'Hesse', 'Goethe'),
	   ('95690794F', 'streifenheisen@gmail.com', 'Lutz', 'Krosigk', 'Brecht'),
	   ('50655019A', 'angiegrimmer@gmail.com', 'Angela', 'Grimm', 'Göring'),
	   ('13390082B', 'evewhite907gmail.com', 'Evelyn', 'White', 'Bouchard'),
	   ('28217065K', 'ashstemn@gmail.com', 'Asher', 'Stewart', 'Simard'),
	   ('09248574K', 'charol42@gmail.com', 'Charlotte', 'Martin', 'Anderson'),
	   ('84210194H', 'rosli98@gmail.com', 'Claire', 'Li', 'Ross'),
	   ('31608254K', 'huntermor@gmail.com', 'Hunter', 'Moore', 'Singh'),
       ('59944833W', 'gravel.anouk@hotmail.com', 'Luke', 'Richard', 'Gagnon'),
       ('07066179G', 'ballard@lavoie.net', 'Violet', 'Belanger', 'Audet'),
       ('59476958Q', 'elapierre@blais.org', 'Ethan', 'Lee', 'Blais'),
       ('39557702W', 'max19@james.com', 'Eoin', 'Buckley', 'James'),
       ('04047453M', 'carrie26@yahoo.com', 'Nathan', 'O’Callaghan ', 'Evans'),
       ('49107008F', 'christian39@yahoo.co.uk', 'Elsie', 'Clarke', 'Frank'),
       ('39382125F', 'teagan.rogers@murphy.com', 'William', 'Foley', 'Butler'),
       ('67348101F', 'lindsay16@gmail.com', 'Annie', 'Kenny', 'Pine'),
       ('99618909K', 'borges.tatiana@sapo.pt', 'Diana', 'Garcia', 'Rua'),
       ('25382155E', 'samuel70@rocha.com', 'Valentim', 'Mendes', 'Ribeiro'),
       ('43635340Q', 'rita.assuncao@leite.org', 'Benjamim', 'Alves', 'Melo'),
       ('96750638B', 'camila.teixeira@clix.pt', 'Violeta', 'Cardoso', 'Tavares'),
       ('08989009B', 'mendes.matheus@mail.pt', 'Alexandra', 'Matias', 'Andrade'),
       ('91956398Y', 'nicole25@lopes.net', 'Emanuel', 'Amaral ', 'de Faria'),
       ('87718550T', 'esteves.claudio@gmail.com', 'Tiago', 'Figueiredo', 'Cunha'),
       ('56760587Z', 'ppfannerstill@gmail.com', 'Bailee', 'Smitham', 'Kohler '),
       ('28866379E', 'lueilwitz.giovanna@hotmail.com', 'Mohamed', 'Donnelly', 'Weimann'),
       ('87787430H', 'bosco.aurelio@gmail.com', 'Una', 'VonRueden', 'Maybellville'),
       ('08952144S', 'kylie.barton@crooks.parliament.nz', 'Beverly', 'Breitenberg', 'Cordieville'),
       ('79571674T', 'eokon@kirlin.parliament.nz', 'Godfrey', 'Bahringer', 'Shanahan'),
	   ('03521827K', 'superpepe12@hotmail.com', 'José', 'García', 'Leonés'),
	   ('49739874M', 'campillo22p@hotmail.com', 'José', 'Pablo', 'Campillo'),
	   ('96561226G', 'hughesquinn@gmail.com', 'Quinn', 'Lexend', 'Hughes'),
	   ('67656217S', 'thenextgod96@hotmail.com', 'Christopher', 'Jones', 'Smith'),
	   ('54376238Y', 'pregame@admissions.com', 'Lucas', 'Ramirez', 'Steal'),
	   ('46179648H', 'costajuana@gmail.com', 'Juana', 'Costa', 'Hernández'),
	   ('40072532T', 'bravoaurora27@gmail.com', 'Aurora', 'Bravo', 'Fernández');


create table entrada(
    localizador varchar (8) primary key,
    artistaE varchar (10) not null,
    zonaE varchar (20) not null,
    fechaE date not null,
    apE int, -- 0 si no han seleccionado o no hay opción de acceso prioritario y 1 si lo han cogido
    dniP varchar (10) not null,
    pago int not null, -- consideraremos 1 con tarjeta, 2 con PayPal, 3 en taquilla y 4 otros
    numE int check (numE>=1 and numE<=6) not null,
    codS int not null,
    fechaVenta date not null,
    fechaSoldout date,
    foreign key (dniP) references persona(dniP) on update cascade,
    foreign key (codS) references sala(codS) on update cascade on delete cascade,
    foreign key (codS, zonaE) references zona(codS, codZ) on update cascade,
    foreign key (artistaE) references artista(dniA) on update cascade,
    foreign key (artistaE, codS, fechaE) references toca(dniA, codS, fechaCon) on update cascade -- "checkea" que el artista toca ese día en esa sala
); 
INSERT INTO entrada VALUES ('ABC12345', '89510285E', '1', '2023-06-25', 0,'01939028Y', 2, 5, 13, '2023-04-01', null),
						   ('ABC12343', '89510285E', '1', '2023-06-25', 0,'70311854A', 3, 1, 13, '2023-04-01', null),
                           ('ABC12341', '89510285E', '1', '2023-06-25', 0,'03733000P', 4, 6, 13, '2023-04-01', null),
                           ('ABC12342', '89510285E', '1', '2023-06-25', 0,'92446985A', 1, 5, 13, '2023-04-01', null),
                           ('ABC12344', '89510285E', '1', '2023-06-25', 0,'00148122W', 1, 3, 13, '2023-04-01', null),
                           ('ABC12347', '89510285E', '1', '2023-06-25', 0,'03733000P', 4, 6, 13, '2023-04-01', null),  
                           ('AOFI2020', '39200192T', '1', '2023-06-13', 0,'96750638B', 2, 5, 13, '2023-04-12', null),
                           ('AOFI2021', '39200192T', '1', '2023-06-13', 0,'56760587Z', 3, 2, 13, '2023-04-12', null),
                           ('AOFI2022', '39200192T', '1', '2023-06-13', 0,'67656217S', 3, 1, 13, '2023-04-12', null),
                           ('AOFI2023', '39200192T', '1', '2023-06-13', 0,'03733000P', 1, 1, 13, '2023-04-12', null),
                           ('AOFI2024', '39200192T', '1', '2023-06-13', 0,'79571674T', 4, 6, 13, '2023-04-12', null),
                           ('AOFI2025', '39200192T', '1', '2023-06-13', 0,'03521827K', 2, 6, 13, '2023-04-12', null),
                           ('LSIR3010', '28738838G', '1', '2023-09-21', 0,'05857005D', 2, 1, 13, '2023-08-03', null),
						   ('LSIR3011', '28738838G', '1', '2023-09-21', 0,'13390082B', 2, 2, 13, '2023-08-03', null),
						   ('LSIR3012', '28738838G', '1', '2023-09-21', 0,'74879728P', 1, 3, 13, '2023-08-03', null),
						   ('LSIR3013', '28738838G', '1', '2023-09-21', 0,'07066179G', 3, 4, 13, '2023-08-03', null),
                           ('LSIR3014', '28738838G', '1', '2023-09-21', 0,'49107008F', 4, 3, 13, '2023-08-03', null),
                           ('LSIR3015', '28738838G', '1', '2023-09-21', 0,'19948826Y', 4, 4, 13, '2023-08-03', null),  
                           ('PDIW9280', '19382209I', '1', '2022-09-08', 0,'31603553N', 3, 3, 13, '2022-07-10', null),
                           ('PDIW9281', '19382209I', '1', '2022-09-08', 0,'97835424W', 1, 5, 13, '2022-07-10', null),
                           ('PDIW9282', '19382209I', '1', '2022-09-08', 0,'20312302J', 1, 5, 13, '2022-07-10', null),
                           ('PDIW9283', '19382209I', '1', '2022-09-08', 0,'09308483S', 4, 1, 13, '2022-07-10', null),
                           ('PDIW9284', '19382209I', '1', '2022-09-08', 0,'50655019A', 2, 2, 13, '2022-07-10', null),
                           ('PDIW9285', '19382209I', '1', '2022-09-08', 0,'79571674T', 2, 4, 13, '2022-07-10', null),    
                           ('QPEI0290', '19380082Y', '1', '2023-09-10', 0,'31608254K', 1, 6, 13, '2023-02-19', null),
                           ('QPEI0291', '19380082Y', '1', '2023-09-10', 0,'14192694S', 1, 4, 13, '2023-02-19', null),
                           ('QPEI0292', '19380082Y', '1', '2023-09-10', 0,'92446985A', 2, 2, 13, '2023-02-19', null),
                           ('QPEI0293', '19380082Y', '1', '2023-09-10', 0,'19948826Y', 4, 2, 13, '2023-02-19', null),
                           ('QPEI0294', '19380082Y', '1', '2023-09-10', 0,'72486812N', 3, 1, 13, '2023-02-19', null),
                           ('QPEI0295', '19380082Y', '1', '2023-09-10', 0,'84210194H', 3, 5, 13, '2023-02-19', null),
                           ('QPEI0296', '19380082Y', '1', '2023-09-10', 0,'67348101F', 4, 6, 13, '2023-02-19', null),
                           ('WIDO2010', '87297492Y', '1', '2024-08-20', 0,'28866379E', 2, 3, 13, '2023-11-12', null),
                           ('WIDO2011', '87297492Y', '1', '2024-08-20', 0,'12466633N', 2, 3, 13, '2023-11-12', null),
                           ('WIDO2012', '87297492Y', '1', '2024-08-20', 0,'20312302J', 2, 3, 13, '2023-11-12', null),
                           ('WIDO2013', '87297492Y', '1', '2024-08-20', 0,'27399153N', 2, 3, 13, '2023-11-12', null),
                           ('WIDO2014', '87297492Y', '1', '2024-08-20', 0,'14192694S', 2, 3, 13, '2023-11-12', null),
                           ('WIDO2015', '87297492Y', '1', '2024-08-20', 0,'99618909K', 2, 3, 13, '2023-11-12', null),
                           ('WIDO2016', '87297492Y', '1', '2024-08-20', 0,'31608254K', 2, 3, 13, '2023-11-12', null),
						   ('FGHIJ456', '62955711E', '1' , '2023-12-09',0, '01939028Y', 1, 2, 4, '2023-06-12', null),
                           ('FGHIJ455', '62955711E', '1' , '2023-12-09',0, '93088388M', 2, 2, 4, '2023-06-12', null),
                           ('FGHIJ453', '62955711E', '1' , '2023-12-09',0, '01939028Y', 3, 4, 4, '2023-06-12', null),
                           ('FGHIJ457', '62955711E', '1' , '2023-12-09',0, '56864646K', 4, 1, 4, '2023-06-12', null),
                           ('FGHIJ458', '62955711E', '1' , '2023-12-09',0, '92446985A', 2, 1, 4, '2023-06-12', null),
                           ('FGHIJ459', '62955711E', '1' , '2023-12-09',0, '28535250R', 2, 5, 4, '2023-06-12', null),   
                           ('OSUEI920', '02663917F', '1', '2023-01-15', 0,'87787430H', 4, 2, 4, '2022-06-06', null),
                           ('OSUEI921', '02663917F', '1', '2023-01-15', 0,'70311854A', 1, 1, 4, '2022-06-06', null),
                           ('OSUEI922', '02663917F', '1', '2023-01-15', 0,'28535250R', 2, 5, 4, '2022-06-06', null),
                           ('OSUEI923', '02663917F', '1', '2023-01-15', 0,'31603553N', 2, 6, 4, '2022-06-06', null),
                           ('OSUEI924', '02663917F', '1', '2023-01-15', 0,'90900565B', 3, 2, 4, '2022-06-06', null),
                           ('OSUEI925', '02663917F', '1', '2023-01-15', 0,'59944833W', 3, 4, 4, '2022-06-06', null),
                           ('DHIWO194', '19380082Y', '1', '2024-11-02', 0,'25382155E', 2, 3, 4, '2023-12-05', null),
                           ('DHIWO195', '19380082Y', '1', '2024-11-02', 0,'08952144S', 2, 1, 4, '2023-12-05', null),
                           ('DHIWO196', '19380082Y', '1', '2024-11-02', 0,'00148122W', 4, 2, 4, '2023-12-05', null),
                           ('DHIWO197', '19380082Y', '1', '2024-11-02', 0,'37736096L', 1, 6, 4, '2023-12-05', null),
                           ('DHIWO198', '19380082Y', '1', '2024-11-02', 0,'05857005D', 1, 3, 4, '2023-12-05', null),
                           ('DHIWO199', '19380082Y', '1', '2024-11-02', 0,'78626118C', 3, 3, 4, '2023-12-05', null),
                           ('KDIAJ100', '87297492Y', '1', '2022-06-10', 0,'07066179G', 2, 4, 4, '2022-01-23', null),
                           ('KDIAJ101', '87297492Y', '1', '2022-06-10', 0,'43635340Q', 2, 5, 4, '2022-01-23', null),
                           ('KDIAJ102', '87297492Y', '1', '2022-06-10', 0,'79571674T', 1, 3, 4, '2022-01-23', null),
                           ('KDIAJ103', '87297492Y', '1', '2022-06-10', 0,'81301756E', 3, 2, 4, '2022-01-23', null),
                           ('KDIAJ104', '87297492Y', '1', '2022-06-10', 0,'56864646K', 2, 5, 4, '2022-01-23', null),
                           ('KDIAJ105', '87297492Y', '1', '2022-06-10', 0,'74879728P', 2, 2, 4, '2022-01-23', null),
                           ('OAJQU025','79217342T', '1','2023-07-19', 0,'95690794F', 2, 1, 4, '2023-05-19', null),
                           ('OAJQU026','79217342T', '1','2023-07-19', 0,'59476958Q', 3, 6, 4, '2023-05-19', null),
                           ('OAJQU027','79217342T', '1','2023-07-19', 0,'96750638B', 4, 6, 4, '2023-05-19', null),
                           ('OAJQU028','79217342T', '1','2023-07-19', 0,'03521827K', 3, 3, 4, '2023-05-19', null),
                           ('OAJQU029','79217342T', '1','2023-07-19', 0,'93088388M', 1, 5, 4, '2023-05-19', null),
                           ('OAJQU020','79217342T', '1','2023-07-19', 0,'61293051Y', 1, 2, 4, '2023-05-19', null),
                           ('KLMNO789', '62955711E', '1', '2023-04-06',0, '65737428R', 1, 1, 28, '2022-12-29', null),
                           ('KLMNO780', '62955711E', '1', '2023-04-06', 0,'08989009B', 2, 2, 28, '2022-12-29', null),
                           ('KLMNO781', '62955711E', '1', '2023-04-06', 0,'59944833W', 2, 5, 28, '2022-12-29', null),
                           ('KLMNO782', '62955711E', '1', '2023-04-06', 0,'14192694S', 3, 6, 28, '2022-12-29', null),
                           ('KLMNO783', '62955711E', '1', '2023-04-06', 0,'87787430H', 1, 6, 28, '2022-12-29', null),
                           ('KLMNO784', '62955711E', '1', '2023-04-06', 0,'40072532T', 3, 3, 28, '2022-12-29', null), 
                           ('CIFIK290', '938209390J', '1','2022-03-25', 0,'97835424W', 2, 3, 28, '2021-09-30', null),
                           ('CIFIK292', '938209390J', '1','2022-03-25', 0,'39557702W', 1, 1, 28, '2021-09-30', null),
                           ('CIFIK293', '938209390J', '1','2022-03-25', 0,'08989009B', 4, 2, 28, '2021-09-30', null),
                           ('CIFIK294', '938209390J', '1','2022-03-25', 0,'49739874M', 4, 3, 28, '2021-09-30', null),
                           ('CIFIK295', '938209390J', '1','2022-03-25', 0,'73135465L', 1, 6, 28, '2021-09-30', null),
                           ('CIFIK296', '938209390J', '1','2022-03-25', 0,'79739899A', 1, 6, 28, '2021-09-30', null), 
                           ('IAOJI028', '19380082Y', '1','2023-06-19', 0,'96485032D', 2, 6, 28, '2023-01-19', null),
                           ('IAOJI029', '19380082Y', '1','2023-06-19', 0,'13390082B', 3, 6, 28, '2023-01-19', null),
                           ('IAOJI020', '19380082Y','1', '2023-06-19', 0,'04047453M', 1, 5, 28, '2023-01-19', null),
                           ('IAOJI021', '19380082Y','1', '2023-06-19', 0,'91956398Y', 1, 2, 28, '2023-01-19', null),
                           ('IAOJI022', '19380082Y','1', '2023-06-19', 0,'96561226G', 2, 1, 28, '2023-01-19', null),
                           ('IAOJI023', '19380082Y', '1','2023-06-19', 0,'03733000P', 2, 2, 28, '2023-01-19', null),
                           ('WIDU0670','829478921S', '1','2022-06-03', 0,'61377844K', 2, 6, 28, '2022-04-25', null),
                           ('WIDU0671','829478921S','1', '2022-06-03', 0,'09308483S', 3, 5, 28, '2022-04-25', null),
                           ('WIDU0672','829478921S', '1','2022-06-03', 0,'61377844K', 1, 2, 28, '2022-04-25', null),
                           ('KQRFS923', '87297492Y','1', '2023-03-04', 0,'78686813H', 1, 6, 28, '2022-10-10', null),
                           ('KQRFS924', '87297492Y', '1','2023-03-04', 0,'09248574K', 3, 3, 28, '2022-10-10', null),
                           ('KQRFS925', '87297492Y', '1','2023-03-04', 0,'39382125F', 2, 3, 28, '2022-10-10', null),
						   ('PQRSTU12', '89510285E', '1', '2023-10-04',0, '65737428R', 3, 4, 11, '2023-09-09', null),
                           ('PQRSTU13', '89510285E', '1', '2023-10-04', 0,'27399153N', 2, 2, 11, '2023-09-09', null),
                           ('PQRSTU14', '89510285E', '1', '2023-10-04', 0,'25382155E', 1, 3, 11, '2023-09-09', null),
                           ('PQRSTU15', '89510285E', '1', '2023-10-04',0,'96750638B', 2, 3, 11, '2023-09-09', null),
                           ('PQRSTU16', '89510285E', '1', '2023-10-04', 0,'08989009B', 1, 5, 11, '2023-09-09', null),
                           ('PQRSTU17', '89510285E', '1', '2023-10-04', 0,'84210194H', 1, 1, 11, '2023-09-09', null), 
                           ('SOQUH010', '70200137G', '1', '2023-01-02', 0,'56760587Z', 1, 4, 11, '2022-04-19', null),
                           ('SOQUH019', '70200137G', '1', '2023-01-02', 0,'86510562H', 1, 6, 11, '2022-04-19', null),
                           ('SOQUH011', '70200137G', '1', '2023-01-02', 0,'54376238Y', 1, 3, 11, '2022-04-19', null),
                           ('SOQUH012', '70200137G', '1', '2023-01-02', 0,'92446985A', 2, 5, 11, '2022-04-19', null),
                           ('SOQUH013', '70200137G', '1', '2023-01-02', 0,'19948826Y', 2, 2, 11, '2022-04-19', null),
                           ('SOQUH014', '70200137G', '1', '2023-01-02', 0,'72486812N', 1, 1, 11, '2022-04-19', null),  
                           ('BDIHEO00', '023855992J', '1', '2022-04-01',0, '84210194H', 1, 6, 11, '2021-12-12', null),
                           ('BDIHEO09', '023855992J', '1', '2022-04-01', 0,'67348101F', 1, 6, 11, '2021-12-12', null),
                           ('BDIHEO08', '023855992J', '1', '2022-04-01', 0,'12466633N', 1, 5, 11, '2021-12-12', null),
                           ('BDIHEO07', '023855992J', '1', '2022-04-01', 0,'20312302J', 4, 1, 11, '2021-12-12', null),
                           ('BDIHEO06', '023855992J', '1', '2022-04-01', 0,'46179648H', 2, 3, 11, '2021-12-12', null),
                           ('BDIHEO05', '023855992J', '1', '2022-04-01', 0,'28866379E', 2, 2, 11, '2021-12-12', null),
                           ('HWISY029', '926836877J', '1', '2022-08-18', 0,'14192694S', 1, 5, 11, '2022-02-12', null),
                           ('HWISY025', '926836877J', '1', '2022-08-18', 0,'31608254K', 1, 3, 11, '2022-02-12', null),
                           ('HWISY023', '926836877J', '1', '2022-08-18', 0,'99618909K', 3, 2, 11, '2022-02-12', null),
                           ('HWISY027', '926836877J', '1', '2022-08-18', 0,'87787430H', 2, 3, 11, '2022-02-12', null),
                           ('HWISY022', '926836877J', '1', '2022-08-18', 0,'40072532T', 2, 4, 11, '2022-02-12', null),
                           ('HWISY021', '926836877J', '1', '2022-08-18', 0,'27399153N', 4, 1, 11, '2022-02-12', null),
                           ('Y5Z6A7B8', '99286356K', '1', '2024-12-14', 0,'07066179G', 2, 3, 6, '2023-03-16', null),
                           ('Y5Z6A7B9', '99286356K', '1', '2024-12-14', 0,'90900565B', 1, 2, 6, '2023-03-16', null),
                           ('Y5Z6A7B0', '99286356K', '1', '2024-12-14', 0,'95690794F', 4, 3, 6, '2023-03-16', null),
                           ('Y5Z6A7B7', '99286356K', '1', '2024-12-14', 0,'67348101F', 4, 3, 6, '2023-03-16', null),
                           ('Y5Z6A7B6', '99286356K', '1', '2024-12-14', 0,'46179648H', 3, 5, 6, '2023-03-16', null),
                           ('Y5Z6A7B5', '99286356K', '1', '2024-12-14', 0,'87873435A', 2, 1, 6, '2023-03-16', null),
                           ('Y5Z6A7B4', '99286356K', '1', '2024-12-14', 0,'43635340Q', 2, 1, 6, '2023-03-16', null), 
                           ('AUWUHD91', '28738838G', '1','2023-05-21', 1,'01939028Y', 1, 3, 6, '2023-03-15', '2023-03-19'),
                           ('AUWUHD92', '28738838G', '1','2023-05-21', 1,'65737428R', 1, 5, 6, '2023-03-15', '2023-03-19'),
                           ('AUWUHD93', '28738838G', '1','2023-05-21', 1,'72525506C', 4, 2, 6, '2023-03-15', '2023-03-19'),
                           ('AUWUHD94', '28738838G', '1','2023-05-21', 1,'86510562H', 3, 1, 6, '2023-03-15', '2023-03-19'),
                           ('AUWUHD95', '28738838G', '1','2023-05-21', 1,'12466633N', 2, 4, 6, '2023-03-15', '2023-03-19'),
                           ('AUWUHD96', '28738838G', '1','2023-05-21', 1,'70311854A', 3, 3, 6, '2023-03-15', '2023-03-19'), 
                           ('AUWUHD97', '28738838G', '1','2023-05-21', 1,'00148122W', 4, 6, 6, '2023-03-15', '2023-03-19'),
                           ('AUWUHD98', '28738838G', '1','2023-05-21', 1,'81301756E', 1, 6, 6, '2023-03-15', '2023-03-19'),
                           ('AUWUHD99', '28738838G', '1','2023-05-21', 1,'93088388M', 1, 3, 6, '2023-03-15', '2023-03-19'),
                           ('AUWUHD12', '28738838G', '1','2023-05-21', 1,'73135465L', 4, 5, 6, '2023-03-15', '2023-03-19'),
                           ('AUWUHD14', '28738838G', '1','2023-05-21',1, '03733000P', 3, 3, 6, '2023-03-15', '2023-03-19'),
                           ('AUWUHD13', '28738838G', '1','2023-05-21', 1,'02330636T', 4, 4, 6, '2023-03-15', '2023-03-19'),
                           ('AUWUHD15', '28738838G', '1','2023-05-21',1, '92446985A', 2, 6, 6, '2023-03-15', '2023-03-19'),
                           ('AUWUHD16', '28738838G', '1','2023-05-21', 1,'20312302J', 1, 5, 6, '2023-03-15', '2023-03-19'),
                           ('AUWUHD17', '28738838G', '1','2023-05-21', 1,'28535250R', 1, 4, 6, '2023-03-15', '2023-03-19'),
                           ('AUWUHD18', '28738838G', '1','2023-05-21', 1,'37736096L', 2, 5, 6, '2023-03-15', '2023-03-19'),
                           ('AUWUHD19', '28738838G', '1','2023-05-21', 1,'56864646K', 4, 6, 6, '2023-03-15', '2023-03-19'),
                           ('AUWUHD21', '28738838G', '1','2023-05-21', 1,'61293051Y', 2, 5, 6, '2023-03-15', '2023-03-19'),
                           ('AUWUHD22', '28738838G', '1','2023-05-21', 1,'79739899A', 3, 2, 6, '2023-03-15', '2023-03-19'),
                           ('AUWUHD23', '28738838G', '1','2023-05-21', 1,'61377844K', 1, 6, 6, '2023-03-15', '2023-03-19'),
                           ('AUWUHD24', '28738838G', '1','2023-05-21', 1,'87873435A', 1, 6, 6, '2023-03-15', '2023-03-19'),
                           ('AUWUHD25', '28738838G', '1','2023-05-21', 1,'19948826Y', 3, 4, 6, '2023-03-15', '2023-03-19'),
                           ('AUWUHD26', '28738838G', '1','2023-05-21', 1,'74879728P', 2, 6, 6, '2023-03-15', '2023-03-19'),
                           ('FJEIJD23', '023855992J', '1', '2021-11-04', 0,'96750638B', 4, 2, 6, '2021-04-11', '2021-04-30'),
                           ('FJEIJD24', '023855992J', '1', '2021-11-04', 0,'03521827K', 2, 5, 6, '2021-04-11', '2021-04-30'),
                           ('FJEIJD25', '023855992J', '1', '2021-11-04', 0,'93088388M', 1, 6, 6, '2021-04-11', '2021-04-30'),
                           ('FJEIJD26', '023855992J', '1', '2021-11-04', 0,'61293051Y', 1, 2, 6, '2021-04-11', '2021-04-30'),
                           ('FJEIJD27', '023855992J', '1', '2021-11-04', 0,'97835424W', 1, 1, 6, '2021-04-11', '2021-04-30'),
                           ('FJEIJD28', '023855992J', '1', '2021-11-04', 0,'50655019A', 3, 3, 6, '2021-04-11', '2021-04-30'),
                           ('FJEIJD29', '023855992J', '1','2021-11-04', 0,'00148122W', 4, 6, 6, '2021-04-11', '2021-04-30'),
                           ('FJEIJD11', '023855992J', '1','2021-11-04', 0,'81301756E', 1, 6, 6, '2021-04-11', '2021-04-30'),
                           ('FJEIJD12', '023855992J', '1','2021-11-04', 0,'93088388M', 1, 3, 6, '2021-04-11', '2021-04-30'),
                           ('FJEIJD13', '023855992J', '1','2021-11-04', 0,'73135465L', 4, 5, 6, '2021-04-11', '2021-04-30'),
                           ('FJEIJD14', '023855992J', '1','2021-11-04', 0,'03733000P', 3, 3, 6, '2021-04-11', '2021-04-30'),
                           ('FJEIJD15', '023855992J', '1','2021-11-04', 0,'02330636T', 4, 4, 6, '2021-04-11', '2021-04-30'),
                           ('FJEIJD16', '023855992J', '1','2021-11-04', 0,'92446985A', 2, 6, 6, '2021-04-11', '2021-04-30'),
                           ('FJEIJD17', '023855992J', '1','2021-11-04', 0,'20312302J', 1, 5, 6, '2021-04-11', '2021-04-30'),
                           ('FJEIJD18', '023855992J', '1','2021-11-04', 0,'28535250R', 1, 4, 6, '2021-04-11', '2021-04-30'),
                           ('FJEIJD31', '023855992J', '1','2021-11-04', 0,'37736096L', 2, 5, 6, '2021-04-11', '2021-04-30'),
                           ('FJEIJD32', '023855992J', '1','2021-11-04', 0,'56864646K', 4, 6, 6, '2021-04-11', '2021-04-30'),
                           ('FJEIJD33', '023855992J', '1','2021-11-04', 0,'61293051Y', 2, 5, 6, '2021-04-11', '2021-04-30'),
                           ('FJEIJD34', '023855992J', '1','2021-11-04', 0,'79739899A', 3, 2, 6, '2021-04-11', '2021-04-30'),
                           ('FJEIJD35', '023855992J', '1','2021-11-04', 0,'61377844K', 1, 6, 6, '2021-04-11', '2021-04-30'),
                           ('FJEIJD36', '023855992J', '1','2021-11-04', 0,'87873435A', 1, 6, 6, '2021-04-11', '2021-04-30'),
                           ('FJEIJD37', '023855992J', '1','2021-11-04', 0,'19948826Y', 3, 4, 6, '2021-04-11', '2021-04-30'),
                           ('FJEIJD38', '023855992J', '1','2021-11-04', 0,'74879728P', 2, 5, 6, '2021-04-11', '2021-04-30'),
                           ('DJE93920', '79217342T', '1', '2021-03-24', 0,'39557702W', 2, 6, 6, '2020-11-01', '2020-11-05'),
                           ('DJE93921', '79217342T', '1', '2021-03-24', 0,'08989009B', 3, 5, 6, '2020-11-01', '2020-11-05'),
                           ('DJE93922', '79217342T', '1', '2021-03-24', 0,'49739874M', 4, 1, 6, '2020-11-01', '2020-11-05'),
                           ('DJE93923', '79217342T', '1', '2021-03-24', 0,'73135465L', 4, 2, 6, '2020-11-01', '2020-11-05'),
                           ('DJE93924', '79217342T', '1', '2021-03-24', 0,'79739899A', 1, 6, 6, '2020-11-01', '2020-11-05'),
                           ('DJE93925', '79217342T', '1', '2021-03-24', 0,'96485032D', 1, 6, 6, '2020-11-01', '2020-11-05'),
                           ('DJE93926', '79217342T', '1', '2021-03-24', 0,'96750638B', 4, 2, 6, '2020-11-01', '2020-11-05'),
                           ('DJE93927', '79217342T', '1', '2021-03-24', 0,'03521827K', 2, 5, 6, '2020-11-01', '2020-11-05'),
                           ('DJE93928', '79217342T', '1', '2021-03-24', 0,'93088388M', 1, 6, 6, '2020-11-01', '2020-11-05'),
                           ('DJE93929', '79217342T', '1', '2021-03-24', 0,'61293051Y', 1, 2, 6, '2020-11-01', '2020-11-05'),
                           ('DJE93911', '79217342T', '1', '2021-03-24', 0,'97835424W', 1, 1, 6, '2020-11-01', '2020-11-05'),
                           ('DJE93912', '79217342T', '1', '2021-03-24', 0,'50655019A', 3, 3, 6, '2020-11-01', '2020-11-05'),
                           ('DJE93913', '79217342T', '1','2021-03-24',0, '00148122W', 4, 6, 6, '2020-11-01', '2020-11-05'),
                           ('DJE93914', '79217342T', '1','2021-03-24', 0,'81301756E', 1, 6, 6, '2020-11-01', '2020-11-05'),
                           ('DJE93915', '79217342T', '1','2021-03-24', 0,'93088388M', 1, 3, 6, '2020-11-01', '2020-11-05'),
                           ('DJE93916', '79217342T', '1','2021-03-24', 0,'73135465L', 4, 5, 6, '2020-11-01', '2020-11-05'),
                           ('DJE93917', '79217342T', '1','2021-03-24', 0,'03733000P', 3, 3, 6, '2020-11-01', '2020-11-05'),
                           ('DJE93918', '79217342T', '1','2021-03-24', 0,'02330636T', 4, 4, 6, '2020-11-01', '2020-11-05'),
                           ('DJE93919', '79217342T', '1','2021-03-24', 0,'92446985A', 2, 6, 6, '2020-11-01', '2020-11-05'),
                           ('DJE93931', '79217342T', '1','2021-03-24', 0,'20312302J', 1, 5, 6, '2020-11-01', '2020-11-05'),
                           ('DJE93932', '79217342T', '1','2021-03-24', 0,'28535250R', 1, 4, 6, '2020-11-01', '2020-11-05'),
                           ('DJE93933', '79217342T', '1','2021-03-24', 0,'37736096L', 2, 5, 6, '2020-11-01', '2020-11-05'),
                           ('DJE93934', '79217342T', '1','2021-03-24', 0,'56864646K', 4, 6, 6, '2020-11-01', '2020-11-05'),
                           ('DJE93935', '79217342T', '1','2021-03-24', 0,'61293051Y', 2, 2, 6, '2020-11-01', '2020-11-05'),
						   ('SKFUE290', '29129956F', '1', '2022-05-15', 0,'13390082B', 1, 4, 29, '2022-01-03', null),
                           ('SKFUE291', '29129956F', '1', '2022-05-15', 0,'04047453M', 2, 3, 29, '2022-01-03', null),
                           ('SKFUE292', '29129956F', '1', '2022-05-15', 0,'91956398Y', 1, 5, 29, '2022-01-03', null),
                           ('SKFUE293', '29129956F', '1', '2022-05-15', 0,'96561226G', 3, 2, 29, '2022-01-03', null),
                           ('SKFUE294', '29129956F', '1', '2022-05-15', 0,'03733000P', 3, 1, 29, '2022-01-03', null),
                           ('SKFUE295', '29129956F', '1', '2022-05-15', 0,'61377844K', 2, 6, 29, '2022-01-03', null),
                           ('DJWIDJ00', '62955711E', '1', '2021-08-04', 0,'09308483S', 2, 3, 17, '2021-04-20', null),
                           ('DJWIDJ01', '62955711E', '1', '2021-08-04', 0,'28217065K', 1, 6, 17, '2021-04-20', null),
                           ('DJWIDJ02', '62955711E', '1', '2021-08-04', 0,'49107008F', 4, 2, 17, '2021-04-20', null),
                           ('DJWIDJ03', '62955711E', '1', '2021-08-04', 0,'87718550T', 4, 1, 17, '2021-04-20', null),
                           ('DJWIDJ04', '62955711E', '1', '2021-08-04', 0,'67656217S', 3, 3, 17, '2021-04-20', null),
                           ('DJWIDJ05', '62955711E', '1', '2021-08-04', 0,'02330636T', 1, 5, 17, '2021-04-20', null),
                           ('HDKWI180', '28738838G', '1', '2022-10-11', 0,'87873435A', 3, 2, 17, '2022-07-10', null),
                           ('HDKWI181', '28738838G', '1', '2022-10-11', 0,'78686813H', 2, 1, 17, '2022-07-10', null),
                           ('HDKWI182', '28738838G', '1', '2022-10-11', 0,'09248574K', 2, 4, 17, '2022-07-10', null),
                           ('HDKWI183', '28738838G', '1', '2022-10-11', 0,'39382125F', 1, 2, 17, '2022-07-10', null),
                           ('HDKWI184', '28738838G', '1', '2022-10-11', 0,'56760587Z', 4, 5, 17, '2022-07-10', null),
                           ('HDKWI185', '28738838G', '1', '2022-10-11', 0,'54376238Y', 1, 6, 17, '2022-07-10', null),
                           ('XIJWI000', '023855992J', '1', '2022-10-09',0, '86510562H', 1, 4, 17, '2022-06-16', null),
                           ('XIJWI001', '023855992J', '1', '2022-10-09', 0,'92446985A', 1, 6, 17, '2022-06-16', null),
                           ('XIJWI002', '023855992J', '1', '2022-10-09', 0,'19948826Y', 2, 4, 17, '2022-06-16', null),
                           ('XIJWI003', '023855992J', '1', '2022-10-09', 0,'72486812N', 3, 5, 17, '2022-06-16', null),
                           ('XIJWI004', '023855992J', '1', '2022-10-09', 0,'84210194H', 3, 2, 17, '2022-06-16', null),
                           ('XIJWI005', '023855992J', '1', '2022-10-09', 0,'67348101F', 3, 4, 17, '2022-06-16', null),
                           ('PDIW1989', '87297492Y', '1', '2023-11-02', 0,'28866379E', 2, 4, 17, '2023-02-28', null),
                           ('PDIW1988', '87297492Y', '1', '2023-11-02', 0,'46179648H', 2, 6, 17, '2023-02-28', null),
                           ('PDIW1987', '87297492Y', '1', '2023-11-02', 0,'12466633N', 1, 4, 17, '2023-02-28', null),
                           ('PDIW1986', '87297492Y', '1', '2023-11-02', 0,'20312302J', 1, 6, 17, '2023-02-28', null),
                           ('PDIW1985', '87297492Y', '1', '2023-11-02', 0,'27399153N', 1, 4, 17, '2023-02-28', null),
                           ('PDIW1984', '87297492Y', '1', '2023-11-02', 0,'14192694S', 1, 5, 17, '2023-02-28', null),
                           ('GEI92800', '87297492Y', '1', '2023-12-21', 0,'31608254K', 4, 1, 17, '2023-04-06', null),
                           ('GEI92801', '87297492Y', '1', '2023-12-21', 0,'99618909K', 2, 4, 17, '2023-04-06', null),
                           ('GEI92802', '87297492Y', '1', '2023-12-21', 0,'87787430H', 2, 1, 17, '2023-04-06', null),
                           ('GEI92803', '87297492Y', '1', '2023-12-21', 0,'40072532T', 3, 5, 17, '2023-04-06', null),
                           ('GEI92804', '87297492Y', '1', '2023-12-21', 0,'70311854A', 3, 3, 17, '2023-04-06', null),
                           ('GEI92805', '87297492Y', '1', '2023-12-21', 0,'28535250R', 3, 1, 17, '2023-04-06', null),
                           ('LMSI8018','72958826H', '1', '2023-02-26', 0,'31603553N', 2, 5, 16, '2022-07-09', null),
                           ('LMSI8017','72958826H', '1', '2023-02-26', 0,'90900565B', 4, 2, 16, '2022-07-09', null),
                           ('LMSI8016','72958826H', '1', '2023-02-26', 0,'59944833W', 1, 1, 16, '2022-07-09', null),
                           ('LMSI8015','72958826H', '1', '2023-02-26', 0,'25382155E', 2, 3, 16, '2022-07-09', null),
                           ('LMSI8014','72958826H', '1', '2023-02-26', 0,'08952144S', 1, 3, 16, '2022-07-09', null),
                           ('LMSI8013','72958826H', '1', '2023-02-26', 0,'00148122W', 1, 2, 16, '2022-07-09', null),
						   ('ZKEUF189', '70200137G','1', '2023-03-22', 0,'37736096L', 4, 2, 16, '2022-08-11', null),
						   ('ZKEUF188', '70200137G','1', '2023-03-22', 0,'05857005D', 4, 5, 16, '2022-08-11', null),
						   ('ZKEUF187', '70200137G','1', '2023-03-22', 0,'78626118C', 2, 4, 16, '2022-08-11', null),
						   ('ZKEUF186', '70200137G','1', '2023-03-22', 0,'07066179G', 3, 1, 16, '2022-08-11', null),
						   ('ZKEUF185', '70200137G','1', '2023-03-22', 0,'43635340Q', 3, 6, 16, '2022-08-11', null),
						   ('ZKEUF184', '70200137G','1', '2023-03-22', 0,'79571674T', 1, 2, 16, '2022-08-11', null),
						   ('CENKJ290', '938209390J', '1', '2023-08-15',0, '81301756E', 1, 5, 16, '2023-03-21', null),
                           ('CENKJ291', '938209390J', '1', '2023-08-15', 0,'56864646K', 1, 6, 16, '2023-03-21', null),
                           ('CENKJ292', '938209390J', '1', '2023-08-15', 0,'74879728P', 2, 1, 16, '2023-03-21', null),
                           ('CENKJ293', '938209390J', '1', '2023-08-15', 0,'95690794F', 4, 3, 16, '2023-03-21', null),
                           ('CENKJ294', '938209390J', '1', '2023-08-15', 0,'59476958Q', 3, 3, 16, '2023-03-21', null),
                           ('CENKJ295', '938209390J', '1', '2023-08-15', 0,'96750638B', 2, 6, 16, '2023-03-21', null),
                           ('EFI19200', '87297492Y', '1', '2023-05-10', 0,'03521827K', 2, 5, 16, '2022-11-24', null),
                           ('EFI19201', '87297492Y', '1', '2023-05-10', 0,'93088388M', 3, 2, 16, '2022-11-24', null),
                           ('EFI19202', '87297492Y', '1', '2023-05-10', 0,'61293051Y', 1, 6, 16, '2022-11-24', null),
                           ('EFI19203', '87297492Y', '1', '2023-05-10', 0,'50655019A', 1, 6, 16, '2022-11-24', null),
                           ('EFI19204', '87297492Y', '1', '2023-05-10', 0,'39557702W', 1, 1, 16, '2022-11-24', null),
                           ('EFI19205', '87297492Y', '1', '2023-05-10', 0,'08989009B', 1, 4, 16, '2022-11-24', null),
                           ('NSIOO290', '87297492Y', '1', '2023-01-15', 0,'49739874M', 2, 2, 16, '2022-05-31', null),
                           ('NSIOO291', '87297492Y', '1', '2023-01-15', 0,'73135465L', 4, 4, 16, '2022-05-31', null),
                           ('NSIOO292', '87297492Y', '1', '2023-01-15', 0,'79739899A', 4, 1, 16, '2022-05-31', null),
                           ('NSIOO293', '87297492Y', '1', '2023-01-15', 0,'96485032D', 3, 6, 16, '2022-05-31', null),
                           ('NSIOO294', '87297492Y', '1', '2023-01-15', 0,'13390082B', 1, 3, 16, '2022-05-31', null),
                           ('NSIOO295', '87297492Y', '1', '2023-01-15', 0,'04047453M', 1, 4, 16, '2022-05-31', null),
                           ('DFI39490', '72958826H', '1', '2021-08-01',0,'91956398Y', 2, 4, 20, '2021-03-05', null),
                           ('DFI39491', '72958826H', '1', '2021-08-01', 0,'96561226G', 3, 1, 20, '2021-03-05', null),
                           ('DFI39492', '72958826H', '1', '2021-08-01', 0,'03733000P', 3, 2, 20, '2021-03-05', null),
                           ('DFI39493', '72958826H', '1', '2021-08-01', 0,'61377844K', 4, 3, 20, '2021-03-05', null),
                           ('DFI39494', '72958826H', '1', '2021-08-01', 0,'09308483S', 1, 6, 20, '2021-03-05', null),
                           ('DFI39495', '72958826H', '1', '2021-08-01', 0,'28217065K', 1, 6, 20, '2021-03-05', null),
                           ('VIEJ2900', '70200137G', '1', '2021-02-10', 0,'49107008F', 4, 2, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2901', '70200137G', '1', '2021-02-10', 0,'87718550T', 1, 5, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2902', '70200137G', '1', '2021-02-10', 0,'02330636T', 2, 4, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2903', '70200137G', '1', '2021-02-10', 0,'67656217S', 2, 1, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2904', '70200137G', '1', '2021-02-10', 0,'90900565B', 1, 6, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2905', '70200137G', '1', '2021-02-10', 0,'78686813H', 3, 2, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2906', '70200137G', '1','2021-02-10', 0,'01939028Y', 1, 3, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2907', '70200137G', '1','2021-02-10', 0,'65737428R', 1, 5, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2908', '70200137G', '1','2021-02-10', 0,'72525506C', 4, 2, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2909', '70200137G', '1','2021-02-10', 0,'86510562H', 3, 1, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2911', '70200137G', '1','2021-02-10', 0,'12466633N', 2, 4, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2912', '70200137G', '1','2021-02-10', 0,'70311854A', 3, 3, 20, '2020-06-01', '2020-06-09'), 
                           ('VIEJ2913', '70200137G', '1','2021-02-10', 0,'00148122W', 4, 6, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2914', '70200137G', '1','2021-02-10', 0,'81301756E', 1, 6, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2915', '70200137G', '1','2021-02-10', 0,'93088388M', 1, 3, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2916', '70200137G', '1','2021-02-10', 0,'73135465L', 4, 5, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2921', '70200137G', '1','2021-02-10', 0,'03733000P', 3, 3, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2922', '70200137G', '1','2021-02-10', 0,'14192694S', 4, 4, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2923', '70200137G', '1','2021-02-10', 0,'92446985A', 2, 6, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2924', '70200137G', '1','2021-02-10', 0,'20312302J', 1, 5, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2925', '70200137G', '1','2021-02-10', 0,'28535250R', 1, 4, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2926', '70200137G', '1','2021-02-10', 0,'37736096L', 2, 5, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2927', '70200137G', '1','2021-02-10', 0,'56864646K', 4, 6, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2931', '70200137G', '1','2021-02-10', 0,'61293051Y', 2, 5, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2932', '70200137G', '1','2021-02-10', 0,'79739899A', 3, 2, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2933', '70200137G', '1','2021-02-10', 0,'61377844K', 1, 6, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2934', '70200137G', '1','2021-02-10', 0,'87873435A', 1, 6, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2935', '70200137G', '1','2021-02-10', 0,'19948826Y', 3, 4, 20, '2020-06-01', '2020-06-09'),
                           ('VIEJ2936', '70200137G', '1','2021-02-10', 0,'74879728P', 2, 6, 20, '2020-06-01', '2020-06-09'),
                           ('BRO39011', '02663917F', '1', '2021-07-19', 0,'09248574K', 4, 2, 20, '2021-01-07', null),
                           ('BRO39012', '02663917F', '1', '2021-07-19', 0,'39382125F', 2, 5, 20, '2021-01-07', null),
                           ('BRO39013', '02663917F', '1', '2021-07-19', 0,'56760587Z', 4, 1, 20, '2021-01-07', null),
                           ('BRO39014', '02663917F', '1', '2021-07-19', 0,'54376238Y', 1, 6, 20, '2021-01-07', null),
                           ('BRO39015', '02663917F', '1', '2021-07-19', 0,'86510562H', 1, 5, 20, '2021-01-07', null),
                           ('BRO39016', '02663917F', '1', '2021-07-19', 0,'92446985A', 1, 6, 20, '2021-01-07', null),
                           ('KWBRO028', '28738838G', '1', '2023-12-28', 0,'19948826Y', 3, 2, 20, '2022-12-18', null),
                           ('KWBRO029', '28738838G', '1', '2023-12-28', 0,'72486812N', 3, 1, 20, '2022-12-18', null),
                           ('KWBRO020', '28738838G', '1', '2023-12-28', 0,'84210194H', 2, 5, 20, '2022-12-18', null),
                           ('KWBRO021', '28738838G', '1', '2023-12-28', 0,'67348101F', 1, 4, 20, '2022-12-18', null),
                           ('KWBRO022', '28738838G', '1', '2023-12-28', 0,'28866379E', 4, 1, 20, '2022-12-18', null),
                           ('KWBRO023', '28738838G', '1', '2023-12-28', 0,'46179648H', 4, 3, 20, '2022-12-18', null),
                           ('038HDN90', '023855992J', '1', '2025-01-10',0, '12466633N', 2, 4, 20, '2023-12-10', null ),
                           ('038HDN91', '023855992J', '1', '2025-01-10',0, '20312302J', 1, 2, 20, '2023-12-10', null ),
                           ('038HDN92', '023855992J', '1', '2025-01-10', 0,'27399153N', 4, 5, 20, '2023-12-10', null ),
                           ('038HDN93', '023855992J', '1', '2025-01-10', 0,'14192694S', 3, 3, 20, '2023-12-10', null ),
                           ('038HDN94', '023855992J', '1', '2025-01-10', 0,'31608254K', 3, 2, 20, '2023-12-10', null ),
                           ('038HDN95', '023855992J', '1', '2025-01-10', 0,'99618909K', 1, 6, 20, '2023-12-10', null ),
                           ('84JDKO00', '938209390J', '1', '2021-12-08', 0,'87787430H', 2, 6, 20, '2020-11-29', null),
                           ('84JDKO01', '938209390J', '1', '2021-12-08', 0,'40072532T', 4, 3, 20, '2020-11-29', null),
                           ('84JDKO02', '938209390J', '1', '2021-12-08', 0,'70311854A', 1, 5, 20, '2020-11-29', null),
                           ('84JDKO03', '938209390J', '1', '2021-12-08', 0,'28535250R', 1, 4, 20, '2020-11-29', null),
                           ('84JDKO04', '938209390J', '1', '2021-12-08', 0,'31603553N', 3, 1, 20, '2020-11-29', null),
                           ('84JDKO05', '938209390J', '1', '2021-12-08', 0,'90900565B', 4, 2, 20, '2020-11-29', null),
                           ('CKEU9320', '87297492Y', '1', '2023-09-26', 0,'59944833W', 2, 4, 20, '2023-04-05', null),
                           ('CKEU9321', '87297492Y', '1', '2023-09-26', 0,'25382155E', 1, 6, 20, '2023-04-05', null),
                           ('CKEU9322', '87297492Y', '1', '2023-09-26', 0,'00148122W', 1, 3, 20, '2023-04-05', null),
                           ('CKEU9323', '87297492Y', '1', '2023-09-26', 0,'08952144S', 3, 2, 20, '2023-04-05', null),
                           ('CKEU9324', '87297492Y', '1', '2023-09-26', 0,'37736096L', 3, 1, 20, '2023-04-05', null),
                           ('CKEU9325', '87297492Y', '1', '2023-09-26', 0,'05857005D', 2, 3, 20, '2023-04-05', null),
                           ('KCIEO200', '01730290I', '1', '2024-09-05', 0,'78626118C', 3, 2, 20, '2023-12-09', null),
                           ('KCIEO201', '01730290I', '1', '2024-09-05', 0,'07066179G', 4, 5, 20, '2023-12-09', null),
                           ('KCIEO202', '01730290I', '1', '2024-09-05', 0,'43635340Q', 2, 2, 20, '2023-12-09', null),
                           ('KCIEO203', '01730290I', '1', '2024-09-05', 0,'79571674T', 1, 6, 20, '2023-12-09', null),
                           ('KCIEO204', '01730290I', '1', '2024-09-05', 0,'81301756E', 1, 5, 20, '2023-12-09', null),
                           ('KCIEO205', '01730290I', '1', '2024-09-05', 0,'56864646K', 1, 6, 20, '2023-12-09', null),
                           ('VWXYZ345', '29129956F', '3', '2023-04-03', 0,'72525506C', 2, 2, 23, '2023-02-14', null),
                           ('VWXYZ344', '29129956F', '1', '2023-04-03', 0,'61377844K', 3, 1, 23, '2023-02-14', null),
                           ('VWXYZ343', '29129956F', '2', '2023-04-03', 0,'96485032D', 2, 6, 23, '2023-02-14', null);



create table telfP(
    numTelf varchar (18) primary key,
    dniP varchar (10),
    foreign key (dniP) references persona(dniP) on delete cascade on update cascade
);

INSERT INTO telfP VALUES ('+34 601 989 918','01939028Y'),
						 ('+34 742 792 613', '65737428R'),
                         ('+34 657 387 623', '72525506C'), 
                         ('+34 699 274 258', '86510562H'), 
                         ('+34 751 914 220', '12466633N'),
                         ('+34 647 507 385', '70311854A'),
                         ('+33 012 135 9546', '00148122W'),
                         ('+33 186 429 6523', '81301756E'),
                         ('+33 094 066 8971', '93088388M'), 
                         ('+33 252 284 4951', '73135465L'),
                         ('+33 737 005 3118', '03733000P'),
                         ('+34 100 430 702', '02330636T'),
                         ('+34 674 836 152', '92446985A'),
                         ('+34 640 476 842', '20312302J'),
                         ('+34 661 181 419', '28535250R'),
                         ('+34 613 368 447', '37736096L'),
                         ('+34 604 779 345', '56864646K'),
                         ('+34 769 877 675', '61293051Y'),
                         ('+7 009 012 489', '79739899A'),
                         ('+7 070 087 416', '61377844K'),
                         ('+7 051 812 617', '87873435A'),
                         ('+7 041 216 380', '19948826Y'), 
                         ('+7 041 528 924', '27399153N'),
                         ('+7 040 540 800', '31603553N'),
                         ('+39 070 290 975', '05857005D'),
                         ('+39 0352 75008', '74879728P'),
                         ('+39 0346 72141', '97835424W'),
                         ('+39 0362 14043', '96485032D'),
                         ('+39 0396 39101', '09308483S'),
                         ('+39 0328 02555', '78686813H'),
                         ('+49 0395 22097', '72486812N'),
                         ('+49 08093 60 83', '14192694S'),
                         ('+49 05272 87 74', '90900565B'),
                         ('+49 030 29 74 81', '78626118C'),
                         ('+49 06507 73 54', '95690794F'),
                         ('+49 08636 71 81', '50655019A'),
                         ('+353 040 52 34 81', '13390082B'),
                         ('+353 079 5899 88', '28217065K'),
                         ('+353 079 0025 81', '09248574K'),
                         ('+353 070 3091 91', '84210194H'),
                         ('+353 070 0622 80', '31608254K'), 
                         ('+353 070 4713 06', '59944833W'),
                         ('+353 079 5483 00', '07066179G'),
                         ('+353 070 2455 07', '59476958Q'),
                         ('+353 070 1009 12', '39557702W'),
                         ('+353 077 0884 87', '04047453M'),
                         ('+353 079 2441 41', '49107008F'), 
                         ('+353 070 4936 99', '39382125F'),
                         ('+353 077 0284 06', '67348101F'),
                         ('+351 21 227 637', '99618909K'),
                         ('+351 21 244 144', '25382155E'),
                         ('+351 21 229 376', '43635340Q'),
                         ('+351 21 253 167', '96750638B'),
                         ('+351 21 234 856', '08989009B'),
                         ('+351 21 243 512', '91956398Y'),
                         ('+351 21 223 348', '87718550T'),
                         ('+64 8118 904', '56760587Z'),
                         ('+64 3309 457', '28866379E'),
                         ('+64 1491 056', '87787430H'),
                         ('+64 0261 718', '08952144S'),
                         ('+64 1274 393', '79571674T'),
                         ('+34 653 991 677', '03521827K'),
                         ('+34 738 228 139', '49739874M'),
                         ('+34 732 747 996', '96561226G'),
                         ('+34 689 903 287', '67656217S'),
                         ('+34 730 873 041', '54376238Y'),
                         ('+34 607 323 257', '46179648H'),
                         ('+34 782 880 408', '40072532T');

-- Dadas las siguientes preguntas y peticiones por parte del equipo de productores, resolvemos las siguientes consultas

/*
1. Sabiendo que una persona puede coger varias entradas para distintos artistas y, para el mismo artista en distintas fechas,
con el fin de crear un "club de socios" para posibles descuentos, obtener los nombres y correo electrónico de aquellas
personas que más veces hayan comprado entradas (independientemente del número de entradas que hayan comprado por evento).
*/

-- para facilitar trabajo a la hora de realizar la consulta, creamos una vista que cuente el número de veces que ha comprado cada persona entradas
drop view if exists compras_por_persona;
create view compras_por_persona(codP, comprasRealizadas) as
    select p.dniP, count(localizador)
    from persona as p inner join entrada as e on p.dniP = e.dniP
    group by p.dniP
    ;

select dniP, nomP, email
    from persona as p inner join compras_por_persona as e on p.dniP = e.codP
    where comprasRealizadas = (select max(comprasRealizadas)
                             from compras_por_persona)
	;


/*
2. Obtener el precio de las entradas más baratas y más caras en cada sala de eventos
*/

select s.codS, min(precioZ) as "más barata", max(precioZ) as "más cara"
     from zona as z inner join sala as s on z.codS = s.codS
     group by s.codS
     ;
   
   
/*
3. Obtener aquellas zonas en las salas de conciertos que se ofertan accesos prioritarios, el precio de estos
(por un lado, el precio del acceso prioritario y, por otro, el precio final al que se quedaría la entrada) y
ordenarlos de mayor a menor precio.
*/

select z.codS, z.codZ, accesoPrior as "precio AP", (precioZ + accesoPrior) as "precio final"
    from sala as s inner join zona as z on s.codS = z.codS
    where accesoPrior is not null
    order by (precioZ + accesoPrior) desc
    ;
    
-- como hay salas en las que distintas zonas ofertan accesos prioritarios a distintos precios, la sala aparece más de una vez    
   
   
/*
4. De cara a la preparación por parte del equipo y el tiempo estimado de duración del concierto, se desea conocer el número de 
canciones que toca cada artista y la duración total que conlleva tocar todas ellas. Ordenarlos por nombre alfabéticamente.
*/

select nomArtistico, count(codC) canciones, sum(duracion) "duración"
    from cancion as c inner join artista as a on c.dniA = a.dniA
    group by c.dniA
    order by nomArtistico
    ;
    
    
/* 
5. Para aquellos conciertos en los que se vendieron todas las entradas, interesa conocer el artista, sala de concierto y duración de venta
de las entradas (fecha de soldout - fecha de inicio de venta). Ordénalos de manera que aparezcan primero los que menos tiempo tardaron en agotarse.
*/

select nomArtistico, s.codS, (fechaSoldout - fechaVenta) as "duración entradas"
    from artista as a inner join toca as t on a.dniA = t.dniA inner join sala as s on t.codS = s.codS inner join entrada as e on s.codS = e.codS
    where fechaSoldout is not null and fechaE=fechaCon
    group by nomArtistico, s.codS, (fechaSoldout - fechaVenta)
    order by (fechaSoldout - fechaVenta) asc
	;
    
    
/*
6. Identificar el o los artistas que más días seguidos se han alojado en cada hotel y cuánto costó la estancia en total
*/

-- para la siguiente consulta, realizaremos primero una vista con los artistas, los hoteles en los que han estado
-- la duración de dichas estancias y el coste de las mismas

drop view if exists artista_en_hotel;
create view artista_en_hotel (codA, idHotel, estancia, coste) as
    select a.dniA, h.codH, (fechaSal - fechaEnt), precioNoche*(fechaSal - fechaEnt)
    from artista as a inner join alojado as al on a.dniA = al.dniA inner join hotel as h on al.codH = h.codH
    ;

select idHotel, estancia, coste, codA
    from artista_en_hotel as aeh
    where estancia = (select max(estancia) -- seleccionamos todas aquellas estancias donde se hayan alojado el máximo de días los artistas
						from artista_en_hotel 
						where idHotel = aeh.idHotel)
	;

 
/*
7. Realizar una vista de próximos conciertos incluyendo el nombre del artista, la fecha del concierto (ordenándolos del más
próximo al más lejano) y la ciudad en la que se va a realizar
*/

drop view if exists proximos_conciertos;
create view proximos_conciertos (nomA, fConcierto, ciudad) as
    select nomArtistico, fechaCon, ciudadS
    from artista as a inner join toca as t on a.dniA = t.dniA inner join sala as s on t.codS = s.codS
    where fechaCon > curdate() 
	order by fechaCon asc
    ;


/*
8. A los artistas les interesa conocer los ingresos generados en cada concierto. Hallar además el nombre de las
cuatro ciudades donde más ingresos se han generado (responder a la siguiente consulta con una vista en la primera parte).
*/

-- creamos, en primer lugar, una vista donde se contabiliza, para cada concierto, el nombre del artista
-- la ciudad en la que ha actuado y la fecha del concierto, el total de ingresos generados por la compra de
-- entradas, siendo esta la suma del precio de la entrada por el número de entradas compradas.
drop view if exists ingresos_generados;
create view ingresos_generados (nomArtista, ciudad, fechaConcierto, ingreso) as
    select nomArtistico, ciudadS, fechaCon, sum((apE*accesoPrior+precioZ)*numE) as ing
    from artista as a inner join toca as t on a.dniA = t.dniA inner join sala as s on 
    t.codS = s.codS inner join zona as z on s.codS = z.codS inner join entrada as e on 
    t.codS = e.codS and e.fechaE = t.fechaCon and e.artistaE = a.dniA
    group by nomArtistico, fechaCon, z.codS
    order by ing desc;

select ciudad, ingreso
    from ingresos_generados ig1
    where ingreso >= (select distinct ingreso
					      from ingresos_generados ig2
                          order by ingreso desc
					      limit 3, 1) -- con limit x,y con x omitimos las x primeras filas y con y devolvemos y valores. por tanto
                                      -- lo que estamos haciendo en esta consulta es obviar los tres ingresos más alto, seleccionando
									  -- el cuarto y devolviendo ese unico valor para que en la desigualdad aparezcan todas las 
                                      -- ciudades con los cuatro ingresos más altos
	;
    
 
/*
9. Con el fin de organizar futuros conciertos, se desea conocer las 3 salas con mayor capacidad de aforo,
incluyendo la magnitud de esta.
*/

select codS as 'código sala', aforoS as 'aforo'
    from sala as s1
    where aforoS >= (select distinct aforoS
			             from sala as s2
                         order by aforoS desc
                         limit 2, 1) -- utilizamos el siguiente limit con la misma explicación que en el ejercicio anterior
	order by aforoS desc
	;
        
        
/*        
10. Obtener una vista con los conciertos para cada ciudad ordenados
desde el más próximo al más antiguo indicando el artista que toca en cada uno de ellos.
*/
    
drop view if exists conciertos_por_ciudades;
create view conciertos_por_ciudades (ciudad, fConcierto, nArtista) as
	select ciudadS, fechaCon, nomArtistico
	from sala as s inner join toca as t on s.codS = t.codS inner join artista as a on a.dniA = t.dniA
	order by ciudadS asc, fechaCon desc
	;

/*
11. De los artistas que llevan más de diez años con la productora, es de interés saber el número
de conciertos que han dado y el número total de veces que se han alojado en un hotel 
*/

/*
11. De los artistas que llevan más de diez años con la productora, es de interés saber el número
de conciertos que han dado y el número total de veces que se han alojado en un hotel, además de los ingresos totales que han percibido.
*/
select nomArtista, year(curdate()) - year(fecProductora) as enProductora,
	   count(distinct fechaCon) as numConciertos, count(distinct fechaEnt) as numHoteles, sum(distinct ingreso) as ingresoTotal
       from ingresos_generados inner join artista as a on nomArtista = a.nomArtistico 
							   inner join toca as t on a.dniA = t.dniA 
                               inner join alojado as al on al.dniA = a.dniA 
       group by nomArtista, enProductora
       having enProductora > 10
       ;


-- en la siguiente consulta vemos como el número de conciertos que han dado y los hoteles en los que se han alojado coinciden en
-- número o el segundo es inferior puesto que todos los datos que tenemos muestran que el artista se queda en un hotel durante
-- la noche del concierto.


/* 
12. Teniendo en cuenta que la adquisición de entradas puede verse afectada por la estacionalidad, las productoras
desean conocere las fechas en las que más entradas salieron a la venta y en las que menos. Además deberá indicarse la estación
(primavera, verano, toño, invierno) a la que pertenece dicha fecha.
*/

-- como lo que buscamos son el número de entradas vendidas por cada estación, generaremos en primer lugar una vista
drop view if exists entradas_estacion;
create view entradas_estacion(fecha, entradas, estacion) as
    select fechaVenta, sum(numE), case when month(fechaVenta) > 4 then 'Primavera'
													    when month(fechaVenta) > 7 then 'Verano'
                                                        when month(fechaVenta) > 10 then 'Otoño'
                                                        else 'Invierno'
                                                        end as estacion
    from entrada
    group by fechaVenta
    order by sum(numE) desc;
    
select estacion, sum(entradas) entradasVendidas
    from entradas_estacion
    group by estacion
    order by entradasVendidas desc;


/*
13. La industria musical pretende dar 3 premios a los conciertos más exitosos del año. Para ello, se tiene en cuenta el número de entradas
que se vendieron y, en caso de empate, el tiempo en que tardaron de agotarse (si es que lo hicieron)
*/
    
select nomArtistico, fechaCon, ciudadS, sum(numE) as entradasVendidas, min(fechaSoldout - fechaVenta) as tiempoVenta
    from artista as a inner join toca as t on a.dniA = t.dniA inner join sala as s on t.codS = s.codS
    inner join entrada as e on t.dniA = e.artistaE and t.fechaCon = e.fechaE
    group by a.nomArtistico, t.fechaCon, s.ciudadS
	order by entradasVendidas desc, tiempoVenta
	limit 3; -- hemos comprobado y como los empates se realizan entre el 2ndo y el 3ero podemos utilizar limit sin problema


/*
14. De los conciertos en los que se vendieron todas las entradas (hubo Soldout), indicar cuántas personas compraron entradas
y cuántos días tardaron en agotarse. Indicar también la fecha del concierto, sala de la actuación y nombre del artista.
*/

select nomArtistico, e.codS, fechaCon, COUNT(fechaE) as compradores, (fechaSoldout - fechaVenta) as "días en venta"
    from toca as t inner join entrada as e on t.codS = e.codS and t.fechaCon = e.fechaE inner join artista as a on t.dniA = a.dniA
    where fechaSoldout is not null
    group by nomArtistico, e.codS, fechaCon, (fechaSoldout - fechaVenta)
    order by compradores asc
    ;


/* 
15. Crear un trigger para evitar comprar más entradas de las que hay (por cada zona).
En caso de que una persona trate de comprar más entradas de las que hay disponibles en ese momento, 
deberá saltar un error con un mensaje que explique por qué no es posible realizar la compra.

Para ello, tendremos que calcular el número de entradas que existen para que la cantidad que se desea comprar no exceda a la 
disponible. Como número de entradas disponibles estamos utilizando el aforo de cada zona. 
*/

drop trigger if exists comprar_entradas_BI;
delimiter //  
create trigger comprar_entradas_BI before insert 
	on entrada
    for each row 
    begin 
	    declare entradasVendidas int; -- creamos la variable número de entradas vendidas
        declare aforoZona int; -- creamos la variable aforo
    
        set entradasVendidas = (select sum(numE)
						            from entrada
						            where codS = new.codS and zonaE = new.zonaE and fechaE = new.fechaE);
	
        set aforoZona = (select aforoZ
						     from zona
							 where codS = new.codS and codZ = new.zonaE);
    
	     if new.numE > aforoZona - entradasVendidas then 
		     signal sqlstate '45000' #error 45000 es un tipo de error
             set message_text = 'No hay suficientes entradas disponibles';
		 end if;
    end;
//
delimiter ; 


/* 16 
En caso de que se acaben los contratos con las salas, los productores quieren guardar el número de teléfono, 
aforo, país y dirección de la sala borrada. Genera un trigger para guardar dicha información.
*/

-- en primer lugar, creamos la tabla donde queremos que se guarde la información
create table antiguas_salas(
    telfSala varchar(18),
    aforoSala int,
    paisSala varchar(40),
    dirSala varchar(40)
    );
    
drop trigger if exists clientesborradosAD;
create trigger salasborradosAD after delete 
    on sala 
    for each row
    insert into antiguas_salas values (old.telfS, old.aforoS, old.paisS, old.dirS)
    ;
    
-- para comprobar que funciona
delete from sala
    where codS = 1
    ;






