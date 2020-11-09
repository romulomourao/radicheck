class PatientsController < ApplicationController

  before_action :set_patients, only: [:index]
  before_action :set_patient, only: [:show]

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


  private

  def set_patients
    @patients = apply_scopes(Patient).order(acquisition_date: :desc).page(params[:page]).per(10)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end


end
