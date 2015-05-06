
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


function zeroCouponValution(notionel,t,q, s, u, d)
  t=t+1
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
  return fo[t,1]


end
zeroCouponValution(100,10,0.5,0.05,1.1,0.9)

function forwardLatice(notionel,tf,tz,q, s, u, d)
  tf=tf+1
  #tz=tz+1
  zeroCoup=zeroCouponValution(notionel,tz,q, s, u, d)
  fo=zeros(tf,tf)
  fo[:,end]=100
  r=arbreBinomial(s,u,d,tz)

  r=r[end-tf+1:end,1:tf]
  for j in tf-1:-1:1
    for i in tf-j+1:tf
      # fo[i,j]=i+j
      fo[i,j]= (q*fo[i-1,j+1]+(1-q)*fo[i,j+1])/(1+r[i,j])

    end
  end
  return 100*zeroCoup/fo[end,1]



end


