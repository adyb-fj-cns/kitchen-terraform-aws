require 'awspec'
require 'aws-sdk'

region = "eu-west-1"
name = "demo"

describe 'demo tests' do
    describe vpc(name), region: region do
        it { should exist }
        it { should have_tag('Name').value(name) }
    end
end