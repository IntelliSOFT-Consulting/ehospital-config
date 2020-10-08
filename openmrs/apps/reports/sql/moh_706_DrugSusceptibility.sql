SELECT '9.1 E. coli 0157:H7' AS 'Drug Resistance Pattern' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'a. Ciprofloxacin' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'b. Levofloxacin' ,
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'c. Gentamicin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'd. Tetracycline' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'e. Ceftazidime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'f. Cefuroxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'g. Cefotaxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'h. Ampicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'i. Cefazolin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'j.AmoxillinClavulanate' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'k. Amikacin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'l. Cefoxitin/oxacillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'm. Chloramphenicol' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'n. Cefepime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'p. Piperacillin-tazobactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'q. obramycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'r. Ampicillin Sulbactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 's. Trimethoprim Sulfamethoxazole' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 't. Penicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'u. Vancomycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'v. Meropenem' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'w.Clindamycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'x. Doxycycline/tetracyclin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'y. Ceftazidime-avibactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'z. Erythromycin', 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'aa. Gentamicin'
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
UNION ALL 	

SELECT '9.2 Proteus spp' AS 'Drug Resistance Pattern' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'a. Ciprofloxacin' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'b. Levofloxacin' ,
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'c. Gentamicin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'd. Tetracycline' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'e. Ceftazidime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'f. Cefuroxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'g. Cefotaxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'h. Ampicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'i. Cefazolin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'j.AmoxillinClavulanate' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'k. Amikacin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'l. Cefoxitin/oxacillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'm. Chloramphenicol' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'n. Cefepime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'p. Piperacillin-tazobactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'q. obramycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'r. Ampicillin Sulbactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 's. Trimethoprim Sulfamethoxazole' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 't. Penicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'u. Vancomycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'v. Meropenem' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'w.Clindamycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'x. Doxycycline/tetracyclin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'y. Ceftazidime-avibactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'z. Erythromycin', 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'aa. Gentamicin'
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	
	
UNION ALL 	

SELECT '9.3 Salmonella spp' AS 'Drug Resistance Pattern' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'a. Ciprofloxacin' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'b. Levofloxacin' ,
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'c. Gentamicin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'd. Tetracycline' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'e. Ceftazidime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'f. Cefuroxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'g. Cefotaxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'h. Ampicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'i. Cefazolin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'j.AmoxillinClavulanate' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'k. Amikacin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'l. Cefoxitin/oxacillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'm. Chloramphenicol' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'n. Cefepime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'p. Piperacillin-tazobactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'q. obramycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'r. Ampicillin Sulbactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 's. Trimethoprim Sulfamethoxazole' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 't. Penicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'u. Vancomycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'v. Meropenem' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'w.Clindamycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'x. Doxycycline/tetracyclin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'y. Ceftazidime-avibactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'z. Erythromycin', 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'aa. Gentamicin'
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL 	

SELECT '9.4 Shigella spp' AS 'Drug Resistance Pattern' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'a. Ciprofloxacin' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'b. Levofloxacin' ,
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'c. Gentamicin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'd. Tetracycline' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'e. Ceftazidime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'f. Cefuroxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'g. Cefotaxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'h. Ampicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'i. Cefazolin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'j.AmoxillinClavulanate' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'k. Amikacin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'l. Cefoxitin/oxacillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'm. Chloramphenicol' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'n. Cefepime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'p. Piperacillin-tazobactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'q. obramycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'r. Ampicillin Sulbactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 's. Trimethoprim Sulfamethoxazole' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 't. Penicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'u. Vancomycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'v. Meropenem' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'w.Clindamycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'x. Doxycycline/tetracyclin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'y. Ceftazidime-avibactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'z. Erythromycin', 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'aa. Gentamicin'
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'		
	
UNION ALL 	

SELECT '9.5 Klebsiella pneumoniae' AS 'Drug Resistance Pattern' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'a. Ciprofloxacin' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'b. Levofloxacin' ,
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'c. Gentamicin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'd. Tetracycline' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'e. Ceftazidime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'f. Cefuroxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'g. Cefotaxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'h. Ampicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'i. Cefazolin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'j.AmoxillinClavulanate' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'k. Amikacin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'l. Cefoxitin/oxacillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'm. Chloramphenicol' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'n. Cefepime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'p. Piperacillin-tazobactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'q. obramycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'r. Ampicillin Sulbactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 's. Trimethoprim Sulfamethoxazole' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 't. Penicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'u. Vancomycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'v. Meropenem' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'w.Clindamycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'x. Doxycycline/tetracyclin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'y. Ceftazidime-avibactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'z. Erythromycin', 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'aa. Gentamicin'
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'		
	
