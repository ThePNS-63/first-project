#include <stdio.h>
#include <stdlib.h>

int path[20];
int n;

int g(int k, int v[], int c[][20]);
void trvpath(int k, int v[], int c[][20], int j);

int main() {
    int mcost;
    path[0] = 0; // Start from vertex 0 (assuming 0-based indexing)

    printf("Enter value of N:\n");
    scanf("%d", &n);

    int c[20][20]; // Max size of 20 as per path array size
    int v[20] = {0}; // Initialize all to 0

    printf("Enter Array Elements:\n");
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            scanf("%d", &c[i][j]);
        }
    }

    printf("Adjacency Matrix:\n");
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            printf("%d\t", c[i][j]);
        }
        printf("\n");
    }

    v[0] = 1; // Start from vertex 0
    mcost = g(0, v, c); // Get the minimum cost

    for (int i = 0; i < n; i++) v[i] = 0; // Reset the visited array
    v[0] = 1;
    
    int j = 1; // Start filling path from index 1
    trvpath(0, v, c, j);

    printf("Minimum cost is : %d\n", mcost);
    printf("Path : ");
    for (int i = 0; i <= n; i++) {
        printf("%d ", path[i] + 1); // Printing path in 1-based index for user
    }
    printf("\n");

    return 0;
}

int g(int k, int v[], int c[][20]) {
    int min = 9999, temp;
    int allVisited = 1;
    
    for (int i = 1; i < n; i++) {
        if (v[i] == 0) {
            allVisited = 0;
            break;
        }
    }

    if (allVisited) {
        return c[k][0]; // Return to the starting point
    }

    for (int i = 1; i < n; i++) {
        if (v[i] == 0) {
            v[i] = 1;
            temp = c[k][i] + g(i, v, c);
            if (temp < min) {
                min = temp;
            }
            v[i] = 0;
        }
    }

    return min;
}

void trvpath(int k, int v[], int c[][20], int j) {
    int temp, min = 9999, t;
    int v1[20];

    if (j < n) {
        for (int i = 1; i < n; i++) {
            if (v[i] == 0) {
                v[i] = 1;
                temp = c[k][i] + g(i, v, c);
                if (temp < min) {
                    min = temp;
                    t = i;
                    for (int x = 0; x < n; x++) {
                        v1[x] = v[x];
                    }
                }
                v[i] = 0;
            }
        }
        path[j] = t;
        trvpath(t, v1, c, j + 1);
    } else {
        path[j] = 0; // Complete the cycle by returning to the starting point
    }
}
