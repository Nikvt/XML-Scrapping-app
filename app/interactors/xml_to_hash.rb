class XmlToHash
  include Interactor

  def call
    data = {}
    context.data.xpath('//recovr').children.each do |collection|
      data[collection.name.to_sym] = {}
      collection.children.each do |object|
        attributes = {}
        object.children.each do |attribute|
          attributes[attribute.name.to_sym] = attribute.child.inner_text
        end
        data[collection.name.to_sym][(object.name + '_' + attributes[:id]).to_sym] = attributes
      end
    end
    context.data = data
  end
end
