#include <string.h>
#include <stdio.h>
#include "cns.h"
#include "ctest.h"

void ctest_resource()
{
   char file_path[512];
   snprintf(file_path, 512, "%s/test2.txt", cns_resource_path());

   FILE *f = fopen(file_path,"rb");
   if (f == NULL)
     {
       cns_print("failed to open file %s",file_path);
       return;
     }
   else
    cns_print("opened file %s",file_path);
 
   while(f)
     {
      char line[256];
      int status = fread(line, 1, 256, f);
      if(status)
        line[status] = 0;
      cns_print("count %d",status);
      if(status <= 0)
         break;
      cns_print("line %s",line);
     }
   fclose(f);
   cns_print("test resource done");
}

#include <sys/stat.h>
void ctest_read_test_document(const char *file_path);
void ctest_write_test_document(const char *file_path);

void ctest_create_test_document()
{
   char file_path[512];
   snprintf(file_path, 512, "%s/test.txt", cns_documents_path());
   cns_print("create test document %s", file_path);

   struct stat buffer;   
   if(stat(file_path, &buffer) == 0)
   {
       cns_log("document already exists.");
   }
   else
   {
       cns_log("create the document.");
       ctest_write_test_document(file_path);
     }

}

void ctest_read_test_document(const char *file_path)
{

      FILE *f = fopen(file_path, "rb");
      if (f == NULL)
        cns_log("failed to read document");
      else
        {
         while(f)
          {
           char line[256];
           int status = fread(line, 1, 256, f);
           if(status)
              line[status] = 0;
           cns_print("count %d",status);
           if(status <= 0)
             break;
           cns_print("line %s",line);
         }
        fclose(f);
        }
}

void ctest_write_test_document(const char *file_path)
{

      FILE *f = fopen(file_path, "wb");
      if (f == NULL)
        cns_log("failed to write document");
      else
        {
         fprintf(f, "doc content\n");
         fclose(f);
        }

}

void ctest_test_document()
{
   char file_path[512];
   snprintf(file_path, 512, "%s/test.txt", cns_documents_path());
   cns_print("test document %s", file_path);

   ctest_read_test_document(file_path);
   ctest_write_test_document(file_path);

}

