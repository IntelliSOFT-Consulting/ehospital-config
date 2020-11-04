SELECT
	'BCG' AS 'ANTIGEN',
	'Under 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) < 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = 'BCG, Date' 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0

UNION ALL 

SELECT
	'BCG' AS 'ANTIGEN',
	'Above 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) >= 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = 'BCG, Date' 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0
   
UNION ALL

SELECT
	'OPV (Birth dose)' AS 'ANTIGEN',
	'Within 2 weeks' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(WEEK, p.birthdate, o.value_datetime) <= 2
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = 'Polio birth Dose, Date' 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0
   
UNION ALL

SELECT
	'OPV1' AS 'ANTIGEN',
	'Under 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) < 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = '1st Polio, Date'
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0
   
   
UNION ALL

SELECT
	'OPV1' AS 'ANTIGEN',
	'Above 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) >= 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = '1st Polio, Date' 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0   
   
UNION ALL

SELECT
	'OPV2' AS 'ANTIGEN',
	'Under 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) < 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = '2nd Polio, Date'
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0 
	
UNION ALL

SELECT
	'OPV2' AS 'ANTIGEN',
	'Above 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) >= 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = '2nd Polio, Date' 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0    
	
UNION ALL

SELECT
	'OPV3' AS 'ANTIGEN',
	'Under 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) < 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = '3rd Polio, Date' 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0 
	
UNION ALL

SELECT
	'OPV3' AS 'ANTIGEN',
	'Above 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) >= 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = '3rd Polio, Date'  
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0   
	
UNION ALL

SELECT
	'IPV' AS 'ANTIGEN',
	'Under 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) < 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = 'IPV, Date' 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0 
	
UNION ALL

SELECT
	'IPV' AS 'ANTIGEN',
	'Above 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) >= 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name  = 'IPV, Date 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0    

UNION ALL 
	
SELECT
	'DPT+HIB+HEPB 1' AS 'ANTIGEN',
	'Under 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) < 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = 'DPT/Hep.B/ Hib.1, Date'
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0

UNION ALL 

SELECT
	'DPT+HIB+HEPB 1' AS 'ANTIGEN',
	'Above 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) >= 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = 'DPT/Hep.B/ Hib.1, Date' 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0		 
	
UNION ALL 		

SELECT
	'DPT+HIB+HEPB 2' AS 'ANTIGEN',
	'Under 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) < 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = 'DPT/Hep.B/ Hib.2, Date' 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0

UNION ALL 

SELECT
	'DPT+HIB+HEPB 2' AS 'ANTIGEN',
	'Above 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) >= 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name  = 'DPT/Hep.B/ Hib.2, Date'  
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0		 
   
UNION ALL 

SELECT
	'DPT+HIB+HEPB 3' AS 'ANTIGEN',
	'Under 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) < 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name  = 'DPT/Hep.B/ Hib.3, Date' 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0

UNION ALL 

SELECT
	'DPT+HIB+HEPB 3' AS 'ANTIGEN',
	'Above 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) >= 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = 'DPT/Hep.B/ Hib.3, Date' 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0		 
   
UNION ALL 

SELECT
	'Pneumococcal 1' AS 'ANTIGEN',
	'Under 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) < 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = 'Pneumococcal 1, Date' 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0

UNION ALL 

SELECT
	'Pneumococcal 1' AS 'ANTIGEN',
	'Above 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) >= 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = 'Pneumococcal 1, Date'  
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0	
	
UNION ALL 

SELECT
	'Pneumococcal 2' AS 'ANTIGEN',
	'Under 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) < 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = 'Pneumococcal 2, Date' 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0

UNION ALL 

SELECT
	'Pneumococcal 2' AS 'ANTIGEN',
	'Above 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) >= 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = 'Pneumococcal 2, Date'  
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0	
	
UNION ALL 

SELECT
	'Pneumococcal 3' AS 'ANTIGEN',
	'Under 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) < 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = 'Pneumococcal 3, Date'  
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0

UNION ALL 

SELECT
	'Pneumococcal 3' AS 'ANTIGEN',
	'Above 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) >= 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = 'Pneumococcal 3, Date' 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0				 
	   
UNION ALL 

