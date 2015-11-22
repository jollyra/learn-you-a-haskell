#include <stdio.h>
#include <stdlib.h>


char **dict = (char *[]) {"dog", "cat", "fish", "the", "nigel", "new", NULL};
char **board = (char *[]) {"dog",
                           "thf",
                           "esi"};


void boggleSolve(int dim, char **board, char** dict);
void printDict(void);
void word(int col, int row, char *word);

void printDict(void) {
    int i = 0;
    while(dict[i] != NULL) {
       printf("%s\n", dict[i]); 
       i++;
    }
}


void boggleSolve(int dim, char **board, char** dict) {
    int i = 0;
    int col;
    int row;
    while(dict[i] != NULL) {
        for(row = 0; row < dim; row++) {
            for(col = 0; col < dim; col++) {
                word(col, row, dict[i]);
            }
        }
        i++;
    }
}

void word(int col, int row, char *word) {
    printf("%c\n", board[row][col]);
}

int main(void) {
    boggleSolve(3, board, dict);
    return 0;
}
