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
    script src: "https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"
    table class: "index_map" do
      div id: 'active_admin_index_map'
      div class: 'map-data', 'data-collection' => collection_with_actions.to_json
    end
  end

  def collection_with_actions
    @collection.collect do |element|
      {attributes: element.attributes, actions: actions(element, css_class: :member_link)}
    end
  end

  def actions(resource, options = {})
    action_array = []
    if controller.action_methods.include?('show') && authorized?(ActiveAdmin::Auth::READ, resource)
      action_array << item(I18n.t('active_admin.view'), resource_path(resource), class: "view_link #{options[:css_class]}", title: I18n.t('active_admin.view'))
    end
    if controller.action_methods.include?('edit') && authorized?(ActiveAdmin::Auth::UPDATE, resource)
      action_array << item(I18n.t('active_admin.edit'), edit_resource_path(resource), class: "edit_link #{options[:css_class]}", title: I18n.t('active_admin.edit'))
    end
    if controller.action_methods.include?('destroy') && authorized?(ActiveAdmin::Auth::DESTROY, resource)
      action_array << item(I18n.t('active_admin.delete'), resource_path(resource), class: "delete_link #{options[:css_class]}", title: I18n.t('active_admin.delete'),
        method: :delete, data: {confirm: I18n.t('active_admin.delete_confirmation')})
    end

    action_array
  end

  def item *args
    link_to *args
  end
end
