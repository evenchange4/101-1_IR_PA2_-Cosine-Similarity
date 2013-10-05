#read argument
if ARGV.count != 2 
	puts "please run like example \"ruby 3_cosine_similaity.rb 3 5\""
else
	document1 = ARGV[0] 
	document2 = ARGV[1] 
end

#input argument file
d1 = File.open('../output/tf-idf_hash/'+document1+'.txt', "rb").read
d1 = eval(d1)
d2 = File.open('../output/tf-idf_hash/'+document2+'.txt', "rb").read
d2 = eval(d2)

result = 0
d1.keys.each do |key|
	if d2[key] != nil
		result = result + (d1[key]*d2[key])
	end 
end
puts "cosine similarity of document "+document1+" and "+document2
puts result