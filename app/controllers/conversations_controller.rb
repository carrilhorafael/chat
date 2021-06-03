class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :update, :destroy]

  # GET /conversations
  def index
    @conversations = Conversation.all

    render json: @conversations
  end

  # GET /conversations/1
  def show
    render json: @conversation
  end

  # POST /conversations
  def create
    if already_conversation
      render json: @conversation
    else
      conv_params= {
        speaker1_id: current_user.id,
        speaker2_id: conversation_params[:speaker_id]
      }
      @conversation = Conversation.new(conv_params)

      if @conversation.save
        render json: @conversation, status: :created, location: @conversation
      else
        render json: @conversation.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /conversations/1
  def update
    if @conversation.update(conversation_params)
      render json: @conversation
    else
      render json: @conversation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /conversations/1
  def destroy
    @conversation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def already_conversation
      @conversation = Conversation.find_by(speaker1_id: current_user.id, speaker2_id: conversation_params[:speaker_id])
      if @conversation.nil?
        @conversation = Conversation.find_by(speaker2_id: current_user.id, speaker1_id: conversation_params[:speaker_id])
      end
      return @conversation.present?
        
    end

    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conversation_params
      params.require(:conversation).permit(:speaker_id)
    end
end
