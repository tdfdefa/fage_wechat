class WechatsController < ApplicationController
 

	def home
	@@token ="token"
	#if check_signature?(params[:signature],params[:timestamp],params[:nonce])  
   	  return render text: params[:echostr]  
    	#end  

		  
	end
	#验证token
	def do_GET (request, response)
    		response.status = 200
    		response.content_type = "text/plain"
    		response.body = request.query["echostr"] 
 	end
 	
   	
   	 private  
	  def check_signature?(signature,timestamp,nonce)  
	    Digest::SHA1.hexdigest([timestamp,nonce,@@token].sort.join) == signature  
	  end  


end
