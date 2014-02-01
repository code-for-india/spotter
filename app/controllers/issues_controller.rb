class IssuesController < ApplicationController

  respond_to :xml, :json
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  api :GET, '/issues/:lat/:lng/:area', "Shows issue in :area around the given :lat and :lng"
  param :area, String, "The area within which issues need to be shown"
  param :lat, String, "Latitude of the user"
  param :lng, String, "Longitude of the user"
  formats ['json', 'xml']
  def index
    # shows issue in a given area
    @issues = Issue.in_area params[:lat], params[:lng], params[:area]
  end

  api :GET, '/issues/:id/:lat/:lng/', "show issue and its distance from user"
  param :id, String, "The id of the concerned issue"
  param :lat, String, "Latitude of the user"
  param :lng, String, "Longitude of the user"
  formats ['json', 'xml']
  def show
    # shows distance between you and issue
    lat = params[:lat]
    lng = params[:lng]
    @dist = @issue.distance lat, lng
  end

  def new
    @issue = Issue.new
  end

  def edit
  end

  api :POST, '/issues', "create a new issue"
  param :issue_type, String
  param :latitude, String
  param :longitude, String
  param :description, String
  param :status, String
  formats ['json', 'xml']
  def create
    @issue = Issue.new(issue_params)

    respond_to do |format|
      if @issue.save
        format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
        format.json { render action: 'show', status: :created, location: @issue }
      else
        format.html { render action: 'new' }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:issue_type, :latitude, :longitude, :description, :status, :image)
    end
end
