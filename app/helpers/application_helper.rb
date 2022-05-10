module ApplicationHelper
  def active?(controller_name, action_name)
     return "active border-bottom border-dark border-2" if controller_name == params[:controller] && action_name == params[:action]
  end

  def status_image(object)
    if object.status == "everytime"
      'nisekai.jpg'
    else
      'netabare.jpg'
    end
  end
end
