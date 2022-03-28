ActiveAdmin.register ProblemForm do
  
  menu parent: 'Notifications'
 
  permit_params :user_id, :date_of_incident, :place, :content, :admin_note, :status
 
  index do
    selectable_column
    id_column
    column :user
    column :date_of_incident
    column :place
    column :status do |problem_form|
      status_tag problem_form.status
    end
    column :created_at
    actions
  end
end
