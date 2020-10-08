SELECT '6.1 PAP smear' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	'' AS ''            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '6.2 Touch preparations' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	'' AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '6.3 Tissue impressions' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	'' AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

	
UNION ALL

SELECT 'Fine Needle Aspirates' AS 'Smears' ,
   'Total exam' AS 'Total Exam' ,
   'Malignant'  AS 'Malignant' ,
	'' AS 'TNM Stage'   
   
UNION ALL

SELECT '6.4 Thyroid' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	'' AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'   
	
UNION ALL

SELECT '6.5 Lymph nodes' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	'' AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'  
	
UNION ALL

SELECT '6.6 Liver' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	'' AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'  
	
UNION ALL

SELECT '6.7 Breast' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	'' AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'  
	
	
UNION ALL

SELECT '6.8 Soft tissue masses' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	'' AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL

SELECT 'Fluid Cytology' AS 'Smears' ,
   'Total exam' AS 'Total Exam' ,
   'Malignant'  AS 'Malignant' ,
	'' AS 'TNM Stage' 
	
UNION ALL
	
SELECT '6.9 Ascitic fluid' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	'' AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '6.10 CSF' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	'' AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '6.11 Pleural fluid' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	'' AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 	
	
UNION ALL
	
SELECT '6.12 Urine' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	'' AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL

SELECT 'Tissue Histology' AS 'Smears' ,
   'Total exam' AS 'Total Exam' ,
   'Malignant'  AS 'Malignant' ,
	'TNM Stage' AS 'TNM Stage' 
	
UNION ALL
	
SELECT '6.13 Prostrate' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '6.14 Breast tissue' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '6.15 Ovary' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '6.16 Uterus (Cervix)' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 	
	
UNION ALL
	
SELECT '6.17 Uterus (Endometrium)' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '6.18 Skin' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 														 		 	

UNION ALL
	
SELECT '6.19 Head and Neck' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '6.20 Oral' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '6.21 Esophagus' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '6.22 Colorectal' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '6.23 Hepatobiliary' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 	
	
UNION ALL
	
SELECT '6.24 Soft tissue and bone' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '6.25 Lymph nodes tissue' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
	
UNION ALL

SELECT 'Bone Marrow Studies' AS 'Smears' ,
   'Total exam' AS 'Total Exam' ,
   'Malignant'  AS 'Malignant' ,
	'' AS '' 
	
UNION ALL
	
SELECT '6.26 Bone marrow aspirate' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	''  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '6.27 Trephine biopsy' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	''  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'CODED_CONCEPT'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 		;						