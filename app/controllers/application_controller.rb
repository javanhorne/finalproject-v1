class ApplicationController < ActionController::Base


  def create_profile

    render({ :template => "profile/create_profile.html.erb"})
  end  
  def home

    render({ :template => "profile/home.html.erb"})
  end  
  def test
    
    render({ :template => "profile/test.html.erb"})
  end  

  def add_diagnosis
  # <!-- For ICD9 Loader -->
    # Add params to the database

    render({ :template => "profile/create_profile.html.erb"})
  end  

end
