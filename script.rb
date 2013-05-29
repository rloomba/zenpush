Dir.chdir("./examples/faq")
subdir_list = Dir["*"].reject { |o| not File.directory?(o) }

IGNORE = ['.', '..', '.DS_Store']

subdir_list.each do |category|
  next if category == "Developer" || category == "Support"
  Dir.chdir("./#{category}")
  dir_contents = Dir.entries(Dir.pwd)
  dir_contents.reject! { |file_name| IGNORE.include?(file_name)}
  dir_contents.each do |file_name|
    command = "zp push -f #{file_name} -F github"
    p "running #{command}"
    system(command)
  end
  Dir.chdir("../")
end
