class Api::V1::PostsController < ApiController
  before_action :authenticate_user_from_token, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = @current_user.posts.new(post_params)
    render json: { success: false, message: @post.errors.full_messages }, status: :unprocessable_entity unless @post.save
  end

  private

  def post_params
    params.permit(:title, :body)
  end
end
