#include <stdio.h>

struct person {
    int id;
    char *first_name;
    char *last_name;
};

void print_person_details(struct person *p);
struct person create_person(int id, char *first_name, char *last_name);

int main() {

    struct person p = create_person(4, "Joe", "Reynolds");
    struct person r = create_person(8, "Richard", "Smith");

    print_person_details(&p);
    print_person_details(&r);
    
    return 0;
}

struct person create_person(int id, char *first_name, char *last_name) {
    struct person p;

    p.id = id;
    p.first_name = first_name;
    p.last_name= last_name;
    return p;
}

void print_person_details(struct person *p) {
    printf("ID: %d\n", p->id);
    printf("First Name: %s\n",p->first_name);
    printf("Last Name: %s\n",p->last_name);
    printf("\n");
}



