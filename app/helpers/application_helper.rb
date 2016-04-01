module ApplicationHelper
  def alphabet_filter(model, parent=nil)
    a = String.new
    [*('0'..'9'),*('a'..'z')].each do |i|
      if model.constantize.send(:letter_present?, i)
        if parent
          a << link_to(i, polymorphic_path([parent, model.constantize], i: i))
        else
          a << link_to(i, polymorphic_path(model.constantize, i: i))
        end
      end
      a << " "
    end
    if parent
      a << link_to('clear', polymorphic_path([parent, model.constantize]))
    else
      a << link_to('clear', polymorphic_path(model.constantize))
    end
    a.html_safe
  end
  
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
    link_to title, sort: column, direction: direction, i: params[:i]
  end  
end
