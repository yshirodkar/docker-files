#!/bin/bash

echo "Select the pod region for service (Just type number)"
echo "1. US1"
echo "2. US2"
echo "3. US3"
echo "4. EU1"
echo "5. AP1"
echo "6. CA1"
echo "7. Staging"

read -p "Just type number:  "
pod_region=$REPLY

	PROFILE="--profile pdlmp_user"
if [ "$pod_region" == "1" ]; then
	echo "US1 region selected"
	REGION="us-east-1"
	CLUSTER="PS-US1A"
	PROFILE=""
elif [[ "$pod_region" == "2" ]]; then
	echo "US2 region selected"
	REGION="us-west-2"
	CLUSTER="us2-pod"
elif [[ "$pod_region" == "3" ]]; then
	echo "US3 region selected"
	REGION="us-east-1"
	CLUSTER="us3-pod"
elif [[ "$pod_region" == "4" ]]; then
	echo "EU1 region selected"
	REGION="eu-west-1"
	CLUSTER="eu1-pod"
elif [[ "$pod_region" == "5" ]]; then
	echo "AP1 region selected"
	REGION="ap-southeast-1"
	CLUSTER="ap1-pod"
elif [[ "$pod_region" == "6" ]]; then
	echo "CA1 region selected"
	REGION="ca-central-1"
	CLUSTER="ca1-pod"
elif [[ "$pod_region" == "7" ]]; then
	echo "Staging region selected"
	REGION="us-east-1"
	CLUSTER="Playbooks-Staging"
else
	echo "Please select right input."
	exit
fi

echo "Region and cluster names are $REGION, $CLUSTER"

echo "Please select the service need to restart"
echo "1. PS Custom KPM API"
echo "2. PS Custom KPM Service"
echo "3. PS Image Service"
echo "4. PS Joules Translator"
echo "5. PS Leaderboard API"
echo "6. PS Metric Service"
echo "7. PS Metric Worker"
echo "8. PS Point Service"
echo "9. PS Rank Service"
echo "10. PS Event Service"

read -p "Just type number:  "
selected_service=$REPLY

if [ "$selected_service" == "1" ]; then
	SERVICE="ps-custom-kpm-api"
elif [[ "$selected_service" == "2" ]]; then
	SERVICE="ps-custom-kpm-service"
elif [[ "$selected_service" == "3" ]]; then
	SERVICE="ps-image-service"
elif [[ "$selected_service" == "4" ]]; then
	SERVICE="ps-joules-translator"
elif [[ "$selected_service" == "5" ]]; then
	SERVICE="ps-leaderboard-api"
elif [[ "$selected_service" == "6" ]]; then
	SERVICE="ps-metric-service"
elif [[ "$selected_service" == "7" ]]; then
	SERVICE="ps-metric-worker"
elif [[ "$selected_service" == "8" ]]; then
	if [[ "$pod_region" == "7" ]]; then
		SERVICE="staging-ps-points-service"
	else
		SERVICE="ps-points-service"
	fi
elif [[ "$selected_service" == "9" ]]; then
	SERVICE="ps-rank-service"
elif [[ "$selected_service" == "10" ]]; then
	SERVICE="ps-event-service"
else
	echo "Please select right input"
	exit
fi

echo "Restarting $SERVICE service...."
echo "aws --region ${REGION} ecs update-service --cluster ${CLUSTER} --service ${SERVICE} --force-new-deployment ${PROFILE}"
aws --region ${REGION} ecs update-service --cluster ${CLUSTER} --service ${SERVICE} --force-new-deployment ${PROFILE}