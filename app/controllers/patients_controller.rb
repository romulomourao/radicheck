class PatientsController < ApplicationController

  before_action :set_patients, only: [:index]
  before_action :set_patient, only: [:show, :edit, :update]

  has_scope :q

  def index
  end

  def show
    @exams ||= @patient.exams.order(acquisition_date: :desc)
    gon.push({
      exams_api: api_exams_url,
      patient_id: @patient.id,
      controller: controller_name
    })
  end

  def new
    @patient = Patient.new
  end

  def edit
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      flash[:success] = "Paciente criado com sucesso"
      redirect_to @patient
    else
      flash[:error] = "Algo deu errado"
      render 'new'
    end
  end

  def update
      if @patient.update_attributes(patient_params)
        flash[:success] = "Paciente atualizado com sucesso"
        redirect_to @patient
      else
        flash[:error] = "Algo deu errado"
        render 'edit'
      end
  end


  private

  def set_patients
    @patients = apply_scopes(Patient).order(acquisition_date: :desc).page(params[:page]).per(10)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :cpf)
  end

end
