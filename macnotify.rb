require "terminal-notifier"

Plugin.create(:macnotify) do
  on_popup_notify do |user, text, &stop|
    text = if text.is_a? Message
      text.to_show
    else
      '' unless test.is_a? String
    end
    
    u = "mikumiku"
    u = "@#{user[:idname]} (#{user[:name]})" if user

    text = text.encode(Encoding::UTF_8)
    u = u.encode(Encoding::UTF_8)

    if text.valid_encoding? && u.valid_encoding?
      TerminalNotifier.notify(text, :title=>u, :sender=>'org.macosforge.xquartz.X11')
    end
    stop.call
  end
end
