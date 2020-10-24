SELECT '7.1 VDRL' AS 'Serological Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END)  AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Positive' AND c.locale = 'en')  THEN 1 END ) AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'VDRL(TPHA) (Serum)'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '7.2 TPHA' AS 'Serological Test' ,
    SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END) AS 'Total Exam' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Positive' AND c.locale = 'en')  THEN 1 END ) AS 'Number Postive'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name IN ('VDRL(TPHA) (Serum)', 'TPHA')
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL

SELECT '7.3 ASOT' AS 'Serological Test' ,
    SUM(CASE WHEN o.value_text IS NOT NULL THEN 1 END) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'ASOT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL

SELECT '7.4 HIV' AS 'Serological Test' ,
    SUM(CASE WHEN o.value_text IS NOT NULL THEN 1 END) AS 'Total Exam' ,
   SUM(CASE WHEN CAST(o.value_text AS UNSIGNED) >= 1 THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name IN ('HIV Tridot', 'HIV (Blood)', 'HIV (Serum)', 'HIV ELISA (Serum)', 'HIV ELISA (Blood)')
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL

SELECT '7.5 Brucella' AS 'Serological Test' ,
    SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Brucella'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	

UNION ALL
	
SELECT '7.6 Rheumatoid factor' AS 'Serological Test' ,
    SUM(CASE WHEN o.value_text IS NOT NULL THEN 1 END) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Rheumatoid factor'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL
	
SELECT '7.7 Helicobacter pylori' AS 'Serological Test' ,
    SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1  THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Helicobacter pylori'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL
	
SELECT '7.8 Hepatitis A test' AS 'Serological Test' ,
    SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1  THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Hepatitis A test'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	

UNION ALL
	
SELECT '7.9 Hepatitis B test' AS 'Serological Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Hepatitis B test'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL
	
SELECT '7.10 Hepatitis C test' AS 'Serological Test' ,
    SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Hepatitis C test'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'		
	
UNION ALL
	
SELECT '7.11 HCG' AS 'Serological Test' ,
    SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'B HCG'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL
	
SELECT '7.12 CRAG Test' AS 'Serological Test' ,
    SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END) AS 'Total Exam' ,
   ''  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CRAG Test'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	;									