#include <iostream>

using namespace std;

#define MAX 999
int M[10][10];
int completd[10] = {0};
int cost = 0, n;

void TCP(int city);
int least(int city);

int main() {
    cout << "Enter the number of cities: ";
    cin >> n;

    cout << "Enter the cost matrix:\n";
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            cin >> M[i][j];
        }
    }

    TCP(0);
    cout << "\nMin Cost: " << cost << endl;
    return 0;
}

void TCP(int city) {
    int i, ncity;
    completd[city] = 1;
    cout << city + 1 << " --> ";

    ncity = least(city);

    if (ncity == MAX) {
        ncity = 0;
        cout << ncity + 1;
        cost += M[city][ncity];
        return;
    }
    TCP(ncity);
}

int least(int city) {
    int i, ncity = MAX, min = MAX, kmin;

    for (int i = 0; i < n; i++) {
        if (M[city][i] != 0 && completd[i] == 0) {
            if (M[city][i] + M[i][city] < min) {
                min = M[city][i] + M[i][city];
                kmin = M[city][i];
                ncity = i;
            }
        }
    }
    if (min != 999) {
        cost += kmin;
    }
    return ncity;
}
