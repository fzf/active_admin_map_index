class IndexAsMap < ActiveAdmin::Component

  def build(page_presenter, collection)
    @page_presenter = page_presenter
    @collection = collection.to_a
    add_class "index"
    build_table
  end

  def number_of_columns
    @page_presenter[:columns] || default_number_of_columns
  end

  def self.index_name
    "map"
  end

 protected

  def build_table
    script src: "https://maps.googleapis.com/maps/api/js?key=#{ActiveAdminMapIndex.config.google_key}"
    table class: "index_map" do
      div id: 'active_admin_index_map'
      div class: 'map-data', 'data-collection' => @collection.to_json
    end
  end
end
