
CREATE OR REPLACE PROCEDURE fill_na( 
  table_name in VARCHAR2,
  column_name1 in VARCHAR2,
  column_name2 in VARCHAR2,
  fill_value in VARCHAR2 DEFAULT 'blank')
AS
 sql_statement VARCHAR2(1000);
BEGIN
  sql_statement := 
  'UPDATE ' || table_name ||
   ' set ' || column_name1 || ' = :fill_value' ||
   ' where ' || column_name2 || ' is null';
   
    EXECUTE IMMEDIATE sql_statement USING fill_value;
    COMMIT;
END;
