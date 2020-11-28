#include <stdlib.h>
#include <stdio.h>
#include <math.h>

/* handy macro function to save us some typing time */
#define _I(fmt, args...)  printf(fmt "\n", ##args)


/***** structure of the entry *****/
typedef struct llist{
    struct llist *next;
    unsigned     year;
    char         *city;
    unsigned      population_total;
    unsigned      population_below_wa;
    unsigned      population_in_wa;
    unsigned      population_above_wa;
} llist_t;

/***** global: start of the linked list structure *****/
llist_t *lhead = NULL;


void llist_print_single(llist_t *entry){
    _I("%20s, %u, %6u, %6u, %6u, %6u",
        entry->city,
        entry->year,
        entry->population_total,
        entry->population_below_wa,
        entry->population_in_wa,
        entry->population_above_wa);
}


/* @brief Prints entire linked list of entries
 *
 * NOTE:
 *   your goal here is to find a way how to iterate through the list, for the
 *   actual printing utilize print_list_single procedure 
 *   NB: use the global head pointer
 *
 * */
void llist_print(){
    /* your code goes here */
}


/* @brief Reads file and constructs the linked list structure
 *
 * NOTE:
 *   try to divide your functionality in smaller chunks, i.e. for each entry
 *   - read line
 *   - allocate structure
 *   - parse line and fill the entry 
 *   - don't forget to allocate space for cities as they are of variable length
 *   NB: use the global head pointer
 *
 * @param fd    "file descriptor"
 * 
 * */
void llist_init(FILE *fd){
    /* your code goes here */
}


/* @brief Releases the linked structure and the allocated memory associated
 *        with it
 *
 * NOTE:
 *   Basically this procedure should undo the things done in the init function
 *   NB: use the global head pointer
 *
 * */
void llist_deinit(){
    /* your code goes here */
}


/* @brief Sorts linked list by the overall population
 *
 * NOTE:
 *   try learning about existant sorting algorithms, for example bubble sort:
 *   - https://www.geeksforgeeks.org/bubble-sort/
 *   - https://www.youtube.com/watch?v=kgBjXUE_Nwc
 *   NB: use the global head pointer
 *
 *   The bubble sort algorithm is not very efficient, but hey, we have to 
 *   start somewhere. Here the key is to figure out, how can you exchange
 *   entries. Drawing the linked structure should help with the intuition.
 *
 * */
void llist_sort_year(){
    /* your code goes here */
}


/* @brief Sorts linked list by the year
 *
 * NOTE:
 *   try learning about existant sorting algorithms, for example bubble sort:
 *   - https://www.geeksforgeeks.org/bubble-sort/
 *   - https://www.youtube.com/watch?v=kgBjXUE_Nwc
 *   NB: use the global head pointer
 *
 *   The bubble sort algorithm is not very efficient, but hey, we have to 
 *   start somewhere. Here the key is to figure out, how can you exchange
 *   entries. Drawing the linked structure should help with the intuition.
 *
 * */
void llist_sort_population_overall(){
    /* your code goes here */
}


void print_usage(char *fname){
    printf("USAGE:\n");
    printf("\t%s <input file name>\n", fname);
}


int main(int argc, char *argv[]){
    char *fname_input;
    FILE *fd_input;

    /* checking input parameters */
    if(argc < 2){
        print_usage(argv[0]);
        return 0;
    }

    _I("Parsing input");
    fname_input = argv[1];

    _I("Opening file");
    fd_input  = fopen(fname_input,  "r");
    if(fd_input == NULL){
        _I("FAILED to open file");
        return 1;
    }

    _I("Initializing linked list");
    llist_init(fd_input);
    llist_print();

    _I("Sorting list in acending order by the year");
    llist_sort_year();
    llist_print();

    _I("Sorting list in acending order by population size (overall)");
    llist_sort_population_overall();
    llist_print();

    _I("Deinitializing linked list");
    llist_deinit();
    
    _I("Closing files");
    fclose(fd_input);

    return 0;
}
