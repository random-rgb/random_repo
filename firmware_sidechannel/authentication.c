// iterate throw the password letter by letter.

#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[])
{
    char * user_input = argv[0];
    char * real_password = argv[1];

    if (strnlen(user_input) != strnlen(real_password))
	{
		return 1;
	}

	size_t i;
	for (i = 0; i < strnlen(string s, 100); i++) {
	    if (string[i] != real_password)
	    {
	    	return 1;
	    }
	    // operation that takes time. 
	}

    return 0;
}

