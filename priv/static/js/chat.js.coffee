$ ->
  socket = new Phoenix.Socket("ws://" + location.host + "/ws")
  $output = $("#output")
  $input = $("#input")

  socket.join "chat", "chat", {}, (chan) =>
    chan.on "join", (message) =>
      console.log "connected"

    $input.change (event) =>
      message = $input.val()
      chan.send "message",
        data: message
      $input.val ""
      console.log "sent message:", message

    chan.on "join", (message) =>
      console.log "joined:", message
      $output.append $("<p>").text(message.status)

    chan.on "message", (message) =>
      $output.append($("<p>").text(message))
      console.log "received message:", message
