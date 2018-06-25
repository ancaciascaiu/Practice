require 'httparty'
require 'nokogiri'

class OpinionsController < ApplicationController

  def show
	response = HTTParty.get("http://www.debate.org/opinions/#{params[:name]}")
	page = Nokogiri::HTML(response.parsed_response)

	p "Title: #{page.css("span[class='q-title']").children.first.text}"
	p page.css("span[class='yes-text']").children.first.text
	p page.css("span[class='no-text']").children.first.text
	yes_posts(page)
	p "-------"
	no_posts(page)
  end

  private

  def yes_posts(page)
  	p 'Yes posts:'
	page
		.css("div#yes-arguments")
		.css("li[class='hasData']")
		.each do |li|
			p li.children[0..3].text
			p 'Author: ' + li.css("cite a").text
		end
  end

  def no_posts(page)
  	p 'No posts:'
	page
		.css("div#no-arguments")
		.css("li[class='hasData']")
		.each do |li|
			p li.children[0..3].text
			p 'Author: ' + li.css("cite a").text
		end
  end
end