SELECT
	'ROTA 1' AS 'ANTIGEN',
	'Under 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) < 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = 'Rota1, Date'
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0	  
	
UNION ALL 

SELECT
	'ROTA 2' AS 'ANTIGEN',
	'Under 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) < 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = 'Rota2, Date' 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0	  
	
	
UNION ALL 

SELECT
	'Vitamin A' AS 'ANTIGEN',
	'6 - 11 Months (100,000IU)' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) BETWEEN 6 AND 11
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = 'Vitamin A (6-11 months), Date' 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0	  	
	
UNION ALL 

SELECT
	'Yellow fever' AS 'ANTIGEN',
	'Under 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) < 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = 'Yellow Fever, Date' 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0

UNION ALL 

SELECT
	'Yellow fever' AS 'ANTIGEN',
	'Above 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) >= 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = 'Yellow Fever, Date'
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0		
	
UNION ALL 
 
SELECT
	'MR 1' AS 'ANTIGEN',
	'Under 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) < 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = 'MR1, Date'
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0

UNION ALL 

SELECT
	'MR 1' AS 'ANTIGEN',
	'Above 1 Year' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) >= 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name  = 'MR1, Date' 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0	
	
UNION ALL 

SELECT
	'Fully Immunized Child (FIC) at 1 year' AS 'ANTIGEN',
	'' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) = 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = 'Fully Immunised, Date' 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0						 
		     
UNION ALL 

SELECT
	'Vitamin A' AS 'ANTIGEN',
	'At 12- 59 Months (200,000IU)' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) BETWEEN 12 AND 59
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name IN ('concept_name') 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0	
	
UNION ALL 

SELECT
	'MR 2' AS 'ANTIGEN',
	'At 1 1⁄2 - 2 Years' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) BETWEEN 18 AND 24
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = 'MR 2, Date' 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0		
	
UNION ALL 

SELECT
	'MR 2' AS 'ANTIGEN',
	'Above 2 Years' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) >= 24
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name = 'MR 2, Date' 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0	
	
UNION ALL 

SELECT
	'Tetanus Toxoid ContainingVaccine for pregnant women' AS 'ANTIGEN',
	'1st Dose' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name IN ('concept_name') 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0		
	
UNION ALL 

SELECT
	'Tetanus Toxoid ContainingVaccine for pregnant women' AS 'ANTIGEN',
	'2nd Dose' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name IN ('concept_name') 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0		
	
UNION ALL 

SELECT
	'Tetanus Toxoid ContainingVaccine for pregnant women' AS 'ANTIGEN',
	'3rd Dose' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name IN ('concept_name') 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0		
	
UNION ALL 

SELECT
	'Tetanus Toxoid ContainingVaccine for pregnant women' AS 'ANTIGEN',
	'4th Dose' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name IN ('concept_name') 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0		
	
UNION ALL 

SELECT
	'Tetanus Toxoid ContainingVaccine for pregnant women' AS 'ANTIGEN',
	'5th Dose' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name IN ('concept_name') 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0		
	
UNION ALL 

SELECT
	'Tetanus Toxoid ContainingVaccine for pregnant women' AS 'ANTIGEN',
	'1st Dose' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name IN ('concept_name') 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0		
	
UNION ALL 

SELECT
	'Tetanus Toxoid Containing Vaccine for Trauma' AS 'ANTIGEN',
	'' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name IN ('concept_name') 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0	
	
UNION ALL 

SELECT
	'Adverse Events Following Immunization' AS 'ANTIGEN',
	'' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name IN ('concept_name') 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0		

UNION ALL 

SELECT
	'Squint/White Eye reflection (Under 1 Year)' AS 'ANTIGEN',
	'Under 1 Year1' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) < 12
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name IN ('concept_name') 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0	
	
UNION ALL 

SELECT
	'HPV Vaccine1' AS 'ANTIGEN',
	'At first contact' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name IN ('concept_name') 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0																 

UNION ALL 

