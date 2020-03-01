const app = App.cable.subscriptions.create('PostChannel', {
  connected: function(data) {
  },
  disconnected: function(data) {
  },
  received(data) {
    $('body').append('<p>' + data["data"] + '</p>');
  }
})

$(function() {
  $(document).on('keypress', '.post', function(e) {
    if (e.keyCode === 13) {
      app.perform("create", {data: $('.post').val()});
      $('.post').val('');
    }
  })
})