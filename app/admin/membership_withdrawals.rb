ActiveAdmin.register MembershipWithdrawal do

  menu parent: 'Notifications'
  permit_params :user_id, :content, :admin_note, :status
  
  index do
    selectable_column
    id_column
    column :user
    column :content
    column :status do |membership_withdrawal|
      status_tag membership_withdrawal.status
    end
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :user
      row :content
      row :admin_note
      row :status do |membership_withdrawal|
        status_tag membership_withdrawal.status
      end
      row :created_at
    end
  end

end
