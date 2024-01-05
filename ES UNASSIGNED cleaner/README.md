# Elasticsearch Unassigned Shards Cleaner (es-clean)

## Overview
The `es-clean` script is designed to safely remove indices with unassigned shards in an Elasticsearch cluster. This script connects to a specified Elasticsearch server via SSH and performs actions to identify and delete indices with unassigned shards.

## Prerequisites
Before using `es-clean`, ensure you have SSH access to the target Elasticsearch server and the necessary permissions to perform index deletion operations.

## Installation
1. **Download the Script:**  
   Download `es-clean` script to your local system.

2. **Move the Script to `/usr/local/bin/`:**  
   Move the script to the `/usr/local/bin/` directory to make it globally accessible. This can be done using the following command:
   ```
   mv es-clean /usr/local/bin/
   ```

3. **Make the Script Executable:**  
   Grant execute permissions to the script to allow it to run. Use the command:
   ```
   chmod +x /usr/local/bin/es-clean
   ```

## Usage
To use `es-clean`, simply run the script with the server name as an argument. For example:
```
es-clean [servername]
```
Replace `[servername]` with the actual name of your Elasticsearch server.

When executed, the script will:
- Connect to the specified Elasticsearch server via SSH.
- List all indices with unassigned shards.
- Prompt for confirmation to delete all listed indices.
- Delete the indices upon confirmation.

## Important Notes
- **Data Loss Warning:** This script will permanently delete indices. Ensure you have backups or do not require the data in these indices before proceeding.
- **Test First:** Always test the script in a non-production environment before using it on a production server.
- **SSH Configuration:** Ensure your SSH access and permissions are correctly configured for the script to function properly.

## License
This script is released under MIT.
