function guess = getValidInput(words)
    % Function to check whether the user gave a valid input which has to be
    % a 5 letter and valid word, while checking if they asked for a hint or
    % help on how to play the game

    % Flag to see whether the user gave a valid input
    validInput=0;
    while true
        % Gets the guess and puts it in lower case incase its typed in upper case
        guess = lower(input('Enter your guess: ', 's')); 
        % Checks if the user asks for help
        if strcmp(guess, 'help')
            % Calls the help function to help explain the code
            help();
        else
            while true
                % Checks to see if the word inputed is a 5 letter word
                if length(guess) ~= 5 
                    fprintf('Please enter a 5-letter word.\n');
                    break;
                % Makes sure its a word in the list of valid words by
                % comparing the guess to the whole list of valid words
                elseif ~strcmp(guess, words)
                    fprintf('Word not in the list. Try again.\n');
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