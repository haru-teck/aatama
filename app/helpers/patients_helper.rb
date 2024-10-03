module PatientsHelper
  def patient_gender_class(patient)
    case patient.gender
    when '男性'
      'patient-name-male'
    when '女性'
      'patient-name-female'
    else
      'patient-name-other'
    end
  end
end
