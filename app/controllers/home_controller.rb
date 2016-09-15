require 'JBNU_Parser'

class HomeController < ApplicationController

  def main
    #test
    #test2

    parser = JBNU_Parser.new

    query = params[:query]
    if query == nil
      query = ""
    end

    @study = parser.getPosts(4,query)

    if query == nil

    else
      #  redirect_to :anchor => 'service'
    end
  end

  def index

    parser = JBNU_Parser.new

    query = params[:query]
    if query == nil
      query = ""
    end
 ["K_PUBLIC","K_NOTICE","K_RECRUIT","K_SEMINAR","K_STUDY","K_ALBA","K_MARKET","K_LIVE","K_FOUND"]
    # @public = parser.getPosts(0,query)
    # @notice = parser.getPosts(1,query)
    # @recrult = parser.getPosts(2,query)
    # @seminar = parser.getPosts(3,query)
    @study = parser.getPosts(4,query)
    # @alba = parser.getPosts(5,query)
    # @market = parser.getPosts(6,query)
    # @live = parser.getPosts(7,query)
    # @found = parser.getPosts(8,query)
    #
    @public = @study
    @notice = @study
    @recrult = @study
    @seminar = @study

    @alba = @study
    @market = @study
    @live = @study
    @found = @study

    # @recrult = []


  end

  def search

    @query = params[:query]

  end

end
