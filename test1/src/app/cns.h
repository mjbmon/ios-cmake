/*

  Define C++ interface to NS.

  Note on documents path:
    In order for Files to see the Documents the
    app has to enable stuff

    Before your files can appear in the Files app, you must 
  indicate that your app supports Open in Place and File Sharing 
  Enabled. These options are configured using keys in your 
  Info.plist file. The first key is UIFileSharingEnabled, which 
  enables iTunes sharing of files in your Documents folder. The 
  second key is LSSupportsOpeningDocumentsInPlace, which grants 
  the local file provider access to files in your Documents 
  folder. Add these keys to your Info.plist and set their values 
  to YES. 

  Ok, this was already done and the Files app can open the sample
  documents file.

  I think there are also permissions to import stuff as well.

  Some of this is handled with extensions, see
https://developer.apple.com/library/archive/documentation/General/Conceptual/ExtensibilityPG/

  (there are DocumentProviders and Document Picker)


 */ 

// Print string to ns log
void cns_log(const char *s);

// Print formatted string to ns log.
void cns_print(const char *fmt, ...);

// Clone a character string
char *cns_str_clone(const char *s);

// Free a string
void cns_str_free(char *s);

// Get path to Documents
const char *cns_documents_path();

// Get path to ApplicationSupportDirectory
const char *cns_appdir_path();

// Get path to Resources
const char *cns_resource_path();

