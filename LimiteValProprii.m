function [limita_inf, limita_sup] = LimiteValProprii(d, s)
	n = length(d);
	s = abs(s);
	limita_inf = d(1) - s(1);
	limita_sup = d(1) + s(1);
	
	for k = 2:n-1
		#temp1 min
		#temp2 max
		temp = [(d(k) - s(k-1) - s(k)) (d(k) + s(k-1) + s(k))];
		
		if (temp(1) < limita_inf)
			limita_inf = temp(1);
		endif
		
		if (temp(2) > limita_sup)
			limita_sup = temp(2);
		endif
	endfor
	
	temp = [(d(n) - s(n-1)) (d(n) + s(n-1))]; #limit case
	
	if (temp(1) < limita_inf)
		limita_inf = temp(1);
	endif
	
	if (temp(2) > limita_sup)
		limita_sup = temp(2);
	endif
endfunction
