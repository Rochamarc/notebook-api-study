class ApplicationController < ActionController::API
    # Garante que as requisições sejam do tipo json
    before_filter :ensure_json_request

    def ensure_json_request
        return if request.headers['Accept'] =~ /json/
        render :nothing => true, :status => 406
    end
end
