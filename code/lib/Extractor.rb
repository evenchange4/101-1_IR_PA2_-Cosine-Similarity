#IR PA1 MichaelHsu
#2012.09.18

#class : Extractor
#method: extract input string, output a text file

#https://github.com/raypereda/stemmify
require 'stemmify'

class Extractor
	def extract(collectionDocument, outputFileName)
		#use download stop_words @ http://ir.dcs.gla.ac.uk/resources/linguistic_utils/stop_words
		stopwords = open('lib/stop_words.txt', "rb").read
		#Hash with init value 0
		hashtable = Hash.new {0}
		#Lowercasing everything.
		b = collectionDocument.downcase
		#Tokenization. char in a array []
		c = b.tr(',', '') .split(/[?!."'\/%);*&@-_`(\\\s]/)
		#Stemming using Porter’s algorithm
		c.each do |term|
			#Stopword removal.
			if !stopwords.include?term
				# term exist in hash table, value += 1
				if hashtable.has_key?(term.stem)
					# result << term.stem
					hashtable[term.stem] = hashtable[term.stem] + 1
				else
					# new a hash
					hashtable[term.stem] = 1
				end #end hashtable loop
			end
		end
		#Save the result as a txt file.
		f = File.open("../output/terms_hash/"+outputFileName+".txt", 'w')
		#sort hash
		hashtable2 = Hash[hashtable.sort]
		f.write(hashtable2)
		f.close()
	end
end