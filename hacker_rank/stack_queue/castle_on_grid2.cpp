// 1  procedure BFS(G, start_v) is
// 2      let Q be a queue
// 3      label start_v as discovered
// 4      Q.enqueue(start_v)
// 5      while Q is not empty do
// 6          v := Q.dequeue()
// 7          if v is the goal then
// 8              return v
// 9          for all edges from v to w in G.adjacentEdges(v) do
// 10             if w is not labeled as discovered then
// 11                 label w as discovered
// 12                 w.parent := v
// 13                 Q.enqueue(w)

#include <vector>
#include <list>
#include <map>
#include <set>
#include <queue>
#include <deque>
#include <stack>
#include <bitset>
#include <algorithm>
#include <functional>
#include <numeric>
#include <limits>
#include <tuple>
#include <utility>
#include <sstream>
#include <iostream>
#include <iomanip>
#include <cstdio>
#include <cmath>
#include <cstdlib>
#include <ctime>
#include <cassert>

using namespace std;

// This is edge list (2-dimentional)
vector<int> g[100002];

int main()
{
    int n;
    cin>>n;
    assert(n >=1 && n <= 100);
    vector<string> v(n);
    for(int i =  0; i < n ;i++)
    {
        cin>>v[i];
    }
    int x1, y1, x2, y2;
    cin>>x1>>y1>>x2>>y2;
    assert(x1 >= 0 && x1 < n && y1 >= 0 && y1 < n && x2 >= 0 && x2 < n && y2 >= 0 && y2 < n);
    // construct edge
    for(int i = 0 ; i < n ; i++)
    {
        for(int j = 0 ; j < n; j++)
        {
            if(v[i][j] == '.')
            {
                assert(v[i][j] == '.' || v[i][j] == 'X');
                int cur = i*n + j;
                for(int k = i-1; k >= 0; k--)
                {
                    if(v[k][j] == '.')
                    {
                        int now = k*n + j;
                        g[cur].push_back(now);
                    }
                    else
                        break;
                }
                for(int k = i+1; k < n; k++)
                {
                    if(v[k][j] == '.')
                    {
                        int now = k*n + j;
                        g[cur].push_back(now);
                    }
                    else
                        break;
                }
                for(int k = j-1; k >= 0; k--)
                {
                    if(v[i][k] == '.')
                    {
                        int now = i*n + k;
                        g[cur].push_back(now);
                    }
                    else
                        break;
                }
                for(int k = j+1; k < n; k++)
                {
                    if(v[i][k] == '.')
                    {
                        int now = i*n + k;
                        g[cur].push_back(now);
                    }
                    else
                        break;
                }
            }
        }
    }
    int start_pos = x1*n + y1;
    int done[10001] = {0}, dis[10001] = {0};
    queue<int> q;
    q.push(start_pos);
    done[start_pos] = 1;
    while(!q.empty())
    {
        int now = q.front();
        q.pop();
        for(int i = 0 ; i < g[now].size(); i++)
        {
            int nxt = g[now][i];
            if(!done[nxt])
            {
                done[nxt] = 1;
                dis[nxt] = dis[now]+1;
                q.push(nxt);
            }
        }
    }
    cout<<dis[x2*n + y2]<<endl;
    return 0;
}
