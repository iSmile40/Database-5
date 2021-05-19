INSERT INTO Singer (name)
VALUES
    ('The Beatles'),
    ('Radiohead'),
    ('Muse'),
    ('Coldplay'),
    ('Queen'),
    ('David Bowie'),
    ('Black Sabbath'),
    ('The Prodigy'),
    ('Gorillaz'),
    ('Lily Allen');

INSERT INTO Genre (name)
VALUES
    ('Rock and roll'),
    ('Ambient'),
    ('Heavy metal'),
    ('Electronica'),
    ('Electropop'),
    ('Pop');

INSERT INTO Singer_Genre (singer_id, genre_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 1),
    (4, 1),
    (5, 1),
    (6, 1),
    (7, 3),
    (8, 4),
    (9, 5),
    (10, 6);

INSERT INTO Album (name, year_of_issue)
VALUES
    ('Abbey Road', 1969),
    ('In Rainbows', 2007),
    ('Collateral Damage', 2020),
    ('Love in Tokyo', 2018),
    ('A Kind Of Magic', 1986),
    ('Lets Dance', 1983),
    ('Master of Reality', 1971),
    ('The Fat of the Land', 1997),
    ('Demon Days', 2005),
    ('What You Waiting For', 2019);

INSERT INTO Singer_Album (singer_id, album_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

INSERT INTO Songs (name, duration, album_id)
VALUES
    ('Polythene Pam', 1.13, 1),
    ('Something', 3.03, 1),
    ('Reckoner', 4.50, 2),
    ('Videotape', 4.40, 2),
    ('Collateral Damage', 2.10, 3),
    ('Something Just Like This', 4.04, 4),
    ('Paradise', 4.37, 4),
    ('A Kind Of Magic', 4.23, 5),
    ('Modern Love', 4.46, 6),
    ('Solitude', 8.08, 7),
    ('Sweet Leaf', 5.05, 7),
    ('Breathe', 4.36, 8),
    ('O My Green World', 4.31, 9),
    ('Last Living Souls', 3.10, 9),
    ('My Love', 2.50, 10),
    ('What You Waiting For', 3.00, 10);

INSERT INTO Collection (name, year_of_issue)
VALUES
    ('Best Music', 2018),
    ('Popular Music Archive', 2007),
    ('Golden Collection', 2000),
    ('Popular music', 2019),
    ('Music for All Time', 2015),
    ('Platinum Collection', 2016),
    ('Hits only', 2020),
    ('Rock Classic', 1997);

INSERT INTO Songs_Collection (collection_id, songs_id)
VALUES
    (1, 8),
    (2, 3),
    (4, 7),
    (5, 2),
    (6, 3),
    (7, 3),
    (8, 4)