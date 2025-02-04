# gameWordle-R
Contiene el código para jugar Wordle en R.  

Este programa se divide en 4 funciones:
1. ChooseWord = De 3 basde de datos (BDD) diferentes, se genera una sola. Se filtran los resultados a palabras que contengan 5 letras, acorde a las reglas del juego, y se selecciona una palabra al azar que se convierte en la "respuesta".
2. ApproveInput = Detecta errores que el usuario pueda cometer al emitir un "intento". Como incluir caracteres que no sean letras, no usar una palabra real (limitado a la BDD), o emitir una palabra sin el largo requerido. 
3. CheckAnswer = Compara el intento del usuario con la respuesta del juego y lo evalúa según las reglas del juego. Letra gris para una letra fuera de la respuesta, amarilla para una letra fuera de lugar, verde para la letra que está en la posición correcta. 
4. PlayGame = Cuenta el número de intentos y finaliza el juego después de x intentos fallidos. Imprime el intento del usuario, las letras del alfabeto que no se han utilizado, la evaluación y el conteo de los intentos. En caso de haber error en el intento del usuario el juego no continúa a menos que se emita un intento válido.

Este programa fue inspirado primeramente por @kjytay y su "Playing Wordle in R" en R bloggers, escrito exclusivamente por Laura Tamara ML.
Un trabajo no terminado, hay mucho que mejorar. Falta incluir el modo de juego 'difícil' para que los intentos deban incluir la info proveída en la evaluación previa, completar la base de datos, y qué no. 

------
Contains the code to play Wordle in R

This program is divided into 4 functions:
1. ChooseWord = A single word is generated from three databases (DB). According to the game's rules, the results are filtered to words containing five letters, and a random word is selected to become the "answer."
2. ApproveInput = Detects errors the user may make when issuing an "attempt". Such as including characters that are not letters, not using a real word (limited to the DB), or issuing a word without the required length.
3. CheckAnswer = Evaluates the user's attempt. A "-" for the letters that are not in the answer, a "Y" for a letter out of place, and a "G" for the letter in the correct position.
4. PlayGame = Counts the number of attempts and ends the game after x failed attempts. Prints the user's attempt, the letters of the alphabet that have not been used, the evaluation, and the count of the attempts. In case of an error in the user's attempt the game does not continue unless a valid attempt is issued.

This program was first inspired by @kjytay and his "Playing Wordle in R" on R bloggers, written exclusively by Laura Tamara ML.
This is a work in progress, there is much to improve. Implementing a 'hard' game mode is in my plans, so attempts include the previous evaluation, completing the database, and whatnot.
