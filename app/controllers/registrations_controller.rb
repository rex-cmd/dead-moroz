class RegistrationsController < Devise::RegistrationsController
      def create 
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      end
end