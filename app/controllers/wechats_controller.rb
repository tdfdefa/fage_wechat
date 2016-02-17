class WechatsController < ApplicationController
 def home
 
 render text: params[:echostr]

	end
#接受服务器信息
def info
if params[:xml][:MsgType] == "text"
	render "info",formats: :xml
end
end

end
