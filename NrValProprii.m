function numvp = NrValProprii(d, s, val_lambda)
	P = ValoriPolinoame(d, s, val_lambda);
	numvp = 0;
	
	for k = 1:(length(P) - 1)
		if (P(k) == 0 || sign(P(k+1)) * sign(P(k)) < 0)
			++numvp;
		endif
	endfor
endfunction
			
