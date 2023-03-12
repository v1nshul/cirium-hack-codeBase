#mro relationships

library(tidyverse)

mro= read_csv("mro-relationships.csv")
mro


#trying to find the correlations 
ggplot(mro, aes(x=customer_organization_country, y=maintenance_service_type)) +
  geom_point()
cor(mro$customer_organization_country,mro$maintenance_service_type)

library(GGally)
ggscatmat(select(customer_organization_country,maintenance_service_type,customer_organization))
