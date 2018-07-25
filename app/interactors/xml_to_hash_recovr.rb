class XmlToHashRecovr
  include Interactor

  def call
    data = {}
    context.data.xpath('//recovr').children.each do |collection|
      data[collection.name] = {}
      collection.children.each do |object|
        attributes = {}
        object.children.each do |attribute|
          attributes[attribute.name] = attribute.child.inner_text
        end
        data[collection.name][object.name + '_' + attributes['id']] = attributes
      end
    end
    context.data = XmlHash.create(file_name: context.file_name, tenant_hash: data.to_json)
  end
end