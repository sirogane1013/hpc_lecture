#include <cstdio>

__global__ void kernel(float *a) {
  a[threadIdx.x] = threadIdx.x;
}

int main(void) {
  int N = 4;
  float *a;
  cudaMallocManaged(&a, N*sizeof(float));
  kernel<<<1,N>>>(a);
  cudaDeviceSynchronize();
  for (int i=0; i<N; i++)
    printf("%d %g\n",i,a[i]);
  cudaFree(a);
}