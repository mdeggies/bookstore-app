create table "CATEGORY"(
	MYSTERY VARCHAR(40),
	FICTION VARCHAR(40),
	NONFICTION VARCHAR(40),
	HORROR VARCHAR(40),
        ADULT VARCHAR(40)
)

create table "LOGIN"
(
    USERNAME VARCHAR(30),
    PASSWORD VARCHAR(30)
)

create table "INFO"
(
	FNAME VARCHAR(30),
	GENDER VARCHAR(12),
	CARD VARCHAR(40),
	BORN VARCHAR(12),
        ADDRESS VARCHAR(60)
)

create table "DETAIL"(
	BOOKNAME VARCHAR(40),
	PRICE VARCHAR(10),
	AUTHOR VARCHAR(40),
)

INSERT INTO CATEGORY (MYSTERY,FICTION,NONFICTION,HORROR,ADULT) VALUES 
("The Girl With The Dragon Tattoo"), ("Matterhorn"), ("Into The Wild"), 
("The Walking Dead", "Revival" ), ("Fifty Shades of Grey")

INSERT INTO CATEGORY (BOOKNAME,PRICE,AUTHOR) VALUES 
("The Girl With The Dragon Tattoo", "Matterhorn", "Into The Wild", 
"The Walking Dead","Revival","Fifty Shades of Grey"), ("16.00", "12.99", "7.50", "6.00", "9.99", "4.50"), 
("Stieg Larrson","Karl Marlantes","John Krauker","Robert Kirkman", "Stephen King","E.L James")