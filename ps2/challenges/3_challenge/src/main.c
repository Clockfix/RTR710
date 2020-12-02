#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h> // add aditional *.h file

/* handy macro function to save us some typing time */
#define _I(fmt, args...) printf(fmt "\n", ##args)

/***** structure of the entry *****/
typedef struct llist
{
    struct llist *next;
    unsigned year;
    char *city;
    unsigned population_total;
    unsigned population_below_wa;
    unsigned population_in_wa;
    unsigned population_above_wa;
} llist_t;

#define NUM_OF_LETTERS 20
#define BUFFER_SIZE 256

/***** global: start of the linked list structure *****/
llist_t *lhead = NULL;

void llist_print_single(llist_t *entry)
{
    _I("%20s, %u, %6u, %6u, %6u, %6u",
       entry->city,
       entry->year,
       entry->population_total,
       entry->population_below_wa,
       entry->population_in_wa,
       entry->population_above_wa);
}

unsigned int sample_count = 0;

/* @brief Prints entire linked list of entries
 *
 * NOTE:
 *   your goal here is to find a way how to iterate through the list, for the
 *   actual printing utilize print_list_single procedure 
 *   NB: use the global head pointer
 *
 * */
void llist_print()
{
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
void llist_init(FILE *fd)
{
    /* your code goes here */

    // geting number of records
    _I("    Getting number of records and allocating memory");
    char ch;
    while (!feof(fd))
    {
        ch = fgetc(fd);
        if (ch == '\n') //detecting end of line
        {
            sample_count++;
        }
    }
    rewind(fd);
    printf("    There are %i records in CSV!\n", sample_count);

    // reading file and adding them to linked lists
    _I("    Reading file ");
    char buf[BUFFER_SIZE];
    unsigned temp_year;
    char *temp_city;
    unsigned temp_population_total;
    unsigned temp_population_below_wa;
    unsigned temp_population_in_wa;
    unsigned temp_population_above_wa;
    // allocating city name array
    // char *array_city[NUM_OF_LETTERS];
    char array_city[NUM_OF_LETTERS];
    
    fgets(buf, sizeof(buf), fd);
    char *tok = strtok(buf, ",");
    temp_year = atoi(tok);
    tok = strtok(NULL, ",");
    temp_city = tok;
    int name_size;
    name_size = strlen(temp_city);
    printf("%i\n",name_size);
    //char array_city[0][name_size] ;
    *array_city[0]= temp_city;
    tok = strtok(NULL, ",");
    temp_population_total = atof(tok);
    tok = strtok(NULL, ",");
    temp_population_below_wa = atof(tok);
    tok = strtok(NULL, ",");
    temp_population_in_wa = atof(tok);
    tok = strtok(NULL, ",");
    temp_population_above_wa = atof(tok);

    // char line[BUFFER_SIZE];
    // while (fgets(line, sizeof(line), fd))
    // {
    //     char* tmp = strdup(line);
    //     printf("Field 2 would be %s\n", getfield(tmp, 3));
    //     // NOTE strtok clobbers tmp
    //     free(tmp);
    // }
   
    printf("    %i, %s, %i,%i,%i,%i\n",temp_year,*array_city[0],temp_population_total,temp_population_below_wa,temp_population_in_wa,temp_population_above_wa);
    fgets(buf, sizeof(buf), fd);
    name_size = strlen(temp_city);
    printf("%i\n",name_size);
    //char *array_city[1][name_size] ;
    *array_city[8]= temp_city;
    printf("    %i, %s, %i,%i,%i,%i\n",temp_year,*array_city[8],temp_population_total+1,temp_population_below_wa,temp_population_in_wa,temp_population_above_wa);
fgets(buf, sizeof(buf), fd);
name_size = strlen(tok);
    printf("%i\n",name_size);
    printf("    %i, %s, %i,%i,%i,%i\n",temp_year,*array_city[0],temp_population_total,temp_population_below_wa,temp_population_in_wa,temp_population_above_wa);

    // Creating linked lists
    // creatinf first entry
    // https://www.learn-c.org/en/Linked_lists
    lhead = (llist_t *)malloc(sizeof(llist_t));
    // if (lhead == NULL) {
    //     return 1;
    // }
    lhead->year = 2020;
    //lhead->city = array_city[0];
    lhead->population_total = 100;
    lhead->population_below_wa = 50;
    lhead->population_in_wa = 20;
    lhead->population_above_wa = 30;
    lhead->next = NULL;

    // add entry at end of list
    llist_t *current = lhead;
    while (current->next != NULL)
    {
        current = current->next;
    }

    /* now we can add a new variable */
    current->next = (llist_t *)malloc(sizeof(llist_t));
    current->next->year = 20;
    //current->next->city = array_city[0];
    current->next->population_total = 100;
    current->next->population_below_wa = 50;
    current->next->population_in_wa = 10;
    current->next->population_above_wa = 20;
    current->next->next = NULL;
    //llist_print_single(lhead->next);
}

// const char* getfield(char* line, int num)
// {
//     const char* tok;
//     for (tok = strtok(line, ",");
//             tok && *tok;
//             tok = strtok(NULL, "\n"))
//     {
//         if (!--num)
//             return tok;
//     }
//     return NULL;
// }
    

// // Adding an item to the end of the list
// void push(llist_t * lhead, unsigned year, char *city, unsigned population_total,  unsigned population_below_wa, unsigned population_in_wa, unsigned population_above_wa) {
//     llist_t * current = lhead;
//     while (current->next != NULL) {
//         current = current->next;
//     }

//     /* now we can add a new variable */
//     current->next = (llist_t *) malloc(sizeof(llist_t));
//     current->next->year = year;
//     current->next->city = city;
//     current->next->population_total = population_total;
//     current->next->population_below_wa = population_below_wa;
//     current->next->population_in_wa = population_in_wa;
//     current->next->population_above_wa = population_above_wa;
//     current->next->next = NULL;
// }

/* @brief Releases the linked structure and the allocated memory associated
 *        with it
 *
 * NOTE:
 *   Basically this procedure should undo the things done in the init function
 *   NB: use the global head pointer
 *
 * */
void llist_deinit()
{
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
void llist_sort_year()
{
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
void llist_sort_population_overall()
{
    /* your code goes here */
}

void print_usage(char *fname)
{
    printf("USAGE:\n");
    printf("\t%s <input file name>\n", fname);
}

int main(int argc, char *argv[])
{

    char *fname_input;
    FILE *fd_input;


    /* checking input parameters */
    if (argc < 2)
    {
        print_usage(argv[0]);
        return 0;
    }

    _I("Parsing input");
    fname_input = argv[1];

    _I("Opening file");
    fd_input = fopen(fname_input, "r");
    if (fd_input == NULL)
    {
        _I("FAILED to open file");
        return 1;
    }

    _I("Initializing linked list");
    llist_init(fd_input);
    llist_print();

    _I("Sorting list in ascending order by the year");
    llist_sort_year();
    llist_print();

    _I("Sorting list in ascending order by population size (overall)");
    llist_sort_population_overall();
    llist_print();

    _I("Deinitialize linked list");
    llist_deinit();

    _I("Closing files");
    fclose(fd_input);

    return 0;
}
