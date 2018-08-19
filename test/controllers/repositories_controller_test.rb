require 'test_helper'

class RepositoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repository = repositories(:one)
  end

  test 'should get index' do
    get repositories_url
    assert_response :success
  end

  test 'should get new' do
    get new_repository_url
    assert_response :success
  end

  test 'should create repository' do
    assert_difference('Repository.count') do
      post repositories_url, params: { repository: { url: @repository.url } }
    end

    assert_redirected_to repository_url(Repository.last)
  end

  test 'should show repository' do
    get repository_url(@repository)
    assert_response :success
  end

  test 'should destroy repository' do
    assert_difference('Repository.count', -1) do
      delete repository_url(@repository)
    end

    assert_redirected_to repositories_url
  end
end
