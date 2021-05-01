function MOD_IMG = embed( IMG , payload )
%
% EMBED embeds the serialized PAYLOAD in IMG,
%     returning the modified image as MOD_IMG.
% 
%     For each of the n bits in PAYLOAD, EMBED
%     sets the least-significant bit (LSB) of
%     the n-th pixel in IMG to the same value
%     and stores the result as the n-th pixel
%     of MOD_IMG.
% 
% EXAMPLE:
% 
%     Let PAYLOAD = [1 0 0 ... ].
% 
%     Let IMG = [
%         (10000000)b, (00001111)b, (11001110)b, ...
%     ].
% 
%     Then, EMBED sets the LSB of the first,
%     second and third pixel in IMG to 1, 0,
%     and 0 respectively, storing these new
%     pixels in MOD_IMG.
% 
%     Then, MOD_IMG = [
%         (10000001)b, (00001110)b, (11001110)b, ...
%                 -            -            -
%     ].
%
% SEE ALSO: EXTRACT

    %% Encode payload in the PNG image.
    N = size(payload, 2);
    
    MOD_IMG = IMG;
    
    [height, width, depth] = size(MOD_IMG);
    
    pos = 0;
    
    for h = 1 : height
        for w = 1 : width
            for d = 1 : depth
                pos = pos + 1;
                
                byte_val = MOD_IMG(h, w, d);
                
                if payload(pos) == 0
                    byte_val = bitor(byte_val, 1);
                    byte_val = bitxor(byte_val, 1);
                elseif payload(pos) == 1
                    byte_val = bitor(byte_val, 1);
                end
                
                MOD_IMG(h, w, d) = byte_val;
                
                if pos == N
                    return
                end
            end
        end
    end
end

