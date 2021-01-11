
SELECT 'Stroke' AS 'New Complications' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale'  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED" 
   AND c.name IN ('Daily Register,Diagnosis Complications')
   AND o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Stroke') AND cn.locale = 'en' AND cn.concept_name_type = "FULLY_SPECIFIED" )
   
UNION ALL 
   
SELECT 'Ischemic heart disease' AS 'New Complications' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale'  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED" 
   AND c.name IN ('Daily Register,Diagnosis Complications')
   AND o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Ischemic heart disease') AND cn.locale = 'en' AND cn.concept_name_type = "FULLY_SPECIFIED" )
   
UNION ALL

SELECT 'Peripheral vascular disease' AS 'New Complications' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale'  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED" 
   AND c.name IN ('Daily Register,Diagnosis Complications')
   AND o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Peripheral vascular disease') AND cn.locale = 'en' AND cn.concept_name_type = "FULLY_SPECIFIED" )
 
UNION ALL

SELECT 'Heart failure' AS 'New Complications' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale'  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED" 
   AND c.name IN ('Daily Register,Diagnosis Complications')
   AND o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Heart failure') AND cn.locale = 'en' AND cn.concept_name_type = "FULLY_SPECIFIED" )
   
UNION ALL

SELECT 'Retinopathy' AS 'New Complications' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale'  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED" 
   AND c.name IN ('Daily Register,Diagnosis Complications')
   AND o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Peripheral Neuropathy Nephropathy') AND cn.locale = 'en' AND cn.concept_name_type = "FULLY_SPECIFIED" )   
   
UNION ALL

SELECT 'Nephropathy' AS 'New Complications' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale'  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED" 
   AND c.name IN ('Daily Register,Diagnosis Complications')
   AND o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Peripheral Neuropathy Nephropathy') AND cn.locale = 'en' AND cn.concept_name_type = "FULLY_SPECIFIED" )   
      
UNION ALL

SELECT 'Diabetic foot' AS 'New Complications' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale'  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED" 
   AND c.name IN ('Daily Register,Diagnosis Complications')
   AND o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Diabetic foot') AND cn.locale = 'en' AND cn.concept_name_type = "FULLY_SPECIFIED")  ; 
         
	