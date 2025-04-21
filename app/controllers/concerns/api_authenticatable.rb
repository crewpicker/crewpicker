# app/controllers/concerns/api_authenticatable.rb
module ApiAuthenticatable
  extend ActiveSupport::Concern

  # Place class-level calls here, like helper_method
  included do
    # Make the current_user method available as a helper in views/helpers
    helper_method :current_user

    # You could also put other class-level calls here if needed by the concern
    # For example, conditional skip_before_action specific to API contexts
    # skip_before_action :require_login, raise: false, if: -> { request.format.json? && !current_user.present? }
  end


  # This method attempts API key authentication.
  # It sets @current_user if successful but DOES NOT RENDER anything on failure.
  # Returns true if authentication succeeded, false otherwise.
  def attempt_api_key_authentication
    token, secret = extract_api_key_from_request
    # If no Authorization header or invalid format, just return false.
    # The calling method (`authenticate_user_or_api_key`) will handle the final unauthorized.
    return false unless token && secret

    api_key = ApiKey.authenticate(token, secret)

    if api_key
      @current_user = api_key.user # Set the user for this request
      true # Indicate success
    else
      # API key was provided but was invalid or inactive.
      # Log this issue, but don't render here. The calling method renders 401.
      Rails.logger.warn "API Authentication failed for token (prefix): #{token.to_s.first(8)}..."
      false # Indicate failure
    end
  end

  # Extracts the token and secret from the Authorization header.
  # Expects the format "Token <token>:<secret>"
  def extract_api_key_from_request
    auth_header = request.headers['Authorization']
    return [nil, nil] unless auth_header

    # Regex to match "Token token:secret" case-insensitively
    match = auth_header.match(/^Token\s+([^:]+):(.+)$/i)
    if match
      [match[1], match[2]] # Return token and secret
    else
      [nil, nil] # Invalid format
    end
  end

  # Renders a 401 Unauthorized response.
  def render_unauthorized(message = "Unauthorized")
    render json: { error: message }, status: :unauthorized
  end

  # Overridden current_user method.
  # It checks @current_user (set by API key)
  # first, then falls back to the parent's (Sorcery's) current_user.
  def current_user
    @current_user || super
  end

  # You can remove the original helper_method call here, as it's now inside `included`
  # helper_method :current_user # REMOVE THIS LINE

end