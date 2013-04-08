require 'spec_helper'

describe 'noeqd' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen'
    }
  end

  it do
    should contain_package('noeqd')
  end
end
