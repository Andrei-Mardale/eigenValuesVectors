function r = IntervaleValProprii (d, s, m)
	[r(1) aux] = LimiteValProprii(d, s);
	
	#check if input is valid
	test = NrValProprii(d, s, aux);
	if (m > test)
		m = test;
	endif
	
	for k = m:-1:1
		mij = (r(1) + aux) / 2;
		h = (aux - r(1)) / 2;
		
		numvp = NrValProprii(d, s, mij);
		
		#increase/decrease interval until it contains 
		#the required number of proper values
		while (numvp != k)
			h /= 2;
			if (numvp < k)
				mij += h;
			elseif (numvp > k)
				mij -= h;
			endif
		numvp = NrValProprii(d, s, mij);
		endwhile
		
		r(k+1) = aux = mij;
	endfor
endfunction
