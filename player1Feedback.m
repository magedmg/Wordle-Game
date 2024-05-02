function player1Feedback(winGame, wordCharacter, player1Guess, remainingGuesses)
    % Function to give feedback to Player 1 if they have yet to win the
    % game

    % Checks if the player has won the game or now
    if winGame ~= true
        % Feedback for each letter
        fprintf('Feedback: ');
        % Loop for length of the word but in characters
        for characterCheck = 1:length(wordCharacter)
            % Takes each letter of the word
            letter = wordCharacter(characterCheck);
            % If its exactly in the correct postion in both the guess 
            if player1Guess(characterCheck) == letter
                % Correct letter in the correct position in colour as plain
                % text
                cprintf('text', '%s ', letter); 
            % If the letter is present in the word but not in the right
            % postion
            elseif any(player1Guess==letter)
                % Place it in the right position and print it as blue to
                % signal that it was in the wrong postion in the guess but
                % was moved to the right position
                cprintf('hyper', '%s ', letter); 
            else
                % Placeholder for incorrect letters
                fprintf('_ '); 
            end
        end
        fprintf('\n');
        % Tells the user how many guesses they have left
        fprintf('Incorrect, you have %d tries left \n', remainingGuesses);
    end
end