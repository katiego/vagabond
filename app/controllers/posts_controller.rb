class PostsController < ApplicationController
  
    def index
        if params[:tag]
            @posts = Post.tagged_with(params[:tag])
        else
        @posts = Post.all
        end
    end

    def show
        @post = Post.find(params[:id])

    end

    def new
        @city = City.find(params[:city_id])
        @post = Post.new(:city_id => @city)

    end

    def edit
        if current_user == @post.user
            @post = Post.find(params[:id])
        else redirect_to :back, error: "Please log in first"
        end
    end

    def create
        p params
        @city = City.find(params[:post][:city_id])
        @post = current_user.posts.create(post_params)

        if @post.save
           redirect_to post_path(@post)
         else
           flash[:error] = @post.errors.full_messages.join(", ")
           render 'new'
         end
    end

    def update
       @post = Post.find(params[:id])

       if @post.update(post_params)
             redirect_to @post
       else
             render 'edit'
       end
     end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to :back
    end


    private 
        def post_params
            params.require(:post).permit(:title, :body, :author, :city_id, :tag_list, :tag_list => [])
        end
end
``
