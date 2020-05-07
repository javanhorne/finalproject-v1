class ApplicationController < ActionController::Base

  def square_new
    render({ :template => "square/new.html.erb"})
  end  
  
  def square_results
    @number = params.fetch("number")
    @output = @number.to_d * @number.to_d
    @output = @output.to_d
    render({ :template => "square/results.html.erb"})
  end 

  def square_root_new
    render({ :template => "square_root/new.html.erb"})
  end  
  
  def square_root_results
    @number = params.fetch("number")
    @output = @number.to_d**(0.5)
    
    render({ :template => "square_root/results.html.erb"})
  end  

  def payment_new
    render({ :template => "payment/new.html.erb"})
  end  
  
  def payment_results
    @apr = params.fetch("apr").to_d
    @years = params.fetch("years").to_d
    @prin = params.fetch("prin").to_d

    n = @years* 12
    r = (@apr / 12)/100
    
    @output = ((r * @prin)/(1-(1+r)**(-n)))
    
    render({ :template => "payment/results.html.erb"})
  end  


    def random_new
    render({ :template => "random/new.html.erb"})
  end  
  
  def random_results
    @min = params.fetch("min").to_d
    @max = params.fetch("max").to_d

    
    @output = rand(@min.to_f...@max.to_f)
    
    render({ :template => "random/results.html.erb"})
  end  

end
