#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
NUMBER_OF_GUESSES=0

echo -e "\n~~~ Welcome to my secret number guessing game! ~~~\n"

USER_DATA(){
  
  SECRET_NUMBER=$[ $RANDOM % 1000 + 1 ]
  echo Enter your username:
  read USERNAME
  GET_USER_INFO=$($PSQL "SELECT * FROM user_table WHERE name = '$USERNAME'" | sed 's/|/ /g')

  if [[ -z $GET_USER_INFO ]]
  then
    INSERT_NEW_USER=$($PSQL "INSERT INTO user_table(name) VALUES('$USERNAME')")
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

  else
    echo $GET_USER_INFO | while read USERNAME GAMES_PLAYED BEST_GAME
    do
      echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
  fi
}
USER_DATA

echo -e "\nGuess the secret number between 1 and 1000:"

CHECK_GUESS(){
  
  read USER_GUESS
  NUMBER_OF_GUESSES=$[ $NUMBER_OF_GUESSES + 1 ]
  
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    echo That is not an integer, guess again:
    CHECK_GUESS
  
  else
    if [[ $USER_GUESS != $SECRET_NUMBER ]]
    then
      
      if [[ $USER_GUESS -lt $SECRET_NUMBER ]]
      then
        echo -e "\nIt's higher than that, guess again:"
        CHECK_GUESS
        
      elif [[ $USER_GUESS -gt $SECRET_NUMBER ]]
      then
        echo -e "\nIt's lower than that, guess again:"
        CHECK_GUESS
      fi
    
    else
      echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!\n"
      GET_BEST_GAME=$($PSQL "SELECT best_game FROM user_table WHERE name = '$USERNAME'")
      if [[ $NUMBER_OF_GUESSES -lt $GET_BEST_GAME ]]
      then
        UPDATE_USER_COLUMNS=$($PSQL "UPDATE user_table SET games_played = games_played + 1, best_game = $NUMBER_OF_GUESSES WHERE name = '$USERNAME'")
      else
        UPDATE_GAMES_PLAYED=$($PSQL "UPDATE user_table SET games_played = games_played + 1 WHERE name = '$USERNAME'")
      fi
    fi
  fi
}
CHECK_GUESS
