class ParsingsController < ApplicationController

  def index
    @xml_hashes = XmlHash.all
  end

  def create
    file_name = params[:xml_file][:xml].original_filename
    file_nokogiri = Nokogiri::XML(params[:xml_file][:xml]) { |config| config.noblanks }
    result = ParsingSelector.call(data: file_nokogiri, file_name: file_name)

    if result.success?
      puts result.data
      redirect_to parsing_path(result.data)
    else
      redirect_to root_path
    end
  end

  def show
    @hash = XmlHash.find(params[:id]).tenant_hash
  end
end