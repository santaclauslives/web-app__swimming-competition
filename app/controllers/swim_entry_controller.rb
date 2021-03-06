MyApp.post "/swim_entry_delete_one_swimmer/:id" do

  @dq = SwimEntry.find_by_id(params[:id])
  

  erb :"success_deleted_swim_entries_one_swimmer"
end

MyApp.get "/swim_entry" do

  # If a GET request is made to the root path, the following line of code
  # looks for a .erb view file located in the 'views' directory at the given
  # location. So it's going to look for views/main/welcome.erb.
  # 
  # Then it will combine that view file with the layout file and sent the
  # combined document back to the client.

  erb :"swim_entry"
end



MyApp.get "/all_swim_entries" do
  @entries = SwimEntry.all

  erb :"swim_entry_list"
end 

#   erb :"swim_entry"
# end

MyApp.get "/swim_entry/create" do

  # If a GET request is made to the root path, the following line of code
  # looks for a .erb view file located in the 'views' directory at the given
  # location. So it's going to look for views/main/welcome.erb.
  # 
  # Then it will combine that view file with the layout file and sent the
  # combined document back to the client.

  # Accepts the form entry data and creates the swimmer in the table. 
  e = SwimEntry.new
  e.swimmer_id = params[:swimmer_id]
  e.race_id = params[:race_id]
  e.save
 
  
  erb :"success_swim_entry"
end