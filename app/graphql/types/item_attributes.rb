module Types
  class ItemAttributes < Types::BaseInputObject
    description "Attributes for creating or updating ann item"

    argument :title, String, required: true
    argument :description, String, required: true
    argument :image_url, String, required: true
  end
end