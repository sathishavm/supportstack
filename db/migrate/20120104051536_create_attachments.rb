class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
    t.string :attachable_type
    t.integer:attachable_id
    t.has_attached_file :avatar
    t.timestamps
    end
    end
  end

