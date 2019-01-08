require 'test_helper'

class TaskFlowTest < Capybara::Rails::TestCase
  def setup
    @one = task :one
    @two = task :two
  end

  test 'Task index' do
    visit tasks_path

    assert page.has_content?(@one.title)
    assert page.has_content?(@two.title)
  end
end
