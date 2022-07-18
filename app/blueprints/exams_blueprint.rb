class ExamsBlueprint < Blueprinter::Base
  # identifier :uuid

  fields :id

  field :result do
    "teste"
  end

  field :result do
    "teste"
  end

  field :exam_data do |data, _|
    {
      acquisition_date: data.exam.acquisition_date.strftime("%s").to_i,
      modality: I18n.t("activerecord.attributes.exams/base.modalities.#{data.exam.modality}")
    }
  end
end
