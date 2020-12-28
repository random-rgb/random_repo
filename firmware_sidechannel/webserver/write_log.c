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

int main(int argc, char *argv[])
{
	time_t rawtime;
	struct tm * timeinfo;
	char log_string[100] = "attampt access at: ";

	time ( &rawtime );
	timeinfo = localtime ( &rawtime );
	strcat(log_string, asctime (timeinfo));
	append_to_file(log_string);

	return 0;
}
