class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.belongs_to :author, index: true
      t.timestamps
    end
  end
end
