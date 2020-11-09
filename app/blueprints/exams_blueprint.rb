class ExamsBlueprint < Blueprinter::Base
  # identifier :uuid

  fields :id

  field :result do
    "teste"
  end

  field :exam_data do |exam, _|
    exam.exam

  end
end
