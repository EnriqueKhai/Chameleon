function byte_array = deserialize( bit_array , word_len )
    num_bytes  = size(bit_array, 2) / word_len;
    byte_array = zeros(1, num_bytes);
    
    for i = 1 : num_bytes
        offset = word_len * (i - 1);
        
        for j = 1 : 8
            curr_bit = bit_array(j + offset);
            
            partial_value = bitshift(curr_bit, j - 1);
            
            byte_array(i) = byte_array(i) + partial_value;
        end
    end
end

