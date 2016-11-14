class PagesController < ApplicationController
   def show
    begin
  #  @page = Page.find(params[:id]) # обработать исключение не получилось
      @page = Page.find_by_id(params[:id])
      if @page
        @template = Template.find(@page.template_id)
      else
        render  "pages/_error"
      end

     end
  end
  private
    def page_params
      params.require(:page).permit(:title, :url_of_page, :template_id, :content, :is_published)
    end
end
