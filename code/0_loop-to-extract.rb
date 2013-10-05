#loop 找出每一份document的terms，存在/output/terms_hash/中
load 'lib/Extractor.rb'

#new object Extractor
extractor = Extractor.new 
conuter = 1
while conuter <= 1095 do #1095
	#open Text collection
	a= open('../IRTM_news_files/'+conuter.to_s+'.txt', "rb").read
	#call function 
	extractor.extract(a, conuter.to_s)

	puts "Save terms_hash as a txt file (../output/terms_hash/"+conuter.to_s+'.txt)'
	conuter = conuter + 1
end