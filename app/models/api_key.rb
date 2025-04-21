# app/models/api_key.rb
class ApiKey < ApplicationRecord
  belongs_to :user

  # REMOVE THIS LINE ENTIRELY: has_secure_token :token, on: :before_validation
  # It's not supported in Rails 7.0

  # We will manually generate the token in a before_validation callback
  attribute :secret_key, :string, default: -> { SecureRandom.base58(32) } # Use base58 like has_secure_token

  # Callbacks
  # Manually generate token before validation
  before_validation :generate_token_manually, on: :create # <-- Add this callback

  # Digest secret key before validation
  before_validation :digest_secret_key, on: :create

  validates :user, presence: true
  validates :token, presence: true, uniqueness: true # Keep validation
  validates :key_digest, presence: true             # Keep validation
  validates :secret_key, presence: true, on: :create

  # ... rest of the model ...

  # Class method to authenticate
  def self.authenticate(provided_token, provided_secret)
     api_key = find_by(token: provided_token)
     return nil unless api_key && api_key.active?
     BCrypt::Password.new(api_key.key_digest).is_password?(provided_secret) ? api_key : nil
  end

  # Method to display the full key (token:secret) ONLY when creating the key.
  def full_key
    "#{token}:#{secret_key}" if secret_key.present?
  end

  private

  # --- Add this new method for manual token generation ---
  # Manually generate the token before validation if it's blank
  def generate_token_manually
     # Generate a unique token if it hasn't been set already
     # SecureRandom.base58(24) generates a 24-character base58 string,
     # which is the default format/length for has_secure_token
     self.token = SecureRandom.base58(24) unless token.present?
  end
  # -----------------------------------------------------


  # Use bcrypt to create a digest of the secret key
  def digest_secret_key
    if secret_key.present?
      self.key_digest = BCrypt::Password.create(secret_key)
      @secret_key = nil
    end
  end
end