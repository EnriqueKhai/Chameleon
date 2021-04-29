%% Program variables.
clc, clear;

modes = [
    "1) LSB encode"
    "2) LSB decode"
];

num_modes = size(modes, 1);

%% Prompt user for mode of operation.

fprintf("Modes available:\n");

% Print available modes.
for i = 1 : num_modes
    fprintf("%s\n", modes(i));
end

fprintf("\n");

mode = -1;

% Prompt user for desired mode.
while ~(1 <= mode && mode <= num_modes)
    mode = input("Run steganography in mode: ");
end

fprintf("\n\n");

%% Mode 1: LSB encode.
if mode == 1
    fprintf("Mode 1: LSB Encode\n");
    fprintf("------------------\n");
    
    png_filename = "";
    bin_filename = "";
    
    % Prompt user for PNG file.
    while ~isfile(png_filename)
        png_filename = input("PNG file: ", "s");
    end
    
    % Prompt user for binary file.
    while ~isfile(bin_filename)
        bin_filename = input("bin file: ", "s");
    end
    
    fprintf("\n");
    
    % Load files onto stack.
    IMG = imread(png_filename);
    bin_fd = fopen(bin_filename, "r");
    
    bin_data = fread(bin_fd);
    bin_data = bin_data.';
    
    % Construct payload.
    num_bytes = size(bin_data, 2);
    
    head = serialize(num_bytes, 64);
    body = serialize(bin_data , 8);
    
    payload = [head, body];
    
    % Encode binary file in PNG image.
    fprintf("Encoding the binary file in the PNG image...");
    
    MOD_IMG = lsb_encode(IMG, payload);
    
    fprintf(" done!\n");
    
    % Save modified image.
    fprintf("Saving the modified image as modified.png...");
    
    imwrite(MOD_IMG, "modified.png");
    
    fprintf(" done!\n\n");
end

%% Mode 2: LSB decode.
if mode == 2
    fprintf("Mode 2: LSB Decode\n");
    fprintf("------------------\n");
end













