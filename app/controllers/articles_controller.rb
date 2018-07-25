class ArticlesController < ApplicationController

  def home
  end

  def create
    file_name = params[:xml_file][:xml].original_filename
    file_nokogiri = Nokogiri::XML(params[:xml_file][:xml]) { |config| config.noblanks }
    result = ParsingSelector.call(data: file_nokogiri, file_name: file_name)

    if result.success?
      render partial: "partials/hash_#{Apartment::Tenant.current}", locals: { hash: result.data }
    else
      redirect_to root_path
    end
  end
end