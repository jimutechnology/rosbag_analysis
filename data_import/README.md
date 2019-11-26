# data_import
## Introduction
This is a shell script based on rostopic commands.

Customize this script to import data from selected topics.

## Usage
Under the path /rosbag_analysis/data_import,
```
$ ./DataImport.sh X
```
while X.bag is the name of the rosbag file.

This will generate specified log files (each corresponding to one topic) under directory /rosbag_analysis/data_import/X/

