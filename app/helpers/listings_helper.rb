module ListingsHelper
  def tag_links(tags_string)
    tags_string.split(',').map { |tag| link_to tag.strip, tag_path(tag.strip) }.join(', ')
  end
end
