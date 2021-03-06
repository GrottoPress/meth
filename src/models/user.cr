class User < BaseModel
  include Shield::User
  include Carbon::Emailable

  __enum Level do
    Admin
    Editor
    Author
  end

  table :users do
    column first_name : String
    column last_name : String
    column level : User::Level
  end

  def full_name : String
    "#{first_name} #{last_name}"
  end

  def emailable : Carbon::Address
    Carbon::Address.new(full_name, email)
  end
end
