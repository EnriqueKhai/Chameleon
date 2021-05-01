%% Program variables.
clc, clear;

modes = [
    "LSB encode"
    "LSB decode"
];

num_modes = max(size(modes));

% Constants.
HEAD_LEN = 64;
BYTE_LEN = 8;

STEG_IMG = "steg.png";

%% Prompt user for mode of operation.

fprintf("Modes available:\n");

% Print available modes.
for i = 1 : num_modes
    fprintf("%d) %s\n", i, modes(i));
end

fprintf("\n");

mode = -1;

% Prompt user for desired mode.
while ~(1 <= mode && mode <= num_modes)
    mode = input("Run steganography in mode: ");
end

fprintf("\n\n");

%% Operation: encode.
if mode == 1
    fprintf("Mode %d: %s\n", mode, modes(mode));
    fprintf("------------------\n");
    
    img_filename = "";
    bin_filename = "";
    
    % Prompt user for image filename.
    while ~isfile(img_filename)
        img_filename = input("img file: ", "s");
    end
    
    % Prompt user for binary filename.
    while ~isfile(bin_filename)
        bin_filename = input("bin file: ", "s");
    end
    
    fprintf("\n");
    
    % Load files onto stack.
    img = imread(img_filename);
    bin_fd = fopen(bin_filename, "r");
    
    bin_data = fread(bin_fd);
    fclose(bin_fd);
    
    % Construct payload.
    num_bytes = max(size(bin_data));
    
    head = serialize(num_bytes, HEAD_LEN);
    body = serialize(bin_data , BYTE_LEN);
    
    payload = [head, body];
    
    % Embed binary file in image.
    fprintf("Embedding binary file in image...");
    
    mod_img = embed(img, payload);
    
    fprintf(" done!\n");
    
    % Save modified image.
    fprintf("Saving modified image as %s...", STEG_IMG);
    
    imwrite(mod_img, STEG_IMG);
    
    fprintf(" done!\n\n");
end

%% Operation: decode.
if mode == 2
    fprintf("Mode %d: %s\n", mode, modes(mode));
    fprintf("------------------\n");
    
    img_filename = "";
    out_filename = "";
    
    % Prompt user for image filename.
    while ~isfile(img_filename)
        img_filename = input("img file: ", "s");
    end
    
    % Prompt user for output filename.
    out_filename = input("out file: ", "s");
    
    fprintf("\n");
    
    % Load files onto stack.
    img = imread(img_filename);
    
    % Extract payload from image.
    fprintf("Extracting binary file from image...");
    
    head = extract(img, 1, HEAD_LEN);
    num_bytes = deserialize(head, HEAD_LEN);
    
    from = HEAD_LEN + 1;
    to   = from + (num_bytes * 8 - 1);
    
    body = extract(img, from, to);
    bin_data = deserialize(body, BYTE_LEN);
    
    fprintf(" done!\n");
    
    % Recover original binary file.
    fprintf("Writing binary file to %s...", out_filename);
    
    bin_fd = fopen(out_filename, "w");
    
    fwrite(bin_fd, bin_data);
    
    fclose(bin_fd);
    
    fprintf(" done!\n\n");
end













