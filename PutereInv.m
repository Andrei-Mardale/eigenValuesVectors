function [valp vecp] = PutereInv(d, s, h, y, maxIter, eps)
	n = length(d);
	test = test2 = eps + 1;
	p = 0;
	y0 = y' / norm(y);
	h0 = h;
	
	while (test > eps && p < maxIter)
		b = d - h; #diagonal
		a = [0 s]; #below diagonal
		c = [s 0]; #above diagonal
		#added 0 for easier indexing

		#thomas
		c(1) /= b(1); 
		y(1) /= b(1);
		
		for k = 2:n-1
			aux = b(k) - a(k) * c(k-1);
			c(k) /= aux;
			y(k) = (y(k) - a(k) * y(k-1)) / aux;
		endfor
		y(n) = (y(n) - a(n) * y(n-1)) / (b(n) - a(n) * c(n-1));
		
		#back substitution
		z(n) = y(n);
		for k = n-1:-1:1
			z(k) = y(k) - c(k) * z(k+1);
		endfor
				
		#norm		
		y = z / norm(z);
		
		#y' * A * y implementation
		#ytemp = y' * a (=> lambda = ytemp * y)		
		#limit cases (first and last)
		ytemp(1) = y(1) * d(1) + y(2) * s(1);
		ytemp(n) = y(n-1) * s(n-1) + y(n) * d(n);
		
		h = y(1) * ytemp(1) + y(n) * ytemp(n); 
		for k = 2:n-1
			ytemp(k) = y(k-1) * s(k-1) + y(k) * d(k) + y(k+1) * s(k);
			h += y(k) * ytemp(k);
		endfor
		
		test = abs(h0 - h);

		h0 = h;
		++p;
	endwhile
	
	valp = h;
	vecp = y;
endfunction 
