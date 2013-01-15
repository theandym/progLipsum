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
    
    @lipsum_paragraph_1 = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam id elit nisl. Sed elementum condimentum viverra. Sed at quam vitae dolor imperdiet facilisis. Maecenas lacinia, lacus ac iaculis mattis, nibh nulla iaculis ligula, a tincidunt lorem risus et erat. Donec magna nisi, mollis sit amet ullamcorper quis, pulvinar at odio. Duis ac turpis arcu, at pellentesque enim. Nulla ante quam, varius eget fringilla sit amet, rutrum eget ligula. Donec sed dui nec ligula aliquam pharetra. Suspendisse imperdiet pellentesque ipsum, et facilisis massa varius nec.'
    @lipsum_paragraph_2 = 'Cras ac dolor sit amet erat varius ullamcorper sed accumsan nisi. Sed luctus ultricies neque quis adipiscing. Vestibulum vitae auctor tortor. Suspendisse vel scelerisque urna. Nunc bibendum pulvinar eros, nec dapibus dui pulvinar eu. Curabitur erat tortor, volutpat vitae bibendum egestas, tristique eget urna. Suspendisse aliquet fermentum metus quis facilisis. Nulla facilisi. Sed commodo auctor porttitor. Etiam tempus felis vel magna consequat vel molestie tortor lobortis. Aliquam auctor tellus vel nibh feugiat in sagittis augue malesuada. Sed a ante id libero semper aliquet molestie id risus. Integer ac condimentum nibh. Vestibulum sed orci malesuada tortor mollis volutpat. Curabitur euismod euismod erat sed bibendum.'
    @lipsum_paragraph_3 = 'Nam eleifend, mauris in rhoncus pulvinar, dolor ante commodo neque, a dictum massa urna congue justo. Nullam condimentum enim a felis accumsan molestie. Aenean eu est ut leo volutpat hendrerit vitae a elit. Nam in magna est. Nulla ac consequat nisi. Praesent vel lorem est. Nullam at velit vel libero cursus tincidunt. Etiam at massa et sapien pharetra volutpat.'
    @lipsum_paragraph_4 = 'Pellentesque sollicitudin pretium tortor, sit amet ultricies libero cursus in. Praesent sit amet justo arcu. Nulla faucibus aliquet ipsum sit amet porttitor. Morbi libero turpis, convallis vel viverra vel, tincidunt vitae nisl. Vestibulum ut venenatis turpis. Curabitur laoreet, nunc convallis congue laoreet, purus turpis ornare neque, at consequat tortor mauris vitae arcu. In hac habitasse platea dictumst. Morbi dapibus nibh ut purus venenatis sodales.'
    @lipsum_paragraph_5 = 'Fusce neque orci, lobortis in elementum et, congue a massa. Nunc mi turpis, convallis sit amet fringilla in, hendrerit sed risus. Fusce nibh est, aliquam sed egestas at, feugiat at massa. Donec gravida mollis felis at tincidunt. Nunc semper lacus orci, et pellentesque ipsum. Etiam convallis sodales placerat. Donec vitae lacinia sapien. Cras non ipsum dui, sit amet varius mi. Maecenas blandit risus ut lacus auctor faucibus. Phasellus nec nunc eu odio tristique fermentum. Nunc luctus, lorem eu vulputate aliquet, diam ante dignissim turpis, vitae congue nibh turpis vel eros. Vestibulum lobortis metus ut leo tincidunt at commodo elit gravida.'
    
    @lipsum_1 = @lipsum_paragraph_1
    @lipsum_2 = @lipsum_1 + "\n\n" + @lipsum_paragraph_2
    @lipsum_3 = @lipsum_2 + "\n\n" + @lipsum_paragraph_3
    @lipsum_4 = @lipsum_3 + "\n\n" + @lipsum_paragraph_4
    @lipsum_5 = @lipsum_4 + "\n\n" + @lipsum_paragraph_5
    
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
        "[[lipsum_1]]" => @lipsum_1,
        "[[lipsum_2]]" => @lipsum_2,
        "[[lipsum_3]]" => @lipsum_3,
        "[[lipsum_4]]" => @lipsum_4,
        "[[lipsum_5]]" => @lipsum_5
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
