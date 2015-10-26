class PasswordStrategy < ::Warden::Strategies::Base
  def valid?
    return false if request.get?
    user_data = params.fetch("user", {})
    !(user_data["email"].blank? || user_data["password"].blank?)
  end

  def authenticate!
    user = User.find_by_email(params["user"].fetch("email"))
    if user.nil? || user.confirmed_at.nil? || user.password != params["user"].fetch("password")
      fail! :message => "strategies.password.failed"
    else
      success! user
    end
  end
end

Warden::Strategies.add(:password, PasswordStrategy)