UNION ALL 	

SELECT '9.6 Pseudomonas spp' AS 'Drug Resistance Pattern' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'a. Ciprofloxacin' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'b. Levofloxacin' ,
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'c. Gentamicin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'd. Tetracycline' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'e. Ceftazidime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'f. Cefuroxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'g. Cefotaxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'h. Ampicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'i. Cefazolin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'j.AmoxillinClavulanate' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'k. Amikacin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'l. Cefoxitin/oxacillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'm. Chloramphenicol' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'n. Cefepime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'p. Piperacillin-tazobactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'q. obramycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'r. Ampicillin Sulbactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 's. Trimethoprim Sulfamethoxazole' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 't. Penicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'u. Vancomycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'v. Meropenem' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'w.Clindamycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'x. Doxycycline/tetracyclin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'y. Ceftazidime-avibactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'z. Erythromycin', 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'aa. Gentamicin'
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'		
	
UNION ALL 	

SELECT '9.7 Staphylococcus aureus' AS 'Drug Resistance Pattern' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'a. Ciprofloxacin' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'b. Levofloxacin' ,
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'c. Gentamicin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'd. Tetracycline' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'e. Ceftazidime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'f. Cefuroxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'g. Cefotaxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'h. Ampicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'i. Cefazolin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'j.AmoxillinClavulanate' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'k. Amikacin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'l. Cefoxitin/oxacillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'm. Chloramphenicol' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'n. Cefepime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'p. Piperacillin-tazobactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'q. obramycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'r. Ampicillin Sulbactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 's. Trimethoprim Sulfamethoxazole' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 't. Penicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'u. Vancomycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'v. Meropenem' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'w.Clindamycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'x. Doxycycline/tetracyclin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'y. Ceftazidime-avibactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'z. Erythromycin', 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'aa. Gentamicin'
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'		
	
UNION ALL 	

SELECT '9.8 Vibrio cholerae spp' AS 'Drug Resistance Pattern' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'a. Ciprofloxacin' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'b. Levofloxacin' ,
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'c. Gentamicin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'd. Tetracycline' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'e. Ceftazidime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'f. Cefuroxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'g. Cefotaxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'h. Ampicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'i. Cefazolin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'j.AmoxillinClavulanate' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'k. Amikacin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'l. Cefoxitin/oxacillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'm. Chloramphenicol' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'n. Cefepime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'p. Piperacillin-tazobactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'q. obramycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'r. Ampicillin Sulbactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 's. Trimethoprim Sulfamethoxazole' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 't. Penicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'u. Vancomycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'v. Meropenem' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'w.Clindamycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'x. Doxycycline/tetracyclin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'y. Ceftazidime-avibactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'z. Erythromycin', 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'aa. Gentamicin'
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'		
	
UNION ALL 	

SELECT '9.9 Neisseria meningitidis' AS 'Drug Resistance Pattern' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'a. Ciprofloxacin' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'b. Levofloxacin' ,
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'c. Gentamicin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'd. Tetracycline' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'e. Ceftazidime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'f. Cefuroxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'g. Cefotaxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'h. Ampicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'i. Cefazolin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'j.AmoxillinClavulanate' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'k. Amikacin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'l. Cefoxitin/oxacillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'm. Chloramphenicol' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'n. Cefepime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'p. Piperacillin-tazobactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'q. obramycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'r. Ampicillin Sulbactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 's. Trimethoprim Sulfamethoxazole' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 't. Penicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'u. Vancomycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'v. Meropenem' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'w.Clindamycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'x. Doxycycline/tetracyclin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'y. Ceftazidime-avibactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'z. Erythromycin', 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'aa. Gentamicin'
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'		
	
UNION ALL 	

