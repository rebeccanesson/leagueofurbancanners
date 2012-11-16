module UsersHelper
  def setup_user(user)
    user.person ||= Person.new
    user
  end
end