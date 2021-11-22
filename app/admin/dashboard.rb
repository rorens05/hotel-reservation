ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate dashboard" do
        h3 "LINGAYEN DAGUPAN TRANSPORT COOPERATIVE"
        h3 "Brgy. Quibaol West, Highway, Lingayen Pangasinan"
        h3 "CDA Registration No. 9520-1010000000045365"
        h3 "TIN N0. 737-879-958-000"
      end
      
      div do
        image_tag "/images/mission.png", style: 'width: 70%; display: block; margin: 50px auto'
      end
      div do
        image_tag "/images/vision.png", style: 'width: 70%; display: block; margin: 50px auto'
      end
      div do
        image_tag "/images/core-values.png", style: 'width: 70%; display: block; margin: 50px auto'
      end
    end
    
    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
