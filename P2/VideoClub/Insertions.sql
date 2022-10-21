INSERT INTO Director
VALUES ('D0078', 'Stephen Herek');

INSERT INTO Director
VALUES ('D1001', 'Roger Spottiswoode');

INSERT INTO Director
VALUES ('D3765', 'Jane Emmerick');

INSERT INTO Director
VALUES ('D4576', 'John Woo');

INSERT INTO Director
VALUES ('D5743', 'Michael Bay');

INSERT INTO Director
VALUES ('D7834', 'Sally Nichols');

INSERT INTO Video
VALUES (207132, 'Tomorrow Never Dies', '12', 'Action', 5, 21.99, 'D1001');

INSERT INTO Video
VALUES (330553, 'Face/Off', '12', 'Thriller', 5, 31.99, 'D4576');

INSERT INTO Video
VALUES (445624, 'The Rock', '18', 'Action', 4, 29.99, 'D5743');

INSERT INTO Video
VALUES (634817, 'Independence Day', 'PG', 'Sci-Fi', 4.5, 32.99, 'D3765');

INSERT INTO Video
VALUES (781132, '101 Dalmatians', 'U', 'Children', 4, 18.5, 'D0078');

INSERT INTO Video
VALUES (902355, 'Primary Colors', 'U', 'Comedy', 4.5, 14.5, 'D7834');

INSERT INTO VideoForRent
VALUES (178643, 0, 634817);

INSERT INTO VideoForRent
VALUES (199004, 1, 207132);

INSERT INTO VideoForRent
VALUES (200900, 1, 330553);

INSERT INTO VideoForRent
VALUES (210087, 1, 902355);

INSERT INTO VideoForRent
VALUES (243431, 1, 634817);

INSERT INTO VideoForRent
VALUES (245456, 1, 207132);

INSERT INTO VideoForRent
VALUES (245457, 1, 207132);

INSERT INTO VideoForRent
VALUES (317411, 1, 781132);

INSERT INTO Members (memberNo, fname, lname, sex, DOB, address, dateJoined)
VALUES (1, 'Karen', 'Parker', 'F', '1972-2-22', '22 Greenway Drive, Glasgow, G12 8DS', '1991-1-6');

INSERT INTO Members (memberNo, fname, lname, sex, DOB, address, dateJoined)
VALUES (2, 'Gillian', 'Peters', 'F', '1994-03-09', '89 Redmond Road, Glasgow, G11 9YR', '1995-4-19');

INSERT INTO Members (memberNo, fname, lname, sex, DOB, address, dateJoined)
VALUES (3, 'Bob', 'Adams', 'M', '1974-11-15', '57 Littleway Road, Glasgow, G3 6DS', '1998-1-6');

INSERT INTO Members (memberNo, fname, lname, sex, DOB, address, dateJoined)
VALUES (4, 'Don', 'Nelson', 'M', '1991-12-12', '123 Suffolk Lane,Glasgow, G15 1RC', '2000-4-7');

INSERT INTO Members (memberNo, fname, lname, sex, DOB, address, dateJoined)
VALUES (5, 'Lorna', 'Smith', 'F', '1972-1-1', 'Flat 5A London Road, Glasgow, G3', '1998-1-11');

INSERT INTO Members (memberNo, fname, lname, sex, DOB, address, dateJoined)
VALUES (6, 'Dan', 'White', 'M', '1990-5-5', '200 Great Western Road, Glasgow, G11 9JJ', '2001-5-5');

INSERT INTO RentalAgreement (rentalNo, memberNo, videoNo, dateOut, dateReturn)
VALUES (1, 1, 178643, '2000-2-5', '2000-2-7');

INSERT INTO RentalAgreement (rentalNo, memberNo, videoNo, dateOut, dateReturn)
VALUES (2, 1, 199004, '2000-2-5', '2000-2-7');

INSERT INTO RentalAgreement (rentalNo, memberNo, videoNo, dateOut, dateReturn)
VALUES (3, 1, 245456, '2000-2-4', '2000-2-6');

INSERT INTO RentalAgreement (rentalNo, memberNo, videoNo, dateOut, dateReturn)
VALUES (4, 1, 243431, '2000-2-4', '2000-2-6');

INSERT INTO RentalAgreement (rentalNo, memberNo, videoNo, dateOut, dateReturn)
VALUES (5, 3, 199004, '1999-11-11', '1999-11-12');

INSERT INTO RentalAgreement (rentalNo, memberNo, videoNo, dateOut, dateReturn)
VALUES (6, 2, 245456, '1999-11-11', '1999-11-13');

INSERT INTO RentalAgreement (rentalNo, memberNo, videoNo, dateOut, dateReturn)
VALUES (7, 4, 178643, '1999-11-14', '1999-11-16');

INSERT INTO RentalAgreement (rentalNo, memberNo, videoNo, dateOut, dateReturn)
VALUES (8, 3, 243431, '1999-11-11', '1999-11-13');

INSERT INTO RentalAgreement (rentalNo, memberNo, videoNo, dateOut, dateReturn)
VALUES (9, 1, 245457, '1999-11-12', '1999-11-14');

INSERT INTO RentalAgreement (rentalNo, memberNo, videoNo, dateOut, dateReturn)
VALUES (10, 3, 199004, '2000-8-10', NULL);

INSERT INTO RentalAgreement (rentalNo, memberNo, videoNo, dateOut, dateReturn)
VALUES (11, 2, 199004, '2000-8-17', '2000-8-20');

INSERT INTO RentalAgreement (rentalNo, memberNo, videoNo, dateOut, dateReturn)
VALUES (12, 6, 178643, '2004-2-5', '2004-2-7');

INSERT INTO RentalAgreement (rentalNo, memberNo, videoNo, dateOut, dateReturn)
VALUES (13, 6, 317411, '2004-2-5', '2004-2-7');

INSERT INTO RentalAgreement (rentalNo, memberNo, videoNo, dateOut, dateReturn)
VALUES (14, 4, 317411, '2003-2-5', '2003-2-7');

INSERT INTO RentalAgreement (rentalNo, memberNo, videoNo, dateOut, dateReturn)
VALUES (15, 1, 317411, '2002-2-5', '2002-2-7');
