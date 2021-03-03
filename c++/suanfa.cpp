//单调栈，时间复杂度O(N)
#include <stdlib.h>
#include <iostream>
#include <vector>
#include <stack>
using namespace std;
const int N = 500000+10;
int a[N];
int dp[N];
stack<int> s;
int main()
{
    int n,res=0;
    cin >> n;
    for(int i = 0; i < n; i ++) cin >> a[i];
    //前缀和便于快速求区间和，例如求[l,r]区间和=dp[r+1]-dp[l]。l和r的取值范围是[0,n)
    for(int i = 1; i <= n; i ++) dp[i] = dp[i-1] + a[i-1]; 
    for(int i = 0; i < n; i ++) {
        while(!s.empty() && a[i] <= a[s.top()]) {
            int peak = a[s.top()];
            s.pop();
            int l = s.empty()? -1 : s.top();
            int r = i; 
            //l和r是边界，因此区间是[l+1,r-1]，其区间和dp[r+1]-dp[l]
            int dist = dp[r] - dp[l+1];
            res = max(res,peak*dist);
        }
        s.push(i);
    }
    while(!s.empty())
    {
        int peak = a[s.top()];
        s.pop();
        int l = s.empty()? -1 : s.top();
        int r = n; 
        
        int dist = dp[r] - dp[l+1];
        res = max(res,peak*dist);
    }
    cout << res << endl; 
    system("pause");
}
