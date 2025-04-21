# lib/tasks/api_keys.rake
namespace :api_keys do
  desc "Generate an API key for a user"
  task :generate, [:user_id, :description] => :environment do |t, args|
    user = User.find_by(id: args[:user_id])
    unless user
      puts "Error: User with ID #{args[:user_id]} not found."
      exit(1)
    end

    api_key = user.api_keys.new(description: args[:description])

    # The raw_secret is available in api_key.secret_key just before saving
    raw_secret_to_display = api_key.secret_key

    if api_key.save
      puts "API Key generated successfully for user: #{user.email} (ID: #{user.id})"
      puts "---------------------------------------------------"
      puts "Token: #{api_key.token}"
      puts "Secret: #{raw_secret_to_display}" # Display the raw secret ONCE
      puts "---------------------------------------------------"
      puts "IMPORTANT: Store this Secret Key securely! It will not be shown again."
    else
      puts "Error generating API key: #{api_key.errors.full_messages.join(', ')}"
      exit(1)
    end
  end
end
