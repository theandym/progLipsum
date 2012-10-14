# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.items do |primary|
    primary.item :datasets, 'Datasets', datasets_path, :highlights_on => /datasets/ do |dataset|
      dataset.item :new_dataset, 'New Dataset', new_dataset_path, :highlights_on => //
      dataset.item :preview_dataset, 'Preview Dataset', preview_dataset_path, :highlights_on => /datasets\/preview/
    end
  end

end