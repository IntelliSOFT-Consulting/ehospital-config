SELECT '7.1 VDRL' AS 'Specimen Refrral' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Number of species' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Number of Results Recieved'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'

UNION ALL

SELECT '8.2 Viral load' AS 'Specimen Refrral' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Number of species' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Number of Results Recieved'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '8.3 EID' AS 'Specimen Refrral' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Number of species' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Number of Results Recieved'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL

SELECT '8.4 Discodant/discripant' AS 'Specimen Refrral' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Number of species' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Number of Results Recieved'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL

SELECT '8.5 TB Culture' AS 'Specimen Refrral' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Number of species' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Number of Results Recieved'       
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'		
	
UNION ALL

SELECT '8.6 Virological' AS 'Specimen Refrral' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Number of species' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Number of Results Recieved'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'		
	
UNION ALL

SELECT '8.7 Clinical Chemistry' AS 'Specimen Refrral' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Number of species' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Number of Results Recieved'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL

SELECT '8.8 Histology/cytology' AS 'Specimen Refrral' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Number of species' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Number of Results Recieved'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL

SELECT '8.9 Haematological' AS 'Specimen Refrral' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Number of species' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Number of Results Recieved'         
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL

SELECT '8.10 Parasitological' AS 'Specimen Refrral' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Number of species' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Number of Results Recieved'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL

SELECT '8.11 Blood samples for transfussion screening' AS 'Specimen Refrral' ,
   SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END ) AS 'Number of species' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en') THEN 1 END)  AS 'Number of Results Recieved'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'				;						
	
								