
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


function forwardLatice(notionel,t,q, s, u, d)
  fo=zeros(t,t)
  fo[:,end]=notionel
  r=arbreBinomial(s,u,d,t)
  for j in t-1:-1:1
    for i in t-j+1:t
       #fo[i,j]=i+j
      fo[i,j]= (q*fo[i-1,j+1]+(1-q)*fo[i,j+1])/(1+r[i,j])

    end
  end

  #fo=fo./r
  return fo


end

forwardLatice(100.,10,0.5, 0.05,1.1,0.9)

