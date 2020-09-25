
SELECT '2.1 Blood sugar' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.2 OGTT' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

UNION ALL	

/* this is a subcategory. check from multiple concepts */
SELECT '2.3 Renal Function Test' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   'LOW'  AS 'Low' ,
	 'HIGH'  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name IN ('Civil status' , 'Civil status')
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.4 Creatinine' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.5 Urea' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.5 Sodium' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

UNION ALL	

/* this is a subcategory. check from multiple concepts */
SELECT '2.6 Potassium' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.7 Chlorides' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

/* this is a subcategory. check from multiple concepts */
SELECT '2.8 Liver Function Test' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   'LOW'  AS 'Low' ,
	 'HIGH'  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name IN ('Civil status' , 'Civil status')
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL	

SELECT '2.9 Direct bilirubin' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.10 Total bilirubin' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.11 ASAT (SGOT)' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

UNION ALL	


SELECT '2.12 ALAT (SGPT)' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.13 Serum Protein' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.14 Albumin' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.15 Alkaline Phosphatase' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

/* this is a subcategory. check from multiple concepts */
SELECT '2.16 Lipid Profile' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   'LOW'  AS 'Low' ,
	 'HIGH'  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name IN ('Civil status' , 'Civil status')
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

UNION ALL	


SELECT '2.17 Total cholesterol' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.18 Triglycerides' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL	


SELECT '2.19 LDL' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT 'Hormonal Test' AS 'Blood Sugar Test' ,
   'Total Exam' AS 'Total Exam' ,
   'LOW'  AS 'Low' ,
	 'HIGH'  AS 'High'     

UNION ALL 

SELECT '2.20 T3' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.21 T4' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL	


SELECT '2.22 TSH' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'   

UNION 

SELECT 'Tumor Markers' AS 'Blood Sugar Test' ,
   'Total Exam' AS 'Total Exam' ,
   'Number Postive'  AS 'Number Postive' ,
	' '  AS ' '  

/* .information_schema........... */
UNION ALL

SELECT '2.23 PSA' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Number Postive' ,
	' '  AS ' '         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL	

SELECT '2.24 CA 15-3' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Number Postive' ,
	' '  AS ' '         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.25 CA 19-9' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Number Postive' ,
	' '  AS ' '         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL	

SELECT '2.26 CA 125' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Number Postive' ,
	' '  AS ' '         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

UNION ALL

SELECT '2.27 CEA' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Number Postive' ,
	' '  AS ' '         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL	

SELECT '2.28 AFP' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Number Postive' ,
	' '  AS ' '         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

UNION ALL

SELECT 'CSF Chemistry' AS 'Blood Sugar Test' ,
   'Total Exam' AS 'Total Exam' ,
   'Low'  AS 'Low' ,
	'High'  AS 'High'  
	
UNION ALL
	
SELECT '2.29 Proteins' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'  
	
UNION ALL
	
SELECT '2.30 Glucose' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'  ;
	

	
	


	
	