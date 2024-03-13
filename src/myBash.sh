#!/bin/bash

undone_file="undone_file.txt"
completed_file="completed_file.txt"
deleted_file="deleted_file.txt"

create_files() {
    touch $undone_file $completed_file $deleted_file
        echo "Files created successfully."
    }

   add_task() {
       echo "Enter task description:"
       read task
       echo $task >> $undone_file
       echo "Task added successfully."

   }

   show_undone_tasks() {
       echo "Undone Tasks:"
       cat $undone_file
       read "press any key" a
   }

   mark_task_completed() {
       echo "Enter task number to mark as completed:"
       read task_num
       task=$(sed -n "${task_num}p" $undone_file)
       sed -i "${task_num}d" $undone_file
       echo $task >> $completed_file
       echo "Task marked as completed."
   }

   show_completed_tasks() {
       echo "Completed Tasks:"
       cat $completed_file
       read "press any key" a
   }

   delete_task() {
       echo "Enter task number to delete:"
       read task_num
       task=$(sed -n "${task_num}p" $completed_file)
       sed -i "${task_num}d" $completed_file
       echo $task >> $deleted_file
       echo "Task deleted successfully."
   }

   show_deleted_tasks() {
       echo "Deleted Tasks:"
       cat $deleted_file
       read "press any key" a
   }



    while true; do
        echo "Menu:"
        echo "1. Add new task"
        echo "2. Show undone tasks"
        echo "3. Mark task as completed"
        echo "4. Show completed tasks"
        echo "5. Delete a task"
        echo "6. Show deleted tasks"
        echo "7. Exit"

        read choice
        case $choice in
            1) add_task;;
            2) show_undone_tasks;;
            3) mark_task_completed;;
            4) show_completed_tasks;;
            5) delete_task;;
            6) show_deleted_tasks;;
            7) break;;
            *) echo "Invalid option";;
        esac
    done