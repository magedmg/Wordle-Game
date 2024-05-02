function [remainingGuesses, gameMode]=modeSelect()
    % Function to let user pick between single and multiplayer mode as well
    % as how many turns they want

    % Remaining guesses is 0 as the user can change this further down if
    % they choose custom mode
    remainingGuesses=0;
    
    % While statement until the user chooses a mode
    while true
        % Asks the user whether they are playing in single or 2 player mode
        playerMode = input('Choose the number of players that will be playing the game (1 - Single Player, 2 - 2 player mode): ', 's');
        switch playerMode
        % If the user types 1 for single player mode
        case '1' 
            % Changes the gameMode to single player mode
            gameMode=1;
             % Exit the loop
            break; 
        % If the user types 2 for 2 player mode mode
        case '2' 
            % 2 Player mode
            gameMode=2;
             % Exit the loop
            break;
        % If the user does not enter a valid mode selection 
        otherwise
            disp('Invalid mode selection, please enter 1 or 2 for single or 2 player mode');
        end
    end
    % While statement until the user chooses how many attempts they would
    % like
    while true
        % Ask the user whether they want 6 turns or want to input their own
        % custom amount of attempts
        attemptMode = input('Choose the amount of turns | 1 - Standard (6 turns) or 2 - Custom (custom amount of turns): ', 's');
        % If the user Chooses a custom amount go through the below
        % statement 
        if strcmp(attemptMode, '2')
            % Input Sanitation for the custom attempts
            while true
                % Asks user for the custom attempt
                customAttempts = input('Enter the maximum number of attempts: ');
                % Checks that the input from the user is a number, and is
                % greater than 0, and that it is divisible by one (so that
                % it is a whole number)
                if isnumeric(customAttempts) && customAttempts > 0 && mod(customAttempts, 1)== 0
                    % Valid input give it to the remaining guesses
                    remainingGuesses = customAttempts; 
                    % Exit the loop
                    return;
                else
                    % Invalid input
                    fprintf("\n Invalid input, please enter a positive whole number \n");
                end
            end
        % Standard mode
        elseif strcmp(attemptMode, '1')
            % User has 6 attempts, valid input
            remainingGuesses = 6; 
            % Exit loop
            break;
        % Invalid input
        else
            disp('Invalid mode selection. Enter 1 or 2 ');
        end
    end
end