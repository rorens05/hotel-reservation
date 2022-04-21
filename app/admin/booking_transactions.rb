ActiveAdmin.register BookingTransaction do
  menu priority: 6
  permit_params :user_id, :room_id, :price, :schedule, :status, :payment_method, :note, :screenshot

  index do
    selectable_column
    id_column
    column :user
    column :hotel do |item|
      item.room.hotel
    end
    column :room
    column :price do |item|
      format_currency item.price
    end
    column :schedule
    column :status do |item|
      status_tag item.status
    end
    column :payment_method do |item|
      status_tag item.payment_method
    end
    actions
  end

  form do |f|
    tabs do
      tab :general do
        f.inputs do
          f.input :screenshot, as: :file
          f.input :user
          f.input :room, member_label: :display_name
          f.input :price
          f.input :schedule, as: :datetime_picker
          f.input :status
          f.input :payment_method
          f.input :note
        end
      end
    end
    f.actions
  end

  show do
    panel resource.transaction_number do
      tabs do
        tab 'Details' do
          columns do
            column span: 4 do
              attributes_table_for resource do
                row :user
                row :hotel do
                  resource.room.hotel
                end
                row :room
                row :price
                row :schedule
                row :status do 
                  status_tag resource.status
                end
                row :payment_method do 
                  status_tag resource.payment_method
                end
                row :note
              end
            end
            if resource.screenshot.attached?
              column span: 1 do
                image_tag resource.screenshot, class: 'width-100'
              end
            end
          end
        end
      end
    end
  end

end
