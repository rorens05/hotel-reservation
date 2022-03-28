class ProblemFormsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_navigation_name
  layout 'dashboard'

  private

    def problem_form_params
      params.require(:problem_form).permit(:user_id, :date_of_incident, :place, :content, :admin_note, :status)
    end

    def set_navigation_name 
      @navigation_name = "form"
    end
end
