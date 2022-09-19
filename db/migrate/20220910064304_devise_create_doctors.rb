# frozen_string_literal: true

class DeviseCreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.references :specialty
      t.string :full_name
      t.datetime :experience_at
      t.text :description

      t.datetime :start_work_schedule, default: '0000-01-01 09:00:00'
      t.datetime :end_work_schedule, default: '0000-01-01 18:00:00'
      t.datetime :start_lunch_break, default: '0000-01-01 13:00:00'
      t.datetime :end_lunch_break, default: '0000-01-01 14:00:00'

      t.integer :duration_appointments, default: 60

      t.boolean :monday_off, default: false
      t.boolean :tuesday_off, default: false
      t.boolean :wednesday_off, default: false
      t.boolean :thursday_off, default: false
      t.boolean :friday_off, default: false 
      t.boolean :saturday_off, default: true
      t.boolean :sunday_off, default: true

      ## Admin verified
      t.boolean :verified,          default: false

      ## Database authenticatable
      t.string :phone_number,       null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :doctors, :phone_number,         unique: true
    add_index :doctors, :reset_password_token, unique: true
  end
end
