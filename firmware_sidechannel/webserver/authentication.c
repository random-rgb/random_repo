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



int main(int argc, char *argv[])
{
    char * user_input = argv[1];
    char * real_password = argv[2];

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
