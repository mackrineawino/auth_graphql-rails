# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :phone, String, null: false
    field :email, String, null: false
    field :date_of_birth, GraphQL::Types::ISO8601Date, null: false
    field :isMuslim, Types::BooleanType
    field :status, Types::IntegerType
  end
end
