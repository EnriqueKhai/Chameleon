function bit_array = extract(IMG, from, to)
%
% EXTRACT returns the least-significant bits (LSB)
%     of the pixels in IMG, starting at pixel FROM
%     and ending at pixel TO.
%
%     These LSBs are returned as an array of bits,
%     in BIT_ARRAY.

    [height, width, depth] = size(IMG);
    
    bit_array = zeros(1, to - from + 1);
    
    pos = 0;
    
    for h = 1 : height
        for w = 1 : width
            for d = 1 : depth
                pos = pos + 1;
                
                if from <= pos && pos <= to
                    bit_val = bitand(IMG(h, w, d), 1);
                    bit_array(pos - from + 1) = bit_val;
                end
                
                if pos == to
                    return
                end
            end
        end
    end
end

