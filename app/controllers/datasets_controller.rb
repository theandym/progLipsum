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
        "[[number_2_digit]]" => 10 + Random.rand(99 - 10),
        "[[number_3_digit]]" => 100 + Random.rand(999 - 100),
        "[[number_4_digit]]" => 1000 + Random.rand(9999 - 1000),
        "[[number_5_digit]]" => 10000 + Random.rand(99999 - 10000),
        "[[number_6_digit]]" => 100000 + Random.rand(999999 - 100000),
        "[[number_7_digit]]" => 1000000 + Random.rand(9999999 - 1000000),
        "[[number_8_digit]]" => 10000000 + Random.rand(99999999 - 10000000),
        "[[number_9_digit]]" => 100000000 + Random.rand(999999999 - 100000000),
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
