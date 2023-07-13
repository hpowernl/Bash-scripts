# Empty Directory Handler Bash Script

This is a command-line bash script that scans a directory to find and display all empty directories within it. The script can also remove these empty directories if instructed.

## Usage
To use the script, clone the repository or download the run.sh file and then add execute permissions to it.

```bash
chmod +x remove-empty-folder.sh
```

## Displaying Empty Directories
To display all empty directories within a given directory, run the following command:

./run.sh --directory /your/directory/path

```bash
./run.sh --directory /your/directory/path
```
This will print a table displaying the paths of all empty directories within the specified directory.


## Removing Empty Directories
To remove all empty directories within a given directory, run the following command:

```bash
./run.sh --remove --directory /your/directory/path
```
This will delete all empty directories within the specified directory and print a table showing the paths of the directories that were removed.

## Caution
When using the removal feature, please ensure you have backed up any important data and double-check the directory path to avoid accidental deletion of important files or directories.

## Contribution
Feel free to submit pull requests for bug fixes or improvements.

## License
[MIT](https://choosealicense.com/licenses/mit/)
