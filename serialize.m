function bit_array = serialize( byte_array , word_len )
%{
SERIALIZE takes in an array of bytes (possibly of
    size 1) and returns an array of bits.

    Each byte in BYTE_ARRAY is converted into a
    subarray of WORD_LEN bits. Specifically , the
    subarray corresponding to each byte is the re-
    verse of said byte's binary representation.

    Consider the decimal number 11 = (1011)b. To
    convert it into a subarray of 8 bits, we first
    left pad (1011)b with zeros to make it 8 bits
    long, i.e. (00001011)b. Then, we simply rever-
    se it, i.e. (11010000)b.

    BIT_ARRAY, the return value, is simply a conc-
    atenation of all subarrays.


EXAMPLE:

    Calling serialize([2, 5], 5) returns the array
    [0 1 0 0 0 1 0 1 0 0].

    2 = ( 10)b = (00010)b.
    5 = (101)b = (00101)b.

    Then,   [2, 5] === [(00010)b, (00101)b].

    Reversing each individual subarray in-place,
    we have [2, 5] === [(01000)b, (10100)b].

    Now, we concatenate (01000)b and (10100)b to
    get the return value [0 1 0 0 0 1 0 1 0 0].

%}
    num_bytes = size(byte_array, 2);
    bit_array = zeros(1, num_bytes * word_len);
    
    for i = 1 : num_bytes
        offset = word_len * (i - 1);
        curr_byte = byte_array(i);
        
        for j = 1 : word_len
            lsb = bitand(curr_byte, 1);

            bit_array(j + offset) = lsb;

            curr_byte = bitshift(curr_byte, -1);
        end
    end
end

