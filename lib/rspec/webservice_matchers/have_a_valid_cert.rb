# frozen_string_literal: true
require 'web_test/util'

require 'rspec/matchers'

module RSpec
  module WebserviceMatchers
    module HaveAValidCert
      # Is https is correctly implemented?
      RSpec::Matchers.define :have_a_valid_cert do
        error_message = nil

        match do |domain_name_or_url|
          begin
            WebTest::Util.try_ssl_connection(domain_name_or_url)
          rescue Exception => e
            error_message = fix_for_excon_bug(e.message)
            false
          end
        end

        failure_message do
          error_message
        end

        # Excon is failing on SSL when a 302 (and possibly others) is received.
        # We should be able to verify the SSL cert even though it's not a
        # 200. HTTPie and Curl are able to.
        # See https://github.com/excon/excon/issues/546
        def fix_for_excon_bug(error_message)
          return error_message unless buggy_message?(error_message)
          'Unable to verify the certificate because a redirect was detected'
        end

        def buggy_message?(text)
          text =~ /Unable to verify|verify failed/
        end
      end
    end
  end
end
