class ParsingSelector
  include Interactor

  def call
    XmlToHashModero.call(context) if Apartment::Tenant.current == 'modero'
    XmlToHashRecovr.call(context) if Apartment::Tenant.current == 'recovr'
  end
end