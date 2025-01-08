class ChatChannel < ApplicationCable::Channel
  def subscribed
    puts "Subscribed to ChatChannel"
    stream_from "chat_#{params[:room]}"
  end

  def receive(data)
    puts "Received data: #{data}"
    ActionCable.server.broadcast("chat_#{params[:room]}", data)
  end
end
