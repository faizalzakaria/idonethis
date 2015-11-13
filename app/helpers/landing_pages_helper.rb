module LandingPagesHelper
  def active?(pattern)
    return 'active' unless params[:controller].match(pattern).nil?
    ''
  end
end
