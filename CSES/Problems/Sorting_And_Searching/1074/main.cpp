#include <bits/stdc++.h>
typedef long long ll;
using namespace std;

void solve(){
	ll n;
	cin>>n;
	ll p[n];
	for (int i=0; i<n; ++i){
		cin>>p[i];
	}

	sort(p, p+n);
	ll ans=0;
	for (int i=0; i<n; i++){
		ans += abs(p[i]-p[n/2]);
	}
	cout << ans;
}

int main(){
	solve();
	return 0;
}
