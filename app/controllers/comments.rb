class Comments < Application

  provides :js, :json
  
  def index
    @comments = Comment.all
    render
  end
  
end
