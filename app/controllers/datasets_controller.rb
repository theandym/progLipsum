class DatasetsController < ApplicationController
  def index
    @datasets = current_account.datasets.all
  end
  
  def new
    @dataset = Dataset.new
    
    @object = @dataset
  end
  
  def preview
    @dataset = Dataset.new(params[:dataset])
    if @dataset.format == nil || @dataset.format.empty?
      redirect_to new_dataset_path, :flash => { :error => 'Please enter your desired data format...' }
    end
    
    @object = @dataset
    
    if params[:number_of_entities].nil? || params[:number_of_entities] == ''
      @number_of_entities = 10
    else
      @number_of_entities = params[:number_of_entities].to_i
    end
    
    @text = Mannequin::Text.new
    
    @dataset.output = ''
    
    @number_of_entities.times do
      @person = Mannequin::Person.new
      @address = Mannequin::Address.new
      @number = Mannequin::Number.new
      
      map_variables_to_data = {
        "[[name_first]]" => @person.first_name, #deprecated
        "[[first_name]]" => @person.first_name,
        "[[name_last]]" => @person.last_name, #deprecated
        "[[last_name]]" => @person.last_name,
        "[[initial]]" => @person.middle_initial,
        "[[middle_initial]]" => @person.middle_initial,
        "[[email_address]]" => @person.email_address,
        "[[street_address]]" => @address.street_address,
        "[[street_number]]" => @address.street_number,
        "[[street_name]]" => @address.street_name,
        "[[street_type]]" => @address.street_type,
        "[[city]]" => @address.city,
        "[[state]]" => @address.state,
        "[[state_code]]" => @address.state_code,
        "[[country]]" => @address.country,
        "[[number_1_digit]]" => @number.digits_1, #deprecated
        "[[number_digits_1]]" => @number.digits_1,
        "[[number_2_digit]]" => @number.digits_2, #deprecated
        "[[number_digits_2]]" => @number.digits_2,
        "[[number_3_digit]]" => @number.digits_3, #deprecated
        "[[number_digits_3]]" => @number.digits_3,
        "[[number_4_digit]]" => @number.digits_4, #deprecated
        "[[number_digits_4]]" => @number.digits_4,
        "[[number_5_digit]]" => @number.digits_5, #deprecated
        "[[number_digits_5]]" => @number.digits_5,
        "[[number_6_digit]]" => @number.digits_6, #deprecated
        "[[number_digits_6]]" => @number.digits_6,
        "[[number_7_digit]]" => @number.digits_7, #deprecated
        "[[number_digits_7]]" => @number.digits_7,
        "[[number_8_digit]]" => @number.digits_8, #deprecated
        "[[number_digits_8]]" => @number.digits_8,
        "[[number_9_digit]]" => @number.digits_9, #deprecated
        "[[number_digits_9]]" => @number.digits_9,
        "[[lipsum_1]]" => @text.lipsum_paragraphs_1, #deprecated
        "[[lipsum_paragraphs_1]]" => @text.lipsum_paragraphs_1,
        "[[lipsum_2]]" => @text.lipsum_paragraphs_2, #deprecated
        "[[lipsum_paragraphs_2]]" => @text.lipsum_paragraphs_2,
        "[[lipsum_3]]" => @text.lipsum_paragraphs_3, #deprecated
        "[[lipsum_paragraphs_3]]" => @text.lipsum_paragraphs_3,
        "[[lipsum_4]]" => @text.lipsum_paragraphs_4, #deprecated
        "[[lipsum_paragraphs_4]]" => @text.lipsum_paragraphs_4,
        "[[lipsum_5]]" => @text.lipsum_paragraphs_5, #deprecated
        "[[lipsum_paragraphs_5]]" => @text.lipsum_paragraphs_5
      }
      regular_expression = Regexp.union(map_variables_to_data.keys)
      
      @dataset.output << @dataset.format.gsub(regular_expression, map_variables_to_data)
      
      if @number_of_entities > 1
        @dataset.output << "\n\n"
      end
    end
  end
  
  def create
    @dataset = Dataset.new(params[:dataset])
    @dataset.account_id = current_account.id
    
    @object = @dataset
    
    if @dataset.save
      redirect_to datasets_path, :notice => 'Save successful!'
    else
      render :preview
    end
  end
  
  def show
    @dataset = current_account.datasets.find(params[:id])
  end
  
  def destroy
    @dataset = current_account.datasets.find(params[:id])
    @dataset.destroy
    
    respond_to do |format|
      format.html { redirect_to(datasets_url) }
    end
  end
end
