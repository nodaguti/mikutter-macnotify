require '/Library/Ruby/Gems/2.0.0/gems/terminal-notifier-1.6.0/lib/terminal-notifier.rb'

Plugin.create :macnotify do
    on_appear do |ms|
        ms.each do |m|

            if Time.now - m[:created] > 5
                next
            end

            text = m.message.to_show
            user = "mikumiku"
            user = "@#{m.message.user[:idname]} (#{m.message.user[:name]})" if m.message.user

            text = text.encode(Encoding::UTF_8)
            user = user.encode(Encoding::UTF_8)

            url = m.message.user[:profile_image_url]
            img = Gdk::WebImageLoader.local_path(url)

            if text.valid_encoding? && user.valid_encoding?
                TerminalNotifier.notify(text, :title=>user, :appIcon=>img, :sender=>'org.macosforge.xquartz.X11')
            end
        end
    end
end
