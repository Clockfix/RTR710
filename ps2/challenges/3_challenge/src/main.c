#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>  // add aditional *.h file
#include <stdbool.h> // add aditional *.h file
#include <stdlib.h>  // add aditional *.h file

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
    unsigned uid; //  added record ID
} llist_t;

#define BUFFER_SIZE 256
unsigned int sample_count = 0;
#define TRUE 1
#define FALSE 0

/***** global: start of the linked list structure *****/
llist_t *lhead = NULL; // this is head pointer (address of first node)
llist_t *ltail = NULL; // this is tail pointer (address of last node)

void llist_print_single(llist_t *entry)
{
    _I("| %6u| %20s| %u| %6u| %6u| %6u| %6u|",
       entry->uid,
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
void print_line()
{
    for (int i = 0; i < 69; i++)
    {
        printf("-");
    }
    printf("\n");
}

void table_head()
{
    print_line();
    char *Suid;
    char *Scity;
    char *Syear;
    char *Spopulation_total;
    char *Spopulation_below_wa;
    char *Spopulation_in_wa;
    char *Spopulation_above_wa;

    Suid = "ID";
    Scity = "city";
    Syear = "year";
    Spopulation_total = "p TOT";
    Spopulation_below_wa = "p b.WA";
    Spopulation_in_wa = "p inWA";
    Spopulation_above_wa = "p a.WA";
    _I("| %6s| %20s| %4s| %6s| %6s| %6s| %6s|",
       Suid,
       Scity,
       Syear,
       Spopulation_total,
       Spopulation_below_wa,
       Spopulation_in_wa,
       Spopulation_above_wa);
    print_line();
    //  print_line();
}

void llist_print()
{
    /* your code goes here */
    llist_t *ltemp = lhead; // temp address of head
    ltemp = lhead;
    table_head();
    while (ltemp != NULL)
    {
        llist_print_single(ltemp);
        ltemp = ltemp->next; // ltemp now stores address for next node
    }
    print_line();
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

int sample_counter(FILE *fd)
{
    // geting number of records
    // _I("    Getting number of records");
    char ch;
    int samples = 0;
    while (!feof(fd))
    {
        ch = fgetc(fd);
        if (ch == '\n') //detecting end of line
        {
            samples++;
        }
    }
    rewind(fd);
    // printf("        There are %i records in CSV!\n", samples);
    return samples;
}

void llist_init(FILE *fd)
{
    /* your code goes here */
    sample_count = sample_counter(fd); // getting reccord count in CSV file
    // reading file and adding them to linked lists
    // _I("    Reading file ");
    // temp values
    char buf[BUFFER_SIZE]; // buffer - for storing line content of file
    char *tok;
    unsigned temp_year;
    char *temp_city;
    int name_size; // size of temp_city string
    unsigned temp_population_total;
    unsigned temp_population_below_wa;
    unsigned temp_population_in_wa;
    unsigned temp_population_above_wa;
    unsigned temp_uid;
    for (temp_uid = 0; temp_uid < sample_count; temp_uid++)
    {
        fgets(buf, sizeof(buf), fd); // reading line from a text file
        tok = strtok(buf, ",");
        temp_year = atoi(tok);
        tok = strtok(NULL, ",");
        temp_city = tok;
        // _I("%4u %20s",temp_uid,temp_city);  // print out uID and city name
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
            lhead->uid = temp_uid;
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
            ltail->next->uid = temp_uid;
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
        //  llist_print_single(ltail); // print out last element of linked list
    }
    // _I("    Linked list created");
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
    llist_t *ltemp = NULL; // temp address of head
    while (lhead != NULL)
    {
        ltemp = lhead->next; // saving address of next node
        free(lhead->city);   // free allocated memory for city name
        free(lhead);         // free allocated memory for first node
        lhead = ltemp;
    }
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
void swap(struct llist **head_ref, unsigned x, unsigned y)
{
    // Nothing to do if x and y are same
    if (x == y)
        return;

    // Search for x (keep track of prevX and CurrX
    struct llist *prevX = NULL, *currX = *head_ref;
    while (currX && currX->uid != x)
    {
        prevX = currX;
        currX = currX->next;
    }

    // Search for y (keep track of prevY and CurrY
    struct llist *prevY = NULL, *currY = *head_ref;
    while (currY && currY->uid != y)
    {
        prevY = currY;
        currY = currY->next;
    }

    // If either x or y is not present, nothing to do
    if (currX == NULL || currY == NULL)
        return;

    // If x is not head of linked list
    if (prevX != NULL)
    {
        prevX->next = currY;
    }
    else // Else make y as new head
    {
        // _I("    New head is %s", currY->city);
        *head_ref = currY;
    }
    // If y is not head of linked list
    if (prevY != NULL)
    {
        prevY->next = currX;
    }
    else
    { // Else make x as new head
        // _I("    New head is %s", currX->city);
        *head_ref = currX;
    }

    // Swap next pointers
    struct llist *temp = currY->next;
    currY->next = currX->next;
    currX->next = temp;
}

void llist_sort_year()
{
    /* your code goes here */
    struct llist *comp_ref = NULL;
    comp_ref = lhead;                               // ref to first node of the list
    if (comp_ref != NULL && comp_ref->next != NULL) // there are at least two nodes in list
    {
        while (comp_ref->next != NULL)
        {
            if (comp_ref->year > comp_ref->next->year)
            {
                // _I("    year in %s %i is larger than %s %i",
                //    comp_ref->city,
                //    comp_ref->year,
                //    comp_ref->next->city,
                //    comp_ref->next->year);
                // _I("        swaping records %s and %s",
                //    comp_ref->city,
                //    comp_ref->next->city);
                swap(&lhead, comp_ref->uid, comp_ref->next->uid);
                // start all over again
                // _I("        lhead is %s", lhead->city);
                comp_ref = lhead; // ref to first
                // _I("        comp_ref is %s", lhead->city);
            }
            else
            {
                // _I("    year in %s %i is smaller than %s %i",
                //    comp_ref->city,
                //    comp_ref->year,
                //    comp_ref->next->city,
                //    comp_ref->next->year);
                if (comp_ref->next != NULL)
                {
                    comp_ref = comp_ref->next;
                }
            }
        }
    }
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

// swap code sample from:
// https://www.geeksforgeeks.org/swap-nodes-in-a-linked-list-without-swapping-data/
// universal node swap code

void llist_sort_population_overall()
{
    /* your code goes here */
    struct llist *comp_ref = NULL;
    comp_ref = lhead;                               // ref to first node of the list
    if (comp_ref != NULL && comp_ref->next != NULL) // there are at least two nodes in list
    {
        while (comp_ref->next != NULL)
        {
            if (comp_ref->population_total > comp_ref->next->population_total)
            {
                // _I("    population in %s %i is larger than %s %i",
                //    comp_ref->city,
                //    comp_ref->population_total,
                //    comp_ref->next->city,
                //    comp_ref->next->population_total);
                // _I("        swaping records %s and %s",
                //    comp_ref->city,
                //    comp_ref->next->city);
                swap(&lhead, comp_ref->next->uid, comp_ref->uid);
                // start all over again
                // _I("        lhead is %s", lhead->city);
                comp_ref = lhead; // ref to first
                // _I("        comp_ref is %s", lhead->city);
            }
            else
            {
                // _I("    population in %s %i is smaller than %s %i",
                //    comp_ref->city,
                //    comp_ref->population_total,
                //    comp_ref->next->city,
                //    comp_ref->next->population_total);
                if (comp_ref->next != NULL)
                {
                    comp_ref = comp_ref->next;
                }
            }
        }
    }
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
