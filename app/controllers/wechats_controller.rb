class WechatsController < ApplicationController
 def home
# render text: params[:echostr] 
render "wechats/info"
	end
def info
#render params
#p  params
end


	#接受微信服务器消息
	def request_info
		render  "wechats/info",layout: false,:formats => :xml
	end
	#验证token

	def do_GET (request, response)
    		response.status = 200
    		response.content_type = "text/plain"
    		response.body = request.query["echostr"] 
 	end
	#验证token方法２	   	
   	 private  
	  def check_signature?(signature,timestamp,nonce)  
	    Digest::SHA1.hexdigest([timestamp,nonce,@@token].sort.join) == signature  
	  end  
	  #验证token方法3

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
