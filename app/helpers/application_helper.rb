module ApplicationHelper
  def flash_tag(msg, msg_type)
    return unless msg.present?
    if msg_type == "notice"
      msg_type = "info"
    elsif msg_type == "alert"
      msg_type = "danger"
    end

    content_tag(:div, class: "tile tile-lg tile-full-width tile-flexible-height tile-deep-orange alert alert-#{msg_type} alert-dismissible", role: "alert") do
      content_tag(:span, class: "content-wrapper") do
        content_tag(:span, class: "tile-content center") do
          content_tag(:h3) do
            msg
          end
        end
      end
    end
  end

  # To enable devise in modal

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
