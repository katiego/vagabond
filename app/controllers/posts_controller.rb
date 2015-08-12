class PostsController < ApplicationController
  
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @city = City.find(params[:city_id])
        @post = Post.new(:city_id => @city)

    end

    def edit
        @post = Post.find(params[:id])
    end

    def create
        @post = current_user.posts.create(post_params)

        if @post.save
           redirect_to '/'
         else
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

        redirect_to profile_path
    end


    private 
        def post_params
            params.require(:post).permit(:title, :body, :author, :city_id)
        end
end
``
