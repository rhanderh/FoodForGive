class ConfessionsController < ApplicationController
  #before_filter :check_for_mobile
  before_action :set_confession, only: [:show, :edit, :update, :destroy]
  before_action :check_if_ipayed, only: [:index]
  respond_to :html, :js, :json
 
  # you can disable csrf protection on controller-by-controller basis:
  #skip_before_filter :verify_authenticity_token

  # GET /confessions
  # GET /confessions.json
  def index
    @confessions = Confession.order('created_at DESC').limit(500).page(params[:page])
  end


  # GET /confessions/new
  def new
    @confession = Confession.new
  end



  # POST /confessions
  # POST /confessions.json
  def create
    @confession = Confession.new(confession_params)
    

    respond_to do |format|
      if @confession.save
        format.js 
      #  format.html {render :partial => 'show_confession', :content_type => 'text/html', notice: 'Thank you for sharing!  Now absolve yourself and feel better by helping someone else.' }
       # format.json { render json: @confession.to_json, status: :created }
      else
        format.js 
       # format.html { render action: 'new', notice: 'Thank you for sharing!  We could not save your reponse right now, but absolve yourself and feel better by helping someone else.' }
        #format.json { render json: @confession.errors, status: :unprocessable_entity }
      end
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
    
    def check_if_ipayed
    @ipayed_val = session[:ipayed]
    puts @ipayed_val

      if @ipayed_val == 1
        return true
      else 
        redirect_to root_path
        return false
      end
    end
    

    
end

