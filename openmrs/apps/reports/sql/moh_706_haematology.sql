SELECT '4.1 Full blood count' AS 'Haematology Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'HB <5 g/dl' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'HB between 5 and 10 g/dl'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='FULL BLOOD COUNT (HAEMOGRAM)'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
   	

UNION ALL
	
SELECT '4.2 HB estimation tests (other techniques)' AS 'Haematology Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'HB <5 g/dl' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'HB between 5 and 10 g/dl'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
   
UNION ALL
	
SELECT '' AS 'Haematology Test' ,
   'Total Exam' AS 'Total Exam' ,
   'Pre-diabetes'  AS 'HB <5 g/dl' ,
	'Diabetes'  AS 'HB between 5 and 10 g/dl' 
	  
UNION ALL
	
SELECT '4.3 Hemoglobin A1c (HbA1c)' AS 'Haematology Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'HB <5 g/dl' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'HB between 5 and 10 g/dl'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
   
UNION ALL
	
SELECT '' AS 'Haematology Test' ,
   'Total Exam' AS 'Total Exam' ,
   'Number <500'  AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl' 	
	
UNION ALL
	
SELECT '4.4 CD4 count' AS 'Haematology Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric  < 500  THEN 1 END)  AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL
	
SELECT 'Other Haematology Test' AS 'Haematology Test' ,
   'Total Exam' AS 'Total Exam' ,
   'Number Positive'  AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl' 
	
UNION ALL	
	
SELECT '4.5 Sickling test' AS 'Haematology Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Sickling test'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
   
UNION ALL	
	
SELECT '4.6 Peripheral blood films' AS 'Haematology Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   '' AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
   
UNION ALL	
	
SELECT '4.7 BMA' AS 'Haematology Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   '' AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	 
   
UNION ALL	
	
SELECT '4.8 Coagulation profile' AS 'Haematology Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   '' AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL	
	
SELECT '4.9 Reticulocyte Count' AS 'Haematology Test' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   '' AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Reticulocyte Count'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	 
   
UNION ALL
	
SELECT 'Other Haematology Test' AS 'Haematology Test' ,
   'Total Exam' AS 'Total Exam' ,
   'High'  AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl' 
	
UNION ALL	
	
SELECT '4.10 Erythrocyte Sedimentation rate' AS 'Haematology Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END) AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	 		
	 		    
UNION ALL
	
SELECT '' AS 'Haematology Test' ,
   '' AS 'Total Exam' ,
   ''  AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl' 
	
UNION ALL
	
SELECT 'Blood Grouping' AS 'Haematology Test' ,
   'Number' AS 'Total Exam' ,
   ''  AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl' 
	
UNION ALL	
	
SELECT '4.11 Total blood group tests' AS 'Haematology Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
  '' AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name IN ('Civil status' , 'Civil status')
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	 
	
UNION ALL	
	
SELECT '4.12 Blood units grouped' AS 'Haematology Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
  '' AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name IN ('Civil status' , 'Civil status')
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	 
	
UNION ALL
	
SELECT 'Blood Safety' AS 'Haematology Test' ,
   'Number' AS 'Total Exam' ,
   ''  AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl' 

UNION ALL
	
SELECT '4.13 Blood units received from blood transfusion centres' AS 'Haematology Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   '' AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	 
   
UNION ALL
	
SELECT '4.14 Blood units collected at facility' AS 'Haematology Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   '' AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL
	
SELECT '4.15 Blood units transfused' AS 'Haematology Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   '' AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'		
	
UNION ALL
	
SELECT '4.16 Transfusion reactions reported and investigated' AS 'Haematology Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   '' AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'		
	
UNION ALL
	
SELECT '4.17 Blood grouping and cross matched' AS 'Haematology Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   '' AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL
	
SELECT '4.18 Blood units discarded' AS 'Haematology Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   '' AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL
	
SELECT 'Blood Screening at facility' AS 'Haematology Test' ,
   'Number Positive' AS 'Total Exam' ,
   ''  AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl' 

UNION ALL	
	
SELECT '4.19 HIV' AS 'Haematology Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL	
	
SELECT '4.20 Hepatitis B' AS 'Haematology Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL	
	
SELECT '4.21 Hepatitis C' AS 'Haematology Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL	
	
SELECT '4.22 Syphillis' AS 'Haematology Test' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'HB <5 g/dl' ,
	''  AS 'HB between 5 and 10 g/dl'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'																      
 															      
 