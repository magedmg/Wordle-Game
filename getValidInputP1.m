function [player1Guess] = getValidInputP1(words, playerOneName)
    % Function to check whether Player 1 gave a valid input which has to be
    % a 5 letter and valid word, while checking if they asked for a hint or
    % help on how to play the game

    % Boolean value to see whether the user gave a valud input
    validInput=0;
    while true
        % Print the players name before hand so that they know that it is
        % their turn
        fprintf("%s ", playerOneName);
        % Gets the guess and puts it in lower case incase its typed in upper case
        player1Guess = lower(input(' | Enter your guess: ', 's')); 
        % Checks if the user asks for help
        if strcmp(player1Guess, 'help')
            % Calls the help function to help explain the code
            help();
        else
            while true
                % Checks to see if the word inputed is a 5 letter word
                if length(player1Guess) ~= 5 
                    fprintf('%s please enter a 5-letter word.\n', playerOneName);
                    break;
                % Makes sure its a word in the list of valid words by
                % comparing the guess to the whole list of valid words
                elseif ~strcmp(player1Guess, words)
                    fprintf('The word is not in the list %s. Try again and guess a real word.\n', playerOneName);
                    break;
                % The guess is valid
                else
                    % Changes the flag to 1
                    validInput=1;
                    % Valid guess, exit the loop
                    break;
                end
            end
            % If the flag is 1 (true) then the guess is valid
            if (validInput ==1)
                % Exists the loop
                break;
            end
        end
    end
end