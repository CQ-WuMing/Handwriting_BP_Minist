function images = readMNISTImages(filename)
FID=fopen(filename,'r');  
%��ȡǰ16���ֽڣ�һ���ֽڰ�λ��
magic = fread(FID, 1, 'int32', 0, 'ieee-be');    

numImages = fread(FID, 1, 'int32', 0, 'ieee-be'); 

numRows = fread(FID, 1, 'int32', 0, 'ieee-be');    

numCols = fread(FID, 1, 'int32', 0, 'ieee-be');   

%��ȡ��СΪ28*28��ͼƬ

images = fread(FID, inf, 'unsigned char'); %��������ά����3�ֲ���,Inf��n��[m,n]��Inf ����������������������ļ���ÿһ��Ԫ�ض�Ӧһ��ֵ

images = reshape(images, numCols, numRows, numImages);

images = permute(images,[2 1 3]);%������һά�͵ڶ�ά,�൱��ת��;��ΪͼƬ�Ƿ���������Ҫ��תһ��

fclose(FID);
end
