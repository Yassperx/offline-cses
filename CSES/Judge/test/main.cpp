#include <bits/stdc++.h>
using namespace std;
typedef long long ll;
#define mod 1e9+7

ll fibonacci(ll n){
  if (n == 0) return 0;
  else if (n==1) return 1;
  return (fibonacci(n-1)) + (fibonacci(n-2)) % (ll)(mod);
}

int main(){
  ll n;
  cin>>n;
  cout << fibonacci(n) << endl;
  return 0;
}
