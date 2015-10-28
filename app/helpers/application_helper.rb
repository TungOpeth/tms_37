module ApplicationHelper

  # Returns the full title on a per-page basis.       # Documentation comment
  def full_title(page_title = '')                     # Method def, optional arg

    if page_title.empty?                              # Boolean test
      t :title                                       # Implicit return
    else
      page_title + " | " + t(:title)                  # String concatenation
    end
  end

  def link_to_remove_fields name, f
    f.hidden_field(:_destroy) + link_to(name, "#", onclick: "remove_fields(this)")
  end

  def link_to_add_fields name, f, association
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, child_index: "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, "#", onclick: "add_fields(this, \"#{association}\",
      \"#{escape_javascript(fields)}\")")
  end
end

