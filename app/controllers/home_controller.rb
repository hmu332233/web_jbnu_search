require 'JBNU_Parser'

class HomeController < ApplicationController

  def main
    @notice_list = %w[전체 학사공지 취업공지 일반공지 교내채용 특강/세미나]
    @post_list =  %w[공모/스터디 아르바이트 판매/구매/광고 자취/하숙/원룸 분실/습득]

    @query = params[:query]
    @tab = params[:tab]

    parser = JBNU_Parser.new

    if @query == nil
      @query = ""
    end

    if @tab == nil
      @tab = "학사공지"
    end

    @all = false

    case @tab # a_variable is the variable we want to compare
    when "전체"    #compare to 1
      @public = parser.getPosts(0,@query)
      @notice = parser.getPosts(1,@query)
      @recrult = parser.getPosts(2,@query)
      @seminar = parser.getPosts(3,@query)
      @study = parser.getPosts(4,@query)
      @alba = parser.getPosts(5,@query)
      @market = parser.getPosts(6,@query)
      @live = parser.getPosts(7,@query)
      @found = parser.getPosts(8,@query)
      #
      # @public = @study
      # @notice = @study
      # @recrult = @study
      # @seminar = @study
      #
      # @alba = @study
      # @market = @study
      # @live = @study
      # @found = @study
      #
      # @board_list = [@public,@notice,@recrult,@seminar,@study,@alba,@market,@live,@found]

      @all = true
    when "학사공지"    #compare to 2
      @boards = parser.getPosts(0,@query)
      print "실행"
    when "취업공지"    #compare to 2
      @boards = []
      @boards << Post.new("","준비중입니다","","","")
      print "실행"
    when "일반공지"    #compare to 2
      @boards = parser.getPosts(1,@query)
      print "실행"
    when "교내채용"    #compare to 2
      @boards = parser.getPosts(2,@query)
      print "실행"
    when "특강/세미나"    #compare to 2
      @boards = parser.getPosts(3,@query)
      print "실행"
    when "공모/스터디"    #compare to 2
      @boards = parser.getPosts(4,@query)
      print "실행"
    when "아르바이트"    #compare to 2
      @boards = parser.getPosts(5,@query)
      print "실행"
    when "판매/구매/광고"    #compare to 2
      @boards = parser.getPosts(6,@query)
      print "실행"
    when "자취/하숙/원룸"    #compare to 2
      @boards = parser.getPosts(7,@query)
      print "실행"
    when "분실/습득"    #compare to 2
      @boards = parser.getPosts(8,@query)
      print "실행"
    else
      @boards = parser.getPosts(0,@query)
      print "실행"
    end




  end

  def index

    parser = JBNU_Parser.new

    query = params[:query]
    if query == nil
      query = ""
    end

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

    parser = JBNU_Parser.new

    query = params[:query]
    if query == nil
      query = ""
    end

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


  end

end
