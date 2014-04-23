require '/Library/Ruby/Gems/2.0.0/gems/terminal-notifier-1.6.0/lib/terminal-notifier.rb'

Plugin.create :macnotify do
    on_appear do |ms|
        ms.each do |m|
            text = m.message.to_show
            user = "mikumiku"
            user = "@#{m.message.user[:idname]} (#{m.message.user[:name]})" if m.message.user

            text = text.encode(Encoding::UTF_8)
            user = user.encode(Encoding::UTF_8)

            if text.valid_encoding? && user.valid_encoding?
                TerminalNotifier.notify(text, :title=>user, :sender=>'org.macosforge.xquartz.X11')
            end
        end
    end
end
