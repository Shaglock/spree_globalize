Spree::Admin::ResourceController.class_eval do
  def parent
    # if parent_data.present?
    #   @parent ||= parent_data[:model_class].find_by("#{parent_data[:find_by]}": params["#{resource.model_name}_id"])
    #   instance_variable_set("@#{resource.model_name}", @parent)
    # end
    if parent_data.present?
      @parent ||= parent_data[:model_class].
        # Don't use `find_by_attribute_name` to workaround globalize/globalize#423 bug
        send(:find_by, parent_data[:find_by].to_s => params["#{resource.model_name}_id"])
      instance_variable_set("@#{resource.model_name}", @parent)
    else
      nil
    end
  end
end
