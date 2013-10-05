#loop 讀取每一份document的terms，對應到dictionary_hash.txt，算出tf-idf-unit-vector，並且存放到/output/tf-idf_hash中
load 'lib/Unit_vector.rb'
unit_vector = Unit_vector.new 
unit_vector_document = Hash.new
#open dictionary_hash file 	#string to hash use 'eval()'
dictionary_hash = File.open('../output/dictionary_hash.txt', "rb").read
dictionary_hash = eval(dictionary_hash)

conuter = 1
while conuter <= 1095 do #1095
	#open terms hash file 	#string to hash use 'eval()'
	terms_hash = open('../output/terms_hash/'+conuter.to_s+'.txt', "rb").read
	terms_hash = eval(terms_hash)

	# save as hash
	f_hash = File.open("../output/tf-idf_hash/"+conuter.to_s+".txt", 'w')
	result = Hash.new
	#TF-IDF
	terms_hash.keys.each do |term|
		t_index = dictionary_hash.keys.index(term)+1
		tf = terms_hash[term]
		df = dictionary_hash[term]
		idf = Math.log10(1095/df)
		tf_idf = tf*idf
		result[t_index] = tf_idf
	end
	#轉換成unit vector
	unit_vector_document = unit_vector.unit(Hash[result.sort])
	#output file
	f_hash.write(unit_vector_document)
	f_hash.close()

	puts "Save tf-idf as a txt file (../output/tf-idf/"+conuter.to_s+'.txt)'
	conuter = conuter + 1
end

