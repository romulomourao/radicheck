module Api
  class ExamsController < ActionController::API
    respond_to :json

    has_scope :by_patient

    def index
      render json: ExamsBlueprint.render(collection)
    end

    private

    def collection
      @collection ||= apply_scopes(PatientExam.all)
    end

  end
end
