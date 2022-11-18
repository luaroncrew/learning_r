# 1. etudier les variables dans toute la population et 
# regarder dans les regions differentes
# 2. faire une pre-stratification pour que la repartition 
# des variabeles soit optimale
# 3. interoger des echantillon adaptés dans une moitie de region
# 4. faire une estimation.

# mean age, mean enfants, % rev superiour 
data = read.csv2('data/DONNEES_SOCIO_DEMO_2020_V2.csv')
means_age_regions = c(
  mean(data[data$REGION == 1,]$AGE),
  mean(data[data$REGION == 2,]$AGE),
  mean(data[data$REGION == 3,]$AGE),
  mean(data[data$REGION == 4,]$AGE),
  mean(data[data$REGION == 5,]$AGE),
  mean(data[data$REGION == 6,]$AGE),
  mean(data[data$REGION == 7,]$AGE),
  mean(data[data$REGION == 8,]$AGE))
plot(means_age_regions)


means_enfants_region = c(
  mean(data[data$REGION == 1,]$ENFANTS),
  mean(data[data$REGION == 2,]$ENFANTS),
  mean(data[data$REGION == 3,]$ENFANTS),
  mean(data[data$REGION == 4,]$ENFANTS),
  mean(data[data$REGION == 5,]$ENFANTS),
  mean(data[data$REGION == 6,]$ENFANTS),
  mean(data[data$REGION == 7,]$ENFANTS),
  mean(data[data$REGION == 8,]$ENFANTS))
plot(means_enfants_region)

plot(table(data$REGION, data$CLASSE))
plot(table(data$REGION, data$DIPLOME))



prop.table(data[data$REGION == 1,]$CLASSE)
prop.table(data[data$REGION == 2,]$CLASSE)
prop.table(data[data$REGION == 3,]$CLASSE)
prop.table(data[data$REGION == 4,]$CLASSE)
prop.table(data[data$REGION == 5,]$CLASSE)
prop.table(data[data$REGION == 6,]$CLASSE)
prop.table(data[data$REGION == 7,]$CLASSE)
prop.table(data[data$REGION == 8,]$CLASSE)


echs_pre_1st_year = c(
  sample(data[data$REGION == 4,]$ID, 50),
  sample(data[data$REGION == 5,]$ID, 50),
  sample(data[data$REGION == 6,]$ID, 50),
  sample(data[data$REGION == 7,]$ID, 50)
)

echs_pre_1st_year
write.csv(echs_pre_1st_year,file="echantillon.csv",row.names=F)

first_interview = read.csv2('data/resultats kirill1.csv')

means_bonbons_regions = c(
  mean(first_interview[first_interview$REGION == 4,]$data_ech_valeurs),
  mean(first_interview[first_interview$REGION == 5,]$data_ech_valeurs),
  mean(first_interview[first_interview$REGION == 6,]$data_ech_valeurs),
  mean(first_interview[first_interview$REGION == 7,]$data_ech_valeurs)
  )

plot(means_bonbons_regions)

mean(first_interview$data_ech_valeurs)

echs_pre_1st_year = c(
  sample(data[data$REGION == 1,]$ID, 75),
  sample(data[data$REGION == 2,]$ID, 75),
  sample(data[data$REGION == 3,]$ID, 75),
  sample(data[data$REGION == 4,]$ID, 25),
  sample(data[data$REGION == 5,]$ID, 25),
  sample(data[data$REGION == 6,]$ID, 25),
  sample(data[data$REGION == 7,]$ID, 25),
  sample(data[data$REGION == 8,]$ID, 75)
)
  

first_interview_collab = read.csv2('data/resultats FloraHeidi.csv')
third_ech = read.csv2('data/resultats FloraHeidi.csv')


means_bonbons_regions_ech_sup = c(
  mean(first_interview_collab[first_interview_collab$REGION == 1,]$data_ech_valeurs, na.rm=T),
  mean(first_interview_collab[first_interview_collab$REGION == 2,]$data_ech_valeurs, na.rm=T),
  mean(first_interview_collab[first_interview_collab$REGION == 3,]$data_ech_valeurs, na.rm=T),
  mean(first_interview_collab[first_interview_collab$REGION == 4,]$data_ech_valeurs, na.rm=T),
  mean(first_interview_collab[first_interview_collab$REGION == 5,]$data_ech_valeurs, na.rm=T),
  mean(first_interview_collab[first_interview_collab$REGION == 6,]$data_ech_valeurs, na.rm=T),
  mean(first_interview_collab[first_interview_collab$REGION == 7,]$data_ech_valeurs, na.rm=T),
  mean(first_interview_collab[first_interview_collab$REGION == 8,]$data_ech_valeurs, na.rm=T)
)




