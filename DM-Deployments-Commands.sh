#!/bin/bash 
RED='\e[1;31m'
NC='\e[0m' # No Color

echo -e "choose the file that you want to deploy \n stg-settings.json \n prod-settings.json"
read file
git clone https://DM-Token:glpat-9wkpBeR5d2qv7Np6HUBq@gitlabce.tools.aws.vodafone.com/IoT-VAS/strategic-dm/image-sync-automation.git
cat image-sync-automation/$file | grep -A 30 charts > charts
##########billing reporter################
br_chart=$(cat charts | grep billing)
br_chart_v=$(echo -e "$br_chart" | tr '.' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
br_chart_n=$(echo -e "$br_chart" | tr '.' ' ' | sed -e 's/[^a-z]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
#echo $br_chart_v
echo -e "helm upgrade $RED billing-reporter $NC avsystem/$RED$br_chart_n$NC --version $br_chart_v -n coiote-dm-management  --reset-values" >> generated-commands

##########blackbox_exporter################
bbe_chart=$(cat charts | grep blackbox)
bbe_chart_v=$(echo -e "$bbe_chart" | tr '.' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
bbe_chart_n=$(echo -e "$bbe_chart" | tr '.' ' ' | sed -e 's/[^a-z]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
#echo $bbe_chart_v
echo -e "helm upgrade $RED blackbox-exporter $NC avsystem/$RED$bbe_chart_n$NC --version $RED $bbe_chart_v $NC -n $RED monitoring $NC --reset-values"  >> generated-commands
##########gemini##########################
g_chart=$(cat charts | grep gemini)
g_chart_v=$(echo -e "$g_chart" | tr '.' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
g_chart_n=$(echo -e "$g_chart" | tr '.' ' ' | sed -e 's/[^a-z]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
#echo $g_chart_v
echo -e "helm upgrade $RED gemini $NC avsystem/$RED$g_chart_n$NC --version $RED $g_chart_v $NC -n $RED gemini $NC --reset-values"  >> generated-commands
###########healthchecker##################
hc_chart=$(cat charts | grep healthchecker)
hc_chart_v=$(echo -e "$hc_chart" | tr '.' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
hc_chart_n=$(echo -e "$hc_chart" | tr '.' ' ' | sed -e 's/[^a-z]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
#echo $hc_chart_v
echo -e "helm upgrade $RED healthchecker $NC avsystem/$RED$hc_chart_n$NC --version $RED $hc_chart_v $NC -n $RED monitoring $NC --reset-values"  >> generated-commands
###########iam##################
iam_chart=$(cat charts | grep iam)
iam_chart_v=$(echo -e "$iam_chart" | tr '.' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
iam_chart_n=$(echo -e "$iam_chart" | tr '.' ' ' | sed -e 's/[^a-z]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
#echo $iam_chart_v
echo -e "helm upgrade $RED iam $NC avsystem/$RED$iam_chart_n$NC --version $RED $iam_chart_v $NC -n $RED iam $NC --reset-values"  >> generated-commands
########istio-base##################
ib_chart=$(cat charts | grep base)
ib_chart_v=$(echo -e "$ib_chart" | tr '.' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
ib_chart_n=$(echo -e "$ib_chart" | tr '.' ' ' | sed -e 's/[^a-z]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
#echo $ib_chart_v
echo -e "helm upgrade $RED istio-base $NC avsystem/$RED$ib_chart_n $NC --version $RED $ib_chart_v $NC -n $RED istio-system $NC  --reset-values"  >> generated-commands
##########istio-configuration-vf##################
ic_chart=$(cat charts | grep istio-configuration-vf)
ic_chart_v=$(echo -e "$ic_chart" | tr '.' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
ic_chart_n=$(echo -e "$ic_chart" | tr '.' ' ' | sed -e 's/[^a-z]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
#echo $ic_chart_v
echo -e "helm upgrade $RED istio-configuration $NC avsystem/$RED$ic_chart_n$NC --version $RED $hc_chart_v $NC  -n $RED coiote-dm-management $NC --reset-values"  >> generated-commands
###########istio-configuration-oss##################
icoss_chart=$(cat charts | grep istio-configuration-oss)
icoss_chart_v=$(echo -e "$icoss_chart" | tr '.' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
icoss_chart_n=$(echo -e "$icoss_chart" | tr '.' ' ' | sed -e 's/[^a-z]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
#echo $icoss_chart_v
echo -e "helm upgrade $RED istio-configuration-oss $NC avsystem/$RED$icoss_chart_n $NC --version $RED $icoss_chart_v $NC -n $RED monitoring $NC  --reset-values"  >> generated-commands
###########istio-gateway-vf##################
igwvf_chart=$(cat charts | grep gateway-vf)
igwvf_chart_v=$(echo -e "$igwvf_chart" | tr '.' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
igwvf_chart_n=$(echo -e "$igwvf_chart" | tr '.' ' ' | sed -e 's/[^a-z]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
#echo $igwvf_chart_v
echo -e "helm upgrade $RED istio-gateway $NC avsystem/$RED$igwvf_chart_n$NC  --version $RED $igwvf_chart_v $NC -n $RED coiote-dm-management $NC --reset-values"  >> generated-commands
###########istio-gateway-oss##################
igwoss_chart=$(cat charts | grep gateway-oss)
igwoss_chart_v=$(echo -e "$igwoss_chart" | tr '.' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
igwoss_chart_n=$(echo -e "$igwoss_chart" | tr '.' ' ' | sed -e 's/[^a-z]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
#echo $igwoss_chart_v
echo -e  "helm upgrade $RED istio-gateway-oss $NC avsystem/$RED$igwoss_chart_n$NC --version $RED $igwoss_chart_v $NC -n $RED monitoring $NC --reset-values"  >> generated-commands
###########istiod##################
istiod_chart=$(cat charts | grep istiod)
istiod_chart_v=$(echo -e "$istiod_chart" | tr '.' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
istiod_chart_n=$(echo -e "$istiod_chart" | tr '.' ' ' | sed -e 's/[^a-z]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
#echo $istiod_chart_v
echo -e "helm upgrade $RED istiod $NC avsystem/$RED$istiod_chart_n$NC --version $RED $istiod_chart_v $NC -n $RED istio-system $NC --reset-values"  >> generated-commands

###########kiali##################
kiali_chart=$(cat charts | grep kiali)
kiali_chart_v=$(echo -e "$kiali_chart" | tr '.' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
kiali_chart_n=$(echo -e "$kiali_chart" | tr '.' ' ' | sed -e 's/[^a-z]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
#echo $kiali_chart_v
echo -e "helm upgrade $RED kiali $NC avsystem/$RED$kiali_chart_n$NC --version $RED $kiali_chart_v $NC -n $RED monitoring $NC  --reset-values"  >> generated-commands

###########metrics-server##################
ms_chart=$(cat charts | grep metrics-server)
ms_chart_v=$(echo -e "$igwoss_chart" | tr '.' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
ms_chart_n=$(echo -e "$igwoss_chart" | tr '.' ' ' | sed -e 's/[^a-z]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
#echo $ms_chart_v
echo -e "helm upgrade $RED metrics-server $NC avsystem/$RED$ms_chart_n$NC --version $RED $ms_chart_v $NC -n $RED kube-system $NC --reset-values"  >> generated-commands

###########mongo##################
mongo_chart=$(cat charts | grep mongo)
mongo_chart_v=$(echo -e "$mongo_chart" | tr '.' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
mongo_chart_n=$(echo -e "$mongo_chart" | tr '.' ' ' | sed -e 's/[^a-z]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
#echo $mongo_chart_v
echo -e "helm upgrade $RED mongo $NC avsystem/$RED$mongo_chart_n$NC --version $RED $mongo_chart_v $NC -n $RED coiote-dm-management $NC --reset-values"  >> generated-commands

###########prometheus##################
prometheus_chart=$(cat charts | grep kube-prometheus)
prometheus_chart_v=$(echo -e "$prometheus_chart" | tr '.' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
prometheus_chart_n=$(echo -e "$prometheus_chart" | tr '.' ' ' | sed -e 's/[^a-z]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
#echo $prometheus_chart_v
echo -e "helm upgrade $RED prometheus $NC avsystem/$RED$prometheus_chart_n$NC --version $RED $prometheus_chart_v $NC -n $RED monitoring $NC --reset-values"  >> generated-commands
###########redis##################
#redis_chart=$(cat charts | grep redis)
#redis_chart_v=$(echo -e "$redis_chart" | tr '.' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
#redis_chart_n=$(echo -e "$redis_chart" | tr '.' ' ' | sed -e 's/[^a-z]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
#echo $redis_chart_v
#echo "helm upgrade gemini avsystem/$redis_chart_n --version $redis_chart_v -n coiote-dm-management  --reset-values" >> generated_commands
###########cloud-bridge##################
cb_chart=$(cat charts | grep cloud-bridge)
cb_chart_v=$(echo -e "$cb_chart" | tr '.' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
cb_chart_n=$(echo -e "$cb_chart" | tr '.' ' ' | sed -e 's/[^a-z]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
#echo $cb_chart_v
echo -e "helm upgrade $RED cloud-bridge $NC avsystem/$RED$cb_chart_n$NC --version $RED $cb_chart_v $NC -n $RED coiote-dm-management $NC --reset-values"  >> generated-commands

###########coiote-dm##################
cm_chart=$(cat charts | grep coiote-dm)
cm_chart_v=$(echo -e "$cm_chart" | tr '.' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
cm_chart_n=$(echo -e "$cm_chart" | tr '.' ' ' | sed -e 's/[^a-z]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
#echo $cm_chart_v
echo -e "helm upgrade $RED coiote-dm $NC avsystem/$RED$cm_chart_n$NC --version $RED $cm_chart_v $NC -n $RED coiote-dm-management $NC  --reset-values --set image.tag=$RED$cm_chart_v$NC-devman --set image.pullPolicy=Always"  >> generated-commands
###########udp-connector##################
udp_chart=$(cat charts | grep udp-connector)
udp_chart_v=$(echo -e "$udp_chart" | tr '.' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
udp_chart_n=$(echo -e "$udp_chart" | tr '.' ' ' | sed -e 's/[^a-z]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
#echo $udp_chart_v
echo -e "helm upgrade $RED udp-connector $NC avsystem/$RED$udp_chart_n$NC --version $RED $udp_chart_v $NC -n $RED coiote-dm-management $NC --reset-values --set image.tag=$RED$udp_chart_v$NC-vf-prod --set image.pullPolicy=Always"  >> generated-commands

###########victoria-metrics-cluster##################
victoria_chart=$(cat charts | grep victoria-metrics-cluster)
victoria_chart_v=$(echo -e "$victoria_chart" | tr '.' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
victoria_chart_n=$(echo -e "$victoria_chart" | tr '.' ' ' | sed -e 's/[^a-z]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g')
#echo $victoria_chart_v
echo -e "helm upgrade $RED victoria-metrics-cluster $NC avsystem/$RED$victoria_chart_n$NC --version $RED $victoria_chart_v $NC -n $RED coiote-dm-management $NC --reset-values"  >> generated-commands
########################################3 
cat generated-commands
rm -rf image-sync-automation generated-commands charts





