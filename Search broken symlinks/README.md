# Bash Symlink Checker
This Bash script checks a specified directory for symlinks and validates whether they point to an existing location. If a symlink points to a non-existing location, a warning will be printed in red. If the symlink points to a valid location, a success message will be printed in green.

## Usage
To use this script, you must provide the directory you want to scan as an argument.
```bash
./symlink_check.sh /data/web/magento2
```

## Installation
1. Clone this repository:
```bash
git clone git@github.com:hpowernl/Bash-scripts.git
```

2. Change into the directory:
```bash
cd BASH-SCRIPTS/Search broken symlinks/
```

3. Make the script executable
```bash
chmod +x symlink-check.sh
```

## Contribution
Feel free to submit pull requests for bug fixes or improvements.

## License
[MIT](https://github.com/hpowernl/Bash-scripts/blob/main/LICENSE)