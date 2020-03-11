#!/bin/sh

USERNAME=${1}
PASSWORD=${2}
DBHOST=${3}
DBPORT=${4}
DBNAME=${5}

PGPASSWORD="${PASSWORD}" pg_dump -Fcs -U ${USERNAME} -h ${DBHOST} -p ${DBPORT} -d ${DBNAME} \
   -n nhdplus                        \
   -f nhdplus_indexing_schema.dmp

PGPASSWORD="${PASSWORD}" pg_dump -Fc  -U ${USERNAME} -h ${DBHOST} -p ${DBPORT} -d ${DBNAME} \
   -t nhdplus.catchment_np21         \
   -t nhdplus.catchmentsp_np21       \
   -t nhdplus.nhdflowline_np21       \
   -t nhdplus.nhdflowline_np21_geo   \
   -t nhdplus.nhdflowline_np21_acu   \
   -t nhdplus.nhdflowline_np21_lpv   \
   -t nhdplus.nhdflowline_np21_uas   \
   -t nhdplus.nhdflowline_np21_ugm   \
   -t nhdplus.nhdflowline_np21_uhi   \
   -t nhdplus.fdr_np21_amsamoa_rdt   \
   -t nhdplus.fdr_np21_conus_rdt     \
   -t nhdplus.fdr_np21_guammar_rdt   \
   -t nhdplus.fdr_np21_hawaii_rdt    \
   -t nhdplus.fdr_np21_prvi_rdt      \
   -f nhdplus_indexing_resources.dmp 

