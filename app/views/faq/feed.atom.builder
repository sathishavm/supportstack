xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "SupportStack FAQ"
  
  
    for post in @news_items
      xml.item do
        xml.title post.question
         xml.link  "http://localhost:3000/faq/comments/#{post.id}"
        xml.update_time post.updated_at
      end
    end
  end
	end