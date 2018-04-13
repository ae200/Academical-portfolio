module NewContact
   extend ActiveSupport::Concern
   
   included do 
     before_action :new_contact
   end

   def new_contact
    respond_to do |format|
        format.html
         format.js
     end
  end 
end  