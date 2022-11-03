#!/bin/bash


subject=$@



cd /oak/stanford/groups/menon/rawdata/scsnl;


echo "subjectlist"
for subj in ${subject}; do ls -d ${subj}/visit*/session?/anatomical/*olume* -1 | tr '/' ',' | cut -d, -f1-3 | sed -e 's/visit//g' | sed -e 's/session//g';done


echo "dirnames"
for subj in ${subject}; do ls -d ${subj}/visit*/session?/anatomical/*olume* -1 | tr '/' ',' | cut -d, -f5;done
