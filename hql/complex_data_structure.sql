CREATE EXTERNAL TABLE IF NOT EXISTS
COMPLEX_TABLE(
    id_unique STRING,
	name STRING,
    date_int TIMESTAMP,
    degree ARRAY<STRUCT<
        id:STRING,
        name:STRING,
        cgpa:STRING
    >>,
	family ARRAY<STRUCT<
        name:STRING,
		dob:DATE,
		relationship:STRING,
        degree: ARRAY<STRUCT<
        id:STRING,
        name:STRING,
        cgpa:STRING
    >>>>,
	active boolean
)
row format delimited fields terminated by '\;'
collection items terminated by '|'
map keys terminated by ','
lines terminated by '\n'
stored as TEXTFILE
location '/your/hdfs/file/directory';

select * from complex_table
select family from complex_table;


select family[1] from complex_table;
