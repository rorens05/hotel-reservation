ActiveAdmin.register Room do

  menu priority: 3
  permit_params :hotel_id, :name, :description, :price, :image

  index do
    selectable_column
    id_column
    column :hotel
    column :name
    column :price do |item|
      format_currency item.price
    end
    actions
  end

  form do |f|
    tabs do
      tab :general do
        f.inputs do
          f.input :image, as: :file
          f.input :hotel
          f.input :name
          f.input :description, as: :froala_editor
          f.input :price
        end
      end
    end
    f.actions
  end

  show do
    panel resource.name do
      tabs do
        tab 'Details' do
          columns do
            column span: 4 do
              attributes_table_for resource do
                row :hotel
                row :name
                row :description do
                  resource.description&.html_safe
                end
                row :price do
                  format_currency resource.price
                end
              end
            end
            if resource.image.attached?
              column span: 1 do
                image_tag resource.image, class: 'width-100'
              end
            end
          end
        end
      end
    end
  end
end
