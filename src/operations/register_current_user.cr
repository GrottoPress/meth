class RegisterCurrentUser < User::SaveOperation
  permit_columns :first_name, :last_name

  before_save do
    validate_required first_name, last_name
    validate_name first_name, last_name
    validate_not_pwned(password) if Lucky::Env.production?

    set_level
  end

  include Shield::SendWelcomeEmail

  private def set_level
    if !App.settings.make_first_user_admin || UserQuery.new.first?
      level.value = User::Level.new(:author)
    else
      level.value = User::Level.new(:admin)
    end
  end
end
