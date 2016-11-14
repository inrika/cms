class Admin::PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!
   def index
    @pages = Page.all
  end


  def show
  end

  def new
    @templates = Template.all
    @page = Page.new
  end

  def edit
    @templates = Template.all
  end

  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to([:admin,@page], notice: 'Page was successfully updated.')}
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to([:admin,@page], notice: 'Page was successfully updated.')}
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to admin_pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_page
    @page = Page.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def page_params
    params.require(:page).permit(:title, :url_of_page, :template_id, :content, :is_published)
  end
end
