module UsersHelper
  def human_attribute_roles
    Hash[User.roles.map { |k,v| [k, User.human_attribute_name("role.#{k}")] }]
  end
end
