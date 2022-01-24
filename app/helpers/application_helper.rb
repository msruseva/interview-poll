module ApplicationHelper
  def link_to_add_answer(name, f, association, **args)
    id, fields = add_row(name, f, association)

    link_to(name, '#', class: "add_answers " + args[:class], data: { id: id, fields: fields.gsub("\n", "") })
  end

  def link_to_add_question(name, f, association, **args)
    id, fields = add_row(name, f, association)

    link_to(name, '#', class: "add_questions " + args[:class], data: { id: id, fields: fields.gsub("\n", "") })
  end

  def add_row(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize, f: builder)
    end

    [id, fields]
  end
end
