function bit_array = extract(IMG, from, to)
%
% EXTRACT returns the least-significant bits (LSB)
%     of the pixels in IMG, starting at pixel FROM
%     and ending at pixel TO.
%
%     These LSBs are returned as an array of bits
%     in BIT_ARRAY.
%
%
% EXAMPLE:
%
%     Let IMG = [
%         (11110010)b, (10000011)b, (00000001)b, ...
%     ].
%
%     Calling EXTRACT(IMG, 1, 3) will return an
%     array of 3 bits, specifically the LSBs of
%     the first, second and third pixel in IMG.
%
%     Recall IMG = [
%         (11110010)b, (10000011)b, (00000001)b, ...
%                 _            _            _
%     ].
%
%     Then, the return value is
%
%     BIT_ARRAY = [0 1 1].
%
%
% SEE ALSO: EMBED

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

