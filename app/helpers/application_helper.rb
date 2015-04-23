module ApplicationHelper
  def resource_class
    devise_mapping.to
  end

  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def connection_color(pending_connection)
    if pending_connection
      "new-connection"
    else
      "all-read"
    end
  end
end
