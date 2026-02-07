# frozen_string_literal: true

module Identifiable
  extend ActiveSupport::Concern

  class_methods do
    attr_accessor :identity_key

    def identifies_by(attribute)
      self.identity_key = attribute
    end

    # Ensures tokens generated with secure token will never start with a number.
    # This ensures any class that are identified by tokens work properly with Turbo.
    def generate_unique_secure_token(...)
      "OAK#{super(...)}"
    end
  end

  included do
    def to_param = send(self.class.identity_key)
    def to_key = [ to_param ]
  end
end
