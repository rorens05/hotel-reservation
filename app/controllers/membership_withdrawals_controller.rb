class MembershipWithdrawalsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_navigation_name
  layout 'dashboard'

  private

  def membership_withdrawal_params
    params.require(:membership_withdrawal).permit(:user_id, :content, :admin_note, :status)
  end

  def set_navigation_name 
    @navigation_name = "form"
  end
end
