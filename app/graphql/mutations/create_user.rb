module Mutations
    class CreateUser < BaseMutation
      # often we will need input types for specific mutation
      # in those cases we can define those input types in the mutation class itself
      class AuthProviderSignupData < Types::BaseInputObject
        argument :credentials, Types::AuthProviderCredentialsInput, required: false
      end
  
      argument :phone, String, required: true
      argument :date_of_birth, Date, required: true
      argument :isMuslim, Boolean, required: false
      argument :status, Integer, required: false

      argument :auth_provider, AuthProviderSignupData, required: false
  
      type Types::UserType
  
      def resolve(phone: nil, auth_provider: nil)
        User.create!(
          phone: phone,
          date_of_birth: date_of_birth,
          isMuslim: isMuslim,
          status: status,
          email: auth_provider&.[](:credentials)&.[](:email),
          password: auth_provider&.[](:credentials)&.[](:password)
        )
      end
    end
  end