require 'JBNU_Parser'

class HomeController < ApplicationController
  def index

    parser = JBNU_Parser.new

    query = params[:query]
    if query == nil
      query = ""
    end

    @public = parser.start(0,query)
    @notice = parser.start(1,query)
    @recrult = parser.start(2,query)
    @seminar = parser.start(3,query)
  end

  def search

    @query = params[:query]

  end

end
