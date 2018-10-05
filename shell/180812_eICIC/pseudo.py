main():
	for i in simulating_times:
		initial():
		for j in TTI:
			eICIC_Algorithm()
		output utility for every user

initial():
	initial (UE,BS,Total_Rate,shadowing) to zero
	BSLocation()		# get datas of BS from a file
	RandomLocation()	# random locations for user
	Associating_BS()	# find closest BS for every user
	ListForSINR()		# count SINR for every user location
	push all the user into priority queue

eICIC_Algorithm():		# decide ABS or non-ABS
	eICIC_Schudule()

eICIC_Schudule():
	for beststation in NumOfBS
		pop the user with less utility in the priority queue
		utility_function()	# calculate the new utility
		puch the user with updated utility
