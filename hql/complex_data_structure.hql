CREATE EXTERNAL TABLE IF NOT EXISTS COMPLEX_TABLE(
id_unique STRING,
name STRING,
date_int TIMESTAMP,
qualifications ARRAY<STRUCT<
    id:STRING,
    name:STRING,
    cgpa:STRING
>>,
active boolean
)
row format delimited
fields terminated by '\;'
collection items terminated by '|'
map keys terminated by ','
lines terminated by '\n'
stored as TEXTFILE
location '/user/cloudera/test/complex';


select * from complex_table
select qualifications from complex_table;
select qualifications[1] from complex_table;
select id_unique, name, qualifications[1] from complex_table;
select id_unique, name, qualifications from complex_table limit 1;
-- Split the array into multiple rows
select id_unique, name, qualification from complex_table LATERAL VIEW EXPLODE(qualifications) qualificationsTable as qualification;


