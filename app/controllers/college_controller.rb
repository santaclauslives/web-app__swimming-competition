MyApp.get "/college_delete/:id" do
  @college = College.find_by_id(params[:id])
  @college.delete

  erb :"success_college_deleted"
end

MyApp.get "/form_for_editing_college/:id" do
  @college = College.find_by_id(params[:id])

  erb :"edit_college_form"
end

MyApp.get "/process_form_for_editing_college/:id" do
  @college = College.find_by_id(params[:id])

    @college.college_name = params[:college_name] #last error message here
    @college.conference_id = params[:conference_id]
    @college.contact = params[:contact]
    @college.contact_email = params[:contact_email]
    @college.contact_ph = params[:contact_ph]
    @college.locked = params[:locked]
    @college.save

  erb :"success_college_edit"
end

MyApp.post "/lock_college/:id" do  #I KNOW THIS ISN'T IT. 
  @college = College.find_by_id(params[:id]) #find the line in college table 
  @college.locked = true
  @college.save

  erb :"success_college_locked"
end

MyApp.get "/all_colleges" do
  @colleges = College.all

  erb :"college_list"
end

MyApp.get "/college/new" do

  @conferences = Conference.all# If a GET request is made to the root path, the following line of code
  # looks for a .erb view file located in the 'views' directory at the given
  # location. So it's going to look for views/main/welcome.erb.
  # 
  # Then it will combine that view file with the layout file and sent the
  # combined document back to the client.

  # Accepts the form entry data and creates the swimmer in the table. 
  
  erb :"college"
end

MyApp.get "/college/create" do

  # If a GET request is made to the root path, the following line of code
  # looks for a .erb view file located in the 'views' directory at the given
  # location. So it's going to look for views/main/welcome.erb.
  # 
  # Then it will combine that view file with the layout file and sent the
  # combined document back to the client.

  # Accepts the form entry data and creates the college in the table. 

  @college = College.new
  @college.college_name = params[:college_name]
  @college.conference_id = params[:conference_id]
  @college.contact = params[:contact]
  @college.contact_email = params[:contact_email]
  @college.contact_ph = params[:contact_ph]
  @college.save


  erb :"success_college_add"
end

MyApp.get "/college_view/:id" do

  @college = College.find(params[:id]) 
  

  # If a GET request is made to the root path, the following line of code
  # looks for  .erb view file located in the 'views' directory at the given
  # location. So it's going to look for views/main/welcome.erb.
  # 
  # Then it will combine that view file with the layout file and sent the
  # combined document back to the client.

  # Accepts the form entry data and creates the swimmer in the table. 
  
  erb :"college_status"
end
