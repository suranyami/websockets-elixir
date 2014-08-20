(function() {
  $(function() {
    var $input, $output, socket;
    socket = new Phoenix.Socket("ws://" + location.host + "/ws");
    $output = $("#output");
    $input = $("#input");
    return socket.join("chat", "chat", {}, (function(_this) {
      return function(chan) {
        chan.on("join", function(message) {
          return console.log("connected");
        });
        $input.change(function(event) {
          var message;
          message = $input.val();
          chan.send("message", {
            text: message,
            banana: "xyz"
          });
          $input.val("");
          return console.log("sent message:", message);
        });
        chan.on("join", function(message) {
          console.log("joined:", message);
          return $output.append($("<p>").text(message.status));
        });
        return chan.on("message", function(message) {
          $output.append($("<p>").text(message.text));
          return console.log("received message:", message);
        });
      };
    })(this));
  });

}).call(this);
