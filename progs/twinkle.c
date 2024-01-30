#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <time.h>
#define depth 200
#define width 200

int main(void)
{
    srand(time(NULL));
    int d = 0;
    char line[depth][width];
    while (scanf("%s", line[d]) != EOF)
        d++;

    while (1)
    {
        int i = 0;
        int j = 0;

        char bung[depth][width];
        for (i = 0; i < depth; i++)
        {
            j = 0;
            if (line[i][j] == 0)
            {
                break;
            }
            for (j; j < width; j++)
            {
                if (line[i][j] == 0)
                    break;

                if (rand() % 10 == 0)
                    bung[i][j] = rand() % 32 + 'a';
                else
                    bung[i][j] = line[i][j];
            }

            printf("%s\n", bung[i]);
        }
        printf("%d\n", line[i][j]);
        sleep(1);
        system("clear");
    }

    return 0;
}