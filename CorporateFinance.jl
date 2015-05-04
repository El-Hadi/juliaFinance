function échéancierAnnuité(M,n,i)
  #A annuité
  #M montant de l'emprunt
  #i taux d'intéret
  #n durée de l'emrpunt

  A=M/((1-(1+i)^-n)/i)
  eche=zeros(n,5)
  eche[1,1]=M
  eche[:,2]=A
  eche[1,3]=eche[1,1]*i
  eche[1,4]=eche[1,2]-eche[1,3]
  eche[1,5]=eche[1,1]-eche[1,4]
  for j in 2:n
  eche[j,1]=eche[j-1,5]
  eche[j,3]=i*eche[j,1]
  eche[j,4]=eche[j,2]-eche[j,3]
  eche[j,5]=eche[j,1]-eche[j,4]



  end





  return eche
end

