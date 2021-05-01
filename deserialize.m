function word_array = deserialize(bit_array, word_len)
%
% DESERIALIZE takes in an array of bits and returns
%     an array of words (possibly of size 1), each
%     of length WORD_LEN bits.
% 
%     Here, a "word" refers to an integer of
%     WORD_LEN bits. To deserialize an array of
%     bytes, call deserialize() with WORD_LEN = 8 as
%     a byte can be represented as an 8-bit integer.
% 
%     Every WORD_LEN bits in BIT_ARRAY will be conv-
%     erted into a word and stored in WORD_ARRAY.
%     Specifically, each word is a reverse of the
%     integer described by the corresponding WORD_LEN
%     bits.
% 
%     Assume WORD_LEN = 5. If then first 5 bits in
%     BIT_ARRAY are [1 1 1 0 0], the the first word
%     is rev(11100)b = (00111)b = 7.
% 
%     WORD_ARRAY, the return value, is simply a con-
%     catenation of all words reconstructed from
%     BIT_ARRAY.
% 
% 
% EXAMPLE:
% 
%     Assume we are trying to deserialize 5-bit words.
% 
%     Let BIT_ARRAY = [0 1 0 0 0 1 0 1 0 0].
% 
%     We know that each word is 5-bits long, so there
%     must be 10 bits / 5 = 2 words inside BIT_ARRAY.
%     Specifically, the first 5 bits of BIT_ARRAY co-
%     rrespond to the first word, and the next 5 bits
%     the second word.
%
%     That is,
%
%     BIT_ARRAY = [ 0  1  0  0  0  1  0  1  0  0 ]
%                   <----------->  <----------->
%                    First word     Second word
% 
%     Then,
% 
%     WORD_ARRAY = [rev(01000)b rev(10100)b]
%                = [   (00010)b    (00101)b]
%                = [        2           5  ]
%
%
% SEE ALSO: SERIALIZE.

    num_words  = max(size(bit_array)) / word_len;
    word_array = zeros(1, num_words);
    
    for i = 1 : num_words
        offset = word_len * (i - 1);
        
        for j = 1 : word_len
            curr_bit = bit_array(j + offset);
            
            partial_value = bitshift(curr_bit, j - 1);
            
            word_array(i) = word_array(i) + partial_value;
        end
    end
end

