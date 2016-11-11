class PagesController < ApplicationController
   # GET /pages/1
  # GET /pages/1.json
  def show
    begin
    @page = Page.find(params[:id])
    @template = Template.find(@page.template_id)
     rescue
       render_404
     end

  end
  private
   # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :url_of_page, :template_id, :content, :is_published)
    end
end
