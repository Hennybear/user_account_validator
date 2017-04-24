class EmailMissingError < StandardError
end

class UserAccountValidator
  attr_reader :email, :username, :name

  def initialize(user)
    @email = user[:email] || ''
    @username = user[:username]
    @name = user[:name]
  end

  def validate
    if email_missing?
      raise EmailMissingError, "Please enter an email address."
    elsif email_symbol_missing?
      raise "Please enter a valid email address."
    elsif username_missing?
      raise "Please enter a username."
    end
  end


  def email_missing?
    if @email.nil? || @email.empty?
      return true
    else
      return false
    end
  end

  def email_symbol_missing?
    if !@email.include?("@")
      return true
    else
      return false
    end
  end

  def username_missing?
    @username.nil? || username.empty?
  end
end
