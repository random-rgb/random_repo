#include <stdio.h>
#include <string.h>
#include <time.h>
#include <errno.h>

/* msleep(): Sleep for the requested number of milliseconds. */
int msleep(long msec)
{
    struct timespec ts;
    int res;

    if (msec < 0)
    {
        errno = EINVAL;
        return -1;
    }

    ts.tv_sec = msec / 1000;
    ts.tv_nsec = (msec % 1000) * 1000000;

    do {
        res = nanosleep(&ts, &ts);
    } while (res && errno == EINTR);

    return res;
}

int append_to_file(char * dataToAppend)
{
	FILE *fPtr;
    char *filePath = "access.log";

    /*  Open all file in append mode. */
    fPtr = fopen(filePath, "a");


    /* fopen() return NULL if unable to open file in given mode. */
    if (fPtr == NULL)
    {
        /* Unable to open file hence exit */
        printf("\nUnable to open '%s' file.\n", filePath);
        printf("Please check whether file exists and you have write privilege.\n");
        return 1;
    }

    /* Append data to file */
    fputs(dataToAppend, fPtr);

    /* Done with file, hence close file. */
    fclose(fPtr);

    return 0;
}

int write_log()
{
	time_t rawtime;
	struct tm * timeinfo;
	char log_string[100] = "attampt access at: ";

	time ( &rawtime );
	timeinfo = localtime ( &rawtime );
	strcat(log_string, asctime (timeinfo));
	append_to_file(log_string);
}


int main(int argc, char *argv[])
{
    char * user_input = argv[1];
    char * real_password = argv[2];

    write_log();

    if (strnlen(user_input, 100) != strnlen(real_password, 100))
    {
            return 1;
    }

    size_t i;
    for (i = 0; i < strnlen(user_input, 100); i++) {
        if (user_input[i] != real_password[i])
        {
            return 1;
        }
        msleep(400);
    }

    return 0;
}
