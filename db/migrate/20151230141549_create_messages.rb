class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :to
      t.string :from
      t.string :body
      t.string :sms_id
      t.string :sms_status

      t.timestamps null: false
    end
  end
end
