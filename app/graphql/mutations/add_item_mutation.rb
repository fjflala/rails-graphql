module Mutations
  class AddItemMutation < Mutations::BaseMutation
    argument :attributes, Types::ItemAttributes, required: true

    field :item, Types::ItemType, null: true
    field :errors, Types::ValidationErrorsTypes, null: false

    def resolve(attributes:)
      # TODO: Commented because testing with graphiql does not have sessions
      # check_authentication!

      item = Item.new(attributes.to_h.merge(user_id: "1"))

      if item.save
        MartianLibrarySchema.subscriptions.trigger("itemAdded", {}, item)
        { item: item }
      else
        { errors: item.errors.full_messages }
      end
    end
  end
end