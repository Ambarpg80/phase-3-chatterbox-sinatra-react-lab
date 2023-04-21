class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # Add routes

  #GET (Read)
  get "/messages" do 
    message = Message.order("created_at ASC")
    message.to_json
  end

  #POST (Create)
  post "/messages" do 
    message = Message.create(
      username: params[:username],
      body: params[:body]
    )
    message.to_json
  end

  #PATCH (Update)
  patch "/messages/:id" do 
    message = Message.find(params[:id])
    message.update(
      body: params[:body]
    )
    message.to_json
  end

  #DELETE (Destroy)
  delete "/messages/:id" do
    message = Message.find(params[:id])
    message.destroy 
  end
  
end
