function MOD_IMG = lsb_encode( IMG , payload )
    %% Encode payload in the PNG image.
    N = size(payload, 2);
    
    MOD_IMG = IMG;
    
    [height, width, depth] = size(MOD_IMG);
    
    pos = 0;
    
    for i = 1 : height
        for j = 1 : width
            for k = 1 : depth
                pos = pos + 1;
                
                byte_val = MOD_IMG(i, j, k);
                
                if payload(pos) == 0
                    byte_val = bitor(byte_val, 1);
                    byte_val = bitxor(byte_val, 1);
                elseif payload(pos) == 1
                    byte_val = bitor(byte_val, 1);
                end
                
                MOD_IMG(i, j, k) = byte_val;
                
                if pos == N
                    return
                end
            end
        end
    end
end

