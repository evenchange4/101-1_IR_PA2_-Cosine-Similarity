#IR PA2 MichaelHsu
#2012.10.23

#class : Extractor
#method: extract input hash, output a hash txt file
class Unit_vector
	def unit(to_de_unit_hash)
		
		sum_of_value = 0
		to_de_unit_hash.each_value do |value|
			sum_of_value = sum_of_value + value*value
		end

		to_de_unit_hash.each_key do |key|
			to_de_unit_hash[key] = to_de_unit_hash[key] / Math.sqrt(sum_of_value)
		end

		return to_de_unit_hash
	end
end