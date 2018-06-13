close all
clear all

filename=['/home/valery/Dev/stage/out_reco.h5'];
hinfo = hdf5info(filename);

tempo=single(h5read(filename, hinfo.GroupHierarchy.Groups(1).Groups(1).Datasets(2).Name));

[dimx, dimy, lala, lili, total_number] = size(tempo);

number_of_slices=36;
number_of_repetitions=total_number/number_of_slices;

magnitude=reshape(tempo, [ dimx, dimy, lala, number_of_slices, number_of_repetitions]);

no_reordering='N';
[order_of_acquisition_mb, order_of_acquisition_sb, MapSliceSMS, vec_MapSliceSMS]=extract_slice_organisation(number_of_slices,16, 2,  no_reordering);
[~,indice_sb]=sort(order_of_acquisition_sb);


magnitude_tempo=zeros(size(magnitude));

for s=1:number_of_slices
    magnitude_tempo(:,:,:,s,:)=magnitude(:,:,:,indice_sb(s),:);   
end

magnitude=imrotate(magnitude_tempo,90);

close(figure(1))
figure(1)
for rep=1:number_of_repetitions
    for s=1:number_of_slices        
        subplot(6,6,s);imagesc(squeeze(magnitude(:,:,:,s,rep))); colormap(gray);
    end
    pause(0.5);
end
