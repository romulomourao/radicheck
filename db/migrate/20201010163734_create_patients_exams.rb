class CreatePatientsExams < ActiveRecord::Migration[6.0]
  def change
    create_table :patients_exams do |t|
      t.references :patient
      t.references :exam
    end
  end
end
