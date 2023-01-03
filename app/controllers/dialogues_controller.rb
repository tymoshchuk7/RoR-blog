class DialoguesController < ApplicationController
  def index
    @dialogues = Dialogue.where(user_id: current_user.id)
  end

  def show
    @dialogue = Dialogue.find(params[:id])
  end

  def new
    @dialogue = Dialogue.new
  end

  def create
    @dialogue = Dialogue.new
    @dialogue.user_id = current_user.id
    if dialogue.save
      redirect_to @dialogue
    else
      render :new, status: :unprocessable_entity
    end
  end

  # private
  #   def dialogue_params
  #     params.require(:dialogues).permit()
  #   end
end
