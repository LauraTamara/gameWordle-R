###This game was coded by Laura Tamara Mena, alias @MamaraTena, with initial inspiration 
###from @kjytay and his fabulous work on 'R Bloggers'. Thank you.

##Pending to add hard mode: any revealed hints must be used in all subsequent guesses.

library(readxl)

#Chooses random word
ChooseWord <- function(){
  #Chooses randomly a word from a data base and then converts it into a vector.
  filePath1 <- "/Users/khadijah/CODE PROYECTS/R PROYECTS/WORDLE/word_data_base.xls"
  wordDataBase1 <- toupper(unlist(read_xls(filePath1, 
                                          col_names = F,
                                          .name_repair = "unique_quiet")))
  
  filePath2 <- "/Users/khadijah/CODE PROYECTS/R PROYECTS/WORDLE/wordDataBase_google-10000-english.xls"
  wordDataBase2 <- toupper(unlist(read_xls(filePath2, 
                                           col_names = F,
                                           .name_repair = "unique_quiet")))
  wordDataBase2 <- sort(wordDataBase2[nchar(wordDataBase2) == 5])
  
  
  wordDataBase <- unique(c(wordDataBase1, wordDataBase2))
  randomWord <- sample(wordDataBase, size = 1, replace = T)
  return(randomWord)
}

#Detect mistakes by the user when submitting an answer.
ApproveInput <- function(guess, guessVec, answerLength, wordDataBase, controlVar){
  
  filePath <- "/Users/khadijah/CODE PROYECTS/R PROYECTS/WORDLE/word_data_base.xls"
  wordDataBase <- toupper(unlist(read_xls(filePath, 
                                          col_names = F,
                                          .name_repair = "unique_quiet")))
  #Check characters
  for (i in 1:answerLength) {
    if (!(guessVec[i] %in% LETTERS)){
      errorChar <- print("Your answer must only include letters")
      controlVar <- F
    }
  }
  
  #Checks Length
  if (nchar(guess) != answerLength){
    if (nchar(guess) < answerLength){
      errorLengthL <- print("Your answer is shorter than 5 letters")
      controlVar <- F
    }
    if (nchar(guess) > answerLength) {
      errorLengthM <- print("Your answer is longer than 5 letters")
      controlVar <- F
    }
  }
  
  #Checks for a valid word
  if(controlVar == T){
    if(!(guess %in% wordDataBase)){
      errorWord <- print("Your answer is not a real word, if you really think this is wrong tell Tamara to add the word to the database. Meanwhile, try with a differnt word.")
      controlVar <- F
    }
  }
  
  return(controlVar)
}


#Compares the user's guess and the correct answer
CheckAnswer <- function(guessVec, wordDay){
  gradeVec <- c(rep("-", 5))
  answerLength <- length(wordDay)
  for (i in 1:answerLength){
    if(guessVec[i] == wordDay[i]) {
      gradeVec[i] <- "G"
      wordDay[i] <- "-"
    }
  }
  for (i in 1:answerLength){
    if(gradeVec[i] != "G"){
      if(guessVec[i] %in% wordDay){
        gradeVec[i] <- "Y"
        wordDay[match(guessVec[i], wordDay)] <- "-"
      }
    }
  }
  return(gradeVec)
}

#Main Game
PlayGame <- function(randomWord, guessNo = 0, answerLength = 5){
  
  randomWord <- ChooseWord()
  wordDay <- strsplit(randomWord,"") [[1]]
  
  guessNo = guessNo + 1
  lettersLeft <- LETTERS #Display letters left
  guessVec <- c(rep("-", 5))
  
  #Condition to not lose
  while (guessNo < 6) {
    #Asks the user to submit a word and converts it to a vector.
    print(paste(c("Letters left: ", lettersLeft), collapse = " "))
    guess <- toupper(readline(paste("Make you guess number", guessNo, ": ")))
    guessVec <- unlist(strsplit(guess, ""))
    
    #Evaluates
    ###Ends the game if the user's guess is identical to the Word of the Day.
    if(identical(guessVec, wordDay)){
      print("Wow, YOU WON") 
      return()
    }
    else{
      #Checks input
      controlVar <- T
      controlVar <- ApproveInput(guess, guessVec, answerLength, wordDataBase, controlVar)
      while(controlVar == F){
        guess <- toupper(readline(paste("Make you guess number", guessNo, ": ")))
        controlVar <- T
        guessVec <- unlist(strsplit(guess, ""))
        controlVar <- ApproveInput(guess, guessVec, answerLength, wordDataBase, controlVar)
      }
      
      #Evaluates answer
      gradeVec <- CheckAnswer(guessVec, wordDay)
      guessNo = guessNo + 1
      
      #Updates letters left, prints user's guess in better format and its and grade.
      lettersLeft <- setdiff(lettersLeft, guessVec)
      print(paste(strsplit(guess, "") [[1]]))
      print(gradeVec)
    }
  }
  if (guessNo == 6) {
    print(paste("No more chances left. You have lost. The word was:", randomWord))
  }
}

PlayGame()


