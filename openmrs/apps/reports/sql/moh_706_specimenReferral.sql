SELECT '8.1 CD4' AS 'Specimen Refrral' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Number of species' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Number of Results Recieved'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CD4'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

UNION ALL

SELECT '8.2 Viral load' AS 'Specimen Refrral' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Number of species' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Number of Results Recieved'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Viral load'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '8.3 EID' AS 'Specimen Refrral' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Number of species' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Number of Results Recieved'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'EID'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL

SELECT '8.4 Discodant/discripant' AS 'Specimen Refrral' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Number of species' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Number of Results Recieved'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Discodant/discripant'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL

SELECT '8.5 TB Culture' AS 'Specimen Refrral' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Number of species' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Number of Results Recieved'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'TB Culture'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'		
	
UNION ALL

SELECT '8.6 Virological' AS 'Specimen Refrral' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Number of species' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Number of Results Recieved'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Virological'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'		
	
UNION ALL

SELECT '8.7 Clinical Chemistry' AS 'Specimen Refrral' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Number of species' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Number of Results Recieved'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Clinical Chemistry'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '8.8 Histology/cytology' AS 'Specimen Refrral' ,
   SUM(CASE WHEN o.value_text IS NOT NULL THEN 1 END ) AS 'Number of species' ,
   SUM(CASE WHEN o.value_text = 1 THEN 1 END)  AS 'Number of Results Recieved'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name IN ('Cytology (CSF)', 'Cytology (GAL)', 'Cytology (Plural Fluid)', 'Cytology (AL)', 'Cytology (Knee Joint Fluid)', 
	'Cytology (Peritoneal Fluid)', 'Cytology (Asitic Fluid)', 'Cytology (BAL)', 
	'Cytology (Pyrotinial Fluid)', 'Cytology (Pus)', 'Fine Needle Aspiration Cytology (FNAC)', 'Cytology (Vaginal Fluid)')
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL

SELECT '8.9 Haematological' AS 'Specimen Refrral' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Number of species' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Number of Results Recieved'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Haematological'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL

SELECT '8.10 Parasitological' AS 'Specimen Refrral' ,
   SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END ) AS 'Number of species' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Number of Results Recieved'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Parasitological'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL

SELECT '8.11 Blood samples for transfussion screening' AS 'Specimen Refrral' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Number of species' ,
   SUM(CASE WHEN o.value_numeric = 1 THEN 1 END)  AS 'Number of Results Recieved'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'Blood samples for transfussion screening'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'				;						
	
								