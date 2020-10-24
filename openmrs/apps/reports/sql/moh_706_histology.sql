SELECT '6.1 PAP smear' AS 'Smears' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric= 1 THEN 1 END)  AS 'Malignant' ,
	'' AS ''            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'PAP smear'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '6.2 Touch preparations' AS 'Smears' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Malignant' ,
	'' AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'Touch preparations'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '6.3 Tissue impressions' AS 'Smears' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Malignant' ,
	'' AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'Tissue impressions'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

	
UNION ALL

SELECT 'Fine Needle Aspirates' AS 'Smears' ,
   'Total exam' AS 'Total Exam' ,
   'Malignant'  AS 'Malignant' ,
	'' AS 'TNM Stage'   
   
UNION ALL

SELECT '6.4 Thyroid' AS 'Smears' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric THEN 1 END)  AS 'Malignant' ,
	'' AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'Thyroid'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'   
	
UNION ALL

SELECT '6.5 Lymph nodes' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric THEN 1 END)  AS 'Malignant' ,
	'' AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'Lymph nodes'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'  
	
UNION ALL

SELECT '6.6 Liver' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric THEN 1 END)  AS 'Malignant' ,
	'' AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'Liver'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'  
	
UNION ALL

SELECT '6.7 Breast' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Malignant' ,
	'' AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'Breast'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'  
	
	
UNION ALL

SELECT '6.8 Soft tissue masses' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	'' AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'Soft tissue masses'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL

SELECT 'Fluid Cytology' AS 'Smears' ,
   'Total exam' AS 'Total Exam' ,
   'Malignant'  AS 'Malignant' ,
	'' AS 'TNM Stage' 
	
UNION ALL
	
SELECT '6.9 Ascitic fluid' AS 'Smears' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Malignant' ,
	'' AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name  IN ('Protein (Asitic Fluid)', 'Sugar (Asitic Fluid)', 'Total Leucocyte Count (Asitic Fluid)', 'Adinosin diamarese (Asitic Fluid)' )
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
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_text = 1 THEN 1 END)  AS 'Malignant' ,
	'' AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name IN ('Cytology (Plural Fluid)','Gram Stain (Plural Fluid)','ZN Stain (Plural Fluid)', 'Culture (Plural Fluid)', 'Total Leucocyte Count (Plural Fluid)', 'Protein (Plural Fluid)', 'Differential Count (Plural Fluid)',
	'Sugar (Plural Fluid), Adinosin diamarese (Pleural Fluid)',' LPA (Pleural Fluid)', 'LJ (Pleural Fluid)', 'CBNAAT (Pleural Fluid)', 'ADA (Pleural Fluid)', 'Antibiotic Sensitivity (Pleural Fluid)', 'Agranulocyte Count (Pleural Fluid)', 
	'Appearance (Pleural Fluid)', 'Culture (Pleural Fluid)', 'Colour (Pleural Fluid)', 'Transparency (Pleural Fluid)', 'TLC (Pleural Fluid)',' DLC (Pleural Fluid)', 'Neutrophil (Pleural Fluid)', 'Lymphocyte (Pleural Fluid)',   
	  'Eosinophil (Pleural Fluid)', ' Monocyte (Pleural Fluid)', 'AFB Stain (Pleural Fluid)', 'LDH (Pleural Fluid)', 'Protein (Pleural Fluid)', 'Basophil (Pleural Fluid)',' Granulocyte Count (Pleural Fluid)', 
	  'pH (Pleural Fluid)',  'Gram Stain (Pleural Fluid)')
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 	
	
UNION ALL
	
SELECT '6.12 Urine' AS 'Smears' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Malignant' ,
	'' AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'Urine'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL

SELECT 'Tissue Histology' AS 'Smears' ,
   'Total exam' AS 'Total Exam' ,
   'Malignant'  AS 'Malignant' ,
	'TNM Stage' AS 'TNM Stage' 
	
UNION ALL
	
SELECT '6.13 Prostrate' AS 'Smears' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_numeric THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'Prostrate'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '6.14 Breast tissue' AS 'Smears' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'Breast tissue'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '6.15 Ovary' AS 'Smears' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'Ovary'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '6.16 Uterus (Cervix)' AS 'Smears' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'Uterus (Cervix)'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 	
	
UNION ALL
	
SELECT '6.17 Uterus (Endometrium)' AS 'Smears' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'Uterus (Endometrium)'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '6.18 Skin' AS 'Smears' ,
   SUM(CASE WHEN o.value_text IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_text = 1 THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_text = 1 THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name IN ('Antibiotic Sensitivity (Slit Skin)', 'M. Leprae (Slit Skin)', 'Smear Test (Slit Skin)', 'Rifampicin resistance (Slit Skin)', 'Gram Stain (Slit Skin)', 'AFB Stain (Slit Skin)', 'ZN Stain (Slit Skin)')
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 														 		 	

UNION ALL
	
SELECT '6.19 Head and Neck' AS 'Smears' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'Head and Neck'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '6.20 Oral' AS 'Smears' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'Oral'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '6.21 Esophagus' AS 'Smears' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'Esophagus'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '6.22 Colorectal' AS 'Smears' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'Colorectal'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '6.23 Hepatobiliary' AS 'Smears' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'Hepatobiliary'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 	
	
UNION ALL
	
SELECT '6.24 Soft tissue and bone' AS 'Smears' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'Soft tissue and bone'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '6.25 Lymph nodes tissue' AS 'Smears' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Malignant' ,
	SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'Lymph nodes tissue'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
	
UNION ALL

SELECT 'Bone Marrow Studies' AS 'Smears' ,
   'Total exam' AS 'Total Exam' ,
   'Malignant'  AS 'Malignant' ,
	'' AS '' 
	
UNION ALL
	
SELECT '6.26 Bone marrow aspirate' AS 'Smears' ,
   SUM(CASE WHEN o.value_text IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_text = 1 THEN 1 END)  AS 'Malignant' ,
	''  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name IN ('bone marrow test', 'bone marrow test' )
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 
	
UNION ALL
	
SELECT '6.27 Trephine biopsy' AS 'Smears' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Total Exam' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Malignant' ,
	''  AS 'TNM Stage'            
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') < 5
   AND c.name = 'Trephine biopsy'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#' 		;						