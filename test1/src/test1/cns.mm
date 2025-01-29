#include <string.h>
#include <stdarg.h>
#include "cns.h"

#import <UIKit/UIKit.h>

void cns_log(const char *s)
{
  NSLog(@"%s",s);
}

#define CNS_MAX_TMP 512
static char _cns_buf[CNS_MAX_TMP];

void cns_print(const char *format, ...)
{
  va_list args;
  va_start (args, format);
  vsnprintf (_cns_buf, CNS_MAX_TMP, format, args);
  va_end (args);

  cns_log(_cns_buf);
}

char *cns_str_clone(const char *s)
{
 if (s == NULL)
   s = "";

 int l = strlen(s);
 char *cs = (char *) malloc(l+1);
 memcpy(cs, s, l+1);
 return cs;
}

void cns_str_free(char *s)
{
 free(s);
}

static char *_cns_doc_path = NULL;

const char *cns_documents_path()
{
  if (_cns_doc_path)
    return _cns_doc_path;

  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString *path = paths[0];
  const char *cpath = [path UTF8String];
  _cns_doc_path = cns_str_clone(cpath);
  return _cns_doc_path;
}

static char *_cns_appdir_path = NULL;

const char *cns_appdir_path()
{
  if (_cns_appdir_path)
    return _cns_appdir_path;

  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
  NSString *path = paths[0];
  const char* cpath = [path UTF8String];
  _cns_appdir_path = cns_str_clone(cpath);
  return _cns_appdir_path;
}

static char *_cns_resource_path = NULL;

const char *cns_resource_path()
{
  if (_cns_resource_path)
    return _cns_resource_path;

  const char* cpath = [[[NSBundle mainBundle] resourcePath] UTF8String];
  _cns_resource_path = cns_str_clone(cpath);
  return _cns_resource_path;
}

