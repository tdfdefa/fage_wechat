class WechatsController < ApplicationController
	def home
		if valid_msg_signature(params)
		      render text: "", status: 401
		      return false
		   end
		   # content, status = Prpcrypt.decrypt(aes_key, params[:echostr], corp_id)
		    render text: content, status: status
	end

	def valid_msg_signature(params)
		timestamp         = params[:timestamp]
		nonce             = params[:nonce]
		echo_str          = params[:echostr]
		msg_signature     = params[:msg_signature]
		sort_params       = [qy_token, timestamp, nonce, echo_str].sort.join
		current_signature = Digest::SHA1.hexdigest(sort_params)
		current_signature == msg_signature
   	 end
end
