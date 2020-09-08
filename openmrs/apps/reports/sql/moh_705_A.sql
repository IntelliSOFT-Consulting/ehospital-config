DROP TABLE IF EXISTS obs_temp;
 CREATE TEMPORARY TABLE obs_temp (
  id int(11) NOT NULL AUTO_INCREMENT ,
  diseases varchar(50) DEFAULT NULL,
  concept_id int(11) DEFAULT NULL,
  day_1 int(11) DEFAULT 0,
  day_2 int(11) DEFAULT 0,
  day_3 int(11) DEFAULT 0 ,
  day_4 int(11) DEFAULT 0 ,
  day_5 int(11) DEFAULT 0 ,
  day_6 int(11) DEFAULT 0 ,
  day_7 int(11) DEFAULT 0 ,
  day_8 int(11) DEFAULT 0 ,
  day_9 int(11) DEFAULT 0 ,
  day_10 int(11) DEFAULT 0 ,
  day_11 int(11) DEFAULT 0 ,
  day_12 int(11) DEFAULT 0 ,
  day_13 int(11) DEFAULT 0 ,
  day_14 int(11) DEFAULT 0 ,
  day_15 int(11) DEFAULT 0 ,
  day_16 int(11) DEFAULT 0 ,
  day_17 int(11) DEFAULT 0 ,
  day_18 int(11) DEFAULT 0 ,
  day_19 int(11) DEFAULT 0 ,
  day_20 int(11) DEFAULT 0 ,
  day_21 int(11) DEFAULT 0 ,
  day_22 int(11) DEFAULT 0 ,
  day_23 int(11) DEFAULT 0 ,
  day_24 int(11) DEFAULT 0 ,
  day_25 int(11) DEFAULT 0 ,
  day_26 int(11) DEFAULT 0 ,
  day_27 int(11) DEFAULT 0 ,
  day_28 int(11) DEFAULT 0 ,
  day_29 int(11) DEFAULT 0 ,
  day_30 int(11) DEFAULT 0 ,
  day_31 int(11) DEFAULT 0 ,
  Totals int(11) DEFAULT 0 ,      
  CONSTRAINT pk_id PRIMARY KEY (id)) ;
   
  INSERT INTO obs_temp (concept_id) 
  SELECT DISTINCT c.concept_id FROM openmrs.concept_name c 
  WHERE	c.concept_id IN (1,2,3 ,4,5,6 ,1054) ;
  
  UPDATE obs_temp ot, openmrs.concept_name c 
  SET ot.diseases = c.name 
  WHERE c.concept_id = ot.concept_id
  AND c.locale = "en" ; 
  
  /* this query  requires the first and last day of the same month*/
  UPDATE obs_temp ot 
  SET ot.day_1 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 0 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_2 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 1 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_3 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 2 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_4 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 3 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_5 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 4 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_6 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 5 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_7 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 6 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_8 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 7 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_9 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 8 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_10 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 9 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_11 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 10 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_12 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 11 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_13 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 12 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_14 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 13 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_15 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 14 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_16 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 15 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_17 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 16 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_18 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 17 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_19 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 18 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_20 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 19 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_21 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 20 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_22 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 21 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_23 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 22 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_24 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 23 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_25 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 24 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_26 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 25 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_27 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 26 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_28 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 27 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_29 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 28 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
   UPDATE obs_temp ot 
  SET ot.day_30 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 29 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;
  
  UPDATE obs_temp ot 
  SET ot.day_31 = (SELECT COUNT(ob.person_id) FROM  openmrs.obs ob ,openmrs.person p  WHERE ob.concept_id = ot.concept_id AND p.person_id = ob.person_id AND  TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5 AND ob.obs_datetime = DATE_ADD('#startDate#', INTERVAL 30 DAY))
  WHERE EXTRACT(DAY FROM '#startDate#') = 1 
  AND  LAST_DAY('#startDate#') = '#endDate#'
  AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0;

  UPDATE obs_temp ot 
  SET ot.Totals  = (SELECT day_1 + day_2 + day_3 + day_4 + day_5 + day_6 + day_7 + day_8 + day_9 + day_10 + day_11 + day_12 + day_13 + day_14 + day_15 + day_16
  + day_17 + day_18 + day_19 + day_20 + day_21 + day_22 + day_23 + day_24 + day_25 + day_26 + day_27 + day_28 + day_29 + day_30 + day_31 ) 
  WHERE ot.concept_id IS NOT NULL;
    
 DROP TABLE IF EXISTS view_temp;
 CREATE TEMPORARY TABLE view_temp
 
 ALTER TABLE view_temp DROP COLUMN concept_id;

 SELECT * FROM view_temp ; 