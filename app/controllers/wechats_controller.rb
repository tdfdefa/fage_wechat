class WechatsController < ApplicationController
 def home
	

	return render text:params[:echostr]   
def info
end
 end

#验证token
	def do_GET (request, response)
    		response.status = 200
    		response.content_type = "text/plain"
    		response.body = request.query["echostr"]     
 	end
	def valid_msg_signature(params)
	
		qy_token =  "token"
		timestamp         = params[:timestamp]
		nonce             = params[:nonce]
		echo_str          = params[:echostr]
		msg_signature     = params[:signature]
		sort_params       = [qy_token, timestamp, nonce].sort.join
		current_signature = Digest::SHA1.hexdigest(sort_params)
		if current_signature == msg_signature
			return  true
		else
			return false
		end

   	 end


end
