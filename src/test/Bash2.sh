#!/bin/bash

create_files() {
    for i in {1..5}
     do
        touch file_$i.txt
    done
    echo "Five text files created successfully."
}

add_hello_world() {
    for file in file_*.txt
     do
        echo "Hello iran" > $file
    done
    echo "Added 'Hello iran' to all files."
}

replace_bash() {
    for file in file_*.txt
     do
        sed -i 's/world/bash/g' $file
    done
    echo "Replaced 'world' with 'bash' in all files."
}

while true; do
    echo "Menu:"
    echo "1. Create five text files"
    echo "2. Add 'Hello world' to files"
    echo "3. Replace 'world' with 'bash' in files"
    echo "4. Exit"

    read choice
    case $choice in
        1) create_files;;
        2) add_hello_world;;
        3) replace_bash;;
        4) break;;
        *) echo "Invalid option";;
    esac
done