function d = point_to_line(v1,v2,CUE)
      v1(1,3)=0;
      v2(1,3)=0;
      CUE(1,3)=0;
      a = v1 - v2;
      b = CUE- v2;
      d = norm(cross(a,b)) / norm(a);
end
