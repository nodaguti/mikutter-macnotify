Plugin.create(:growlnotify) do
  on_popup_notify do |user, text, &stop|
    text = text.to_show if text.is_a? Message
    u = "mikumiku"
    u = "@#{user[:idname]} (#{user[:name]})" if user
    url = user[:profile_image_url]
    img = Gdk::WebImageLoader.local_path(url)
    Thread.new{system 'say', user[:idname]}
    system 'growlnotify', '-t', u, '-m', text, '--image', img
    stop.call
  end
end
