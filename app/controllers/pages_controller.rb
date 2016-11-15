class PagesController < ApplicationController
  def show
    @page = Page.find_by_url_of_page!(params[:path])

    @template = Template.find(@page.template_id)
    rescue
      ActiveRecord::RecordNotFound
      render  "pages/_error"
  end

end
