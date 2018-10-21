clear variables

%%   Mise en forme des données
Im = rgb2gray(imread('ImRef.jpg')); % chargement de l'image

hauteur = 140; largeur = 100;   %On sélectionne manuellement 
[lignes, colonnes] = size(Im);
nbVisages = (floor(colonnes/largeur)+1) * (floor(lignes/hauteur)+1);
Base_images = zeros(hauteur, largeur, nbVisages);
cpt = 0;
quantX = 1:hauteur-1:lignes;
quantY = 1:largeur-1:colonnes;

for i = 1:length(quantX)-1
   for j = 1:length(quantY)-1
       cpt = cpt + 1;
       if(quantY(j+1)<=colonnes && quantX(i+1)<=lignes)
          Base_images(:, :, cpt) = Im(quantX(i):quantX(i+1), quantY(j):quantY(j+1));
       end
   end
end

base = Base_images(:,:,1);
for ii = 2:15
    base = base + Base_images(:,:,ii);
    figure
    imagesc(Base_images(:,:,ii))
end
% 
% figure
% title('Image initiale')
% imagesc(base)
% 
% %% Etape 1 : description des yeux
% Gx = [-1 0 1;
%       -2 0 2;
%       -1 0 1];
%   
% Gy = [-1 -2 -1;
%       0 0 0;
%       1 2 1];
%   
% imT = base;
% ImMod = sqrt(conv2(Gx,base).^2 + conv2(Gy,base).^2);
% incX = 69-43; incY = 77-5;
% BandeYeux = im2double(ImMod(43:69, 5:77));
% BandeYeuxCol = im2double(ImMod(1:end, 5:77));
% BandeYeuxCol = BandeYeuxCol';
% %BandeYeux = conv2(BandeYeux, [-1/6 -2/3 -1/6; -2/3 26/6 -2/3; -1/6 -2/3 -1/6]);
% 
% % chargement de l'image
% imTest = im2double(rgb2gray(imread('ImVal5.jpg')));%imTest = im2double(rgb2gray(imread('ImVal5.jpg'))); 
% %imTest = Base_images(:,:,5);
% imTest = sqrt(conv2(Gx,imTest).^2 + conv2(Gy,imTest).^2);
% 
% % cross corr
% corr = xcorr2(imTest,BandeYeux);
% corr = imresize(corr, size(imTest));
% [li, col, li1, col1] = pos_max(corr);
% 
% corr2 = xcorr2(imTest,BandeYeuxCol);
% corr2 = imresize(corr2, size(imTest));
% [li2, col2] = pos_max(corr2);
% 
% im1 = imTest; im2 = imTest;
% im1(li-1:li+1,1:end) = max(max(im1));
% im2(1:end,col2:col2) = max(max(im2));
% corr(li,col) = max(max(corr));
% corr2(li2,col2) = max(max(corr2));
% 
% figure
% subplot(221)
% imagesc(im1)
% hold on
% plot(li,col,'rs','markers',12)
% colormap gray
% subplot(223)
% imagesc(corr)
% colormap gray
% subplot(222)
% imagesc(im2)
% colormap gray
% subplot(224)
% imagesc(corr2)
% colormap gray
% 
% 
% 
% %% Cache
% % CoorYeux = [43 5;   % position du bandeau "yeux"
% %             43 77;
% %             69 5;
% %             69 77];
% %         
% % % features = extractFeatures(ImMod, CoorYeux, 'Method','Block');
% % % F_yeux = mean(features); % Bandeau de ref
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
