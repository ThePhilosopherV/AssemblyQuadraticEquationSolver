extern nosol :proc

extern sol1 :real8
extern sol2 :real8
.data
four real8 4.0 
zero real8 0.0
minus1 real8 -1.0

.code

quardiac_eq_solver proc


;a is in xmm0 | b is in xmm1 | c is in xmm2

movsd xmm4,xmm0 ;preserving a for later use
movsd xmm5,xmm1;preserving  b for later use
movsd xmm6,xmm1 ; preserving b for later use ,again :)  this is an educational code and it's bit messy

;lets calculate  b^2-4*a*c and decide if the equation accepts reall solutions or not
mulsd xmm1,xmm1 ;mulitplication 

mulsd xmm0,xmm2

mulsd xmm0,four

subsd xmm1,xmm0;substruction
comisd xmm1,zero;comparison


jb finish_nosol;no reall solutions as b^2-4*a*c < 0


;compute first sol
sqrtpd xmm1,xmm1

addsd xmm4,xmm4

mulsd xmm5,minus1

addsd xmm5,xmm1 

divsd xmm5,xmm4;first sol is in xmm5


;compute second sol
mulsd xmm1,minus1
mulsd xmm6,minus1

addsd xmm1,xmm6
divsd xmm1,xmm4;second sol is in xmm1

movsd sol1,xmm1; sol1 and sol2 are declared in our c program ,remember ?

movsd sol2,xmm5

ret


finish_nosol:
call nosol

quardiac_eq_solver endp

end
