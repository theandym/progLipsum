module ApplicationHelper
  def application_title
    return "#{render_navigation(:context => :application_master, :renderer => :text, :join_with => " > ")}"
  end
  
  def meta_description
    return "Create test data in any format, integrate common variables, and generate as many records as you want. progLipsum is the 'lorem ipsum' for developers."
  end
end
