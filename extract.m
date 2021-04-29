function payload = extract( IMG, from, to )
    [height, width, depth] = size(IMG);
    
    payload = zeros(1, to - from + 1);
    
    pos = 0;
    
    for h = 1 : height
        for w = 1 : width
            for d = 1 : depth
                pos = pos + 1;
                
                if from <= pos && pos <= to
                    bit_val = bitand(IMG(h, w, d), 1);
                    payload(pos - from + 1) = bit_val;
                end
                
                if pos == to
                    return
                end
            end
        end
    end
end

