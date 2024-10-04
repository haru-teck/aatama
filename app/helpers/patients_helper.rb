module PatientsHelper
  def patient_gender_class(patient)
    return 'patient-card-other' if patient.nil?

    case patient.gender
    when '男性'
      'patient-card-male'
    when '女性'
      'patient-card-female'
    else
      'patient-card-other'
    end
  end
end