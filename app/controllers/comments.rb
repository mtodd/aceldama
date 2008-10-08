class Comments < Application

  provides :js, :json
  
  def index
    @comments = Comment.all
    
    case content_type
    when :js
      render
    when :json
      render
    end
  end
  
end
