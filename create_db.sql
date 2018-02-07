DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

CREATE TABLE book
(
  id int(8) NOT NULL AUTO_INCREMENT,
  title varchar(100) NOT NULL,
  description varchar(255) NOT NULL,
  author varchar(100) NOT NULL,
  isbn varchar(20) NOT NULL,
  printYear INT,
  readAlready BIT DEFAULT FALSE,
  PRIMARY KEY (id)
);

INSERT INTO book (title, description, author, isbn, printYear) VALUES
  ("Book 1", "programmer", "Sun", "978-5-94074-568-6", 1995),
  ("Book 2", "programmer", "Sun", "978-5-94074-568-6", 1997),
  ("Book 3", "programmer", "right", "978-5-94074-568-6", 1998),
  ("Book 4", "programmer", "Sun", "978-5-94074-568-6", 2000),
  ("Book 5", "programmer", "Sun", "978-5-94074-568-6", 2005),
  ("Book 6", "programmer", "Oracle", "978-5-94074-568-6", 2006),
  ("Book 7", "programmer", "love", "978-5-94074-568-6", 2013),
  ("Book 8", "programmer", "Oracle", "978-5-94074-568-6", 1995),
  ("Book 9", "programmer", "Oracle", "978-5-94074-568-6", 1997),
  ("Book 10", "programmer", "Oracle", "978-5-94074-568-6", 1998),
  ("Book 11", "programmer", "Oracle", "978-5-94074-568-6", 2000),
  ("Book 12", "programmer", "Good", "978-5-94074-568-6", 2005),
  ("Book 13", "programmer", "very Good", "978-5-94074-568-6", 2006),
  ("Book 14", "programmer", "Oracle", "978-5-94074-568-6", 2013),
  ("Book 15", "programmer", "Oracle", "978-5-94074-568-6", 1995),
  ("Book 16", "programmer", "Oracle", "978-5-94074-568-6", 1997),
  ("Book 17", "programmer", "Oracle", "978-5-94074-568-6", 1998),
  ("Book 18", "programmer", "Oracle", "978-5-94074-568-6", 2000),
  ("Book 19", "programmer", "Oracle", "978-5-94074-568-6", 2005),
  ("Book 20", "programmer", "Oracle", "978-5-94074-568-6", 2006),
  ("Book 21", "programmer", "Oracle", "978-5-94074-568-6", 2013);
