class EventValidation < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :validated?, :boolean
  end
end
