$("#task-id").on "click", ->
  task_id = $(this).attr('id');
  $.ajax {
    url: '/tasks/:task_id/set_done'
    type: 'post'
    dataType: 'script'
    success: () ->
  }
