class ApiController < ActionController::API

  respond_to :json

  protected

  def authenticate_user_from_token
    token = request.headers['access-token']
    render json: { success: false, message: 'access token 정보를 찾을 수 없습니다.' }, status: :unauthorized unless token

    @current_user = User.find_by(token: token)
    render json: { success: false, message: '토큰 정보가 잘못되었습니다' }, status: :forbidden unless @current_user
  end
end
