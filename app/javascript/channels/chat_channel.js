// app/javascript/channels/chat_channel.js
import consumer from "channels/consumer"

const chatChannel = consumer.subscriptions.create({ channel: "ChatChannel", room: room }, {
  connected(){
    console.log("connected")
  },
  received(data) {
    // data => { sent_by: "Paul", body: "This is a cool chat app." }
    console.log(data)
  }
})

setTimeout(function (){chatChannel.send({ sent_by: "Paul", body: "This is a cool chat app." })}, 1000)

