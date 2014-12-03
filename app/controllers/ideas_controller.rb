class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :verify_ownership, only: [:edit, :destroy]


  # GET /ideas
  # GET /ideas.json
  def index
    @my_ideas = Idea.where(user_id: current_user) if user_signed_in?
    @ideas = Idea.all - (@my_ideas || [])
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # GET /ideas/1/edit
  def edit
    set_idea
    @idea.user ||= current_user
    @idea.save
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user

    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    if not Project.where(idea_id: @idea).empty?
      redirect_to :back, notice: "There's already a project based on this idea"
    else
      @idea.destroy
      respond_to do |format|
        format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    def verify_ownership
      set_idea
      if not @idea.user.nil? and @idea.user != current_user
        redirect_to :ideas
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:name, :description, :platform, :architecture, :tools, :hardware, :effort, :deadline)
    end
end
