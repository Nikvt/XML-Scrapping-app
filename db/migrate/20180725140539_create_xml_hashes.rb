class CreateXmlHashes < ActiveRecord::Migration[5.2]
  def change
    create_table :xml_hashes do |t|
      t.string :file_name
      t.text :tenant_hash

      t.timestamps
    end
  end
end
