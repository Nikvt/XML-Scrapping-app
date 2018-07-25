class XmlToHashModero
  include Interactor

  def call
    context.data.xpath('//comment()').remove
    data = {}
    data[:sid] = context.data.xpath('//sid').inner_text
    data[:datetime] = context.data.xpath('//datetime').inner_text
    data[:payments] = {}
    context.data.xpath('//payments').children.each do |payment|
      attributes = {}
      payment.children.each do |attribute|
        attributes[attribute.name.to_sym] = attribute.child.inner_text
      end
      data[:payments][(payment.name + '_' + attributes[:invoicenmbr]).to_sym] = attributes
    end
    context.data = XmlHash.create(file_name: context.file_name, tenant_hash: data)
  end
end