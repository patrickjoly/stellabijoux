module ApplicationHelper
  def sortable(column, theTitle=nil)
    title ||= I18n.t(theTitle)
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    selected = params[:selected_category]
    locale = params[:locale]
    link_to title, :locale => locale , :sort => column, :direction => direction, :selected_category => selected
  end
end
