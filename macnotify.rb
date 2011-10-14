Plugin.create(:growlnotify) do
  on_popup_notify do |user, text, &stop|
    t = text.to_show if text.is_a? Message
    u = "mikumiku"
    u = "@#{user[:idname]} (#{user[:name]})" if user
    img = user[:profile_image_url]
    i = Gtk::WebIcon.get_filename(img)
    system 'growlnotify', '-t', u, '-m', t.to_s, '--image', i
  end
end
