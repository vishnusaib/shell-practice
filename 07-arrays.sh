#!/bin/bash

Movies=("Inception" "The Matrix" "Interstellar" "The Godfather")
echo "Movies in the array:${Movies[0]}"
# To print a specific element in the array, use the index as shown above.

echo "All movies in the array : ${Movies[@]}"
# To print all elements in the array, use the @ symbol."

echo "All movies in the array : ${Movies[$1]}"

echo "All movies in the array : ${Movies[@]/n}"
# To print all elements in the array with a new line, use the @ symbol and add /n at the end.
