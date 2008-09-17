module Service
  class Comments < Halcyon::Controller
    
    def comments
      @comments = Comment.all
      ok @comments
    end
    
  end
end
