// Question 2: 
// Part (a): Correctness of the code has been checked.
#include <stdio.h>
#include <math.h>


void min_max_avg(float **grid, int N, int M, 
                 float *min, float *max, float *avg, 
                 float *col_min, float *col_max, float *col_avg, 
                 float *row_min, float *row_max, float *row_avg) {
// Part(b): Reducing Memory Alasing: 
// Delete all the "global" int variable i and j, and replace them by "local" variable i and j
// In each loop.
// In this way, we do not need to change value of i and j every time. 
// And also, we reduce the risk of data dependency.
    float global_min = INFINITY;
    float global_max = -INFINITY;
    float row_sum[N];
    float col_sum[M];
    *avg = NAN;


// Part(c): we can easily figure out that the loops calculating the min and max are similar.
// However, by 2 loops, each element in the matrix is visited TWICE.
// And therefore, we can use 1 loop to calculate the max and min at the same time.
// In this case, the running time would be halved.
// It satisfys the requirement of loop efficiency. 
// Furthermore, we can generalize the idea to all extreme values
// even the extreme value of each column and row.
// In other word, we use 1 loop to get 6 results, and reduce 5 additional visiting of an element.
// And also, we reduce the number of loops.
// Above are my ideas of increasing the loop efficiency, 
// and significantly decresing the running time.   

        
// Part (d):
// First : i++ is replaced by ++i to decrease running time.

	// Initialize the basic arrays for later use.
	// Decrese the number of instructions in each loop.
    for (int i = 0; i < N; ++i) { 
	row_sum[i] = 0;
	row_avg[i] = NAN;
    }

    for (int j = 0; j < M; ++j) {
	col_max[j] = -INFINITY;	
	col_min[j] = INFINITY;	
	col_sum[j] = 0;
	col_avg[j] = NAN;
    }

// Part (d):
// Second : Use a register to express the grid, so that we do not need to dereference all the time.

	// Compute extreme values.
    for (int i = 0; i < N; ++i) {
	float temp_row_min = INFINITY;
	float temp_row_max = -INFINITY; 
	for(int j = 0; j < M; ++j) {
		register float temp = grid[i][j];
		if (temp < global_min)
			global_min = temp;
		if (temp > global_max)
			global_max = temp;
		if (temp < temp_row_min)
			temp_row_min = temp;
		if (temp > temp_row_max)
			temp_row_max = temp;
		if (temp < col_min[j])
			col_min[i] = temp;
		if (temp > col_max[j])
			col_max[i] = temp;
		row_max[i] = temp_row_max;
		row_min[i] = temp_row_min;
		row_sum[i] += grid[i][j];
		col_sum[j] += grid[i][j];

	}
    }
    
    *min = global_min;
    *max = global_max;

    // Compute averages.
    if ( M > 0 ){
	for (int i = 0; i < N; ++i) {
		row_avg[i] = row_sum[i] / M;
	}
    }

    if ( N > 0 ){
	for (int j = 0; j < M; ++j) {
		col_avg[j] = col_sum[j] / N;
	}
    }
	

// Part (d):
// Third : Use loop unrolling: (Modified from Lecture 26)
    float sum[2] = {0,0};
    int i = 0;
    for (; i < N - 2; i+= 2){
	sum[0] += row_sum[i];
	sum[1] += row_sum[i+1];
    }
    float total = sum[0] + sum[1];
    for (; i < N; ++i) {
	total += row_sum[i];
    }

// Part (d):
// Fourth : Use local variable instead of a multiplication.  
    int size = M * N;
    if (size > 0)
	*avg = total / (float)(size);   

} 