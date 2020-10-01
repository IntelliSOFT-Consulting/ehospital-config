
SELECT '2.1 Blood sugar' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric < 60 THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_numeric > 140 THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Blood sugar'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.2 OGTT' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric BETWEEN 140 AND 199  THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_numeric > 200 THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='OGTT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

UNION ALL	

/* this is a subcategory. check from multiple concepts */
SELECT '2.3 Renal Function Test' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   'LOW'  AS 'Low' ,
	 'HIGH'  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name IN ('Civil status' , 'Civil status')
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.4 Creatinine' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric < 0.84 THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_numeric > 1.3 THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Serum creatinine (mg/dL)'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.5 Urea' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric < 17 THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_numeric > 43 THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Urea'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.5 Sodium' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric < 135 THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_numeric > 145 THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Sodium'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

UNION ALL	

SELECT '2.6 Potassium' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Potassium'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.7 Chlorides' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric < 98 THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_numeric > 107 THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Chlorides'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

/* this is a subcategory. check from multiple concepts */
SELECT '2.8 Liver Function Test' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   'LOW'  AS 'Low' ,
	 'HIGH'  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name IN ('Civil status' , 'Civil status')
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL	

SELECT '2.9 Direct bilirubin' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric < 0.1 THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_numeric > 0.2 THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Direct bilirubin'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.10 Total bilirubin' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Total bilirubin'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.11 ASAT (SGOT)' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN  (o.value_numeric < 10 AND ps.gender = 'M') OR (o.value_numeric < 9 AND ps.gender = 'F') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN (o.value_numeric > 40 AND ps.gender = 'M') OR (o.value_numeric > 32 AND ps.gender = 'F') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person ps ON o.person_id = ps.person_id
   AND c.name ='ASAT (SGOT)'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

UNION ALL	


SELECT '2.12 ALAT (SGPT)' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='ALAT (SGPT)'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.13 Serum Protein' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric < 6 THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_numeric > 8 THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Serum Protein'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.14 Albumin' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric < 3.4 THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_numeric > 5.4 THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Albumin'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.15 Alkaline Phosphatase' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN (o.value_numeric < 20 AND ps.gender = 'M') OR (o.value_numeric < 20 AND ps.gender = 'F') THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN (o.value_numeric > 70 AND ps.gender = 'M') OR (o.value_numeric > 150 AND ps.gender = 'F') THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person ps ON o.person_id = ps.person_id 
   AND c.name ='Alkaline Phosphatase'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

/* this is a subcategory. check from multiple concepts */
SELECT '2.16 Lipid Profile' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   'LOW'  AS 'Low' ,
	 'HIGH'  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name IN ('Civil status' , 'Civil status')
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

UNION ALL	


SELECT '2.17 Total cholesterol' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric < 200 THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_numeric > 239 THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Total cholesterol'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.18 Triglycerides' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric < 150 THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_numeric > 199 THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Triglycerides'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL	

SELECT '2.19 LDL' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric < 130 THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_numeric > 159 THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='LOW-DENSITY LIPOPROTEIN CHOLESTEROL'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT 'Hormonal Test' AS 'Blood Sugar Test' ,
   'Total Exam' AS 'Total Exam' ,
   'LOW'  AS 'Low' ,
	 'HIGH'  AS 'High'     

UNION ALL 

SELECT '2.20 T3' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric < 100 THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_numeric > 200 THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='T3'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.21 T4' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric < 5  THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_numeric > 12 THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='T4'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL	


SELECT '2.22 TSH' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric < 0.5 THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_numeric > 4.1 THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='TSH'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'   

UNION 

SELECT 'Tumor Markers' AS 'Blood Sugar Test' ,
   'Total Exam' AS 'Total Exam' ,
   'Number Postive'  AS 'Number Postive' ,
	' '  AS ' '  


UNION ALL

SELECT '2.23 PSA' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric > 10 THEN 1 END)  AS 'Number Postive' ,
	' '  AS ' '         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='PSA'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL	

SELECT '2.24 CA 15-3' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric > 30 THEN 1 END)  AS 'Number Postive' ,
	' '  AS ' '         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='CA 15-3'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '2.25 CA 19-9' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric > 37 THEN 1 END)  AS 'Number Postive' ,
	' '  AS ' '         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='CA 19-9'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL	

SELECT '2.26 CA 125' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric > 46 THEN 1 END)  AS 'Number Postive' ,
	' '  AS ' '         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='CA 125'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

UNION ALL

SELECT '2.27 CEA' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric > 3 THEN 1 END)  AS 'Number Postive' ,
	' '  AS ' '         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='CEA'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL	

SELECT '2.28 AFP' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric > 400 THEN 1 END)  AS 'Number Postive' ,
	' '  AS ' '         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='AFP'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

UNION ALL

SELECT 'CSF Chemistry' AS 'Blood Sugar Test' ,
   'Total Exam' AS 'Total Exam' ,
   'Low'  AS 'Low' ,
	'High'  AS 'High'  
	
UNION ALL
	
SELECT '2.29 Proteins' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric < 6 THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_numeric > 8 THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Proteins'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'  
	
UNION ALL
	
SELECT '2.30 Glucose' AS 'Blood Sugar Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric < 50 THEN 1 END)  AS 'Low' ,
	SUM(CASE WHEN o.value_numeric > 126 THEN 1 END)  AS 'High'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='GLUCOSE'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'  ;
	

	
	


	
	