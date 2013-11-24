class ConfessionsController < ApplicationController
  before_action :set_confession, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json
  
  # you can disable csrf protection on controller-by-controller basis:
  #skip_before_filter :verify_authenticity_token

  # GET /confessions
  # GET /confessions.json
  def index
    @confessions = Confession.all
  end

  # GET /confessions/1
  # GET /confessions/1.json
  def show
  end

  # GET /confessions/new
  def new
    @confession = Confession.new
  end

  # GET /confessions/1/edit
  def edit
  end

  # POST /confessions
  # POST /confessions.json
  def create
    @confession = Confession.new(confession_params)

    respond_to do |format|
      if @confession.save
        format.js 
        format.html {render :partial => 'show_confession', :content_type => 'text/html', notice: 'Thank you for sharing!  Now absolve yourself and feel better by helping someone else.' }
       # format.json { render json: @confession.to_json, status: :created }
      else
        format.html { render action: 'new', notice: 'Thank you for sharing!  We could not save your reponse right now, but absolve yourself and feel better by helping someone else.' }
        #format.json { render json: @confession.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /confessions/1
  # PATCH/PUT /confessions/1.json

 # def update
  #  respond_to do |format|
   #   if @confession.update(confession_params)
    #    format.html { redirect_to @confession, notice: 'Confession was successfully updated.' }
     #   format.json { head :no_content }
      #else
       # format.html { render action: 'edit' }
        #format.json { render json: @confession.errors, status: :unprocessable_entity }
     # end
    #end
  #end

  # DELETE /confessions/1
  # DELETE /confessions/1.json
  def destroy
    @confession.destroy
   respond_to do |format|
      format.html { redirect_to confessions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_confession
      @confession = Confession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def confession_params
      params.require(:confession).permit(:confession_text)
    end
end
