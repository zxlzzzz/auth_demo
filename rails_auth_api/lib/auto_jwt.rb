class AutoJwt
  def initialize(app)
    @app = app
  end

  def call(env)
    return @app.call(env) if %w[/users /login /].include? env['PATH_INFO']

    header = env['HTTP_AUTHORIZATION']
    jwt = header.split(' ')[1] rescue ''

    begin
      payload = JWT.decode jwt, "91ea5985-7228-4907-918f-1f4a59eee94e", true, { algorithm: 'HS256' }
    rescue JWT::ExpiredSignature
      return [200, {}, [JSON.generate({ message: 'token过期' })]]
    rescue
      return [200, {}, [JSON.generate({ message: '无效token' })]]
    end

    env['current_user_id'] = payload[0]['user_id'] rescue nil

    # 状态码 响应头 响应体
    @status, @headers, @response = @app.call(env)
    [@status, @headers, @response]
  end

end