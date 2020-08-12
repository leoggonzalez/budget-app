module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    email_address = user.email
    hash = Digest::MD5.hexdigest(email_address)
    image_src = "https://www.gravatar.com/avatar/#{hash}?s=#{options[:size]}"
    return image_tag(image_src, class: "card-img", alt: user.username)
  end
end

