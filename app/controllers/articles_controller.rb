class ArticlesController < ApplicationController

  def home
  end

  def create
    result = XmlToHash.call(data: Nokogiri::XML(params[:xml_file][:xml]))

    if result.success?
      puts result.data
      render partial: 'partials/hash', locals: { hash: result.data }
    else
      redirect_to root_path
    end
  end
end