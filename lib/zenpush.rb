# encoding: UTF-8
require 'zenpush/runner'
require 'zenpush/zendesk'
require 'zenpush/markdown'

module ZenPush
  extend self

  # Zendesk API
  def z
    @z ||= ZenPush::Zendesk.new
  end

  def file_to_category_forum_topic(file)
    absolute_path = File.realpath(file)
    file_extension = File.extname(file)

    parts = absolute_path.split('/')

    if ZenPush.z.options[:filenames_use_dashes_instead_of_spaces]
      parts.each { |el| el.gsub!(/-/, ' ') }
    end

    file_object = File.read(file)
    meta = nil
    if file_object =~ /\A(---\s*\n.*?\n?)^(---\s*$\n?)/m
      meta = YAML.load($1)
    end

    topic_name = meta["title"]
    forum_name = parts[-2]
    category_name = parts[-3]
    # category_name = params[:category_name]
    # forum_name    = params[:forum_name]
    # topic_name    = params[:topic_name]

    return category_name, forum_name, topic_name
  end
end

