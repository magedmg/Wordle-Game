function [winGame] = player2WonCheck(player2Guess, word, guessNumber, playerTwoName)
    % Function to check whether or not Player 1 has won the game by
    % guessing the correct word
    % Check if the player won through string comparing Player 1's guess and
    % the word
    if strcmp(player2Guess, word)
        % If they win tell them they won and how many tries it took them
        fprintf('%s won and guessed the word in %d tries!\n', playerTwoName, guessNumber);
        % Change the wingame condition to true to not repeat the loop or
        % the if statement for if the user loses by not having any more
        % guesses
        winGame=true;
        % End the game by breaking out of the while loop
        return;
    end
    winGame = false;
    return;
end