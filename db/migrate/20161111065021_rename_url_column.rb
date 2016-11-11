class RenameUrlColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :pages, :url, :url_of_page
  end
end
