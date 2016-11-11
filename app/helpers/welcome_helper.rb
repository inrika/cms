module WelcomeHelper
  def page_to_show (num)
    @pages[num-1].url_of_page
  end
end
