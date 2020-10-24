
SELECT '3.1 Malaria BS (Under five years)' AS 'Malaria Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1  THEN 1 END)  AS 'Number Postive'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'Malaria BS'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '3.2 Malaria BS (5 years and above)' AS 'Malaria Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Number Postive'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') >= 5
   AND c.name = 'Malaria BS'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '3.3 Malaria Rapid Diagnostic Tests (Under five years)' AS 'Malaria Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Number Postive'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'Malaria Rapid Diagnostic Tests'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '3.4 Malaria Rapid Diagnostic Tests (5 years and
above)' AS 'Malaria Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Number Postive'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') >= 5
   AND c.name = 'Malaria Rapid Diagnostic Tests'
    AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

/* this is a subcategory. check from multiple concepts */
SELECT 'Stool Examination' AS 'Malaria Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   'Number Positive'  AS 'Number Postive'          
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name IN ('Taenia spp.' , 'Hymenolepis nana' , 'Hookworm' ,'Roundworms' ,'S. mansoni' , 'Trichuris trichura' ,'Amoeba')
AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

UNION ALL

SELECT '3.5 Taenia spp.' AS 'Malaria Test' ,
   '' AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1  THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Taenia spp.'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '3.6 Hymenolepis nana' AS 'Malaria Test' ,
   '' AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Hymenolepis nana'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '3.7 Hookworm' AS 'Malaria Test' ,
   '' AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Hookworm'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '3.8 Roundworms' AS 'Malaria Test' ,
   '' AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric= 1 THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Roundworms'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

UNION ALL

SELECT '3.9 S. mansoni' AS 'Malaria Test' ,
   '' AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric =1 THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'S. mansoni'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL

SELECT '3.10 Trichuris trichura' AS 'Malaria Test' ,
   '' AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric =1 THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Trichuris trichura'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 	
	
UNION ALL

SELECT '3.11 Amoeba' AS 'Malaria Test' ,
   '' AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Amoeba'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' ;
	 
	
	