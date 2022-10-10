# DATABASE
CREATE database VideoClub;

# TABLES
CREATE TABLE Director
(
    DirectorNo   CHAR(5) NOT NULL,
    DirectorName VARCHAR(25),
    PRIMARY KEY (directorNo)
);


CREATE TABLE Video
(
    catalogNo   INT NOT NULL,
    title       VARCHAR(30),
    certificate VARCHAR(10),
    category    VARCHAR(10),
    dailyRental DECIMAL(15, 4),
    price       DECIMAL(15, 4),
    DirectorNo  CHAR(5),
    PRIMARY KEY (catalogNo),
    FOREIGN KEY (directorNo) REFERENCES Director (directorNo)
);

CREATE TABLE VideoForRent
(
    videoNo   INT NOT NULL,
    available INT,
    catalogNo INT,
    PRIMARY KEY (videoNo),
    FOREIGN KEY (catalogNo) REFERENCES Video (catalogNo)
);

CREATE TABLE Members
(
    memberNo   INT NOT NULL,
    fName      VARCHAR(15),
    lName      VARCHAR(15),
    sex        CHAR(1) DEFAULT 'M' CHECK (sex in ('M', 'F')),
    DOB        timestamp,
    address    VARCHAR(50),
    dateJoined timestamp,
    PRIMARY KEY (memberNo)
);

CREATE TABLE RentalAgreement
(
    rentalNo   INT NOT NULL,
    memberNo   INT,
    videoNo    INT,
    dateOut    timestamp DEFAULT NOW(),
    dateReturn timestamp,
    PRIMARY KEY (rentalNo),
    FOREIGN KEY (videoNo) REFERENCES VideoForRent (videoNo),
    FOREIGN KEY (memberNo) REFERENCES Members (memberNo)
);
