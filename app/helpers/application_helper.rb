module ApplicationHelper
  def patients_count
    Patient.all.count
  end

  def exams_count
    Exams::Base.all.count
  end
end
