class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|
      t.string  :type
      t.string  :cpf
      t.string  :acquisition_date
      t.integer :modality
      t.string  :study_description
      t.string  :series_description
      t.decimal :slice_thickness
      t.integer :kvp
      t.integer :exposure_time
      t.integer :xray_tube_current
      t.integer :exposure
      t.string  :radionuclide
      t.decimal :radionuclide_total_dose
      t.string  :patients_name
      t.string  :patients_birth_date
      t.string  :patient_id
      t.string  :patients_sex
      t.string  :patients_weight

      t.timestamps
    end
  end
end


















