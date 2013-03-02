module ApplicationHelper
  def sortable(column, theTitle=nil)
    title ||= I18n.t(theTitle)
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    selected = params[:selected_category]
    link_to title, :sort => column, :direction => direction, :selected_category => selected
  end
end
