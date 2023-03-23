class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      # 課題チェックシート11Aの項目で追加
      t.string :title
      t.text :body
      t.integer :user_id
      # ここまで
      t.timestamps
    end
  end
end
