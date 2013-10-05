# output Assignment format
#open dictionary_hash file #string to hash use 'eval()'
dictionary_hash = File.open('../output/dictionary_hash.txt', "rb").read
dictionary_hash = eval(dictionary_hash)

#new file
f = File.open("../output/dictionary.txt", 'w')
f.write("t_index\t term\t df \n")

counter = 1
dictionary_hash.keys.each do |key|
	value = dictionary_hash[key]
	f.write((counter).to_s + "\t" +key.to_s+"\t"+value.to_s+"\n")
	counter = counter+1
end

f.close()
puts "Save dictionary as a txt file (../output/dictionary.txt)"

# the vector file of document 1
hash = File.open("../output/tf-idf_hash/1.txt", 'rb').read
hash = eval(hash)

f = File.open("../output/vector1.txt", 'w')
f.write(hash.count.to_s+"\n")
f.write("t_index\t tf-idf \n")
hash.keys.each do |key|
	f.write(key.to_s+"\t"+hash[key].to_s+"\n")
end
f.close()
puts "Save the vector file of document 1 as a txt file (../output/vector1.txt)"