require 'JBNU_Parser'

class HomeController < ApplicationController
  def index

    parser = JBNU_Parser.new


    @test = parser.start

  end
end
