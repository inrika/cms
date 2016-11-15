class WelcomeController < ApplicationController
  def index
    @pages = Page.where(is_published: true)
  end
end
