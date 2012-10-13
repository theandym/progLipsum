class RandomController < ApplicationController
  def generate
  end
  
  def result
    @entity_format = params[:string]
    
    if params[:number_of_entities].nil? || params[:number_of_entities] == ''
      @number_of_entities = 1
    else
      @number_of_entities = params[:number_of_entities].to_i
    end
    
    @array_of_first_names = ['Andy', 'Dave', 'Jeremy', 'Matt', 'Martin', 'Chris', 'Austin', 'Jonathan', 'Sam', 'Daniel']
    @array_of_last_names = ['Macdonald', 'Lee', 'Grieshop', 'Rector', 'Clark', 'Messer', 'Sanderson', 'Styles', 'Beckler', 'Brown']
    
    @entities_with_data = ''
    
    @number_of_entities.times do
      map_variables_to_data = {
        "[[name_first]]" => @array_of_first_names.sample,
        "[[name_last]]" => @array_of_last_names.sample
      }
      regular_expression = Regexp.union(map_variables_to_data.keys)
      
      @entities_with_data << @entity_format.gsub(regular_expression, map_variables_to_data)
      
      if @number_of_entities > 1
        @entities_with_data << "\n\n"
      end
    end
  end
end
