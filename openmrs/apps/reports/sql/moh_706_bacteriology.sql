SELECT '5.1 Urine' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Total Cultures' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'No. Culture Positive'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
   
UNION ALL

SELECT '5.2 Pus swabs' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Total Cultures' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'No. Culture Positive'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
   
UNION ALL

SELECT '5.3 High Vaginal Swabs' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Total Cultures' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'No. Culture Positive'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'   
   
UNION ALL

SELECT '5.4 Throat swab' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Total Cultures' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'No. Culture Positive'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	     
UNION ALL

SELECT '5.5 Rectal swab' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Total Cultures' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'No. Culture Positive'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'  

UNION ALL
   
SELECT '5.6 Blood' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Total Cultures' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'No. Culture Positive'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name IN ('Absolute Eosinphil Count','Haemoglobin', 'Eosinophil (Blood)', 
	'Lymphocyte (Blood)', 'Packed Cell Volume (PCV)', 'Platelet Count', 
	'Basophil (Blood)', 'Total Leucocyte Count',  'APTT (Test) (Blood)', 
	'ESR','Neutrophil', 'Monocyte (Blood)', 'INR Ratio (Blood)', 
	'Prothrombin Time (Control) (Blood)','Haemoglobin (Relative)',  
	 'Eosinophil, Lymphocyte', 'Polymorph', 'Fasting Blood Sugar', 
	 'Post Blood Sugar (30 mins)',  'Post Blood Sugar (60 mins)', 
	 'Post Blood Sugar (90 mins)','Post Blood Sugar (120 mins)')
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'   

UNION ALL
	
SELECT '5.7 Water' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Total Cultures' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'No. Culture Positive'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'  	 
   
UNION ALL
	
SELECT '5.8 Food' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Total Cultures' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'No. Culture Positive'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL
	
SELECT '5.9 Urethral swabs' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Total Cultures' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'No. Culture Positive'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'  
	
UNION ALL
	
SELECT 'Bacterial enteric pathogens' AS 'Bacteriological Sample' ,
   'Total exam' AS 'Total Exam' ,
   'Number Positive'  AS 'Total Cultures' ,
	 '' AS 'No. Culture Positive'   

UNION ALL
	
SELECT '5.10 Stool Cultures' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Total Cultures' ,
	''  AS 'No. Culture Positive'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Culture (Stool)'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT 'Stool Isolates' AS 'Bacteriological Sample' ,
   'Number positive' AS 'Total Exam' ,
   ''  AS 'Total Cultures' ,
	''  AS 'No. Culture Positive'  
			      
UNION ALL
	
SELECT '5.11 Salmonella typie' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)   ,
   ''  ,
	''           
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'  
	
UNION ALL
	
SELECT '5.12 Shigella - dysenteriae type1' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)   ,
   ''  ,
	''           
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'  
	
UNION ALL
	
SELECT '5.13 E. coli O 157:H7' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)   ,
   ''  ,
	''           
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '5.14 V. cholerae O1' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)   ,
   ''  ,
	''           
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '5.15 V. cholerae O139' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)   ,
   ''  ,
	''           
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT 'Bacterial Meningitis' AS 'Bacteriological Sample' ,
   'Total Exam' AS 'Total Exam' ,
   'Number postive'  AS 'Total Cultures' ,
	'Number Contaminated'  AS 'No. Culture Positive'  							   
   	  	   
UNION ALL

SELECT '5.16 CSF' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Total Cultures' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'No. Culture Positive'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
	
UNION ALL
	
SELECT 'Bacterial meningitis Serotypes' AS 'Bacteriological Sample' ,
   'Number postive' AS 'Total Exam' ,
   ''  AS 'Total Cultures' ,
	''  AS 'No. Culture Positive'
	
UNION ALL
	
SELECT '5.17 Neisseria meningitidis A' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)   ,
   ''  ,
	''           
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL
	
SELECT '5.18 Neisseria meningitidis B' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)   ,
   ''  ,
	''           
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL
	
SELECT '5.19 Neisseria meningitidis C' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)   ,
   ''  ,
	''           
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL
	
SELECT '5.20 Neisseria meningitidis W135' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)   ,
   ''  ,
	''           
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'		
	
UNION ALL
	
SELECT '5.21 Neisseria meningitidis X' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)   ,
   ''  ,
	''           
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'		

UNION ALL
	
SELECT '5.22 Neisseria meningitidis Y' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)   ,
   ''  ,
	''           
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL
	
SELECT '5.23 N.meningitidis (indeterminate)' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)   ,
   ''  ,
	''           
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL
	
SELECT '5.24 Streptococcus pneumonia' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)   ,
   ''  ,
	''           
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'		
	
UNION ALL
	
SELECT '5.25 Haemophilus influenzae (type b)' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)   ,
   ''  ,
	''           
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL
	
SELECT '5.26 Cryptococcal Meningitis' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)   ,
   ''  ,
	''           
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'		
	
UNION ALL
	
SELECT 'Bacterial Pathogens from other types of specimen' AS 'Bacteriological Sample' ,
   'Number postive' AS 'Total Exam' ,
   ''  AS 'Total Cultures' ,
	''  AS 'No. Culture Positive'		

UNION ALL
	
SELECT '5.27 B. anthracis' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)   ,
   ''  ,
	''           
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'		
	
UNION ALL
	
SELECT '5.28 Y. pestis' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)   ,
   ''  ,
	''           
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL
	
SELECT 'SPUTUM' AS 'Bacteriological Sample' ,
   'Total Exam' AS 'Total Exam' ,
   'Number postive'  AS 'Total Cultures' ,
	''  AS 'No. Culture Positive'
	
UNION ALL

SELECT '5.29 Total TB smears' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Total Cultures' ,
	''  AS 'No. Culture Positive'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL

SELECT '5.30 New presumptive TB cases' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Total Cultures' ,
	''  AS 'No. Culture Positive'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL

SELECT '5.31 TB Follow up' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Total Cultures' ,
	''  AS 'No. Culture Positive'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL

SELECT '5.32 Rifampicin Resistant TB' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Total Cultures' ,
	''  AS 'No. Culture Positive'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL

SELECT '5.33 MDR TB' AS 'Bacteriological Sample' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'OTHER NON-CODED' AND c.locale = 'en') THEN 1 END)  AS 'Total Cultures' ,
	''  AS 'No. Culture Positive'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name ='Civil status'
   AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' ;										     