ActiveAdmin.register ShareCapitalWithdrawal do
  menu parent: 'Notifications'

  permit_params :user_id, :amount, :content, :admin_note, :status
  
  index do
    selectable_column
    id_column
    column :user
    column :amount
    column :status do |share_capital_withdrawal|
      status_tag share_capital_withdrawal.status
    end
    column :created_at
    actions
  end
  
end
