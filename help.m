function help()
    % Help function that can be called during the valid input of the game
    % and explains the game to the user
    fprintf('--- Wordle Help ---\n');
    fprintf('Rules of the Game:\n');
    fprintf(' * You have a number of attempts to guess a secret 5-letter word.\n');
    fprintf(' * After each guess, you receive feedback if your guess is both a 5 letter word and is a valid word (so a real word) \n');
    cprintf('text', ' * Green: '); fprintf('Correct letter in the correct position.\n');
    cprintf('hyper', ' * Blue: '); fprintf('Correct letter in the wrong position.\n');
    fprintf(" * However even if its in the incorrect position, it will be moved to the correct position, but will just have a the blue colour and the underline underneath \n");
    fprintf(' * Underscore (_): Incorrect letter.\n'); 
end