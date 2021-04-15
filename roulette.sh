#!/bin/bash 



red=(3 12 7 18 9 14 1 16 5 23 30 36 27 34 25 21 19 32)
black=(26 35 28 29 22 31 20 33 24 10 8 11 13 6 17 2 4 15)

while true; do
    echo -e "Welcome to Thacker Casino! Choose which game you would like to play! \n1) Roulette Wheel\n2) Exit"
    read value
    read -p " Choose the amount you want to start playing with :    " yourAmount
    if [ "$value" -eq 1 ]; then
        echo "You chose Roulette Wheel"
        echo "Loading game ---"
        sleep 1
        while true ; do
            read -p "Choose a number between 0-36 >   " choice
            while true; do
                read -p "Choose a color red or black >    " color
                if [ "$color" != "red" -a "$color" != "black"  ]; then
                    echo "Choose a correct color"
                else
                    break
                fi
            done
            while true; do
                read -p "Choose how much you want to wager : " wager
                if [ "$wager" -gt "$yourAmount" -o "$wager" -lt 1 ]; then
                    echo -e "\nPlease choose a correct amount\nYour amount : $yourAmount"
                else
                    break
                fi
            done
            yourAmount=$((yourAmount - wager))
            echo -e "Spinning the wheel"
            landedValue=$(shuf -i 0-36 -n 1)
            if [ "$landedValue" -eq "$choice" ]; then
                echo "Congratulations! You won $((wager*2))! "
                yourAmount=$((yourAmount + wager*2))
            else
                echo "The number landed on was $landedValue and your choice was $choice"
            fi
            if [ "$yourAmount" -eq 0 ]; then
                read -p "Your amount is 0, keep playing? (y/n)   " answer
                if [ "$answer" == "y" ]; then
                    echo "Adding 100 to your account"
                    yourAmount=$((yourAmount+100))
                else
                    echo "Exiting program"
                    exit 0
                fi
            else
                echo -e "\nYour amount is : $yourAmount"
            fi
        done
    else
        echo "Exiting casino!"
        exit 1
    fi
done
