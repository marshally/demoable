# This migration comes from demoable (originally 20130621185448)
class CreateDemoableAccessCodes < ActiveRecord::Migration
  def change
    create_table :demoable_access_codes do |t|
      t.string :requester
      t.string :email
      t.string :code
      t.boolean :approved
      t.datetime :start_time
      t.integer :duration

      t.timestamps
    end
  end
end
