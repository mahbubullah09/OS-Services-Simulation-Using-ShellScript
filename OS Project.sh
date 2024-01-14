#!/bin/bash

while true; do
    echo "Operating System Services Simulation Using Shell Script"
    echo "1. CPU Scheduling Algorithms"
    echo "2. Page Replacement Algorithms"
    echo "3. Exit"

    read -p "Enter your choice (1-3): " choice

    case $choice in
        1)  # CPU Scheduling Algorithms
            while true; do
                echo "CPU Scheduling Algorithms"
                echo "1. SJF Scheduling"
                echo "2. FCFS Scheduling"
                echo "3. Back to Main Menu"

                read -p "Enter your choice (1-3): " cpu_choice

                case $cpu_choice in
                   

                    1)  # SJF Scheduling
                        echo "SJF Scheduling Algorithm"

                        # SJF Scheduling Code
                        read -p "Enter the number of processes: " n
                        burst_time=()
                        waiting_time=()
                        turnaround_time=()
                        process_number=()

                        for ((i = 1; i <= n; i++)); do
                            echo "Enter the burst time for process $i:"
                            read bt
                            burst_time+=("$bt")
                            waiting_time+=("0")
                            turnaround_time+=("0")
                            process_number+=("$i")
                        done

                        # Sort processes by burst time
                        for ((i = 0; i < n; i++)); do
                            for ((j = i + 1; j < n; j++)); do
                                if ((burst_time[i] > burst_time[j])); then
                                    tmp=${burst_time[i]}
                                    burst_time[i]=${burst_time[j]}
                                    burst_time[j]=$tmp
                                    tmp=${process_number[i]}
                                    process_number[i]=${process_number[j]}
                                    process_number[j]=$tmp
                                fi
                            done
                        done

                        # Calculate waiting and turnaround times
                        waiting_time[0]=0
                        for ((i = 1; i < n; i++)); do
                            waiting_time[i]=$((waiting_time[i - 1] + burst_time[i - 1]))
                        done

                        for ((i = 0; i < n; i++)); do
                            turnaround_time[i]=$((waiting_time[i] + burst_time[i]))
                        done

                        # Print the results in the original order
                        echo "Process | Burst Time | Waiting Time | Turnaround Time"
                        echo "------- | ---------- | ------------ | --------------"
                        for ((i = 0; i < n; i++)); do
                            echo "P${process_number[i]} | ${burst_time[i]} | ${waiting_time[i]} | ${turnaround_time[i]}"
                        done

                       # Calculate the average waiting time and turnaround time
                        total_waiting_time=0
                        total_turnaround_time=0
                        for ((i = 0; i < n; i++)); do
                             total_waiting_time=$((total_waiting_time + waiting_time[i]))
                             total_turnaround_time=$((total_turnaround_time + turnaround_time[i]))
                        done

                        avg_waiting_time=$(awk "BEGIN {print $total_waiting_time / $n}")
                        avg_turnaround_time=$(awk "BEGIN {print $total_turnaround_time / $n}")

                        echo "Average Waiting Time: $avg_waiting_time"
                        echo "Average Turnaround Time: $avg_turnaround_time"


                        ;;
                    2)  # FCFS Scheduling
                        echo "FCFS Scheduling Algorithm"

                        # FCFS Scheduling Code
                        read -p "Enter the number of processes: " n
                        burst_time=()
                        waiting_time=()
                        turnaround_time=()
                        process_number=()

                        for ((i = 1; i <= n; i++)); do
                            echo "Enter the burst time for process $i:"
                            read bt
                            burst_time+=("$bt")
                            waiting_time+=("0")
                            turnaround_time+=("0")
                            process_number+=("$i")
                        done

                        # Calculate waiting and turnaround times
                        waiting_time[0]=0
                        for ((i = 1; i < n; i++)); do
                            waiting_time[i]=$((waiting_time[i - 1] + burst_time[i - 1]))
                        done

                        for ((i = 0; i < n; i++)); do
                            turnaround_time[i]=$((waiting_time[i] + burst_time[i]))
                        done

                        # Print the results in the original order
                        echo "Process | Burst Time | Waiting Time | Turnaround Time"
                        echo "------- | ---------- | ------------ | --------------"
                        for ((i = 0; i < n; i++)); do
                            echo "P${process_number[i]} | ${burst_time[i]} | ${waiting_time[i]} | ${turnaround_time[i]}"
                        done

                        # Calculate the average waiting time and turnaround time
                        # Calculate the average waiting time and turnaround time
                        total_waiting_time=0
                        total_turnaround_time=0
                        for ((i = 0; i < n; i++)); do
                            total_waiting_time=$((total_waiting_time + waiting_time[i]))
                            total_turnaround_time=$((total_turnaround_time + turnaround_time[i]))
                        done

                        avg_waiting_time=$(awk "BEGIN {print $total_waiting_time / $n}")
                        avg_turnaround_time=$(awk "BEGIN {print $total_turnaround_time / $n}")

                        echo "Average Waiting Time: $avg_waiting_time"
                        echo "Average Turnaround Time: $avg_turnaround_time"

                        
                        ;;
                    3)  # Back to Main Menu
                        break
                        ;;
                    *)  # Invalid Choice
                        echo "Invalid choice. Please enter a valid option."
                        ;;
                esac
            done
            ;;
        2)  # Page Replacement Algorithms
            while true; do
                echo "Page Replacement Algorithms"
                echo "1. FIFO"
                echo "2. LRU"
                echo "3. Back to Main Menu"

                read -p "Enter your choice (1-3): " page_choice

                case $page_choice in
                    1)  # FIFO
                        echo "FIFO Page Replacement Algorithm"

                        # FIFO Page Replacement Code
                        read -p "Enter the number of frames: " frames
                        read -p "Enter the number of pages: " pages
                        page_array=()

                        for ((i = 1; i <= pages; i++)); do
                            echo "Enter the page number for reference $i:"
                            read page
                            page_array+=("$page")
                        done

                        fifo_replace=()
                        page_faults=0

                        for ((i = 0; i < frames; i++)); do
                            fifo_replace+=("-1")
                        done

                        for ((i = 0; i < pages; i++)); do
                            page_number=${page_array[i]}
                            page_found=false

                            for ((j = 0; j < frames; j++)); do
                                if [ "${fifo_replace[j]}" -eq "$page_number" ]; then
                                    page_found=true
                                    break
                                fi
                            done

                            if [ "$page_found" == false ]; then
                                replace_index=$((i % frames))
                                fifo_replace[$replace_index]=$page_number
                                page_faults=$((page_faults + 1))
                          
                            else
                         
                                page_hits=$((page_hits + 1))
                            fi
                        done

                        echo "Page Faults using FIFO: $page_faults"
                        echo "Page Hits using FIFO: $page_hits"

                        ;;
                    2)  # LRU
                        echo "LRU Page Replacement Algorithm"
                        # LRU Page Replacement Algorithm
                        echo "LRU Page Replacement Algorithm"

                        # Read the number of frames and pages
                        read -p "Enter the number of frames: " frames
                        read -p "Enter the number of pages: " pages
                        page_array=()

                        # Read the pages
                        for ((i = 1; i <= pages; i++)); do
                            echo "Enter the page number for reference $i:"
                            read page
                            page_array+=("$page")
                        done

                        lru_replace=()
                        page_faults=0
                        page_hits=0

                        # LRU algorithm
                        
                        for ((i = 0; i < pages; i++)); do
                            page_number=${page_array[i]}
                            page_found=false

                            # Check if the page is already in a frame
                            for ((j = 0; j < frames; j++)); do
                                if [ "${lru_replace[j]}" == "$page_number" ]; then
                                    page_found=true
                                    unset lru_replace[j]
                                    lru_replace+=("$page_number")
                                    page_hits=$((page_hits + 1))
                                    break
                                fi
                            done


                            if [ "$page_found" == false ]; then
                                # Page fault occurs, replace page using LRU strategy
                                if [ "${#lru_replace[@]}" -eq "$frames" ]; then
                                    unset lru_replace[0]
                                    lru_replace+=("$page_number")
                                    page_faults=$((page_faults + 1))
                                else
                                    lru_replace+=("$page_number")
                                    page_faults=$((page_faults + 1))
                                fi
                            fi
                        done

                        echo "Page Faults using LRU: $page_faults"
                        echo "Page Hits using LRU: $page_hits"

                        ;;

                    
                    3)  # Back to Main Menu
                        break
                        ;;
                    *)  # Invalid Choice
                        echo "Invalid choice. Please enter a valid option."
                        ;;
                esac
            done
            ;;
        
        3)  # Exit
            echo "Exiting the simulation. Goodbye!"
            exit 0
            ;;
        *)  # Invalid Choice
            echo "Invalid choice. Please enter a valid option."
            ;;
    esac
done


