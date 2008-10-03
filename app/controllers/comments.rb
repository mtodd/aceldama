class Comments < Application

  provides :js, :json
  
  # ...and remember, everything returned from an action
  # goes to the client...
  def index
    @comments = Comment.all
    render
  end
  
end
