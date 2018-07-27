class ParsingSelector
  include Interactor

  def call
    case Apartment::Tenant.current
    when 'modero'
      XmlToHashModero.call(context)
    when 'recovr'
      XmlToHashRecovr.call(context)
    end
  end
end