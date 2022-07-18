module ExamsHelper

  def modality(name)
    Exams::Base.human_enum_name(:modality, name)
  end

end
