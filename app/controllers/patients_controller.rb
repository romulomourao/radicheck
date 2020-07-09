class PatientsController < ApplicationController

  before_action :set_patients, only: [:index]
  before_action :set_patient, only: [:show]

  def index
  end

  def show
  end


  private

  def set_patients
    @patients = Patient.page(params[:page]).per(10)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end


end
