module ThinkersHelper
	def life_dates_for(life_date_birth, life_date_death)
		if life_date_birth && life_date_death.nil?
			"b. #{life_date_birth}"
		elsif life_date_birth.nil? && life_date_death.nil?
			nil
		else
			"#{life_date_birth} - #{life_date_death}"
		end
	end
end
