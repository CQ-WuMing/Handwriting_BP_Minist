function images = readMNISTImages(filename)
FID=fopen(filename,'r');  
%读取前16个字节（一个字节八位）
magic = fread(FID, 1, 'int32', 0, 'ieee-be');    

numImages = fread(FID, 1, 'int32', 0, 'ieee-be'); 

numRows = fread(FID, 1, 'int32', 0, 'ieee-be');    

numCols = fread(FID, 1, 'int32', 0, 'ieee-be');   

%读取大小为28*28的图片

images = fread(FID, inf, 'unsigned char'); %输出数组的维度有3种参数,Inf、n、[m,n]，Inf 代表输出数据是列向量，文件中每一个元素对应一个值

images = reshape(images, numCols, numRows, numImages);

images = permute(images,[2 1 3]);%交换第一维和第二维,相当于转置;因为图片是反的所以需要翻转一下

fclose(FID);
end
