
SELECT '0 to 5' AS 'Age Group' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Diabetes mellitus, type 1','Diabetes mellitus, type 2','Gestational Diabetes Mellitus','Diabetes secondary to other causes') AND cn.locale = 'en') AND p.gender = 'M' ) THEN 1 END ) AS 'Diabetes Male' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Diabetes mellitus, type 1','Diabetes mellitus, type 2','Gestational Diabetes Mellitus','Diabetes secondary to other causes') AND cn.locale = 'en') AND p.gender = 'F' ) THEN 1 END ) AS 'Diabetes FeMale' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Hypertension','Pre-eclampsia') AND cn.locale = 'en') AND p.gender = 'M' ) THEN 1 END ) AS 'Hypertension Male' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Hypertension','Pre-eclampsia') AND cn.locale = 'en') AND p.gender = 'F' ) THEN 1 END ) AS 'Hypertension FeMale'
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#' ) BETWEEN 0 AND 5
 INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
 WHERE c.locale = 'en' 
   AND c.name IN ('Final diagnosis')
   
  UNION ALL 
  
 SELECT '6 to 18' AS 'Age Group' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Diabetes mellitus, type 1','Diabetes mellitus, type 2','Gestational Diabetes Mellitus','Diabetes secondary to other causes') AND cn.locale = 'en') AND p.gender = 'M' ) THEN 1 END ) AS 'Diabetes Male' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Diabetes mellitus, type 1','Diabetes mellitus, type 2','Gestational Diabetes Mellitus','Diabetes secondary to other causes') AND cn.locale = 'en') AND p.gender = 'F' ) THEN 1 END ) AS 'Diabetes FeMale' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Hypertension','Pre-eclampsia') AND cn.locale = 'en') AND p.gender = 'M' ) THEN 1 END ) AS 'Hypertension Male' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Hypertension','Pre-eclampsia') AND cn.locale = 'en') AND p.gender = 'F' ) THEN 1 END ) AS 'Hypertension FeMale'
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#' ) BETWEEN 6 AND 18
 INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
 WHERE c.locale = 'en' 
 AND c.name IN ('Final diagnosis')
   
UNION ALL 

 SELECT '19 to 35' AS 'Age Group' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Diabetes mellitus, type 1','Diabetes mellitus, type 2','Gestational Diabetes Mellitus','Diabetes secondary to other causes') AND cn.locale = 'en') AND p.gender = 'M' ) THEN 1 END ) AS 'Diabetes Male' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Diabetes mellitus, type 1','Diabetes mellitus, type 2','Gestational Diabetes Mellitus','Diabetes secondary to other causes') AND cn.locale = 'en') AND p.gender = 'F' ) THEN 1 END ) AS 'Diabetes FeMale' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Hypertension','Pre-eclampsia') AND cn.locale = 'en') AND p.gender = 'M' ) THEN 1 END ) AS 'Hypertension Male' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Hypertension','Pre-eclampsia') AND cn.locale = 'en') AND p.gender = 'F' ) THEN 1 END ) AS 'Hypertension FeMale'
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#' ) BETWEEN 19 AND 35
 INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
 WHERE c.locale = 'en' 
 AND c.name IN ('Final diagnosis')
 
 UNION ALL
 
  SELECT '36 to 60' AS 'Age Group' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Diabetes mellitus, type 1','Diabetes mellitus, type 2','Gestational Diabetes Mellitus','Diabetes secondary to other causes') AND cn.locale = 'en') AND p.gender = 'M' ) THEN 1 END ) AS 'Diabetes Male' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Diabetes mellitus, type 1','Diabetes mellitus, type 2','Gestational Diabetes Mellitus','Diabetes secondary to other causes') AND cn.locale = 'en') AND p.gender = 'F' ) THEN 1 END ) AS 'Diabetes FeMale' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Hypertension','Pre-eclampsia') AND cn.locale = 'en') AND p.gender = 'M' ) THEN 1 END ) AS 'Hypertension Male' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Hypertension','Pre-eclampsia') AND cn.locale = 'en') AND p.gender = 'F' ) THEN 1 END ) AS 'Hypertension FeMale'
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#' ) BETWEEN 36 AND 60
 INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
 WHERE c.locale = 'en' 
 AND c.name IN ('Final diagnosis')
 
 UNION ALL
 
 SELECT '> 60' AS 'Age Group' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Diabetes mellitus, type 1','Diabetes mellitus, type 2','Gestational Diabetes Mellitus','Diabetes secondary to other causes') AND cn.locale = 'en') AND p.gender = 'M' ) THEN 1 END ) AS 'Diabetes Male' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Diabetes mellitus, type 1','Diabetes mellitus, type 2','Gestational Diabetes Mellitus','Diabetes secondary to other causes') AND cn.locale = 'en') AND p.gender = 'F' ) THEN 1 END ) AS 'Diabetes FeMale' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Hypertension','Pre-eclampsia') AND cn.locale = 'en') AND p.gender = 'M' ) THEN 1 END ) AS 'Hypertension Male' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Hypertension','Pre-eclampsia') AND cn.locale = 'en') AND p.gender = 'F' ) THEN 1 END ) AS 'Hypertension FeMale'
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#' ) > 60
 INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
 WHERE c.locale = 'en' 
 AND c.name IN ('Final diagnosis')
 
  UNION ALL
 
 SELECT 'Total' AS 'Age Group' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Diabetes mellitus, type 1','Diabetes mellitus, type 2','Gestational Diabetes Mellitus','Diabetes secondary to other causes') AND cn.locale = 'en') AND p.gender = 'M' ) THEN 1 END ) AS 'Diabetes Male' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Diabetes mellitus, type 1','Diabetes mellitus, type 2','Gestational Diabetes Mellitus','Diabetes secondary to other causes') AND cn.locale = 'en') AND p.gender = 'F' ) THEN 1 END ) AS 'Diabetes FeMale' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Hypertension','Pre-eclampsia') AND cn.locale = 'en') AND p.gender = 'M' ) THEN 1 END ) AS 'Hypertension Male' ,
   SUM(CASE WHEN (o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Hypertension','Pre-eclampsia') AND cn.locale = 'en') AND p.gender = 'F' ) THEN 1 END ) AS 'Hypertension FeMale'
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
 INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
 WHERE c.locale = 'en' 
 AND c.name IN ('Final diagnosis');
 
 
	