#!/bin/bash
# https://public.opendatasoft.com/explore/dataset/resultats-ligue-1
data=$(cat resultats-ligue-1.json | jq 'sort_by(.fields.name)' |  jq '.[].fields | select((.home_team == "LOSC") or (.away_team == "LOSC"))')


echo $data | jq
for (( i = 0; i < 38; i++ )); do
  home_team=$(echo $data | jq '.[0].home_team')
  away_team=$(echo $data | jq '.[0].away_team')
  home_goal=$(echo $data | jq '.[0].home_goal')
  away_goal=$(echo $data | jq '.[0].away_goal')


  echo $home_team
  echo $away_team
  echo $home_goal
  echo $away_goal


  if ($home_team == "LOSC"); then
      echo "Lille était à domicile"
  fi
done

