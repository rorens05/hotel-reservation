class ShareCapitalsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_navigation_name
  layout 'dashboard'

  private

    def share_capital_params
      params.require(:share_capital).permit(:user_id, :amount, :content, :admin_note, :status, :image)
    end

    def set_navigation_name 
      @navigation_name = "form"
    end
end
