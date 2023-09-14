require "httparty"
require "json"
url="https://jsonplaceholder.typicode.com/photos"
response=HTTParty.get(url)
if response.code==200
    data=JSON.parse(response.body)

    chunks=data.each_slice(100).to_a

    chunks.each_with_index do |chunk,index|
        filename="data_#{index+1}.json"
        File.open(filename,'w') do |file|
            file.write(JSON.pretty_generate(chunk))
        end
        puts "addedd successfull"
   
    end
else
    puts "failed"
end