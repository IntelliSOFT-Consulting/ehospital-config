/* this is a subcategory. check from multiple concepts */
SELECT '1.1 Urine Chemistry' AS 'Urine Test' ,
   SUM(CASE WHEN (o.value_coded IS NOT NULL OR o.value_text IS NOT NULL ) THEN 1 END ) AS 'Total Exam' ,
   'NUMBER POSTIVE'  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name IN ('Sugar (Routine Urin)' , 'Ketone bodies','Bence Jones Protein')
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '1.2 Glucose' AS 'Urine Test' ,
   '' AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Trace (3197)','1+ (3198)','2+ (3199)','3+ (3200)','4+ (3201)') AND c.locale = 'en') THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Sugar (Routine Urin)'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

UNION ALL

SELECT '1.3 Ketones' AS 'Urine Test' ,
   '' AS 'Total Exam' ,
   SUM(CASE WHEN CAST(o.value_text AS UNSIGNED) >= 0.6 THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name IN ('Urine Ketone','Ketone bodies')
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '1.4 Proteins' AS 'Urine Test' ,
   '' AS 'Total Exam' ,
   SUM(CASE WHEN CAST(o.value_text AS UNSIGNED) >= 8 THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Bence Jones Protein'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

/* this is a subcategory. check from multiple concepts */
SELECT '1.5 Urine Microscopy' AS 'Urine Test' ,
   SUM(CASE WHEN o.value_text IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
    'NUMBER POSTIVE'  AS 'Number Postive'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name IN ('Pus Cells (Urine)','Pus (Urine)','Vaginal Trichomonas','Yeast Cell')
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

UNION ALL

SELECT '1.6 Pus cells (>5/hpf)' AS 'Urine Test' ,
   '' AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name IN ('Pus Cells (Urine)','Pus (Urine)')
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '1.7 S. haematobiums' AS 'Urine Test' ,
   '' AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'S. haematobium'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '1.8 T. vaginalis' AS 'Urine Test' ,
   '' AS 'Total Exam' ,
   SUM(CASE WHEN o.value_text IS NOT NULL THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Vaginal Trichomonas'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '1.9 Yeast cells' AS 'Urine Test' ,
   '' AS 'Total Exam' ,
   SUM(CASE WHEN o.value_text IS NOT NULL THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Yeast Cell'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

UNION ALL

SELECT '1.10 Bacteria' AS 'Urine Test' ,
   '' AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Number Postive'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Bacteria'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'  ;