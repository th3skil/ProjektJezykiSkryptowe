#!/bin/bash
pink='\033[0;45m';
cyjan='\033[0;36m';
niebieski='\033[0;44m';
czerwony='\033[0;41m';
zielony='\033[032m';
NC='\033[0m';
pause() {
printf "${zielony}";
read -p "Nacisnij enter zeby kontynuowac.";
printf "${NC}";
}

menu() {
clear
printf "${cyjan}"

echo "|^^^^  MENU  ^^^^|"
echo "|________________|"
echo "| 1 - Start      |"
echo "| 2 - Informacje |"
echo "| 3 - Backup     |"
echo "| 4 - Zakoncz    |"
echo "|________________|"

read -n 1 -s wybor;
case $wybor in
"1")
 for file in "input"/*
    do
      file="${file:6}"
      python3 qsort.py "$file"
    done
    python3 raport.py;
    xdg-open Raport.html </dev/null >/dev/null 2>&1 & disown
    pause;
     menu
    ;;
"2")
    printf "${niebieski}";
        echo "ALGORYTMION 2011 zad 3";
    echo "Dany jest algorytm szybkiego sortowania z wyborem elementu środkowego w
połowie sortowanego ciągu liczb. Program sortuje liczby generowane losowo z przedziału
od 0 do n-1 , których jest dokładnie n różnych liczb. Należy napisać program, który czyta
ze zbioru 'dane3.txt' wymiar zadania i zapisuje w zbiorze 'wynik.3' wszystkie ciągi
liczbowe, dla których algorytm działa w czasie O(n2).
Wejście.
Pierwszy i jedyny wiersz zawiera jedną dodatnią liczbę określającą wymiar zadania.
Wyjście.
Kolejne wiersze zawierają ciągi liczb oddzielone przecinkami, które dają przy szybkim
sortowaniu złożoność czasową O(n2).
).";
    printf "${pink}";
    echo "Autor Jakub Pal.";
    printf "${NC}";
    pause;
    menu;
        ;;
"3")
		echo
		if [ ! -d "backups" ];
		then
			mkdir backups
		fi

		printf -v date '%(%d-%m-%Y-%H:%M:%S)T\n' -1
		mkdir backups/$date

		cp Raport.html backups/$date
    printf "${czerwony}";
	  echo " Backup został utworzony"
		pause;
		menu;
		;;
"4")
    clear;
        exit;
        ;;
*)
    echo "Nie znam polecenia";
    pause;
    menu;
esac;
};


menu