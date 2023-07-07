# Take Home Project

Challenge: A directory contains multiple files and directories of non-uniform file and directory names. Create a program that traverses a base directory and creates an index file that can be used to quickly lookup files by name, size, and content type.


# File Indexing and Search Application

This is a console-based application written in Ruby that allows you to index a directory and perform searches based on file names and types.

## Prerequisites

Before running the application, ensure that you have Ruby installed on your system. You can install Ruby using various methods, such as package managers or third-party tools. Here are a couple of examples:

### apt (Debian or Ubuntu)
`sudo apt-get install ruby-full`

### Homebrew (macOS)
`brew install ruby`

For more options to install Ruby, you can refer to the [Ruby installation documentation](https://www.ruby-lang.org/en/documentation/installation).

## Verify Ruby Installation

To verify the installation of Ruby, run the following command in your terminal or command prompt:
`ruby -v`


# Usage
1.  Clone or download the repository to your local machine.
2.  Open a terminal or command prompt and navigate to the directory where the application files are located.
3.  Run the following command to execute the application:
`ruby solution.rb`
4. The application will display a menu with the following options:
```
==============================
1. Search by name or type
2. Exit
==============================
Enter your choice: 
```
1.  Enter `1` to search for files by name or type. If you wish to exit the application, enter `2`.
    
2.  If you choose option `1` to search, the application will prompt you to enter a search query. Enter the desired search query and press Enter.
    
3.  The application will display the search results, showing the file name, size, type, and path for each matching file as shown below. If no matching files are found, a message stating `No matching files found.` will be shown.
```
Enter your choice: 1
Enter the search query: json

==============================
Search Results:
Name: user1.json, Size: 16.0B, Type: json, Path: ./test_data/data/user1.json
Name: user2.json, Size: 17.0B, Type: json, Path: ./test_data/data/user2.json
==============================
```    
4.  You can rerun the application by executing the `ruby solution.rb` command again.

Note: Ensure that you have appropriate permissions to read the files in the directory and write the index file.
Feel free to customize the application or enhance the functionality as per your needs.
