% Creating a wordle game in matlab
clc 

% Assuming at first the user wants to play
playAgain = true;

% Change this value when the user does win
winGame = false;

while playAgain 
    clc
    % Introduction
    introduction();
    
    % Asking user for mode so that they can customise or play Wordle the
    % standard mode
    [remainingGuesses, gameMode]=modeSelect( );
    
    % If the game is set to 2 player mode, asks for the 2 players for their
    % names and assign them to player 1 and player 2 accordingly
    if gameMode == 2
        playerOneName = input("What is the name of the first person playing the game: ", "s");
        playerTwoName = input("What is the name of the second person playing the game: ", "s");    
        fprintf("Both %s and %s will be getting the same word in the wordle in this game", playerOneName, playerTwoName);
    end
    
    fprintf('\nThe way to play this game is really simple, just start guessing the 5 letter word :) \n')
    
    % Starting placeholder to let the user know how many letters
    cprintf('blue', '_ _ _ _ _ \n');
    
    % Getting text file for 5 letter words acceptable for Wordle
    [words]=wordFileGet();
    
    % Randomises the word chosen as the Wordle
    word=words(randi(numel(words)));
    
    % Intialises storage for word but as a character
    wordCharacter=[];
    
    % Puts the word into a vector as characters to be used later for giving
    % feedback to the user and checking their guess against each character in
    % the word
    wordCharacter=[char(word)];
    
    % Boolean value for whether the value has won the game yet
    winGame=false;
    
    % Initalising storage for the amount of guesses taken by the user
    guessNumber=0;
    
    % Loops for amount of chosen guesses while checking if the player has won
    % or lost
    while remainingGuesses > 0 && winGame==false
        % Keeping track of the guess number and the amount of remaning guesses
        guessNumber=guessNumber+1;
        remainingGuesses=remainingGuesses-1;
    
        % If the game is in single player mode
        if gameMode == 1
            
            % Ensure the input is valid, and check whether they asked for a
            % hint/help
            guess=getValidInput(words);
        
            % Checks if the player has won by guessing the correct word
            [winGame] = playerWonCheck(guess, word, guessNumber);
            
            % Gives the Player feedback if they have not won the game
            playerFeedback(winGame, wordCharacter, guess, remainingGuesses);
    
        % If in Multiplayer (2 player) mode
        else
            % Player 1 guesses 
            player1Guess=getValidInputP1(words, playerOneName);
    
            % Checking whether player 1 has won the game
            [winGame] = player1WonCheck(player1Guess, word, guessNumber, playerOneName);
            
            % If player 1 has not won the game, give them feedback
            player1Feedback(winGame, wordCharacter, player1Guess, remainingGuesses);
            
            % Only gives the 2nd player a turn if the first player has not
            % won the game yet
            if winGame == false
                % Let player 2 guess after player 1 if they have not won
                player2Guess=getValidInputP2(words, playerTwoName);
                
                % Checks whether player 2 has won the game
                [winGame] = player2WonCheck(player2Guess, word, guessNumber, playerTwoName);
        
                % Giving player 2 feedback if they have not won the game
                player2Feedback(winGame, wordCharacter, player2Guess, remainingGuesses);
            end
        end
        
    end
    
    
    if gameMode==1
        % If the player in single player mode hasnt won the game go through the below if statement
        if winGame == false
            % Tells the user they lost the game
            fprintf('You have no more tries left, you have lost the game :( \n');
            fprintf('The correct word was: %s', word{1}); 
            fprintf('\n');
        end
    else
        % If the players in 2 player mode havent won the game go through the below if statement
         if winGame == false
            % Tells the two players they lost the game
            fprintf('Both of %s and %s could not guess the correct word in the amount of given guesses\n', playerOneName, playerTwoName);
            fprintf('So both lost the game');
            fprintf('\n');
            fprintf('The correct word was: %s', word{1}); 
            fprintf('\n');
         end

    end
    % Ask the user if they want to play again
    userPlayAgain=lower(input("\n If you would like to play again type 'yes': ", "s"));
    
    % If they dont want to play again, thank the user and change playAgain
    % to false so that the loop doesnt continue
    if ~strcmp(userPlayAgain, 'yes')
        playAgain=false;
        fprintf('\n Thanks for playing, game is now ending :) \n');
    end
    fprintf('\n')
end