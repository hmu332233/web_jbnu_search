class JBNU_Parser

  def start
    uri = URI(URI.encode("http://www.chonbuk.ac.kr/bb/board.php?movePage=1&boardID=K_PUBLIC"))

    req = Net::HTTP::Get.new(uri)

    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') { |http| http.request(req) }
    doc = Nokogiri::HTML(res.body)

    arr = doc.css(".listBoard//tbody//tr")

    return arr

  end



end
