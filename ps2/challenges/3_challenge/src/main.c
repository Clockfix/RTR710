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
llist_t *lhead = NULL; // this is head pointer (address of first node)
llist_t *ltail = NULL; // this is tail pointer (address of last node)

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
    _I("    Getting number of records");
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
    printf("        There are %i records in CSV!\n", sample_count);

    // reading file and adding them to linked lists
    _I("    Reading file ");
    // tem values
    char buf[BUFFER_SIZE]; // buffer - for storing line content of file
    char *tok;
    unsigned temp_year;
    char *temp_city;
    int name_size; // size of temp_city string
    unsigned temp_population_total;
    unsigned temp_population_below_wa;
    unsigned temp_population_in_wa;
    unsigned temp_population_above_wa;
    for (int i = 0; i < sample_count; i++)
    {
        fgets(buf, sizeof(buf), fd);
        tok = strtok(buf, ",");
        temp_year = atoi(tok);
        tok = strtok(NULL, ",");
        temp_city = tok;
        name_size = strlen(temp_city);
        tok = strtok(NULL, ",");
        temp_population_total = atof(tok);
        tok = strtok(NULL, ",");
        temp_population_below_wa = atof(tok);
        tok = strtok(NULL, ",");
        temp_population_in_wa = atof(tok);
        tok = strtok(NULL, ",");
        temp_population_above_wa = atof(tok);

        // Creating linked lists
        // creatinf first entry
        // https://www.learn-c.org/en/Linked_lists
        if (lhead == NULL)
        {
            // _I("    Creating linked list first node");
            lhead = (llist_t *)malloc(sizeof(llist_t));
            lhead->year = temp_year;
            lhead->city = (char *)malloc(strlen(temp_city) + 1); // allocating 20 char long string
            strcpy(lhead->city, temp_city);
            lhead->population_total = temp_population_total;
            lhead->population_below_wa = temp_population_below_wa;
            lhead->population_in_wa = temp_population_in_wa;
            lhead->population_above_wa = temp_population_above_wa;
            lhead->next = NULL;
            ltail = lhead; // For first note head and tail are same
        }
        else
        {
            // if (i == 1)
            // {
            //     _I("    Creating linked list second node");
            // }
            // else if (i == 2)
            // {
            //     _I("    Creating linked list third node");
            // }
            // else
            // {
            //     _I("    Creating linked list %ith node", i + 1);
            // }
            ltail->next = (llist_t *)malloc(sizeof(llist_t));
            ltail->next->year = temp_year;
            ltail->next->city = (char *)malloc(strlen(temp_city) + 1); // allocating X char long string
            strcpy(ltail->next->city, temp_city);                      // string copy
            ltail->next->population_total = temp_population_total;
            ltail->next->population_below_wa = temp_population_below_wa;
            ltail->next->population_in_wa = temp_population_in_wa;
            ltail->next->population_above_wa = temp_population_above_wa;
            ltail->next->next = NULL;
            ltail = ltail->next; // new tail address
        }
        // llist_print_single(ltail); // print out last element of linked list
    }
}

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
