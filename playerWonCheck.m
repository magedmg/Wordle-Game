function [winGame] = playerWonCheck(guess, word, guessNumber)
    % Function to check whether or not the player has won the game by
    % guessing the correct word
    % Check if the player won through string comparing the user's guess and
    % the word
    if strcmp(guess, word)
        % If they win tell them they won and how many tries it took them
        fprintf('You won and guessed the word in %d tries!\n', guessNumber);
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