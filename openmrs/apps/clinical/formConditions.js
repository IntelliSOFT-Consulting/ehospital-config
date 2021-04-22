Bahmni.ConceptSet.FormConditions.rules = {
    'Diastolic Data' : function (formName, formFieldValues) {
        var systolic = formFieldValues['Systolic'];
        var diastolic = formFieldValues['Diastolic'];
        if (systolic || diastolic) {
            return {
                enable: ["Posture"]
            }
        } else {
            return {
                disable: ["Posture"]
            }
        }
    },
    'Systolic Data' : function (formName, formFieldValues) {
        var systolic = formFieldValues['Systolic'];
        var diastolic = formFieldValues['Diastolic'];
        if (systolic || diastolic) {
            return {
                enable: ["Posture"]
            }
        } else {
            return {
                disable: ["Posture"]
            }
        }
    },
    "Screened for tuberculosis" : function (formName , formFieldValues, patient){
        var screened = formFieldValues["Screened for tuberculosis"];
        if(patient.age >= 5){
            return{
                show: ["Visual Acuity (RE/LE)","Nutrition Interventions"]
            }
        }else {
            return{
                hide: ["Visual Acuity (RE/LE)","Nutrition Interventions"]
            }
        }     
    },
    "Registered on Mtiba" : function (formName , formFieldValues, patient){
        var registered = formFieldValues["Registered on Mtiba"];
        if(registered == "True"){
            return{
                show: ["Mtiba Transaction Number"]
            }
        }else {
            return{
                hide: ["Mtiba Transaction Number"]
            }
        }     
    },
};