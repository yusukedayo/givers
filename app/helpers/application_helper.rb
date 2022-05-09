module ApplicationHelper
  def active?(controller_name, action_name)
     return "active border-bottom border-dark border-2" if controller_name == params[:controller] && action_name == params[:action]
  end

  def rundum_image
    images = ['underrunte.jpeg', 'niserunte.png', 'run.png']
    article_image = images.sort_by{rand}.first
  end
end
