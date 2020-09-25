/* this is a subcategory. check from multiple concepts */
SELECT '1.1 Urine Chemistry' AS 'Urine Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   'NUMBER POSTIVE'  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name IN ('CODED_CONCEPT' , 'CODED_CONCEPT')
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '1.2 Glucose' AS 'Urine Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

UNION ALL

SELECT '1.3 Ketones' AS 'Urine Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '1.4 Proteins' AS 'Urine Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

/* this is a subcategory. check from multiple concepts */
SELECT '1.5 Urine Microscopy' AS 'Urine Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
    'NUMBER POSTIVE'  AS 'Number Postive'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name IN ('CODED_CONCEPT' , 'CODED_CONCEPT')
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

UNION ALL

SELECT '1.6 Pus cells (>5/hpf)' AS 'Urine Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '1.7 S. haematobiums' AS 'Urine Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '1.8 T. vaginalis' AS 'Urine Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '1.9 Yeast cells' AS 'Urine Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

UNION ALL

SELECT '1.10 Bacteria' AS 'Urine Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'  ;
	
	