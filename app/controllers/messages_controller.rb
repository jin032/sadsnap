class MessagesController < ApplicationController
	before_action :authenticate_user!

	def index
		@messages = Recipient.where(:user_id => current_user.id).order('created_at DESC')
	end

	def new
		@message = Message.new
		@recipients = User.all
	end

	def create
		@message = current_user.messages.build(message_params)
		if @message.save
			flash[:success] = 'Message sent!'
			redirect_to root_path
		else
			falsh[:alert]='Message not sent'
			render 'new'
		end
	end

	def destroy
		@message.destroy
		redirect_to root_path
	end

	private

	def message_params
		params.require(:message).permit(:body, :sender_id, user_tokens: [])
	end
	
end
