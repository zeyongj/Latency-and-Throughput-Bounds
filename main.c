
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void min_max_avg(float **, int, int , float *, float *, float *, float *, float *, float *, float *, float *, float *);

#define NTESTS 20

float overall_min;
float overall_max;
float overall_avg;
float *col_min;
float *col_max;
float *col_avg;
float *row_min;
float *row_max;
float *row_avg;

int cycles[NTESTS];
long total;
int start_time = 150;
int end_time = 125;

void main () {
    int ret;
    int i, j;
    float **grid;
    int Nrows;
    int Ncols;

    // gather input
    ret = scanf("%d%d", &Nrows, &Ncols);
	grid = (float **)malloc(Nrows * sizeof(float *));
	grid[0] = (float *)malloc(Ncols * Nrows * sizeof(float));
    for (i = 1; i < Nrows; i++) {
        grid[i] = grid[i-1] + Ncols;
    }
    for (i = 0; i < Nrows; i++) {
        for (j = 0; j < Ncols; j++) {
            ret = scanf("%f", grid[i] + j);
        }
    }


    // setup return vectors
    col_min = (float *)malloc(Ncols * sizeof(float));
    col_max = (float *)malloc(Ncols * sizeof(float));
    col_avg = (float *)malloc(Ncols * sizeof(float));
    row_min = (float *)malloc(Nrows * sizeof(float));
    row_max = (float *)malloc(Nrows * sizeof(float));
    row_avg = (float *)malloc(Nrows * sizeof(float));


    // timed test
    for (i = 0; i < NTESTS; i++) {
        asm volatile (
            "cpuid\n\t"
            "rdtscp\n\t"
            "movl %%eax, %0\n\t"
            : "=r" (start_time)
            : 
            : "rax", "rbx", "rcx", "rdx"
        );

        min_max_avg(grid, Nrows, Ncols , &overall_min, &overall_max, &overall_avg, col_min, col_max, col_avg, row_min, row_max, row_avg);

        asm volatile (
            "cpuid\n\t"
            "rdtscp\n\t"
            "movl %%eax, %0\n\t"
            : "=r" (end_time)
            : 
            : "rax", "rbx", "rcx", "rdx"
        );

        cycles[i] = end_time - start_time;
        if (cycles[i] >= 20000) { i--; continue; }
    }


    // display output
    printf(" min     >>>");
    for (j = 0; j < Ncols; j++) {
        printf(" %2d", (int)(col_min[j]));
    }
    putchar('\n');
    printf("    max   >>");
    for (j = 0; j < Ncols; j++) {
        printf(" %2d", (int)(col_max[j]));
    }
    putchar('\n');
    printf("  v    avg >");
    for (j = 0; j < Ncols; j++) {
        printf(" %2d", (int)(col_avg[j]));
    }
    putchar('\n');
    printf("  v  v      ");
    putchar('\n');
    printf("  v  v  v   ");
    putchar('\n');
    for (i = 0; i < Nrows; i++) {
        // printf(" %2d %2d %2d   ", (int)(row_min[i]), (int)(row_max[i]), (int)(row_avg[i]));
        printf(" %.2f %.2f %.2f   ", (row_min[i]), (row_max[i]), (row_avg[i]));
        for (j = 0; j < Ncols; j++) {
            printf(" %2d", (int)(grid[i][j]));
        }
        putchar('\n');
    }
    putchar('\n');
    //printf(" %2d %2d %2d   (Overall)", (int)(overall_min), (int)(overall_max), (int)(overall_avg));
    printf(" %f %f %f   (Overall)", (overall_min), (overall_max), (overall_avg));
    putchar('\n');
    putchar('\n');


    // display benchmark results
    total = 0;
    for (i = 0; i < NTESTS; i++) {
        printf("Sample %d completed in %d cycles.\n", i+1, cycles[i]);
        if (i >= NTESTS/2) {
            total += cycles[i];
        }
    }
    printf("Average of %ld cycles.\n", total/(NTESTS/2));


    // completely unnecessary recycling
	free(grid[0]);
	free(grid);

    free(col_min); free(col_max); free(col_avg);

    free(row_min); free(row_max); free(row_avg);

    return;
}

