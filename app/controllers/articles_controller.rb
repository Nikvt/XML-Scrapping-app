class ArticlesController < ApplicationController

  def home
  end

  def create
    file_name = params[:xml_file][:xml].original_filename
    file_nokogiri = Nokogiri::XML(params[:xml_file][:xml]) { |config| config.noblanks }
    result = XmlToHashModero.call(data: file_nokogiri, file_name: file_name)

    if result.success?
      puts result.data
      render partial: 'partials/hash_modero', locals: { hash: result.data }
    else
      redirect_to root_path
    end
  end
end