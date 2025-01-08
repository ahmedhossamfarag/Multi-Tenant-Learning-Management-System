class ChatRoomsController < ApplicationController
  before_action :set_chat_room, only: %i[ show edit update destroy ]

  # GET /chat_rooms or /chat_rooms.json
  def index
    @chat_rooms = ChatRoom.all
  end

  # GET /chat_rooms/1 or /chat_rooms/1.json
  def show
  end

  # GET /chat_rooms/new
  def new
    @chat_room = ChatRoom.new
  end

  # GET /chat_rooms/1/edit
  def edit
  end

  # POST /chat_rooms or /chat_rooms.json
  def create
    @chat_room = ChatRoom.new(chat_room_params)

    respond_to do |format|
      if @chat_room.save
        format.html { redirect_to @chat_room, notice: "Chat room was successfully created." }
        format.json { render :show, status: :created, location: @chat_room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chat_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chat_rooms/1 or /chat_rooms/1.json
  def update
    respond_to do |format|
      if @chat_room.update(chat_room_params)
        format.html { redirect_to @chat_room, notice: "Chat room was successfully updated." }
        format.json { render :show, status: :ok, location: @chat_room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chat_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chat_rooms/1 or /chat_rooms/1.json
  def destroy
    @chat_room.destroy!

    respond_to do |format|
      format.html { redirect_to chat_rooms_path, status: :see_other, notice: "Chat room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat_room
      @chat_room = ChatRoom.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def chat_room_params
      params.expect(chat_room: [ :user_id, :title ])
    end
end
