class CreatePublicTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :public_texts do |t|
      t.string :public_text_name, unique: true
      t.string :body
      t.timestamps
    end
  end
end
