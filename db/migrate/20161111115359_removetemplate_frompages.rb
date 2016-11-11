class RemovetemplateFrompages < ActiveRecord::Migration[5.0]
  def change
    remove_column :pages, :template
  end
end
