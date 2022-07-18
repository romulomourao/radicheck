class ExamsController < ApplicationController

  before_action :set_exam, only: [:show, :edit, :update, :destroy]
  before_action :set_exams, only: [:index]

  has_scope :by_user
  has_scope :q

  # GET /Exams
  # GET /Exams.json
  def index
  end

  # GET /Exams/1
  # GET /Exams/1.json
  def show
  end

  # GET /Exams/new
  def new
    @exam = ::Exams::Base.new
  end

  # GET /Exams/1/edit
  def edit
  end

  # POST /Exams
  # POST /Exams.json
  def create
    @exam = ExamCreator.new(dicom_file).call

    @exam.cpf = params[:cpf]

    respond_to do |format|
      if @exam.save
        if params[:cpf]
          patient = Patient.find_by(cpf: params[:cpf])
          PatientExam.create!(exam: @exam, patient: patient)
        end

        format.html {
          flash[:success] = "Exame criado com sucesso"
          redirect_to exam_path(@exam)
        }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /Exams/1
  # PATCH/PUT /Exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params(@exam.type))
        format.html {
          flash[:success] = "Exame atualizado com sucesso"
          redirect_to exam_path(@exam.id)
        }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /Exams/1
  # DELETE /Exams/1.json
  def destroy
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to exams_url, notice: 'Exame deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

    def set_exams
      @exams = apply_scopes(Exams::Base).order(acquisition_date: :desc).page(params[:page]).per(10)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = ::Exams::Base.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exam_params(type)
      params.require(type.underscore.gsub('/', '_').to_sym)
      .permit(:name, :cpf, :avatar,:patients_name,
        :patients_birth_date, :patient_id,
        :patients_sex, :patients_weight,
        :acquisition_date, :modality,
        :study_description, :series_description,
        :slice_thickness, :kvp, :exposure_time,
        :xray_tube_current, :exposure, :radionuclide,
        :radionuclide_total_dose)
    end

    def dicom_file
      params[:file].tempfile.path
    end

end
