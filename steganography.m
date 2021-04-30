%% Program variables.
clc, clear;

modes = [
    "1) LSB encode"
    "2) LSB decode"
];

num_modes = max(size(modes));

% Constants.
HEAD_LEN = 64;
BYTE_LEN = 8;

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
    
    % Prompt user for PNG filename.
    while ~isfile(png_filename)
        png_filename = input("img file: ", "s");
    end
    
    % Prompt user for binary filename.
    while ~isfile(bin_filename)
        bin_filename = input("bin file: ", "s");
    end
    
    fprintf("\n");
    
    % Load files onto stack.
    IMG = imread(png_filename);
    bin_fd = fopen(bin_filename, "r");
    
    bin_data = fread(bin_fd);
    fclose(bin_fd);
    
    % Construct payload.
    num_bytes = max(size(bin_data));
    
    head = serialize(num_bytes, HEAD_LEN);
    body = serialize(bin_data , BYTE_LEN);
    
    payload = [head, body];
    
    % Encode binary file in PNG image.
    fprintf("Encoding binary file within image...");
    
    MOD_IMG = lsb_encode(IMG, payload);
    
    fprintf(" done!\n");
    
    % Save modified image.
    fprintf("Saving modified image as steg.png...");
    
    imwrite(MOD_IMG, "steg.png", "Compression", "none");
    
    fprintf(" done!\n\n");
end

%% Mode 2: LSB decode.
if mode == 2
    fprintf("Mode 2: LSB Decode\n");
    fprintf("------------------\n");
    
    png_filename = "";
    out_filename = "";
    
    % Prompt user for PNG filename.
    while ~isfile(png_filename)
        png_filename = input("img file: ", "s");
    end
    
    % Prompt user for output filename.
    out_filename = input("out file: ", "s");
    
    fprintf("\n");
    
    % Load files onto stack.
    IMG = imread(png_filename);
    bin_fd = fopen(out_filename, "w");
    
    % Extract payload from PNG image.
    fprintf("Extracting binary file within image...");
    
    head = extract(IMG, 1, HEAD_LEN);
    num_bytes = deserialize(head, HEAD_LEN);
    
    from = HEAD_LEN + 1;
    to   = from + (num_bytes * 8 - 1);
    
    body = extract(IMG, from, to);
    bin_data = deserialize(body, BYTE_LEN);
    
    fprintf(" done!\n");
    
    % Recover original binary file.
    fprintf("Writing binary file to %s...", out_filename);
    
    fwrite(bin_fd, bin_data);
    
    fclose(bin_fd);
    
    fprintf(" done!\n\n");
end













