module PatientsHelper
  def insured(day)
    day.patients.where(insured: true)
  end

  def uninsured(day)
    day.patients.where(insured: false)
  end
end
