function prixObligation(c,M,t,i)
  temps=[0.5:0.5:t]
  cf=c*ones(length(temps))
  cf[end]=cf[end]+M
  prix=sum(cf./(1+i).^temps)

  return prix


end




function duration(c,M,t,i)
  temps=[0.5:0.5:t]
  cf=c*ones(length(temps))
  cf[end]=cf[end]+M
  d=sum((cf.*temps)./(1+i).^temps)
  return d/prixObligation(c,M,t,i)

end





function convexité(c,M,t,i)
  temps=[0.5:0.5:t]
  cf=c*ones(length(temps))
  cf[end]=cf[end]+M
  d=sum((cf.*(temps+temps.^2))./(1+i).^temps)
  return d/(prixObligation(c,M,t,i)*(1+i)^2)
end
