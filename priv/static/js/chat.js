$(function() {
  var socket = new Phoenix.Socket("ws://" + location.host + "/ws");
  var $output = $('#output');
  var $input  = $('#input');

  socket.join("chat", "chat", {}, function(chan) {
    chan.on("join", function(message) {
      console.log("connected");
    });

    $input.off("keypress").on("keypress", function(e) {
      if (e.keyCode == 13) {
        chan.send("chat:message", {data: $input.val()});
        $input.val("");
      }
    });

    chan.on("chat:message", function(message) {
      console.log("message:", message);
      $output.append($("<p>").text(atob(message.data)));
    });
  });
});
