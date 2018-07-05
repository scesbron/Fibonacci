module ApplicationHelper
  def user_situations_options
    Hash[User.situations.map { |k,v| [User.human_attribute_name("situations.#{k}"), v] }]
  end
end
