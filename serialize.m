function bit_array = serialize(word_array, word_len)
%
% SERIALIZE takes in an array of words (possibly of
%     size 1), each of length WORD_LEN bits, and
%     returns an array of bits.
% 
%     Here, a "word" refers to an integer of
%     WORD_LEN bits. To serialize an array of bytes,
%     call serialize() with WORD_LEN = 8 as a byte
%     can be represented as an 8-bit integer.
% 
%     Each word in WORD_ARRAY is converted into a
%     subarray of WORD_LEN bits. Specifically , the
%     subarray corresponding to each word is the re-
%     verse of said word's binary representation.
% 
%     Consider the decimal number 11 = (1011)b. To
%     convert it into a subarray of 8 bits, we first
%     left pad (1011)b with zeros to make it 8 bits
%     long, i.e. (00001011)b. Then, we simply rever-
%     se it, i.e. (11010000)b.
% 
%     BIT_ARRAY, the return value, is simply a conc-
%     atenation of all subarrays.
% 
% 
% EXAMPLE:
% 
%     Assume we are trying to serialize 5-bit words.
% 
%     Calling serialize([2, 5], 5) returns the array
%     [0 1 0 0 0 1 0 1 0 0].
%
%     First, we pad both 2 and 5 to a length of 5.
% 
%     2 = ( 10)b = (00010)b.
%     5 = (101)b = (00101)b.
% 
%     Then,   [2, 5] === [(00010)b, (00101)b].
% 
%     Reversing each individual subarray in-place,
%     we have [2, 5] === [(01000)b, (10100)b].
% 
%     Now, we concatenate (01000)b and (10100)b to
%     get the return value [0 1 0 0 0 1 0 1 0 0].
%
%
% SEE ALSO: DESERIALIZE.

    num_words = max(size(word_array));
    bit_array = zeros(1, num_words * word_len);
    
    for i = 1 : num_words
        offset = word_len * (i - 1);
        curr_word = word_array(i);
        
        for j = 1 : word_len
            lsb = bitand(curr_word, 1);

            bit_array(j + offset) = lsb;

            curr_word = bitshift(curr_word, -1);
        end
    end
end

