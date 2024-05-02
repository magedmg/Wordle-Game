function [words]=wordFileGet()
    % List of words in a cell array as normal array didnt work and would mean
    % looping through the whole array each time to make sure the word exists
    % and increase time and lagginess of the application
    wordFileName = 'wordlist.txt';  % Name of your word list file
    fileID = fopen(wordFileName, 'r');
    words = textscan(fileID, '%s');
    % Extract the cell array of words
    words = words{1}; 
end