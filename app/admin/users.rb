ActiveAdmin.register User do
  menu priority: 10

  permit_params :email, 
                :username, 
                :contact_number, 
                :first_name, 
                :middle_name, 
                :last_name, 
                :gender, 
                :birthday, 
                :role, 
                :status,
                :password,
                :password_confirmation,
                :image,
                :country,
                :region_id,
                :province_id,
                :city_id,
                :sss,
                :tin,
                :philhealth,
                :pag_ibig,
                :id_image


  member_action :verify, method: :post do
    resource.verified_at = DateTime.now
    resource.save
    redirect_to resource_path, notice: "Verified"
  end

  member_action :logged_out, method: :post do
    resource.token = nil
    resource.save
    UserChannel.broadcast_to(
        resource,
        { type: "LOGOUT", token: resource.token}
      )
    redirect_to resource_path, notice: "User successfully logged out"
  end
  
  member_action :unverify, method: :post do
    resource.verified_at = nil
    resource.save
    redirect_to resource_path, notice: "Unveried"
  end

  index do
    selectable_column
    id_column
    column "Name", :first_name do |user|
      user.name
    end
    column :email
    column :contact_number
    # column :verified do |user|
    #   status_tag user.verified?
    # end
    actions
  end   
  
  form do |f|  
    f.semantic_errors *f.object.errors.keys
    f.input :image, as: :file
    f.input :id_image, as: :file

    f.input :username
    f.input :contact_number
    f.input :first_name
    f.input :middle_name
    f.input :last_name
    f.input :email
    f.input :gender
    f.input :birthday, as: :date_picker
    f.input :password
    f.input :password_confirmation
    f.actions
  end

  show do
    panel user.name do
      tabs do
        tab 'General Information' do
          columns do
            column span: 3 do
              attributes_table_for user do
                row :id
                row :email
                row :username
                row :contact_number 
                row :first_name 
                row :last_name 
                row :gender 
                row :birthday 
                row :sss
                row :tin
                row :philhealth
                row :pag_ibig
                row :verified_at do 
                  div do
                    if user.verified_at.present?
                      status_tag user.verified?
                      a "Unverify", href: unverify_admin_user_path(user.id), "data-method": :post, rel: 'nofollow', class: 'text-danger'
                    else
                      status_tag user.verified?
                      a "Verify", href: verify_admin_user_path(user.id), "data-method": :post, rel: 'nofollow', class: 'text-success'
                    end
                  end
                end
              end
            end
            if user.image.attached? || user.id_image.attached?
              column do
                div do
                  image_tag user.image, class: 'width-100' if user.image.attached?
                end
                div do
                  image_tag user.id_image, class: 'width-100' if user.id_image.attached?
                end
              end
            end
          end
        end
       
      end
    end
  end

end
