module SessionsHelper

  def sign_in(user)
    cookies[:remember_token] = {value: user.id, expires: 8.hours.from_now.utc}
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

private

  def current_user
    @current_user ||= User.find_by_id(cookies[:remember_token])
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user?(user)
    user == current_user
  end

end
