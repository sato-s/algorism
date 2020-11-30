// You are given a square grid with some cells open (.) and some blocked (X). Your playing piece can move along any row or column until it reaches the edge of the grid or a blocked cell. Given a grid, a start and an end position, determine the number of moves it will take to get to the end position.

#include <cstdio>
#include <cassert>

const int N = 101;

char a[N][N]; // input
int qx[N*N], qy[N*N];
int d[N][N]; // result(visitable?)

int main() {
  int n;
  scanf(" %d", &n);
  for (int i = 0; i < n; i++) {
    scanf(" %s", a[i]);
    for (int j = 0; j < n; j++) {
      assert(a[i][j] == 'X' || a[i][j] == '.');
    }
  }
  int sa, sb;
  int ta, tb;
  scanf(" %d %d", &sa, &sb);
  scanf(" %d %d", &ta, &tb);
  assert(a[sa][sb] == '.');
  assert(a[ta][tb] == '.');
  int e = 0;
  qx[e] = sa; // start
  qy[e] = sb; // start
  d[sa][sb] = 1; // cost to start?
  e++;
  for (int it = 0; it < e; it++) {
    int x = qx[it];
    int y = qy[it];
    for (int i = y + 1; i < n; i++) {
      if (a[x][i] == 'X')
        break;
      if (!d[x][i]) {
        qx[e] = x;
        qy[e] = i;
        e++;
        d[x][i] = d[x][y] + 1;
      }
    }
    for (int i = y - 1; i >= 0; i--) {
     if (a[x][i] == 'X')
        break;
      if (!d[x][i]) {
        qx[e] = x;
        qy[e] = i;
        e++;
        d[x][i] = d[x][y] + 1;
      } 
    }
    for (int i = x + 1; i < n; i++) {
      if (a[i][y] == 'X')
        break;
      if (!d[i][y]) {
        qx[e] = i;
        qy[e] = y;
        e++;
        d[i][y] = d[x][y] + 1;
      } 
    }
    for (int i = x - 1; i >= 0; i--) {
      if (a[i][y] == 'X')
        break;
      if (!d[i][y]) {
        qx[e] = i;
        qy[e] = y;
        e++;
        d[i][y] = d[x][y] + 1;
      }
    }
  }
  assert(d[ta][tb] > 0);
  printf ("%d\n", d[ta][tb] - 1);
  return 0;
}
