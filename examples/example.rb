cwd = File.dirname(File.dirname(File.absolute_path(__FILE__)))
$:.unshift(cwd + "/lib")
require 'zenpush'

# p ZenPush.z.categories

Dir.chdir("../faq/General")

