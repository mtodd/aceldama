class Comments < Application

  provides :js, :json
  
  def index
    # find the page or create it
    unless page = Page.first(:url => params[:page])
      page = Page.new(
        :url => params[:page],
        :created_at => Time.now,
        :updated_at => Time.now
      )
      page.save
    end
    
    # get comments
    @comments = page.comments(:order => [:created_at.desc])
    
    case content_type
    when :js
      render
    when :json
      display
    end
  end
  
  def create
    # handle users
    unless user = User.first(:email => params[:email])
      user = User.new(
        :email => params[:email],
        :created_at => Time.now,
        :updated_at => Time.now
      )
      user.save
    end
    
    # Create comment
    @comment = Comment.new(
      :page => Page.first(:url => params[:page]),
      :body => params[:body],
      :user => user,
      :created_at => Time.now,
      :updated_at => Time.now
    )
    @comment.save
    
    case content_type
    when :js
      render
    when :json
      display
    end
  end
  
end
