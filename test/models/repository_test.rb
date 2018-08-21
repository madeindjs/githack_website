require 'test_helper'

class RepositoryTest < ActiveSupport::TestCase
  setup do
    @repository = repositories(:one)
  end

  test 'should scan leaks' do
    r = Repository.new url: @repository.url, framework: @repository.framework
    assert_changes('Leak.count') do
      r.scan_leaks
    end
  end

  test 'should validate framework' do
    r = Repository.new url: @repository.url, framework: @repository.framework
    assert r.valid?
  end

  test 'should not validate framework' do
    r = Repository.new url: @repository.url, framework: 'azerty'
    assert_not r.valid?
  end
end
