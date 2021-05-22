class AddIntroductionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introdution, :text
  end
end
