# frozen_string_literal: true
require 'spec_helper'
require 'rspec/webservice_matchers/be_up'

include RSpec::WebserviceMatchers::BeUp

describe TestResult do
  it 'requires :success' do
    expect {
      TestResult.new { |r| r.status_code = 200 }
    }.to raise_error(ArgumentError)
  end

  it 'requires :status_code' do
    expect {
      TestResult.new { |r| r.success = true }
    }.to raise_error(ArgumentError)
  end

  it 'accepts boolean :success & integer :status_code' do
    result = TestResult.new do |r|
      r.status_code = 200
      r.success = true
    end
    expect( result ).to be_an_instance_of(TestResult)
  end
end