SELECT
	'HPV Vaccine 2' AS 'ANTIGEN',
	'6 months after' AS ' AGE',
	SUM(CASE DAY(value_datetime) WHEN 1 THEN 1 ELSE 0 END) AS 1st,
	SUM(CASE DAY(value_datetime) WHEN 2 THEN 1 ELSE 0 END) AS 2nd,
	SUM(CASE DAY(value_datetime) WHEN 3 THEN 1 ELSE 0 END) AS 3rd,
	SUM(CASE DAY(value_datetime) WHEN 4 THEN 1 ELSE 0 END) AS 4th,
	SUM(CASE DAY(value_datetime) WHEN 5 THEN 1 ELSE 0 END) AS 5th,
	SUM(CASE DAY(value_datetime) WHEN 6 THEN 1 ELSE 0 END) AS 6th,
	SUM(CASE DAY(value_datetime) WHEN 7 THEN 1 ELSE 0 END) AS 7th,
	SUM(CASE DAY(value_datetime) WHEN 8 THEN 1 ELSE 0 END) AS 8th,
	SUM(CASE DAY(value_datetime) WHEN 9 THEN 1 ELSE 0 END) AS 9th,
	SUM(CASE DAY(value_datetime) WHEN 10 THEN 1 ELSE 0 END) AS 10th,
	SUM(CASE DAY(value_datetime) WHEN 11 THEN 1 ELSE 0 END) AS 11th,
	SUM(CASE DAY(value_datetime) WHEN 12 THEN 1 ELSE 0 END) AS 12th,
	SUM(CASE DAY(value_datetime) WHEN 13 THEN 1 ELSE 0 END) AS 13th,
	SUM(CASE DAY(value_datetime) WHEN 14 THEN 1 ELSE 0 END) AS 14th,
	SUM(CASE DAY(value_datetime) WHEN 15 THEN 1 ELSE 0 END) AS 15th,
	SUM(CASE DAY(value_datetime) WHEN 16 THEN 1 ELSE 0 END) AS 16th,
	SUM(CASE DAY(value_datetime) WHEN 17 THEN 1 ELSE 0 END) AS 17th,
	SUM(CASE DAY(value_datetime) WHEN 18 THEN 1 ELSE 0 END) AS 18th,
	SUM(CASE DAY(value_datetime) WHEN 19 THEN 1 ELSE 0 END) AS 19th,
	SUM(CASE DAY(value_datetime) WHEN 20 THEN 1 ELSE 0 END) AS 20th,
	SUM(CASE DAY(value_datetime) WHEN 21 THEN 1 ELSE 0 END) AS 21st,
	SUM(CASE DAY(value_datetime) WHEN 22 THEN 1 ELSE 0 END) AS 22nd,
	SUM(CASE DAY(value_datetime) WHEN 23 THEN 1 ELSE 0 END) AS 23rd,
	SUM(CASE DAY(value_datetime) WHEN 24 THEN 1 ELSE 0 END) AS 24th,
	SUM(CASE DAY(value_datetime) WHEN 25 THEN 1 ELSE 0 END) AS 25th,
	SUM(CASE DAY(value_datetime) WHEN 26 THEN 1 ELSE 0 END) AS 26th,
	SUM(CASE DAY(value_datetime) WHEN 27 THEN 1 ELSE 0 END) AS 27th,
	SUM(CASE DAY(value_datetime) WHEN 28 THEN 1 ELSE 0 END) AS 28th,
	SUM(CASE DAY(value_datetime) WHEN 29 THEN 1 ELSE 0 END) AS 29th,
	SUM(CASE DAY(value_datetime) WHEN 30 THEN 1 ELSE 0 END) AS 30th,
	SUM(CASE DAY(value_datetime) WHEN 31 THEN 1 ELSE 0 END) AS 31st,
	'' AS 'Total Static'  ,
	'' AS 'Total Ou Reach' ,
	SUM(CASE WHEN DAY(value_datetime)IS NOT NULL THEN 1 ELSE 0 END) AS Totals
	
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id AND o.value_datetime  BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(MONTH, p.birthdate, o.value_datetime) > 6
WHERE 
   locale = 'en' AND c.locale_preferred = 1
  
   AND c.name IN ('concept_name') 
   AND EXTRACT(DAY FROM '#startDate#') = 1 
   AND LAST_DAY('#startDate#') = '#endDate#'
   AND TIMESTAMPDIFF(MONTH, '#startDate#', '#endDate#') = 0	 ;
		     		     		     													 
		     		     		     