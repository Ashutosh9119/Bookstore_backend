class UserService
  def self.signup(params)
    user = User.new(params)
    if user.save
      { success: true, message: "User registered successfully", user: user }
    else
      { success: false, error: user.errors.full_messages.join(", ") }
    end
  end

end
