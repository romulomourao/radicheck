module Api
  class ExamsController < ActionController::API
    respond_to :json

    has_scope :by_patient

    def index
      @exams = collection
      # render json: @exams, include: ['exam']
      render json: ExamsBlueprint.render(@exams)
    end

    private

    def collection
      @collection ||= apply_scopes(PatientExam.all)
    end

  end
end
