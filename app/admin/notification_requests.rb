ActiveAdmin.register_page "Notification Requests", label: "Notifications" do
  menu priority: 7, parent: "Notifications"
  content do
    if User.unverified_users.count.zero?
      para "No unverified user"
    else
      table_for User.unverified_users do
        column :id
        column :email
        column :name
        column :contact_number
        column :actions do |user|
          link_to "Details", admin_user_path(user.id)
        end
      end
    end
  end
end