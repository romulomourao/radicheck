class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  has_scope :by_user
  # GET /Exams
  # GET /Exams.json
  def index
    @exams = ::Exams::Base.all
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

        format.html { redirect_to exam_path(@exam), notice: 'Exam was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /Exams/1
  # PATCH/PUT /Exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to @exam, notice: 'Exam was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Exams/1
  # DELETE /Exams/1.json
  def destroy
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to exams_url, notice: 'Exam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = ::Exams::Base.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exam_params
      params.require(:exam).permit(:name, :cpf, :avatar)
    end

    def dicom_file
      params[:file].tempfile.path
    end

end
