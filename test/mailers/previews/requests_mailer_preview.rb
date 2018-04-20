# Preview all emails at http://localhost:3000/rails/mailers/requests_mailer
class RequestsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/requests_mailer/confirmation
  def confirmation
    RequestsMailer.confirmation
  end

end
