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
    
    @array_of_first_names = ["John", "David", "Michael", "Chris", "Mike", "Mark", "Paul", "Daniel", "James", "Maria", "Sarah", "Laura", "Robert", "Lisa", "Jennifer", "Andrea", "Steve", "Peter", "Kevin", "Jason", "Jessica", "Michelle", "Karen", "Joe", "Brian", "Alex", "Richard", "Linda", "Julie", "Anna", "Andrew", "Mary", "Eric", "Sandra", "Tom", "Stephanie", "Thomas", "Sara", "Martin", "Scott", "Jean", "Susan", "Matt", "Jim", "Amanda", "Marie", "Ali", "Tony", "Melissa", "Carlos", "Jeff", "Marco", "Amy", "Ryan", "Bob", "Dave", "Angela", "Kim", "Kelly", "Patricia", "Jose", "Anthony", "Nicole", "Tim", "Barbara", "Adam", "Dan", "Christine", "Sam", "Patrick", "Anne", "Steven", "Bill", "Jonathan", "George", "Nick", "Matthew", "Ben", "Andy", "William", "Sharon", "Ashley", "Elizabeth", "Nancy", "Antonio", "Rachel", "Ahmed", "Mohamed", "Stephen", "Gary", "Juan", "Jack", "Debbie", "Claudia", "Monica", "Heather", "Christian", "Luis", "Carol", "Cindy"]
    
    @array_of_last_names = ["Smith", "Jones", "Johnson", "Lee", "Brown", "Williams", "Rodriguez", "Garcia", "Gonzalez", "Lopez", "Martinez", "Martin", "Perez", "Miller", "Taylor", "Thomas", "Wilson", "Davis", "Khan", "Ali", "Singh", "Sanchez", "Anderson", "Hernandez", "Chan", "Ahmed", "White", "Wong", "Thompson", "Jackson", "Kumar", "Moore", "Gomez", "King", "Diaz", "Fernandez", "Walker", "Harris", "James", "Green", "Lewis", "Torres", "Robinson", "Clark", "Roberts", "Ramirez", "Young", "Scott", "Tan", "Chen", "Hall", "Wright", "Evans", "Adams", "Allen", "Hill", "Sharma", "Patel", "Baker", "Wang", "Rossi", "Li", "Campbell", "Rivera", "Edwards", "Murphy", "Parker", "Kelly", "Kim", "Turner", "Mitchell", "Mohamed", "Carter", "Phillips", "Collins", "Alvarez", "Morris", "Morgan", "Kaya", "Wood", "Nelson", "Cooper", "Cruz", "Stewart", "Morales", "Flores", "Ng", "Hansen", "Demir", "Gutierrez", "Lim", "Bell", "Reyes", "Can", "Nguyen", "Silva", "Hughes", "Ruiz", "Shah", "Davies", "Macdonald"]

    @array_of_initials = ('A'..'Z').to_a
    
    @array_of_street_numbers = (1..2000).to_a
    
    @array_of_street_names = ["Maple", "Oak", "Poplar", "Cherry"]
    
    @array_of_street_types = ["St", "Rd", "Cir", "Ct", "Way"]
    
    
    
    @entities_with_data = ''
    
    @number_of_entities.times do
      map_variables_to_data = {
        "[[name_first]]" => @array_of_first_names.sample,
        "[[name_last]]" => @array_of_last_names.sample,
        "[[initial]]" => @array_of_initials.sample,
        "[[street_number]]" => @array_of_street_numbers.sample,
        "[[street_name]]" => @array_of_street_names.sample,
        "[[street_type]]" => @array_of_street_types.sample
      }
      regular_expression = Regexp.union(map_variables_to_data.keys)
      
      @entities_with_data << @entity_format.gsub(regular_expression, map_variables_to_data)
      
      if @number_of_entities > 1
        @entities_with_data << "\n\n"
      end
    end
  end
end
