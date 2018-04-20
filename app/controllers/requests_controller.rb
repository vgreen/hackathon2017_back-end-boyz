class RequestsController < ApplicationController
	before_action :find_req, only: [:show, :destroy]
	def index
		@requests = Request.all.order("created_at DESC")
	end


	def show
		@f = Random.rand(100000...900000).to_s
		
		
		#require "addressable/uri"
	    require 'net/http'
	    adr = "https://sms.ru/sms/send?api_id=38D4FB0B-E443-C840-C728-478CE7727601&to="+ @request.title + "&text=" +@f
		uri = URI.parse( adr )
		http = Net::HTTP.new(uri.host, uri.port)
		request = Net::HTTP::Get.new(uri.request_uri)
		http.use_ssl = true  
		response = http.request(request)
	end

	def new
		@request = Request.new
	end

	def create
		@request = Request.new(req_params)

		if @request.save
			redirect_to @request, notice: "Ваша заявка успешно зарегестрирована"
			RequestsMailer.confirmation(@request).deliver_now
		else
			render 'new'
		end
	end

	def destroy
		ide = @request.id
		@request.destroy
		redirect_to root_path, notice: "Заявка id: " + ide.to_s + " '"+ tit+ "' " "была удалена!"
	end

	private

	def req_params
		params.require(:request).permit(:title, :name, :second_name, :patronim, :birthday, :phone_n, :email, :passport_num, :date_pass, :code_podr, :vidan, :region, :addres)
	end

	def find_req
		@request = Request.find(params[:id])
	
	end
	#Создаёт сообщение





	def send_simple_message
		require 'rest_client'
	  RestClient.post "https://api:key-3ax6xnjp29jd6fds4gc373sgvjxteol0"\
	  "@api.mailgun.net/v3/samples.mailgun.org/messages",
	  :from => "Excited User <excited@samples.mailgun.org>",
	  :to => "kormilitsin9746@mail.ru",
	  :subject => "Hello",
	  :text => "Testing some Mailgun awesomeness!"
	end

end
