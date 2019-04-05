class Pin < ApplicationRecord
  belongs_to :user
  has_attached_file :image, styles: { medium: "300x300>", url: "/system/:hash.:extension", hash_secret: "longSecretString" }
 validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


 #has_attached_file :pdf, :path => ':rails/assets/documents/:id/:basename.:extension'
#  validates_attachment :pdf, content_type: { content_type: "application/pdf" }
end
