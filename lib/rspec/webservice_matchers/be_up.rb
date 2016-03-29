# frozen_string_literal: true
require 'rspec/webservice_matchers/util'
require 'validated_object'

# Pass when the response code is 200, following redirects if necessary.
module RSpec
  module WebserviceMatchers
    module BeUp

      class TestResult < ValidatedObject::Base
        attr_accessor :success, :status_code
        alias success? success

        validates :success, presence: true
        validates :status_code, presence: true
      end


      RSpec::Matchers.define :be_up do
        status = nil

        match do |url_or_domain_name|
          status = Util.status(url_or_domain_name, follow: true)
          status == 200
        end

        failure_message do
          "Received status #{status}"
        end
      end

    end
  end
end
