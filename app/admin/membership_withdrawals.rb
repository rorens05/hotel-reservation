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
      row :admin_note
      row :status do |membership_withdrawal|
        status_tag membership_withdrawal.status
      end
      row :created_at
    end
    para "I #{membership_withdrawal.user.name}, member of LDTC would like to withdraw my membership. This is due to the following reasons: #{membership_withdrawal.content}"
  end

end
