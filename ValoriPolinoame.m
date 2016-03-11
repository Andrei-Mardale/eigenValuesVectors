function P = ValoriPolinoame(d, s, val_lambda)
	P = [1 (d(1) - val_lambda)]; #init
	
	for k = 2:length(d)
		P(k+1) = (d(k) - val_lambda) * P(k) - power(s(k-1), 2) * P(k-1);
	endfor
endfunction	
