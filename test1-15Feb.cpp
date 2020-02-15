#include <iostream>
#include <math.h>
#include <iomanip>
#include <fstream>

using namespace std;
int main(){
	int n; //for domain discretization 
	cout<<"enter n"<<endl;
	cin>>n;
	cout<<"enter time step and stop time"<<endl;
	float dt,t;
	cin>>dt>>t;
	float T[n][n];
	for (int i=0;i<n;i++){
		for (int j=0;j<n;j++){
			if ((pow(i,2)+pow(j,2)+(0.5*pow((n-1),2))-(n-1)*(i+j) ) < (0.2*(n-1)*(n-1))) T[i][j]=40.0;
			else T[i][j]=20.0;
		}
	}
	double TD=0.00001; //thermal diffusivity in m2/sec
	long double ap=(n-1)*(n-1)*dt*TD;
	
	for (int k=0;k<t/dt;k++){
		//boundary conditions20
		double T1[n][n];
		for (int i=0;i<n;i++){
			T1[i][0]=20;
			T1[i][n-1]=20;
			T1[0][i]=20;
			T1[n-1][i]=20;
		}
		
		//update temp for next time step
		for (int i=1;i<n-1;i++){
		for (int j=1;j<n-1;j++){
				T1[i][j]= T[i][j]+ ap*(T[i][j+1]+T[i][j-1]+T[i+1][j]+T[i-1][j]-(4*T[i][j]));	
			}
  		}   
 		for (int i=0;i<n;i++){
		for (int j=0;j<n;j++){
				T[i][j]= T1[i][j];	
			}
  		}   
  		 		
		
	}
	ofstream myfile;
	myfile.open ("out.txt");	  
		  for (int i=0;i<n;i++){
			for (int j=0;j<n;j++){
				  myfile << T[i][j] << ",";
			  }
			  myfile << endl;
		  }
	myfile.close();	 

  		
	
	return 0;
}

