class PrivacyPolicyController < ApplicationController
  def index
    if lookup_context.find_all('privacy_policy/' + ENV['CREWPICKER_INSTANCE']).any?
      render ENV['CREWPICKER_INSTANCE']
    end
  end
end
