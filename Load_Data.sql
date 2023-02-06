-- I loaded data types using the wizard, and used the following to import all the files.

LOAD DATA LOCAL INFILE 'filepath'
INTO TABLE tablename
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
