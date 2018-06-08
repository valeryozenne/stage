Bonjour

Voici quelques pistes pour démarrer :

se familiariser avec le Gadgetron

https://github.com/gadgetron/gadgetron/wiki/Gadgetron-Hello-World
https://github.com/gadgetron/gadgetron/wiki/Gadgetron-Gadgets
https://github.com/gadgetron/gadgetron/wiki/Gadgetron-Streaming-Architecture
https://github.com/gadgetron/gadgetron/wiki/Linux-Installation
https://github.com/gadgetron/gadgetron/wiki/HDF5-Files
https://github.com/gadgetron/gadgetron/wiki/Gadgetron-Toolboxes


## exercice 1
plusieurs jeux de données sont a disposition
on va travailler sur la reconstruction EPI

### 1) pour cela, lancer serveur dans un terminal
```
cd Dev/gadgetron/build
gadgetron
```
### 2) à côte le client qui envoie les données au serveur

```
cd Dev/Data
./command_pour_franck
```

## 3) voici ce que contient command_pour_franck
```
#!/bin/bash

home=$(pwd)

rm -f out_reco.h5

#brain Grappa MB
DATA=/home/valery/Reseau/Imagerie/DICOM_DATA/2017-11-07_ICM/FIDSMS/meas_MID00662_FID24281_MB2_1_8iso.h5
NOISEDATA=/home/valery/Reseau/Imagerie/DICOM_DATA/2017-11-07_ICM/FIDSMS/meas_MID00662_NOISE24281_MB2_1_8iso.h5

#gel Grappa SB
#DATA=/home/valery/Reseau/Imagerie/DICOM_DATA/2017-11-07_ICM/FIDSMS/meas_MID00662_FID24281_MB2_1_8iso.h5
#NOISEDATA=/home/valery/Reseau/Imagerie/DICOM_DATA/2017-11-07_ICM/FIDSMS/meas_MID00662_NOISE24281_MB2_1_8iso.h5

#brain Grappa SB

DATA=/home/valery/Reseau/Imagerie/DICOM_DATA/2017-10-31_SMS_Brain_Aurelien/FID/meas_MID00106_FID51714_cmrr_1_7iso_GP2_MB1_36s.h5
NOISEDATA=/home/valery/Reseau/Imagerie/DICOM_DATA/2017-10-31_SMS_Brain_Aurelien/FID/meas_MID00106_NOISE51714_cmrr_1_7iso_GP2_MB1_36s.h5

CONFIG=default_measurement_dependencies.xml
gadgetron_ismrmrd_client -f ${NOISEDATA} -c ${CONFIG}

CONFIG=Generic_Cartesian_Grappa_EPI.xml
gadgetron_ismrmrd_client -f ${DATA} -c ${CONFIG} -o out_reco.h5
```

### 4 lecture des données

soit avec hdfview

ouvrir hdfview,
double clic date
double clique image
clic droit data open as,
cliquer sur image
modifier dim3 dim4 dim0  puis ok

soit avec matlab

avec le script main_read_hdf5



## exercice 2 création d'un nouveau gadget
https://github.com/gadgetron/gadgetron/wiki/Making-a-New-Gadget-Library

## exercice 3  idem 
inserer le code 
 

