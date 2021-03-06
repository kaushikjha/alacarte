# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_remove_fields(name, f, *args)
    options = args.first || {}
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)", options)
  end
  
  def link_to_add_fields(name, f, association, *args)
    options = args.first || {}
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render("shared/" + association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"), options)
  end
end