ech1_annee_1 = read.csv2('data/resultats FloraHeidi.csv')
ech2_annee_1 = read.csv2('data/resultats kirill1.csv')
ech3_annee_1 = read.csv2('data/resultats kirill2.csv')


estimations_moyennes = c(
  mean(ech1_annee_1$data_ech_valeurs, na.rm=T) * 0.5,
  mean(ech2_annee_1$data_ech_valeurs, na.rm=T) * 1/6,
  mean(ech3_annee_1$data_ech_valeurs, na.rm=T) * 2/6
)

estimations_variances = c(
  var(ech1_annee_1$data_ech_valeurs, na.rm=T) * 0.5,
  var(ech2_annee_1$data_ech_valeurs, na.rm=T) * 1/6,
  var(ech3_annee_1$data_ech_valeurs, na.rm=T) * 2/6
)
var_tot = sum(estimations_variances)
est_moy = sum(estimations_moyennes)
est_moy
est_var_est = (1-1200/1000012)*var_tot/1200
est_var_est

IC_addition = 1.96*sqrt(est_var_est)
IC_inf = est_moy - IC_addition
IC_sup = est_moy + IC_addition
IC_inf
IC_sup


new_ech = sample(data$ID, 600)
write.csv(new_ech,file="echantillon.csv",row.names=F)



plot(means_bonbons_regions_ech_sup)

ech1_annee_2 = read.csv2('data/resultats kirillannee2.csv')
means_bonbons_regions_ech_2 = c(
  mean(ech1_annee_2[ech1_annee_2$REGION == 1,]$data_ech_valeurs, na.rm=T),
  mean(ech1_annee_2[ech1_annee_2$REGION == 2,]$data_ech_valeurs, na.rm=T),
  mean(ech1_annee_2[ech1_annee_2$REGION == 3,]$data_ech_valeurs, na.rm=T),
  mean(ech1_annee_2[ech1_annee_2$REGION == 4,]$data_ech_valeurs, na.rm=T),
  mean(ech1_annee_2[ech1_annee_2$REGION == 5,]$data_ech_valeurs, na.rm=T),
  mean(ech1_annee_2[ech1_annee_2$REGION == 6,]$data_ech_valeurs, na.rm=T),
  mean(ech1_annee_2[ech1_annee_2$REGION == 7,]$data_ech_valeurs, na.rm=T),
  mean(ech1_annee_2[ech1_annee_2$REGION == 8,]$data_ech_valeurs, na.rm=T)
)

plot(means_bonbons_regions_ech_2)

est_moy_an_2 = mean(ech1_annee_2$data_ech_valeurs, na.rm=T)
est_var_est = (1-600/1000012)*var(ech1_annee_2$data_ech_valeurs, na.rm=T)/600
est_moy_an_2
est_var_est
IC_addition = 1.96*sqrt(est_var_est)
IC_inf = est_moy_an_2 - IC_addition
IC_sup = est_moy_an_2 + IC_addition
IC_inf
IC_sup

# pour voir l'ecart le moins grand
means_bonbons_regions_ech_sup - means_bonbons_regions_ech_2
write.csv(sample(data[data$REGION == 6,]$ID, 950),file="echantillon.csv",row.names=F)


ech1_annee_3 = read.csv2('data/resultats kirill3.csv')
n = 950
N = 1000012
est_moy = mean(ech1_annee_3$data_ech_valeurs, na.rm=TRUE)
est_var_est_moy = (1-n/N)*var(ech1_annee_3$data_ech_valeurs, na.rm=TRUE)/n
est_moy_an_3 = mean(ech1_annee_3$data_ech_valeurs, na.rm=T)
est_var_est_moy = (1-n/N)*var(ech1_annee_3$data_ech_valeurs, na.rm=T)/950
est_moy_an_3
est_var_est_moy
IC_addition = 1.96*sqrt(est_var_est_moy)
IC_inf = est_moy_an_3 - IC_addition
IC_sup = est_moy_an_3 + IC_addition
IC_inf
IC_sup

