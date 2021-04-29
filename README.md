# Code Snippets and File Templates for Amplify

## Overview

Amplify is an SDK which makes AWS more accessible to app developers. This collection of code snippets and file templates support Amplify to help developers get their work done more quickly.

## Managing Snippets

The default filenames are random while the Amplify snippets use "amplify_" as the prefix. Xcode provides an editor for code snippets which will be used to create new snippets. Once new snippets are created they will need to be collected from the library folder and updated to use a common prefix as the other code snippet files. Then the code snippet files in the  library can be cleared and the properly named files can be installed into the library folder.

Other snippets may be in use which are unrelated to Amplify so these snippets will not be modified. Run the following commands to collect, clear and install Amplify cnode snippets.

```sh
./bin/snippets.sh collect
./bin/snippets.sh clear
./bin/snippets.sh install
```

Once files are collected they will be placed in the Collected folder. Each file should be named with the "amplify_" prefix which will match the name used by the code snippet without the leading $ which is used with code completion in the Xcode editor.

### Creating a New Code Snippet

1. In the Xcode editor select Editor -> Create New Code Snippet
2. Use the dialog window to create a new code snippet with $amplify_ as the prefix for Completion
3. Run the collect command shown above
4. Rename the new file which was collected using the value from Completion without the leading $
5. Copy the file to the CodeSnippets folder
6. Run the clear command shown above
7. Run the install command shown above

### Updating a Code Snippet

1. In the Xcode  press the + button above the active editor
2. Use a search term to find the code snippet you want to update
3. Tap the edit button with the snippet and make your changes
4. Press the Done button when completed
5. Run the collect command shown above
6. Rename the file to match the Completion value
7. Copy the file to the CodeSnippets folder
8. Run the clear command shown above
9. Run the install command shown above
