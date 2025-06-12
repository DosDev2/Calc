#!/bin/bash
#  -----------------------------------------------
# │                                               │
# │  Calc - Una calculadora Básica e Interactiva  │
# │  by @Dos                                      │
# │                                               │
#  -----------------------------------------------

# Colores
green='\e[32m'
red='\e[31m'
blue='\e[34m'
whiteN='\e[1;37m'
purple='\e[35m'
reset='\e[0m'

# Función sumar
sumar() {
echo -n "Operando 1: "
read num1
echo -n "Operando 2: "
read num2

if [ -z "$num1" ] || [ -z "$num2" ]; then
    echo  -e "${red}✘${reset} Los operandos son incorrectos."
    echo -ne "Presione ${green}Enter${reset} para volver a operar... "
    read enter
    sumar
else
    res=$(bc<<<"scale=2; $num1 + $num2")
    echo -e "${green}➜ ${whiteN}$res${reset}"
fi

# Volver a operar
echo -n "Desea sumar otra cantidad? (s/n): "
read opt2

if [ "$opt2" == "s" ]; then
    sumar
elif [ "$opt2" == "n" ]; then
    echo "Thanks!"
else
    echo "Ok..."
fi
}

# Función restar
restar(){
echo -n "Operando 1: "
read num1
echo -n "Operando 2: "
read num2

# Mostrar resultado
if [ -z "$num1" ] || [ -z "$num2" ]; then
    echo  -e "${red}✘${reset} Los operandos son incorrectos."
    echo -ne "Presione ${green}Enter${reset} para volver a operar... "
    read enter
    restar
else
    res=$(bc<<<"scale=2; $num1 - $num2")
    echo -e "${green}➜ ${whiteN}$res${reset}"
fi

# Volver a operar
echo -n "Desea restar otra cantidad? (s/n): "
read opt2

if [ "$opt2" == "s" ]; then
    restar
elif [ "$opt2" == "n" ]; then
    echo "Thanks!"
else
    echo "Ok..."
fi
}

# Función multiplicar
multiplicar(){
echo -n "Operando 1: "
read num1
echo -n "Operando 2: "
read num2

# Mostrar resultado
if [ -z "$num1" ] || [ -z "$num2" ]; then
    echo  -e "${red}✘${reset} Los operandos son incorrectos."
    echo -ne "Presione ${green}Enter${reset} para volver a operar... "
    read enter
    multiplicar
else
    res=$(bc<<<"scale=2; $num1 * $num2")
    echo -e "${green}➜ ${whiteN}$res${reset}"
fi

# Volver a operar
echo -n "Desea multiplicar otra cantidad? (s/n): "
read opt2

if [ "$opt2" == "s" ]; then
    multiplicar
elif [ "$opt2" == "n" ]; then
    echo "Thanks!"
else
    echo "Ok..."
fi
}

# Función dividir
dividir(){
echo -n "Operando 1: "
read num1
echo -n "Operando 2: "
read num2

# Mostrar resultado
if [ -z "$num1" ] || [ -z "$num2" ]; then
    echo  -e "${red}✘${reset} Los operandos son incorrectos."
    echo -ne "Presione ${green}Enter${reset} para volver a operar... "
    read enter
    dividir
elif [ "$num2" -eq 0 ]; then
    echo -e "${red}✘${reset} Error matemático. No se puede dividir entre 0."
    echo -ne "Presione ${green}Enter${reset} para volver a operar... "
    read enter
    dividir
else
    res=$(bc<<<"scale=2; $num1 / $num2")
    echo -e "${green}➜ ${whiteN}$res${reset}"
fi

# Volver a operar
echo -n "Desea dividir otra cantidad? (s/n): "
read opt2

if [ "$opt2" == "s" ]; then
    dividir
elif [ "$opt2"  == "n" ]; then
    echo "Thanks!"
else
    echo "Ok..."
fi
}

# Menú de opciones
menu() {
  echo "┌────────────────────┐"
  echo "│ Calculadora [+/-]  │"
  echo "└────────────────────┘"
  echo "│  1. Sumar          │"
  echo "│  2. Restar         │"
  echo "│  3. Multiplicar    │"
  echo "│  4. Dividir        │"
  echo "│  0. Salir          │"
  echo "└────────────────────┘"
  echo
  echo -ne "${blue} > ${reset}"
  read opt

  case $opt in 
    1) # Envía a la función suma
    sumar
    ;;
    2) # Envía a la función resta
    restar
    ;;
    3) # Envía a la función multiplicar
    multiplicar
    ;;
    4) # Envía a la función dividir
    dividir
    ;;
    0) # Sale del programa
    exit 0
    ;;
    *) # Error
    echo -e "${red}✘${reset} La opción no existe. Verifique la opción."
    sleep 0.1; menu
    ;;
  esac
}

# Inicia el programa
menu
