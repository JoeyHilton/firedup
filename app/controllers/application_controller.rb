class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :navbar_pending_connection


  private

    def navbar_pending_connection
      if current_user
      # All recored where current user is being followed and approved is false
      @follow_records = Follow.where(followable_id: current_user.id, approved: false)
      # Followers from those connections
      @pending_connections = @follow_records.map do |f| 
        User.find(f.follower_id)
      end
    end
    end
end
