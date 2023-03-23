class AddIntroductionToUsers < ActiveRecord::Migration[6.1]
  def change
    # 課題チェックシート11Aの項目で追加
    add_column :users, :introduction, :text
    # ここまで
  end
end
