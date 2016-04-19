class Supplier::RetailersController < Supplier::ApplicationController
    def index
        @retailers = User.where(role: :retailer)
    end

    def new
        @retailer = User.new
    end

    def create
        # option number 1: if the user is not allowed to perform this controller action, we don't update
        if current_user.supplier?
            User.create(retailer_params)
        end

        # option 2: the model is user aware
        # The model has a method do save that gets the user that is trying to dave
        user = User.new(c)
        user.save_if_supplier(current)


        class User
            def save_is_supplier(current_user)
                if current_user.supplier?
                    save
                end
            end
        end

        class User
            attr_accessor         :external_user

            validate 'whatever', if: :external_user?

            def external_user?
                !self.external_user.nil?
                # also verify if external_user is of User type
            end

            def whatever
                if true
                    errors.add(:name, "can't be in the past")
                end                                                                
            end
        end

        user = User.new(retailer_params)
        user.external_user = current_user
        user.save


        class User
            validates :name, presense: true
        end

        if .....
            errors[:contact_atttributes].add(:name, "can't be in the past")
            logger.debug "#{user.errors.inspect}"

    private

    def retailer_params
        default_params = {
            password: @default_password,
            password_confirmation: @default_password
        }
        params.require(:user).permit(:first_name, :last_name, :business_name, :phone_number, :cell_number, :street_address, :apt_suite, :city, :state, :zip_code, :tax_id, :ssn, :in_biz, :terms, :email, :password, :password_confirmation).merge(default_params)
     end
end
