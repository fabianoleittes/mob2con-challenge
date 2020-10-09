# frozen_string_literal: true

class ApiVersion
  def initialize(version:, default: false)
    @version = version
    @default = default
  end

  def matches?(request)
    @default || check_header(request.headers)
  end

  private

  def check_header(headers)
    accept = headers['Accept']
    accept = accept.include?(media_type)
  end

  def media_type
    "application/vnd.mob2con.#{@version}"
  end
end
