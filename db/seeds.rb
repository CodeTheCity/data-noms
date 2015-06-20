%w(CSV JSON).each do |format_name|
  Format.find_or_create_by(name: format_name)
end
