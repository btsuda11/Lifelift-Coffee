# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  first_name      :string           not null
#  last_name       :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    has_secure_password

    before_validation :ensure_session_token

    validates :first_name, :last_name, presence: true
    validates :email, uniqueness: true, length: { in: 3..255 }, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :session_token, presence: true, uniqueness: true
    validates :password, length: { in: 6..255 }, allow_nil: true

    def self.find_by_credentials(email, password)
        user = User.find_by_email(email)
        if user&.authenticate(password)
            user
        else
            nil
        end
    end

    def reset_session_token!
        self.session_token = generate_unique_session_token
        self.save!
        self.session_token
    end
  
    private
    def generate_unique_session_token
        # in a loop:
            # use SecureRandom.base64 to generate a random token
            # use `User.exists?` to check if this `session_token` is already in use
            # if already in use, continue the loop, generating a new token
            # if not in use, return the token
        loop do
            session_token = SecureRandom::urlsafe_base64(16)
            return session_token unless User.exists?(session_token: session_token)
        end
    end

    def ensure_session_token
        # if `self.session_token` is already present, leave it be
        # if `self.session_token` is nil, set it to `generate_unique_session_token`
        self.session_token ||= generate_unique_session_token
    end

end
