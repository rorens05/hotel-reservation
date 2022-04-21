ActiveAdmin.register Hotel do

  menu priority: 2
  permit_params :name, :description, :website, :phone, :email, :rules_and_policy, :image,
                gallery_attributes: [:id, :attachment, :file_type, :_destroy]

  index do
    selectable_column
    id_column
    column :name
    column :website
    column :phone
    column :email
    actions
  end

  form do |f|
    tabs do
      tab :general do
        f.inputs do
          f.input :name
          f.input :description, as: :froala_editor
          f.input :website
          f.input :phone
          f.input :email
          f.input :rules_and_policy, as: :froala_editor
          f.input :image, as: :file
        end
      end
      tab :gallery do
        f.inputs do
          f.has_many :gallery, heading: 'Gallery', allow_destroy: true, new_record: "Add new"   do |a|
            a.input :attachment, as: :file, hint: a.object.attachment.attached? ? image_tag(a.object.attachment, style: 'width: 150px') : content_tag(:span, 'No image yet')
            a.input :file_type, as: :select, collection: a.object.class.file_types.keys
          end
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
                row :name
                row :description do
                  resource.description&.html_safe
                end
                row :website
                row :phone
                row :email
                row :rules_and_policy do
                  resource.rules_and_policy&.html_safe
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
        tab "Gallery" do
          div class: 'admin-gallery' do
            resource.gallery.each do |gallery|
              if gallery.attachment.attached?
                div class: 'admin-gallery-item' do
                  if gallery.file_type == "Image"
                    image_tag gallery.attachment, class: 'width-100'
                  else  
                    video_tag url_for(gallery.attachment), size: "250x250", controls: true
                  end
                end
              end
            end
          end
        end
        tab "Rooms" do
          table_for resource.rooms do
            column :name do |item|
              link_to item.name, admin_room_path(item) 
            end
            column :price do |item|
              format_currency item.price
            end
          end
        end
      end
    end
  end
end
