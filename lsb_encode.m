function MOD_IMG = lsb_encode( IMG , payload )
%{
LSB_ENCODE embeds the serialized payload in the
    target image.

    For each of the n-th bit in PAYLOAD, LSB_E
    -NCODE sets the least-significant bit (LSB)
    of the n-th pixel in IMG to the same value.

EXAMPLE:

    Let PAYLOAD = [1 0 0].

    Let IMG(1 : 3) = [
        (10000000)b, (00001111)b, (11001110)b
    ].

    Then, LSB_ENCODE sets the LSB of the first,
    second and third pixel in IMG to 1, 0, and
    0 respectively.

    Then, MOD_IMG(1 : 3) = [
        (10000001)b, (00001110)b, (11001110)b
                -            -            -
    ].

    LSB(IMG(1)) changed from 0 to 1.
    LSB(IMG(2)) changed from 1 to 0.
    LSB(IMG(3)) remains unchanged at 0.

%}
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

