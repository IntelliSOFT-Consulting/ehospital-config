SELECT
	e.encounter_datetime AS Date,
	CONCAT (pn.given_name," " ,pn.middle_name ," " ,pn.family_name) AS Name ,
	TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#' ) as Age ,
	p.gender as Gender ,
	(SELECT CASE WHEN
	     o2.value_coded IS NOT NULL THEN 'F' END 
	FROM openmrs.obs o2 WHERE o2.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Final diagnosis') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") AND o2.encounter_id = o.encounter_id )
	AS 'F-First visit/R- Revisit' ,
	(SELECT o2.value_numeric FROM openmrs.obs o2 WHERE o2.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Height (cm)') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") AND o2.encounter_id = o.encounter_id )
	AS 'HT(CM)' ,
	(SELECT o2.value_numeric FROM openmrs.obs o2 WHERE o2.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Weight (kg)') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") AND o2.encounter_id = o.encounter_id )
	AS 'WT(KG)',
	(SELECT o2.value_numeric FROM openmrs.obs o2 WHERE o2.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('BMI') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") AND o2.encounter_id = o.encounter_id  )
	AS 'BMI',
	(SELECT o2.value_numeric FROM openmrs.obs o2 WHERE o2.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Waist circumference (cm)') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") AND o2.encounter_id = o.encounter_id  )
	AS 'Waist circumference',
	CONCAT((SELECT o2.value_numeric FROM openmrs.obs o2 WHERE o2.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Systolic Data') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") AND o2.encounter_id = o.encounter_id  ), '/' ,
	(SELECT o2.value_numeric FROM openmrs.obs o2 WHERE o2.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diastolic Data') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") AND o2.encounter_id = o.encounter_id  ))
	AS 'BP (mmHg)',
	(SELECT cn.name FROM openmrs.concept_name cn WHERE cn.locale = 'en' AND cn.concept_id =(SELECT o2.value_coded FROM openmrs.obs o2 WHERE o2.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('HTN Status') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") AND o2.encounter_id = o.encounter_id ))
	AS 'HTN ' ,
	(SELECT CASE WHEN
	     o2.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 1','Diabetes mellitus, type 2','Gestational Diabetes Mellitus','Diabetes secondary to other causes') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") THEN 'Y' ELSE 'N' END 
	FROM openmrs.obs o2 WHERE o2.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Final diagnosis') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") AND o2.encounter_id = o.encounter_id )
	AS 'Diabetes: Newlydiagnosed(Y/N)' ,
	(SELECT o2.value_numeric FROM openmrs.obs o2 WHERE o2.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Blood sugar') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") AND o2.encounter_id = o.encounter_id )
	AS 'Blood sugar (mmol/L) RBS' ,
	(SELECT o2.value_numeric FROM openmrs.obs o2 WHERE o2.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Blood sugar') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") AND o2.encounter_id = o.encounter_id )
	AS 'Blood sugar (mmol/L) FBS' ,
	(SELECT o2.value_numeric FROM openmrs.obs o2 WHERE o2.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('CURRENT HbA1c(%)') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") AND o2.encounter_id = o.encounter_id )
	AS 'Current HbA1C (%)' ,
	(SELECT cn.name FROM openmrs.concept_name cn WHERE cn.locale = 'en' AND cn.concept_id =(SELECT o2.value_coded FROM openmrs.obs o2 WHERE o2.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Final diagnosis') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") AND o2.encounter_id = o.encounter_id ))
	AS 'Diagnosis' ,
	(SELECT cn.name FROM openmrs.concept_name cn WHERE cn.locale = 'en' AND cn.concept_id =(SELECT o2.value_coded FROM openmrs.obs o2 WHERE o2.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Daily Register,Diagnosis Complications') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") AND o2.encounter_id = o.encounter_id ))
	AS 'New diagnosis Complications/co-morbidities' ,
	(SELECT cn.name FROM openmrs.concept_name cn WHERE cn.locale = 'en' AND cn.concept_id =(SELECT o2.value_coded FROM openmrs.obs o2 WHERE o2.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Treatment') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") AND o2.encounter_id = o.encounter_id ))
	AS 'Treatment' ,
	(SELECT CASE WHEN
	     o2.value_coded IS NOT NULL THEN 'F' END 
	FROM openmrs.obs o2 WHERE o2.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Final diagnosis') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") AND o2.encounter_id = o.encounter_id )
	AS 'Foot Clinic :F-First visit/R- Revisit' ,
	(SELECT CASE WHEN
	     o2.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetic foot') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") THEN 'Y' ELSE 'N' END 
	FROM openmrs.obs o2 WHERE o2.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Daily Register,Diagnosis Complications') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") AND o2.encounter_id = o.encounter_id )
	AS 'Diabetic Foot(Y/N)' ,
	(SELECT cn.name FROM openmrs.concept_name cn WHERE cn.locale = 'en' AND cn.concept_id =(SELECT o2.value_coded FROM openmrs.obs o2 WHERE o2.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Foot Risk Assessment') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") AND o2.encounter_id = o.encounter_id ))
	AS 'Foot Risk Assessment' ,
	(SELECT cn.name FROM openmrs.concept_name cn WHERE cn.locale = 'en' AND cn.concept_id =(SELECT o2.value_coded FROM openmrs.obs o2 WHERE o2.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Footcare outcome') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") AND o2.encounter_id = o.encounter_id ))
	AS 'Footcare outcome' ,
	(SELECT CASE WHEN
	     o2.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('TRUE') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") THEN 'Y' ELSE 'N' END 
	FROM openmrs.obs o2 WHERE o2.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes, Screend For TB') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") AND o2.encounter_id = o.encounter_id )
	AS 'Screened for TB Y/N' ,
	(SELECT cn.name FROM openmrs.concept_name cn WHERE cn.locale = 'en' AND cn.concept_id =(SELECT o2.value_coded FROM openmrs.obs o2 WHERE o2.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes, TB Status after Screening') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") AND o2.encounter_id = o.encounter_id ))
	AS 'TB Status after screening (Positive / Negative)' ,
	(SELECT CASE WHEN
	     o2.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('TRUE') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") THEN 'Y' ELSE 'N' END 
	FROM openmrs.obs o2 WHERE o2.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('National Health Insurance Fund Member') AND c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED") AND o2.encounter_id = o.encounter_id )
	AS 'NHIF Y/N'
FROM openmrs.obs o  
INNER JOIN  openmrs.concept c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.person_name pn ON pn.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
GROUP BY p.person_id
ORDER BY e.encounter_datetime ASC ;
