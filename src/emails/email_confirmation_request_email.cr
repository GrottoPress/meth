class EmailConfirmationRequestEmail < BaseEmail
  def initialize(
    @operation : StartEmailConfirmation,
    @email_confirmation : EmailConfirmation
  )
  end

  private def receiver
    Carbon::Address.new(@email_confirmation.email)
  end

  private def heading
    "Confirm your email"
  end

  private def text_message : String
    <<-TEXT
    Hi,

    You (or someone else) entered this email address while
    registering for a new #{App.settings.name} account, or updating their email
    address.

    To proceed to confirm your email, click the link below:

    #{EmailConfirmationUrl.new(@operation, @email_confirmation)}

    This email confirmation link will expire in #{Shield.settings.email_confirmation_expiry.total_minutes.to_i} minutes.

    If you did not initiate this request, ignore this email.

    Regards,
    #{App.settings.name}.
    TEXT
  end
end
