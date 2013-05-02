module ApplicationHelper
    
    def sortable(column, title = nil)
        puts "column #{column} sort_column #{sort_column} sort_direction #{sort_direction}"
      title ||= column.titleize
      css_class = ("sites." + column == sort_column) ? "current #{sort_direction}" : nil
      direction = ("sites." + column == sort_column && sort_direction == "asc") ? "desc" : "asc"
      link_to title, {:sort => column, :direction => direction}, {:class => css_class}
    end
end
