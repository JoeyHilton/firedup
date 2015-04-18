module MessagesHelper
  def notification_color(x)
    if x
      "new-message"
    else
      "all-read"
    end
  end
end
