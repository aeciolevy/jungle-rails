class AddOnDestroy < ActiveRecord::Migration
  def change
    remove_reference :reviews, :users, index: true, foreign_key: true
    remove_reference :reviews, :products, index: true, foreign_key: true
    add_reference :reviews, :users, index: true, foreign_key: true, on_delete: :cascade
    add_reference :reviews, :products, index: true, foreign_key: true, on_delete: :cascade
  end
end
