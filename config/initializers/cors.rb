Rails.application.middleware.insert_before 0, Rack::Cors, debug: false, logger: (->{Rails.logger}) do  
  allow do    
    origins '*'    
    resource '*', 
        :headers=> :any, 
        :methods=> [:get, :post, :delete, :put]  
  end
end