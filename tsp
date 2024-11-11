#include<stdio.h>
#include<stdlib.h>
int path[20];
int n;
int g(int k, int v[n],int c[n][n]);
void trvpath(int k, int v[n],int c[n][n],int j);
void main()
{
int mcost;
path[0]=1;
printf("Enter value of N:\n");
scanf("%d",&n);
int c[n][n];
int v[n];
int j = 1;
for(int i = 1; i<=n; i++)
v[i] = 0;
path[n] = 1;
printf("Enter Array Elements:\n");
for(int i=1;i<=n;i++)
{
for(int j= 1;j<=n;j++)
{
scanf("%d",&c[i][j]);
}
}
printf("Adjacency Matrix:\n");
for(int i=1;i<=n;i++){
for(int j=1;j<=n;j++){
printf("%d\t",c[i][j]);
}
printf("\n");
}
v[1]=1;
mcost=g(1,v,c);
for(int i=1;i<=n;i++)
v[i]=0;
v[1]=1;
trvpath(1,v,c,j);
printf("Minimum cost is : %d\n",mcost);
printf("Path :");
for(int i=0;i<=n;i++)
printf("%d-",path[i]);
}
int g(int k, int v[n], int c[n][n])
{
int min,temp,flag=0;
min = 999;
for(int i=2;i<=n;i++){
if(v[i]==0)
flag=1;
}
if(flag==0){
return c[k][1];
}
for(int i=2;i<=n;i++){
if(v[i]==0){
v[i]=1;
temp = c[k][i]+g(i,v,c);
if(temp<min){
min = temp;
}
v[i]=0;
}
}
return min;
}
void trvpath(int k,int v[n],int c[n][n],int j)
{
int temp,min=999,t,v1[n];
if(j<n){
for(int i=2;i<=n;i++){
if(v[i]==0){
v[i]=1;
temp=c[k][i]+g(i,v,c);
if(temp<min){
min = temp;
t=i;
for(int i=1;i<=n;i++)
 v1[i]=v[i];
}
v[i]=0;
}
}
path[j]=t;
trvpath(t,v1,c,j+1);
}
}
