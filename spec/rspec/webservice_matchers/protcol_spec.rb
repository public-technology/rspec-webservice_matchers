require 'rspec/webservice_matchers'

describe 'status_code' do
  describe 'passes when the server returns the expected value' do
    it 'can check 200 for successful resource requests' do
      'http://www.rfc-editor.org/rfc/rfc2616.txt'.should be_status 200
    end

    it 'handles domain names in addition to URLs' do
      'www.rfc-editor.org'.should be_status 200
    end

    it 'can check 503 for the Service Unavailable status' do
      # TODO: set up a test server or a mock
      'http://www.weblaws.org/texas/laws/tex._spec._dist._local_laws_code_section_1011.202_tax_to_pay_general_obligation_bonds'.should be_status 503
    end
  end
end