#把所有出現的term 做出一個dictionary出來，我在使用上使用hashtable，存成dictionary_hash.txt
#但是因為繳交的格式的限制，另外寫一段code把dictionary_hash.txt轉換成易讀格式dictionary.txt

#new Hash
result = Hash.new
conuter = 1
while conuter <= 1095 do #1095
	#term hash of each documents 	#string to hash use 'eval()'
	a1 = File.open('../output/terms_hash/'+conuter.to_s+'.txt', "rb").read
	a1 = eval(a1)

	a1.keys.each do |key|
		# term exist in hash table, value += 1
		if result.has_key?(key)
			# result << term.stem
			result[key] = result[key] + 1
		else
			# new a hash
			result[key] = 1
		end #end if
	end
	# use merge hash
	# result = result.merge(eval(a1)){|key, oldval, newval| newval + oldval}
	puts "Save term dictionary_hash as a txt file (../output/terms_hash/"+conuter.to_s+'.txt)'
	conuter = conuter + 1
end
f = File.open("../output/dictionary_hash.txt", 'w')
f.write(Hash[result.sort])
f.close()
