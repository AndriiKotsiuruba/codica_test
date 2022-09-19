# frozen_string_literal: true

ActiveAdmin.register Doctor do
  permit_params :specialty_id, :verified, :phone_number, :password, :password_confirmation

  config.batch_actions = false

  index do
    id_column
    column :specialty
    column :verified
    column :phone_number
    column :full_name
    column :experience_at
    column :created_at

    actions
  end

  show do
    default_main_content do
      row :picture do |doctor|
        image_tag doctor.picture.image_url if doctor.picture
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :phone_number if f.object.new_record?
      f.input :password if f.object.new_record?
      f.input :password_confirmation if f.object.new_record?
      f.input :specialty
      f.input :verified
    end
    f.actions
  end
end
