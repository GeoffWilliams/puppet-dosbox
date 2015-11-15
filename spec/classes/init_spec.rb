require 'spec_helper'
describe 'dosbox' do

  context 'with defaults for all parameters' do
    it { should contain_class('dosbox') }
  end
end
