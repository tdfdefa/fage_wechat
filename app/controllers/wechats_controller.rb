class WechatsController < ApplicationController
 def home
	
#render text: params[:xml]
render "info", text: params[:echostr]
#render "wechats/info"
	end
#接受服务器信息
def info
  
	     render layout:false, formats: :xml
 end

	private
#验证token
#	def check_signature?(signature,timestamp,nonce)
	#	Digest::SHA1.hexdigest([timestamp,nonce,@@token].sort.join) == signature  
#	end
end
