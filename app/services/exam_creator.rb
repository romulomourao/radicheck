class ExamCreator

  DICOM_TAGS = {
    :"acquisition date" => :acquisition_date,
    :"modality" => :modality,
    :"study description" => :study_description,
    :"series description" => :series_description,
    :"slice thickness" => :slice_thickness,
    :"kvp" => :kvp,
    :"exposure time" => :exposure_time,
    :"xray tube current" => :xray_tube_current,
    :"exposure" => :exposure,
    :"radionuclide" => :radionuclide,
    :"radionuclide total dose" => :radionuclide_total_dose,
    :"patient's name" => :patients_name,
    :"patient's birth date" => :patients_birth_date,
    :"patient id" => :patient_id,
    :"patient's sex" => :patients_sex,
    :"patient's weight" => :patients_weight
  }

  def initialize(file)
    @file = file
  end


  def call
    @data = DicomExtractor.new(file).call
    data.transform_keys! { |key| key.downcase.to_sym }
    build_exam
  end

  def parse
    raise NotImplementedError, 'You must implement the parse method'
  end


  protected

  def build_exam

    exam_attributes = {}
    DICOM_TAGS.keys.each do |label|
      key = DICOM_TAGS[label];
      exam_attributes[key] = data[label];
    end

    case data[:modality]
    when 'NM'
      exam_attributes[:modality] = 0
      ::Exams::NuclearMedicine.new(exam_attributes)
    else
      exam_attributes[:modality] = 1
      ::Exams::DigitalRadiography.new(exam_attributes)

    end

  end

  attr_accessor :data, :file
end
