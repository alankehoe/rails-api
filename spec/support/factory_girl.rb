# Helpers for FactoryGirl
module FactoryGirl
  # Allows a nested object to be created for controllers or models
  # That require an attributes_for to be present in the request.
  def self.nested_attributes_for(factory_sym)
    attrs = FactoryGirl.attributes_for(factory_sym)
    factory = FactoryGirl.factories[factory_sym]
    factory.associations.names.each do |sym|
      attrs["#{sym}_attributes"] = FactoryGirl.attributes_for sym
    end
    attrs
  end
end