SELECT '9.10 Neisseria gonorrhoeae' AS 'Drug Resistance Pattern' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'a. Ciprofloxacin' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'b. Levofloxacin' ,
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'c. Gentamicin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'd. Tetracycline' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'e. Ceftazidime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'f. Cefuroxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'g. Cefotaxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'h. Ampicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'i. Cefazolin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'j.AmoxillinClavulanate' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'k. Amikacin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'l. Cefoxitin/oxacillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'm. Chloramphenicol' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'n. Cefepime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'p. Piperacillin-tazobactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'q. obramycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'r. Ampicillin Sulbactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 's. Trimethoprim Sulfamethoxazole' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 't. Penicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'u. Vancomycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'v. Meropenem' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'w.Clindamycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'x. Doxycycline/tetracyclin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'y. Ceftazidime-avibactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'z. Erythromycin', 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'aa. Gentamicin'
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'		
	
UNION ALL 	

SELECT '9.11 Streptococcus pneumoniae' AS 'Drug Resistance Pattern' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'a. Ciprofloxacin' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'b. Levofloxacin' ,
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'c. Gentamicin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'd. Tetracycline' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'e. Ceftazidime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'f. Cefuroxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'g. Cefotaxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'h. Ampicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'i. Cefazolin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'j.AmoxillinClavulanate' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'k. Amikacin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'l. Cefoxitin/oxacillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'm. Chloramphenicol' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'n. Cefepime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'p. Piperacillin-tazobactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'q. obramycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'r. Ampicillin Sulbactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 's. Trimethoprim Sulfamethoxazole' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 't. Penicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'u. Vancomycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'v. Meropenem' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'w.Clindamycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'x. Doxycycline/tetracyclin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'y. Ceftazidime-avibactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'z. Erythromycin', 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'aa. Gentamicin'
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'		
	
UNION ALL 	

SELECT '9.12 Haemophilus influenzae' AS 'Drug Resistance Pattern' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'a. Ciprofloxacin' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'b. Levofloxacin' ,
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'c. Gentamicin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'd. Tetracycline' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'e. Ceftazidime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'f. Cefuroxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'g. Cefotaxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'h. Ampicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'i. Cefazolin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'j.AmoxillinClavulanate' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'k. Amikacin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'l. Cefoxitin/oxacillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'm. Chloramphenicol' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'n. Cefepime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'p. Piperacillin-tazobactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'q. obramycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'r. Ampicillin Sulbactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 's. Trimethoprim Sulfamethoxazole' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 't. Penicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'u. Vancomycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'v. Meropenem' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'w.Clindamycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'x. Doxycycline/tetracyclin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'y. Ceftazidime-avibactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'z. Erythromycin', 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'aa. Gentamicin'
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'		
	
UNION ALL 	

SELECT '9.13 Haemophilus parainfluenzae' AS 'Drug Resistance Pattern' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'a. Ciprofloxacin' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'b. Levofloxacin' ,
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'c. Gentamicin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'd. Tetracycline' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'e. Ceftazidime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'f. Cefuroxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'g. Cefotaxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'h. Ampicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'i. Cefazolin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'j.AmoxillinClavulanate' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'k. Amikacin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'l. Cefoxitin/oxacillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'm. Chloramphenicol' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'n. Cefepime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'p. Piperacillin-tazobactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'q. obramycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'r. Ampicillin Sulbactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 's. Trimethoprim Sulfamethoxazole' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 't. Penicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'u. Vancomycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'v. Meropenem' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'w.Clindamycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'x. Doxycycline/tetracyclin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'y. Ceftazidime-avibactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'z. Erythromycin', 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'aa. Gentamicin'
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	
	
UNION ALL 	

SELECT '9.14 Bacterial vaginosis' AS 'Drug Resistance Pattern' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'a. Ciprofloxacin' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'b. Levofloxacin' ,
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'c. Gentamicin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'd. Tetracycline' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'e. Ceftazidime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'f. Cefuroxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'g. Cefotaxime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'h. Ampicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'i. Cefazolin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'j.AmoxillinClavulanate' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'k. Amikacin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'l. Cefoxitin/oxacillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'm. Chloramphenicol' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'n. Cefepime' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'p. Piperacillin-tazobactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'q. obramycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'r. Ampicillin Sulbactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 's. Trimethoprim Sulfamethoxazole' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 't. Penicillin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'u. Vancomycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'v. Meropenem' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'w.Clindamycin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'x. Doxycycline/tetracyclin' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'y. Ceftazidime-avibactam' , 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'z. Erythromycin', 
	 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'CODED VALUE' AND c.locale = 'en')  THEN 1 END)  AS 'aa. Gentamicin'
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
   AND c.name = 'CONCEPT_NAME'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'	 ;									