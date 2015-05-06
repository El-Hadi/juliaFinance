
# fonction qui retourne sous forme matricielle un arbre binomial


function arbreBinomial(s,u,d,t)
  price=zeros(t,t)
  #price[1,1]=s
  for j in 1:t
    for i in t:-1:t-j+1

      price[i,j]=s*u^(t-i)*d^(j-t+i-1)
    end
  end

 return price


end