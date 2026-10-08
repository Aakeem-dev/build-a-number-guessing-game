#!/bin/bash
#psql variable
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#generate a random number between 1 & 1000
SECRET_NUM=$(( (RANDOM % 1000) + 1 ))
GUESS=0
NUM_GUESSES=0

#prompt for username
echo "Enter your username:"
read USER_NAME

while [[ ${#USER_NAME} -gt 22 ]]
do
  echo "Username must be 22 characters or less. Enter your username:"
  read USER_NAME
done

#get the users data
USER_DATA=$($PSQL "SELECT games_played, best_game FROM guess_game WHERE username='$USER_NAME';")

#if the user doens't exist
if [[ -z $USER_DATA ]]
then
  #Insert the new user into the database
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
  INSERTED_USER=$($PSQL "INSERT INTO guess_game (username) VALUES ('$USER_NAME');")

  # Initialize variables for a brand new user
  GAMES_PLAYED=0
  BEST_GAME=0
  
else
  #extract the data
  IFS="|" read -r GAMES_PLAYED BEST_GAME <<< "$USER_DATA"
  GAMES_PLAYED=$(echo "$GAMES_PLAYED" | xargs)
  BEST_GAME=$(echo "$BEST_GAME" | xargs)
  echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"

while [[ $GUESS -ne $SECRET_NUM ]]
do
  read GUESS

  #increment number of guesses
  (( NUM_GUESSES++ ))

  #check if input if valid integer
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi

  #if the guess is smaller...
  if [[ $GUESS -gt $SECRET_NUM ]]
  then
    echo "It's lower than that, guess again:"
  #if the guess is greater...
  elif [[ $GUESS -lt $SECRET_NUM ]]
  then
    echo "It's higher than that, guess again:"
  fi

done

echo "You guessed it in $NUM_GUESSES tries. The secret number was $SECRET_NUM. Nice job!"

#increment games played
(( GAMES_PLAYED++ ))

#if this is the users best game (or their very first game)
if [[ $BEST_GAME -eq 0 || $NUM_GUESSES -lt $BEST_GAME ]]
then
  UPDATED_BEST_GAME=$($PSQL "UPDATE guess_game SET games_played=$GAMES_PLAYED, best_game=$NUM_GUESSES WHERE username='$USER_NAME';")
else 
  UPDATED_DATA=$($PSQL "UPDATE guess_game SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USER_NAME';")

fi
