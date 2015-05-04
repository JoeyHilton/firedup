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

  def connections
    @finished_follow_records = Follow.where(followable_id: current_user.id, approved: true)
    # Followers from those connections
    @connections = @finished_follow_records.map do |f| 
      User.find(f.follower_id)
    end
  end

  # def site_user
  #   @user = User.find(params[:id])
  # end
end
