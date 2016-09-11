require 'Post'
class JBNU_Parser

  # String[] boardId = {"K_PUBLIC","K_NOTICE","K_RECRUIT","K_SEMINAR","K_STUDY","K_ALBA","K_MARKET","K_LIVE","K_FOUND"};


  def boardId(id)
    boardId_t = ["K_PUBLIC","K_NOTICE","K_RECRUIT","K_SEMINAR"]
    return boardId_t[id]
  end

  def start(id,word)
    uri = URI(URI.encode("http://www.jbnu.ac.kr/bb/board.php?boardID="+boardId(id)+"&cTitle=Y&query="+word))

    req = Net::HTTP::Get.new(uri)

    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') { |http| http.request(req) }
    doc = Nokogiri::HTML(res.body)

    posts = []

    doc.css(".programInfo//strong").each do |size_string|
      unless size_string.inner_text == "0"


        doc.css(".listBoard//tbody//tr").each do |post_data|

          number = post_data.css("td")[0].inner_text
          title = post_data.css("th")[0].inner_text
          writer = post_data.css("td")[2].inner_text
          period = post_data.css("td")[3].inner_text

          content_link = post_data.css("th//a")[0].attr('href')

          post = Post.new(number,title,content_link,period,writer)

          posts << post
        end

      else
        posts << Post.new("검색자료가없습니다","","","","")


      end
    end


    return posts

  end

end
