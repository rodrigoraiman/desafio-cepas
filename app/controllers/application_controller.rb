class ApplicationController < ActionController::Base
    def authorize_editor!
        unless current_user.editor?
            flash[:alert]= 'you must be an editor to acces this section'
            redirect_to root_path
        end
    end
end
