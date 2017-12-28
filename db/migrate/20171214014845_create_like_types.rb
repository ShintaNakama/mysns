class CreateLikeTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :like_types do |t|
      t.string :type_name

      t.timestamps
    end
  end
end
