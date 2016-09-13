require 'JBNU_Parser'

class HomeController < ApplicationController

  def main
    #test
  end

  def index

    parser = JBNU_Parser.new

    query = params[:query]
    if query == nil
      query = ""
    end

    @public = parser.getPosts(0,query)
    #  @notice = parser.getPosts(1,query)
     @recrult = parser.getPosts(4,query)
    # @seminar = parser.start(4,query)
    @notice = []
    # @recrult = []

  end

  def search

    @query = params[:query]

  end

end
