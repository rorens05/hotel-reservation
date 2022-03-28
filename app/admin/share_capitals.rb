ActiveAdmin.register ShareCapital do
  menu parent: 'Notifications'
  permit_params :user_id, :amount, :content, :admin_note, :status

  index do
    selectable_column
    id_column
    column :user
    column :amount
    column :status do |share_capital|
      status_tag share_capital.status
    end
    column :created_at
    actions
  end

  show do
    columns do
      column span: 4 do
        attributes_table do
          row :user
          row :amount
          row :content
          row :admin_note
          row :status do |share_capital|
            status_tag share_capital.status
          end
          row :created_at
        end
      end
      if resource.image.attached?
        column do
          image_tag resource.image, style: 'width: 100%'
        end
      end
    end
  end
end
