# Overview
This is our developer docs about Bash file and command in bash file

## Array
1. Declare array
```bash
array=(word "two words" words)
```

2. Check array contain element
```bash
if [[ " ${array[@]} " =~ " ${value} " ]]; then
    # whatever you want to do when arr contains value
fi

if [[ ! " ${array[@]} " =~ " ${value} " ]]; then
    # whatever you want to do when arr doesn't contain value
fi
```
```bash
array=(word "two words" words)  
search_string="one"  
match=$(echo "${array[@]:0}" | grep -o $search_string)  
[[ ! -z $match ]] && echo "found !"
```