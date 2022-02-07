### Distance calculation

This function will be used to calculate the distance between a point and a line. More specifically, if we have a point coordinate, let's say its a CUE point, and we have lines such as D2D links.



![image-20220207153554689](C:\Users\elc20yl\AppData\Roaming\Typora\typora-user-images\image-20220207153554689.png)

```matlab
function d = point_to_line(v1,v2,CUE)
      v1(1,3)=0;
      v2(1,3)=0;
      CUE(1,3)=0;
      a = v1 - v2;
      b = CUE- v2;
      d = norm(cross(a,b)) / norm(a);
end

```

