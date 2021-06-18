class Api::V1::UsersController < ApiController

  def register
    @user = User.new(register_param)
    render json: { success: false, message: @user.errors.full_messages }, status: :unprocessable_entity unless @user.save
  end

  def login
    @user = User.find_by(email: params[:email])
    render json: { success: false, message: '회원정보를 찾을 수 없습니다' } unless @user&.valid_password?(params[:password])
  end

  private

  def register_param
    params.require(:user).permit(:name, :email, :password)
  end

end
