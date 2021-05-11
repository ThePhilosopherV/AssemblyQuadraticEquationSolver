#include <stdio.h> // => printf()
#include <stdlib.h> //=> exit()


extern  double quardiac_eq_solver(double a, double b, double c);//declaration of our assemply procedure solver
void nosol();

double sol1 ;  //sol1 and sol2 is where our asm procedure will write potential solutions
double sol2 ;
int main() {
	double a, b, c;
	
	/*A quadratic equation is an equation of the second degree,
		meaning it contains at least one term that is squared.
		The standard form is ax² + bx + c = 0 with a, b, and c 
		being constants, or numerical coefficients, and x is an unknown variable.*/


	printf("Enter a,b and c your quadratic equation's numerical coefficients [ ax^2 + bx + c = 0 ]\n");
	printf("Enter a: ");

	scanf_s("%lf", &a);

	printf("Enter b: ");

	scanf_s("%lf", &b);

	printf("Enter c: ");

	scanf_s("%lf", &c);

	quardiac_eq_solver(a, b, c);

	if (sol1 == sol2) {
		printf("Equation accepts one solution :\nX = %.2f", sol1);
	}
	else
	{
		printf("Equation accepts two solutions :\nX1 = %.2f ; X2 = %.2F",sol1,sol2);
	}

	return 0;

}

void nosol() {
	printf("Equation accepts no real solutions.");
	exit(0);

}



