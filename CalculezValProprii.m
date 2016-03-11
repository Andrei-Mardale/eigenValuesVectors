function vp = CalculezValProprii (d, s, m, eps)	
	r = IntervaleValProprii(d, s, m);
	n = length(r);
	N = length(d) + 1;
	vp = zeros(1, n-1);
	
	for k = 1:n-1
		a = r(k);
		b = r(k+1);
		
		x0 = a;
		v_x = 1;
		while (abs(v_x) > eps)
			x = (a + b) / 2;
			
			v_a = ValoriPolinoame(d, s, a) (N); #f(a)
			v_x = ValoriPolinoame(d, s, x) (N); #f(x)
			
			#if sign is unchanged then a = x else b = x
			if (v_a * v_x > 0)
				a = x;
			else
				b = x;
			endif
		endwhile
		
		vp(k) = x;	
	endfor
endfunction
			
