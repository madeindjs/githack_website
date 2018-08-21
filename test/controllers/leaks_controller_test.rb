require 'test_helper'

class LeaksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leak = leaks(:one)
  end

  test 'should update leak' do
    patch repository_leak_url(repository_id: @leak.repository_id, id: @leak.id, status: :safe)
    assert_redirected_to @leak.repository
    @leak.reload
    assert @leak.safe?
  end
end
