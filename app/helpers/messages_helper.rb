module MessagesHelper
  def notification_color(message_unread)
    if message_unread
      "new-message"
    else
      "all-read"
    end
  end

  def viewed_message_color(message_unread)
    if message_unread
      "viewed"
    else
      "not_viewed"
    end 
  end

  def message_history_color(user_message)
    if user_message
      "my_message"
    else
      "not_my_message"
    end
  end
end