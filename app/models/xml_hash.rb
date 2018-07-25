class XmlHash < ApplicationRecord
  validates :file_name, :tenant_hash, presence: true
end
