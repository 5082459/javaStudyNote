function W = BFS(G)
 n = size(G,1);
 W = zeros(1,n);
 l = 0;
 v = 1;
 a1 = find(G(v,:) == 1);
 G(v,a1) = 2;
 G(a1,v) = 2;
 W(a1) = l + 1;
 s1 = union(a1,v);
 l = l + 1;
 while ~isempty(G == 1)
     a1 = find(G(s1,:) == 1);
     t = length(s1);
     d = [];
     for i = 1:length(a1)
         if a1(i)/t > floor(a1(i)/t)
             t2 = floor(a1(i)/t) + 1;
         else
             t2 = floor(a1(i)/t);
         end
         if isempty(intersect(d,t2))
             d = union(d,t2);
         end
     end
     d1 = setdiff(d,s1);
     if isempty(d1)
         break;
     else
         W(d1) = l + 1;
         G1 = G(s1,:);
         G1(a1) = 2;
         G(s1,:) = G1;
         G(:,s1) = G1;
         s1 = union(s1,d1);
         l = l + 1;
     end
 end