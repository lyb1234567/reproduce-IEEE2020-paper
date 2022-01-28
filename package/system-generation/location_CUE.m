function coordinate=location_CUE(CUE,CUE_coordinate)
for k=1:size(CUE,1)
    if CUE(k,1)==CUE_coordinate(1,1) && CUE(k,2)==CUE_coordinate(1,2)
        coordinate=k;
        break;
    end
end
end
