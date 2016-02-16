class WechatsController < ApplicationController
<<<<<<< HEAD
 def home
	

	return render text:params[:echostr]   
def info
end
 end

#验证token
=======
 
	def home
	@@token ="token"
	#if check_signature?(params[:signature],params[:timestamp],params[:nonce])  
   	  return render text: params[:echostr]  
    	#end  

		  
	end

	#接受微信服务器消息
	def  info
	
	end

		
	end
	def process_request
		render  "wechats/info",layout: false,:formats => :xml
	end
	#验证token
>>>>>>> 0090d1b38fa2600ccf62000bbf623393b23f6cfa
	def do_GET (request, response)
    		response.status = 200
    		response.content_type = "text/plain"
    		response.body = request.query["echostr"] 
 	end
<<<<<<< HEAD
=======
	#验证token方法２	   	
   	 private  
	  def check_signature?(signature,timestamp,nonce)  
	    Digest::SHA1.hexdigest([timestamp,nonce,@@token].sort.join) == signature  
	  end  
	  #验证token方法3
>>>>>>> 0090d1b38fa2600ccf62000bbf623393b23f6cfa
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
