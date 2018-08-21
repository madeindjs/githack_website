require 'test_helper'

class RepositoryTest < ActiveSupport::TestCase
  setup do
    @repository = repositories(:one)
  end

  test 'should scan leaks' do
    r = Repository.new url: 'https://github.com/madeindjs/fooder', framework: @repository.framework
    assert_changes('Leak.count') do
      r.scan_leaks
    end
  end

  test 'should validate framework' do
    r = Repository.new url: 'https://github.com/madeindjs/fooder', framework: @repository.framework
    assert r.valid?, r.errors.inspect
  end

  test 'should not validate framework' do
    r = Repository.new url: 'https://github.com/madeindjs/fooder', framework: 'azerty'
    assert_not r.valid?
  end
end
