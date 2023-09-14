require "httparty"
require "json"
url="https://jsonplaceholder.typicode.com/posts"
response=HTTParty.get(url)
if response.code==200
    data=JSON.parse(response.body)

    File.open("posts.json",'w') do |file|
        file.write(JSON.pretty_generate(data))
    end
    puts "addedd successfull"
else
    puts "failed"

end