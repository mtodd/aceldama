module Service
  class Comments < Service::Application
    
    def comments
      @comments = Comment.all
      ok @comments
    end
    
  end
end
